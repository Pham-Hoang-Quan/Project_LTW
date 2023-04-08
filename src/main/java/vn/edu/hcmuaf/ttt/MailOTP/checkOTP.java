package vn.edu.hcmuaf.ttt.MailOTP;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet(name = "checkOTP", value = "/checkOTP")
public class checkOTP extends HttpServlet {
    private int otpAttempts = 0;
    private static final int MAX_OTP_ATTEMPTS = 3;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String userOtp = request.getParameter("enterOTP");
//        OTP code = OTPService.checkCodeOTP(userOtp);
//        OTP expires_at = (OTP) OTPService.expires_at();
//        Timestamp ht = new Timestamp(System.currentTimeMillis());


//        Timestamp  expires_at1 = new Timestamp(System.currentTimeMillis() + 5*60*1000);

//        if (userOtp.equals(code)) {
////            if (ht.before(expires_at)) {
//                // Mã OTP hợp lệ và chưa hết hạn
//                // Thực hiện các thao tác tiếp theo ở đây
//
//            } else {
//                // Mã OTP đã hết hạn
//                // Thực hiện xử lý tại đây
//                request.setAttribute("mess", "Mã OTP đã hết hạn");
//            }
//            response.sendRedirect("indext.jsp");
//        } else {
//            // Mã OTP không đúng
//            // Thực hiện xử lý tại đâ
//            request.setAttribute("messs", "Mã OTP không đúng");
//            response.sendRedirect("indext.jsp");
//
//
//        }
// Kiểm tra xem mã OTP có hợp lệ không
        String userOtp = request.getParameter("enterOTP");
        String otp = request.getParameter("otp");

        String user_id = request.getParameter("id_user");

        long currentTime = System.currentTimeMillis();
        int intNumber = Long.valueOf(currentTime).intValue();
        int expiryTime = Integer.parseInt(request.getParameter("expiryTime"));

        if (userOtp.equals(otp)) {
            if (intNumber < expiryTime) {
                // Mã OTP hợp lệ và chưa hết hạn
                //request.setAttribute("messs", "Mã OTP không đúng");
                response.sendRedirect("passwordRamdom.jsp");
            } else {
                // Mã OTP đã hết hạn
                // Thực hiện xử lý tại đây
                request.setAttribute("messs", "Mã OTP đã hết hạn");
                request.getRequestDispatcher("otpMail.jsp").forward(request, response);
            }
            otpAttempts = 0;
        }
        else {
            request.setAttribute("err", "Mã OTP không đúng vui lòng nhập lại");
            request.getRequestDispatcher("otpMail.jsp").forward(request, response);
        }
        //neu nhap sai 3 lan se khoa tai khoan
        otpAttempts++;
        if (otpAttempts == MAX_OTP_ATTEMPTS) {
            OTPService.updateLockUser(user_id);
            request.setAttribute("errr", "Tài khoản của bạn đã bị khóa vui lòng liên hệ admin");
            request.getRequestDispatcher("otpMail.jsp").forward(request, response);
        }
    }
}



