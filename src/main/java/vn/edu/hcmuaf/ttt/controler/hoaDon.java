package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.service.hoaDonService;
import vn.edu.hcmuaf.ttt.service.transService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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

        String tongGia = request.getParameter("tongTien");

        List<String[]> listHoadon = new ArrayList<>();
        int idi = Integer.parseInt(request.getParameter("countSP"));
        for (int i = 1; i <= idi; i++) {
            String qty = request.getParameter("qty"+i);
            String id = request.getParameter("id"+i);
            String nameSP = request.getParameter("nameSP"+i);
            String soLuong = request.getParameter("soLuong" +i);
            String[] s = new String[3];
            s[0] = id;
            s[1] = nameSP;
            s[2] = soLuong;
            listHoadon.add(s);
        }
        Random r = new Random();
        int soHD = r.nextInt(10000);
        for (String[] s:
             listHoadon) {
            new hoaDonService().hoaDon(soHD+"",user_id,fullName,email,tel,city,dis,wa,note,s[0],s[1],tongGia,s[2]);
//            new transService().trans(soHD+"",s[0],s[1],s[2]);
        }



        response.sendRedirect("/THDoAn_war/");





    }
}
