package vn.edu.hcmuaf.ttt.MailOTP;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Random;

@WebServlet(name = "mailOTP", value = "/mailOTP")
public class mailOTP extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Random random = new Random();
        int otpNumber = random.nextInt(900000) + 100000; // Tạo số ngẫu nhiên có 6 chữ số
        String otpString = Integer.toString(otpNumber); // Chuyển đổi số thành chuỗi
        Timestamp created_at = new Timestamp(System.currentTimeMillis());
        Timestamp  expires_at = new Timestamp(System.currentTimeMillis() + 5*60*1000);
        String user_id = request.getParameter("userID");

        OTPService.codeOTP(Integer.parseInt(otpString), created_at, expires_at);
        response.sendRedirect("otpMail.jsp");
    }
}
