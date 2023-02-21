package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.Mail.EmailUtil;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.model.Email;
import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ForgotPassController", value = "/forgot-password")
public class ForgotPassController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("password.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String user = request.getParameter("user");
            User acc = UserService.findByUserAndEmail(user, email);
            if(acc == null) {
                request.setAttribute("message", "Tài Khoản hoặc email không chính xác!");

            }else {
                Email email1 = new Email();
                email1.setFrom("nguyenthitienie06@gmail.com");
                email1.setFromPasswork("iwnmkhegwvodhrna");
                email1.setTo(email);
                email1.setSubject("Forgot password function");
                StringBuffer sb = new StringBuffer();
                sb.append("Dear").append(user);
                sb.append("You are used the forgot password function. ");
                sb.append("You password is <b>").append(acc.getUser_password());
                sb.append("Regards");
                sb.append("Administrator");

                email1.setContent(sb.toString());
                EmailUtil.send(email1);
                request.setAttribute("message", "Mật khẩu đã được gửi vào tài khoản gmail của bạn, vui lòng kiểm tra email của bạn");

            }

        } catch (Exception e){
            request.setAttribute("message", e.getMessage());

        }request.getRequestDispatcher("password.jsp").forward(request, response);

    }
}
