package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddProduct", value = "/AddProduct")
public class AddProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        boolean isLoggedIn = user != null;
        boolean isNormalUser = isLoggedIn && user.getUser_admin() != 1;
        if (!isLoggedIn || isNormalUser) {
            response.sendRedirect("/THDoAn_war/List-Product");
        } else {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String classify = request.getParameter("classify");
            String img = request.getParameter("img");
            String img2 = request.getParameter("img2");
            String img3 = request.getParameter("img3");
            String img4 = request.getParameter("img4");
            String percent = request.getParameter("percent");
            int qty = Integer.parseInt(request.getParameter("qty"));
            int price = Integer.parseInt(request.getParameter("price"));
            String content = request.getParameter("content");
            String info = request.getParameter("info");

            ProductService.insertProduct(name, classify, img, img2, img3, img4, percent, qty, price, content, info);
            response.sendRedirect("ProAdmin");
        }
    }
}
