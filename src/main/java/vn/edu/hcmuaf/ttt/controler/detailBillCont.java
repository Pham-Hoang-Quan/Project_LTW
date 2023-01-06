package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.model.hoaDon;
import vn.edu.hcmuaf.ttt.service.hoaDonService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "detailBillCont", value = "/dodetailbill")
public class detailBillCont extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int soHD = Integer.parseInt(request.getParameter("soHD"));
        int TTHD = Integer.parseInt(request.getParameter("soHD"));

        List<hoaDon> LSsoHD = hoaDonService.getdetaibill(soHD);
        hoaDon tthoaDon = hoaDonService.getinfoBill(TTHD);
        request.setAttribute("LSsoHD", LSsoHD);
        request.setAttribute("TTHD", tthoaDon);
        request.getRequestDispatcher("detailBill.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
