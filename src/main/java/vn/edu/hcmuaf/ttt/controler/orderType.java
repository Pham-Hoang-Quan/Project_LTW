package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.model.hoaDon;
import vn.edu.hcmuaf.ttt.service.hoaDonService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "orderType", value = "/orderType")
public class orderType extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User auth= (User) session.getAttribute("auth");
        String user_id = auth.getUser_id();
        int id_user= Integer.parseInt(user_id);
        int status = Integer.parseInt(request.getParameter("st"));
        List<hoaDon> oder_type = hoaDonService.getOderXN(user_id, status);
        request.setAttribute("lshoadon", oder_type);
        request.getRequestDispatcher("oder.jsp").forward(request,response);




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
