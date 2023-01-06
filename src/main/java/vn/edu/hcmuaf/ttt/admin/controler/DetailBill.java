package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.model.hoaDon;
import vn.edu.hcmuaf.ttt.service.hoaDonService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetailBill", value = "/DetailBill")
public class DetailBill extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int soHD = Integer.parseInt(request.getParameter("SoHD"));
        int TTHD1 = Integer.parseInt(request.getParameter("SoHD"));

        List<hoaDon> LSsoHD = hoaDonService.getdetaibill(soHD);
        hoaDon tthoaDon = hoaDonService.getinfoBill(TTHD1);
        request.setAttribute("LSsoHD", LSsoHD);
        request.setAttribute("TTHD1", tthoaDon);
        request.getRequestDispatcher("admin/detailBill.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
