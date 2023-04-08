package vn.edu.hcmuaf.ttt.Logingg;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "Logingg", value = "/doLogingg")
public class Logingg extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idd");
        String user_email = request.getParameter("email");
        String user_name = request.getParameter("id");

        User user = UserService.getInstance().checkemailandidgg(user_email);
        if(user == null){
            Random r = new Random();
            int user_passgg = r.nextInt(10000);
            UserService.singupGoogle(user_name,user_email, user_passgg + "");
            User users = UserService.checkemailandidgg(user_email);
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", users);
            response.sendRedirect("/THDoAn_war/");
        }else {
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", user);
            response.sendRedirect("/THDoAn_war/");
        }
    }
}
