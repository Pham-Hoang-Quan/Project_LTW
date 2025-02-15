package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.model.hoaDon;
import vn.edu.hcmuaf.ttt.service.hoaDonService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "statusOrder", value = "/statusOrder")
public class statusOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id = request.getParameter("user_id");
        List<hoaDon> LShoaDon = hoaDonService.getStatusOrder(user_id);
        request.setAttribute("lshoadon", LShoaDon);
        request.getRequestDispatcher("order.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
