package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.model.hoaDon;
import vn.edu.hcmuaf.ttt.service.hoaDonService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Lichsu", value = "/lichsu")
public class Lichsu extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String user_id = request.getParameter("user_id");
        int id_user = Integer.parseInt(user_id);
        List<hoaDon> LShoaDon = hoaDonService.getlichSu(user_id);
        request.setAttribute("lshoadon", LShoaDon);
        request.getRequestDispatcher("support.jsp").forward(request,response);
        DB.me().insert(new Log(Log.INFO,id_user,"lichsu-Xem lịch sử",LShoaDon.toString(),0));






    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
