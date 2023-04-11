package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddUserFB", value = "/AddUserFB")
public class AddUserFB extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_name = request.getParameter("id");
        String user_password = null;
        String pass = null;
        String user_fullname = request.getParameter("username");
        String account = "fb";
        String user_email = request.getParameter("email");
        String user_sdt = null;
        String re_pass = null;
        User a = UserService.checkExist(user_name);
        request.getRequestDispatcher("fb_info.jsp").forward(request,response);
        UserService.singup(user_fullname,user_name,account,user_email,user_sdt, user_password);
        response.sendRedirect("List-Product");
//        String username = "fb";
//        String id = request.getParameter("id");
//        String username = request.getParameter("username");
//        String email = request.getParameter("email");
    }
}
