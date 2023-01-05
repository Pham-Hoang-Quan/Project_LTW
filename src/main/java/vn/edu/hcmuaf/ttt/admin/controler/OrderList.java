//package vn.edu.hcmuaf.ttt.admin.controler;
//
//import vn.edu.hcmuaf.ttt.admin.service.HoaDon;
//
//import javax.servlet.*;
//import javax.servlet.http.*;
//import javax.servlet.annotation.*;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet(name = "OrderList", value = "/OrderList")
//public class OrderList extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<HoaDon> listHD = HoaDon.listHD();
//
//        request.setAttribute("listHD", listHD);
//
//        request.getRequestDispatcher("admin/order-manage.jsp").forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
//}
