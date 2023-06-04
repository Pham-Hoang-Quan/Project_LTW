package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.admin.service.HoaDon;
import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.model.hoaDon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderList", value = "/OrderList")
public class OrderList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        boolean isLoggedIn = user != null;
        boolean isNormalUser = isLoggedIn && user.getUser_admin() == 0;
        if (!isLoggedIn || isNormalUser) {

            response.sendRedirect("/admin/login.jsp");

            ///
            //log
//            if(user.getUser_id() != null) {
//                String user_id = user.getUser_id();
//                int id_u = Integer.parseInt(user_id);
//                DB.me().insert(new Log(Log.DANGER,id_u,"/OrderList",  "Truy cập trái phép" ,1));
//            }



            //
            ////

        } else {

            // 0: đơn chờ xác nhận

            List<hoaDon> listHD0 = HoaDon.getListHD0(0);
            request.setAttribute("listHD0", listHD0);
            // 1: đơn đang vận chuyển

            List<hoaDon> listHD1 = HoaDon.getListHD0(1);
            request.setAttribute("listHD1", listHD1);
            //2: đơn hàng đã nhận
            List<hoaDon> listHD2 = HoaDon.getListHD0(2);
            request.setAttribute("listHD2", listHD2);
            // 3: đơn đã hủy
            List<hoaDon> listHD3 = HoaDon.getListHD0(3);
            request.setAttribute("listHD3", listHD3);

            request.getRequestDispatcher("admin/order-manage.jsp").forward(request, response);

            String user_id = user.getUser_id();
            int id_u = Integer.parseInt(user_id);
            DB.me().insert(new Log(Log.INFO,id_u,"/OrderList",  "Truy cập danh sách đơn hàng" ,1));
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
