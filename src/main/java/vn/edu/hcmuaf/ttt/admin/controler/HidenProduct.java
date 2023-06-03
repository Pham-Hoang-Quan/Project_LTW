package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "HidenProduct", value = "/HidenProduct")
public class HidenProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        ProductService.hidenProduct(id);

        response.sendRedirect("ProAdmin");

        User user = (User) request.getSession().getAttribute("auth");
        boolean isLoggedIn = user != null;
        String user_id = user.getUser_id();
        int id_u = Integer.parseInt(user_id);
        DB.me().insert(new Log(Log.DANGER,id_u,"/DiscoutList",  "Truy cập trái phép" ,1));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
