package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.model.hoaDon;
import vn.edu.hcmuaf.ttt.service.hoaDonService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SuccessHD", value = "/SuccessHD")
public class SuccessHD extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int soHds = Integer.parseInt(request.getParameter("soHD"));
        List<hoaDon> detailsHD = hoaDonService.getdetaibill(soHds);
        hoaDon infoCus = hoaDonService.getinfoBill(soHds);
        request.setAttribute("detailsHD", detailsHD);
        request.setAttribute("infoCus", infoCus);
        request.getRequestDispatcher("success.jsp").forward(request,response);




    }
}
