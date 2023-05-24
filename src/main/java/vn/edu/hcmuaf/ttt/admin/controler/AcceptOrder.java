package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.admin.service.HoaDon;
import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AcceptOrder", value = "/AcceptOrder")
public class AcceptOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        boolean isLoggedIn = user != null;

        boolean isNormalUser = isLoggedIn && user.getUser_admin() != 1;

        if (!isLoggedIn || isNormalUser) {
            response.sendRedirect("admin/login.jsp");
            //log
            if(user == null){
                DB.me().insert(new Log(Log.DANGER,1,"/AcceptOrder",  "Truy cập trái phép" ,1));

            }else {
                String user_id = user.getUser_id();
                int id_u = Integer.parseInt(user_id);
                DB.me().insert(new Log(Log.DANGER,id_u,"/AcceptOrder",  "Truy cập trái phép" ,1));
            }


            //


        } else {
            String soHD = request.getParameter("SoHD");

            HoaDon.acceptOrder(soHD);

            response.sendRedirect("OrderList");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
