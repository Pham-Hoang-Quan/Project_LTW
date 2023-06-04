package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.model.hoaDon;
import vn.edu.hcmuaf.ttt.model.oderdetail;
import vn.edu.hcmuaf.ttt.service.hoaDonService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "detailHistoryServlet", value = "/detailHistory")
public class detailHistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User auth= (User) session.getAttribute("auth");
        int soHD = Integer.parseInt(request.getParameter("soHD"));
        hoaDon tthoaDon = hoaDonService.getinfoBill(soHD);
        request.setAttribute("tthoaDon", tthoaDon);
        List<hoaDon> productOder = hoaDonService.getdetaibill(soHD);
        request.setAttribute("productOder", productOder);
        oderdetail oder_detail = hoaDonService.getodertran(soHD);
        request.setAttribute("oder_detail", oder_detail);





        request.getRequestDispatcher("detailHistory.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
