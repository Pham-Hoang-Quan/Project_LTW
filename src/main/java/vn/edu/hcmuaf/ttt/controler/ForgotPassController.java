package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.Mail.EmailUtil;
import vn.edu.hcmuaf.ttt.MailOTP.OTPService;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.model.Email;
import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Random;

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

                Random random = new Random();
//                int otpNumber = random.nextInt(900000) + 100000; // Tạo số ngẫu nhiên có 6 chữ số
//                String otpString = Integer.toString(otpNumber); // Chuyển đổi số thành chuỗi
                Timestamp created_at = new Timestamp(System.currentTimeMillis());
                Timestamp  expires_at = new Timestamp(System.currentTimeMillis() + 5*60*1000);
//                OTPService.codeOTP(Integer.parseInt(otpString), created_at, expires_at);

                // Tạo mã OTP ngẫu nhiên
                int otpNumber = random.nextInt(900000) + 100000; // Tạo số ngẫu nhiên có 6 chữ số
                String otpString = Integer.toString(otpNumber); // Mã OTP có 6 chữ số
                long expiryTime = System.currentTimeMillis() + 5*60*1000;
                int intNumber1 = Long.valueOf(expiryTime).intValue();

                // Thời hạn cho mã OTP là 5 phút

                // Lưu mã OTP và thời hạn của nó vào session
                HttpSession session = request.getSession();
                session.setAttribute("otp", otpString);
                session.setAttribute("expiryTime", intNumber1);
                session.setAttribute("user", acc);



                Email email1 = new Email();
                email1.setFrom("nguyenthitienie06@gmail.com");
                email1.setFromPasswork("iwnmkhegwvodhrna");
                email1.setTo(email);
                email1.setSubject("Gửi Mã OTP");
                StringBuffer sb = new StringBuffer();
                sb.append("Gửi ").append(user);
                sb.append("Bạn đang sử dụng chức năng quên mật khẩu");
//                sb.append("You password is <b>").append(acc.getUser_password());
                sb.append("Chúng tôi gửi đến bạn mã OTP:  ").append(Integer.parseInt(otpString));
                sb.append("Mã OTP hết hạn lúc:  ").append(expires_at);
                sb.append("Trân trọng");
                sb.append("Người quản lý. ");

                email1.setContent(sb.toString());
                EmailUtil.send(email1);
                OTPService.codeOTP(Integer.parseInt(otpString), created_at, expires_at);
                request.setAttribute("message", "OTP đã được gửi vào mail của bạn bạn hãy xem mail và nhập mã OTP.");

            }

        } catch (Exception e){
            request.setAttribute("message", e.getMessage());

        } request.getRequestDispatcher("otpMail.jsp").forward(request, response);

    }
}
