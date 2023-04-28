package vn.edu.hcmuaf.ttt.MailOTP;

<<<<<<< HEAD
import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;
=======
import vn.edu.hcmuaf.ttt.Mail.EmailUtil;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.model.Email;
>>>>>>> 19e1a260646893a61756f7bd4295f261f7f10bd5
import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Random;

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

        String action = request.getParameter("action");
        String userOtp = request.getParameter("enterOTP");
        String otp = request.getParameter("otp");

        String user_id = request.getParameter("id_user");
        int id_user = Integer.parseInt(user_id);

        long currentTime = System.currentTimeMillis();
        int intNumber = Long.valueOf(currentTime).intValue();
        int expiryTime = Integer.parseInt(request.getParameter("expiryTime"));
<<<<<<< HEAD

        if (userOtp.equals(otp)) {
            if (intNumber < expiryTime) {
                // Mã OTP hợp lệ và chưa hết hạn
                //request.setAttribute("messs", "Mã OTP không đúng");
                response.sendRedirect("passwordRamdom.jsp");
                DB.me().insert(new Log(Log.INFO,id_user,"checkOTP-đúng", "mã OTP" + userOtp + ", Thời gian nhập: " + intNumber + ", Thời gian hết hạn: " + expiryTime ,0));
=======
        if (action.equals("submit")) {
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
>>>>>>> 19e1a260646893a61756f7bd4295f261f7f10bd5
            } else {
                request.setAttribute("err", "Mã OTP không đúng vui lòng nhập lại");
                request.getRequestDispatcher("otpMail.jsp").forward(request, response);
                DB.me().insert(new Log(Log.INFO,id_user,"checkOTP-Mã OTP đã hết hạn", "mã OTP" + userOtp + ", Thời gian nhập: " + intNumber + ", Thời gian hết hạn: " + expiryTime ,0));

            }
<<<<<<< HEAD
            otpAttempts = 0;
        } else {
            otpAttempts++;
            //neu nhap sai 3 lan se khoa tai khoan
            if (otpAttempts >= MAX_OTP_ATTEMPTS) {
                OTPService.updateLockUser(user_id);
                request.setAttribute("errr", "Tài khoản bạn đã bị khóa vui lòng liên hệ hotline: 18008080 để mở khóa.");
                request.getRequestDispatcher("otpMail.jsp").forward(request, response);
                DB.me().insert(new Log(Log.DANGER,id_user,"Khóa tài khoản", "số lần: " + otpAttempts,0));
            }else {
                request.setAttribute("err", "Mã OTP không đúng vui lòng nhập lại");
                request.getRequestDispatcher("otpMail.jsp").forward(request, response);
                DB.me().insert(new Log(Log.WARNING,id_user,"Nhập OTP sai", userOtp,0));

            }
=======
            //neu nhap sai 3 lan se khoa tai khoan
            otpAttempts++;
            if (otpAttempts >= MAX_OTP_ATTEMPTS) {
                OTPService.updateLockUser(user_id);
                request.setAttribute("errr", "Tài khoản của bạn đã bị khóa vui lòng liên hệ admin");
                request.getRequestDispatcher("otpMail.jsp").forward(request, response);
            }
        }else if (action.equals("resend_otp")){
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
                    long expiryTimee = System.currentTimeMillis() + 5*60*1000;
                    int intNumber1 = Long.valueOf(expiryTimee).intValue();

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
                    sb.append(" Chúng tôi gửi đến bạn mã OTP:  ").append(Integer.parseInt(otpString));
                    sb.append(" Mã OTP hết hạn lúc:  ").append(expires_at);
                    sb.append(" Trân trọng");
                    sb.append(" Người quản lý. ");

                    email1.setContent(sb.toString());
                    EmailUtil.send(email1);
                    OTPService.codeOTP(Integer.parseInt(otpString), created_at, expires_at);
                    request.setAttribute("message", "OTP đã được gửi lại vào mail của bạn bạn hãy xem mail và nhập mã OTP.");
                }

            } catch (Exception e){
                request.setAttribute("message", e.getMessage());

            } request.getRequestDispatcher("otpMail.jsp").forward(request, response);


>>>>>>> 19e1a260646893a61756f7bd4295f261f7f10bd5
        }
    }
}



