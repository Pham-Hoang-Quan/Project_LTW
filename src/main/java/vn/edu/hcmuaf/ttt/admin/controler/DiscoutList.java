package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.admin.service.DiscountService;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.model.discount;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DiscoutList", value = "/DiscoutList")
public class DiscoutList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        boolean isLoggedIn = user != null;
//        boolean isNormalUser = isLoggedIn && user.getUser_admin() != 1;
        boolean saler = isLoggedIn && user.getUser_admin() == 2 ;
        boolean admin = isLoggedIn && user.getUser_admin() == 1 ;
        if (!saler && !admin )  {
            response.sendRedirect("http://localhost:8080/THDoAn_war/admin/login.jsp");
        } else {
            List<discount> listDis = DiscountService.listDiscount();

            request.setAttribute("listDis", listDis);
            request.getRequestDispatcher("admin/discountList.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
