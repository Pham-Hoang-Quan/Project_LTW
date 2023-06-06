package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.model.hoaDon;
import vn.edu.hcmuaf.ttt.model.oderdetail;
import vn.edu.hcmuaf.ttt.service.hoaDonService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetailBill", value = "/DetailBill")
public class DetailBill extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        boolean isLoggedIn = user != null;

//        boolean isNormalUser = isLoggedIn && user.getUser_admin() != 1;
        boolean saler = isLoggedIn && user.getUser_admin() == 2 ;
        boolean admin = isLoggedIn && user.getUser_admin() == 1 ;
        if (!isLoggedIn) {
            response.sendRedirect("admin/login.jsp");
            DB.me().insert(new Log(Log.DANGER,1,"/DiscoutList",  "Truy cập trái phép" ,1));

        } else {
            int soHD = Integer.parseInt(request.getParameter("SoHD"));
            int TTHD1 = Integer.parseInt(request.getParameter("SoHD"));

            List<hoaDon> LSsoHD = hoaDonService.getdetaibill(soHD);
            hoaDon tthoaDon = hoaDonService.getinfoBill(TTHD1);
            request.setAttribute("LSsoHD", LSsoHD);
            request.setAttribute("TTHD1", tthoaDon);
            oderdetail oder_detaill = hoaDonService.getodertran(soHD);
            request.setAttribute("oder_detaill", oder_detaill);

            request.getRequestDispatcher("admin/detailBill.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
