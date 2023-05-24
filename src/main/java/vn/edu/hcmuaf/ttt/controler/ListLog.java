package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.model.Log;
import vn.edu.hcmuaf.ttt.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListLog", value = "/ListLog")
public class ListLog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        boolean isLoggedIn = user != null;

        boolean isNormalUser = isLoggedIn && user.getUser_admin() == 0;
        boolean isAdmin = isLoggedIn && user.getUser_admin() == 1;

        if (request.getSession().getAttribute("auth") == null) {
            response.sendRedirect("admin/login.jsp");
            DB.me().insert(new vn.edu.hcmuaf.ttt.bean.Log(vn.edu.hcmuaf.ttt.bean.Log.DANGER,1,"/ListLog",  "Truy cập trái phép" ,1));
        } else {
            if (!isAdmin) {
                response.sendRedirect("admin/login.jsp");
                String user_id = user.getUser_id();
                int id_u = Integer.parseInt(user_id);
                DB.me().insert(new vn.edu.hcmuaf.ttt.bean.Log(vn.edu.hcmuaf.ttt.bean.Log.DANGER,id_u,"/ListLog",  "Truy cập trái phép" ,1));
            } else
            {
                List<Log> logList = LogService.getData();
                request.setAttribute("logList", logList);

                int countLog1 = LogService.getCountLog1();
                request.setAttribute("countLog1", countLog1);

                int countLog2 = LogService.getCountLog2();
                request.setAttribute("countLog2", countLog2);

                int countLog3 = LogService.getCountLog3();
                request.setAttribute("countLog3", countLog3);

                int countLog4 = LogService.getCountLog4();
                request.setAttribute("countLog4", countLog4);

                request.getRequestDispatcher("admin/logTest.jsp").forward(request, response);


                String user_id = user.getUser_id();
                int id_u = Integer.parseInt(user_id);
                DB.me().insert(new vn.edu.hcmuaf.ttt.bean.Log(vn.edu.hcmuaf.ttt.bean.Log.DANGER,id_u,"/ListLog",  "Truy cập trái phép" ,1));

            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}