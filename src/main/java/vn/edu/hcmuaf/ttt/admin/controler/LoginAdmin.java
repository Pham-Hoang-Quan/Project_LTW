package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.bean.LoginUser;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.service.CookieUtils;
import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginAdmin", value = "/LoginAdmin")
public class LoginAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginUser userl = new LoginUser();
        String user_name = request.getParameter("user");
        String user_password = request.getParameter("pass");

        User user = UserService.getInstance().checkLogib(user_name,user_password);

        if(user == null){
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }else {
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", user);
            if(userl.isRemember()) {
                CookieUtils.add("user", user_name, 2, response);
            }else {
                CookieUtils.add("user", user_name, 0, response);
            }
            response.sendRedirect("/THDoAn_war/IndexAdmin");
        }
    }
}
