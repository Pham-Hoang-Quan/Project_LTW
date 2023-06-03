package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.admin.service.UserService;
import vn.edu.hcmuaf.ttt.bean.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DetailUser", value = "/DetailUser")
public class DetailUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        boolean isLoggedIn = user != null;
        boolean isNormalUser = isLoggedIn && user.getUser_admin() == 0;
        if (!isLoggedIn || isNormalUser) {
            response.sendRedirect("/admin/login.jsp");
        } else {
            String id = request.getParameter("id");

            User userr = UserService.detailUser(id);


            request.setAttribute("userr", userr);
            request.getRequestDispatcher("admin/detailUser.jsp").forward(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
