package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteProduct", value = "/DeleteProduct")
public class DeleteProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        boolean isLoggedIn = user != null;
        boolean isNormalUser = isLoggedIn && user.getUser_admin() == 0;
        if (!isLoggedIn || isNormalUser)  {
            response.sendRedirect("http://localhost:8080/THDoAn_war/admin/login.jsp");
        } else {
            String id = request.getParameter("id");
            ProductService.deleteProduct(id);
            response.sendRedirect("ProAdmin");
            //log
            String user_id = user.getUser_id();
            int id_u = Integer.parseInt(user_id);
            DB.me().insert(new Log(Log.INFO, id_u, "/DeleteProduct" , "id sản phẩm: " + id , 1));

            //
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
