package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.bean.User;

import vn.edu.hcmuaf.ttt.service.MailService;
import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ForgotPassword", value = "/forgot_passwords")
public class ForgotPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


            String emailAddres = request.getParameter("email");


            User user = UserService.findByUserNameAndEmail(emailAddres);

            if(user==null){

                request.setAttribute("error", "email này chưa được đăng ký");
                response.sendRedirect("password.jsp");
            }else {

                MailService.sendMail(emailAddres, "mat khau", user.getUser_password());
                request.setAttribute("message", "đã gửi vào mail của bạn");


                request.getRequestDispatcher("password.jsp").forward(request,response);
            }


    }
}
