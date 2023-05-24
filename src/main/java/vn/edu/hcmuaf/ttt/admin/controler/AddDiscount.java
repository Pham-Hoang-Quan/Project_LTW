package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.admin.service.DiscountService;
import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddDiscount", value = "/AddDiscount")
public class AddDiscount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        boolean isLoggedIn = user != null;

        boolean isCus = isLoggedIn && user.getUser_admin() ==  0;

        boolean isAdmin = isLoggedIn && user.getUser_admin() == 1;
        boolean isSaler = isLoggedIn && user.getUser_admin() == 2;



        String nameDis = request.getParameter("nameDis");
        String reduce = request.getParameter("reduce");
        int reducePrice = Integer.parseInt(request.getParameter("reducePrice"));
        String created_at = request.getParameter("create");
        String expires_at = request.getParameter("expires");

        DiscountService.insertDis(nameDis, reduce, reducePrice, created_at, expires_at);

        if(!isLoggedIn || !isSaler || !isAdmin) {
            DB.me().insert(new Log(Log.DANGER,1,"/AddDiscount",  "Truy cập trái phép" ,1));
        }
        if(isLoggedIn && isCus) {
            String user_id = user.getUser_id();
            int id_u = Integer.parseInt(user_id);
            DB.me().insert(new Log(Log.DANGER,id_u,"/AddDiscount",  "Truy cập trái phép" ,1));
        }


        response.sendRedirect("DiscoutList");
    }
}
