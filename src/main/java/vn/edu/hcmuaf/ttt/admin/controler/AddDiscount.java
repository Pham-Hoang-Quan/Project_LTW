package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.admin.service.DiscountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddDiscount", value = "/AddDiscount")
public class AddDiscount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameDis = request.getParameter("nameDis");
        String reduce = request.getParameter("reduce");
        int reducePrice = Integer.parseInt(request.getParameter("reducePrice"));
        String created_at = request.getParameter("create");
        String expires_at = request.getParameter("expires");

        DiscountService.insertDis(nameDis, reduce, reducePrice, created_at, expires_at);

        response.sendRedirect("DiscoutList");
    }
}
