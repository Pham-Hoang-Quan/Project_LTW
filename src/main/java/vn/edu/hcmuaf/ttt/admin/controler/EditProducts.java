package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditProducts", value = "/EditProducts")
public class EditProducts extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        boolean isLoggedIn = user != null;
        boolean isNormalUser = isLoggedIn && user.getUser_admin() != 1;
        if (!isLoggedIn || isNormalUser)  {
            response.sendRedirect("/THDoAn_war/List-Product");
        } else {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String classify = request.getParameter("classify");
            String percent = request.getParameter("percent");
            int qty = Integer.parseInt(request.getParameter("qty"));
            int price = Integer.parseInt(request.getParameter("price"));
            String content = request.getParameter("content");
            String info = request.getParameter("info");

            ProductService.editProduct(id,name, classify,percent,qty, price, content, info);
            response.sendRedirect("ProAdmin");
        }

    }
}
