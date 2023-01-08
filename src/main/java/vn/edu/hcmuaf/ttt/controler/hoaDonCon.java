package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.service.hoaDonService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet(name = "hoaDonCon", value = "/doHoaDon")
public class hoaDonCon extends HttpServlet {
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
        String dateComment = request.getParameter("dateComment");



        List<String[]> listHoadon = new ArrayList<>();
        int idi = Integer.parseInt(request.getParameter("countSP"));
        for (int i = 1; i <= idi; i++) {
            String qty = request.getParameter("qty"+i);
            String id = request.getParameter("id"+i);
            String nameSP = request.getParameter("nameSP"+i);
            String soLuong = request.getParameter("soLuong" +i);
            String tongGia = request.getParameter("gia" + i);
            String[] s = new String[4];

            s[0] = id;
            s[1] = nameSP;
            s[2] = soLuong;
            s[3] = tongGia;
            listHoadon.add(s);
        }
        Random r = new Random();
        int soHD = r.nextInt(10000);
        for (String[] s:
             listHoadon) {

                new hoaDonService().hoaDon(soHD + "", user_id, fullName, email, tel, city, dis, wa, note, s[0], s[1], s[3], s[2], dateComment);

            new hoaDonService().updateQty(s[2], s[0]);


        }





        response.sendRedirect("/THDoAn_war/");





    }
}
