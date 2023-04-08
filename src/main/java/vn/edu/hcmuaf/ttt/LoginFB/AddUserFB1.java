package vn.edu.hcmuaf.ttt.LoginFB;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddUserFB1", value = "/AddUserFB1")
public class AddUserFB1 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_name = request.getParameter("id");
        User user = UserService.checkIb_fb(user_name);
        HttpSession session = request.getSession(true);
        session.setAttribute("auth", user);
        response.sendRedirect("/THDoAn_war/");


    }
}
