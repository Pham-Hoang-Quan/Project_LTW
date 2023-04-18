package vn.edu.hcmuaf.ttt.MailOTP;

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

        int user_passRD = Integer.parseInt(request.getParameter("passRD"));
        String str2 = Integer.toString(user_passRD);

        OTPService.updatePassRD(str2,user_id);

        response.sendRedirect("login.jsp");

    }
}
