package vn.edu.hcmuaf.ttt.MailOTP;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.db.DB;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
@WebServlet(name = "passRamdom", value = "/passRamdom")
public class passRamdom extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id = request.getParameter("user");
        int id_user = Integer.parseInt(user_id);

        int user_passRD = Integer.parseInt(request.getParameter("passRD"));
        String passString = String.valueOf(user_passRD);
        String hashedPassword = BCrypt.hashpw(passString, BCrypt.gensalt(12));

        String str2 = Integer.toString(user_passRD);

        OTPService.updatePassRD(hashedPassword,user_id);

        response.sendRedirect("login.jsp");
        DB.me().insert(new Log(Log.INFO,id_user,"gửi lại OTP", passString,0));



    }
}
