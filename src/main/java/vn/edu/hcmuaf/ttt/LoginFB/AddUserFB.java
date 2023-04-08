package vn.edu.hcmuaf.ttt.LoginFB;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "AddUserFB", value = "/AddUserFB")
public class AddUserFB extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_name = request.getParameter("id");
        String user_fullname = request.getParameter("username");

        String user_email = request.getParameter("email");
//        String id_fb = request.getParameter("id");

//
        User user = UserService.checkIb_fb(user_name);
        if(user == null){
            Random r = new Random();
            int user_passgg = r.nextInt(10000);

            UserService.sinupFB(user_fullname,user_email,user_passgg + "",user_name);

            User users = UserService.checkIb_fb(user_name);
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", users);
            response.sendRedirect("/THDoAn_war/");
        }else{
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", user);
            response.sendRedirect("/THDoAn_war/");
        }
//
//
//
//
//        UserService.sinupFB(user_fullname,user_email,user_passgg + "",user_name);
//        HttpSession session = request.getSession(true);
//            session.setAttribute("fbname", user_fullname);
//              response.sendRedirect("/THDoAn_war/");
    }
}
