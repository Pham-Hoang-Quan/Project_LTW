package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "SingupGoogle", value = "/singup-google")
public class SingupGoogle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_name = request.getParameter("user_name");
        String user_email = request.getParameter("user_email");
        Random r = new Random();
        int user_passgg = r.nextInt(10000);
        UserService.singupGoogle(user_name,user_email, user_passgg + "");
        response.sendRedirect("/THDoAn_war/");

    }
}
