package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.service.hoaDonService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "hoaDon", value = "/doHoaDon")
public class hoaDon extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id = request.getParameter("userID");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String city = request.getParameter("city");
        String dis = request.getParameter("dis");
        String wa = request.getParameter("wa");
        String note = request.getParameter("note");
        String nameSP = request.getParameter("nameSP");
        String tongGia = request.getParameter("tongTien");
        new hoaDonService().hoaDon(user_id,fullName,email,tel,city,dis,wa,note,nameSP,tongGia);
        response.sendRedirect("/THDoAn_war/");





    }
}
