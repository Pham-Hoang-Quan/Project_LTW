package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.admin.service.UserService;
import vn.edu.hcmuaf.ttt.bean.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EditUser", value = "/EditUser")
public class EditUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        boolean isLoggedIn = user != null;
        boolean isNormalUser = isLoggedIn && user.getUser_admin() == 0;
        if (!isLoggedIn || isNormalUser)  {
            response.sendRedirect("http://localhost:8080/THDoAn_war/admin/login.jsp");
        } else {
            int id = Integer.parseInt(request.getParameter("idUser"));
            String name = request.getParameter("fullname");
            int admin = Integer.parseInt(request.getParameter("admin"));
            String email = request.getParameter("email");
            String sdt = request.getParameter("sdt");
            String username = request.getParameter("username");


            UserService.editUser(id,name, admin,email,sdt, username);
            response.sendRedirect("StaffList");
        }
    }
}
