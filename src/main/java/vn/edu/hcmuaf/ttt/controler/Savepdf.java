package vn.edu.hcmuaf.ttt.controler;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import vn.edu.hcmuaf.ttt.model.hoaDon;
import vn.edu.hcmuaf.ttt.service.hoaDonService;

@WebServlet(name = "Savepdf", value = "/Savepdf")
public class Savepdf extends HttpServlet {
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
        request.getRequestDispatcher("save-pdf.jsp").forward(request,response);

    }
}
