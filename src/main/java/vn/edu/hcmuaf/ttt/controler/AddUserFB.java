package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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


        UserService.sinupFB(user_fullname,user_name,user_email);

              response.sendRedirect("/THDoAn_war/");

    }
}
