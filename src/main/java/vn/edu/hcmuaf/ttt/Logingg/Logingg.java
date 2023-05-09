package vn.edu.hcmuaf.ttt.Logingg;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "Logingg", value = "/doLogingg")
public class Logingg extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idd");
        String user_email = request.getParameter("email");
        String user_name = request.getParameter("id");
        Random r = new Random();
        int user_passgg = r.nextInt(10000);
        String s = String.valueOf(user_passgg);

        String hashedPassword = BCrypt.hashpw( s, BCrypt.gensalt());

        User user = UserService.getInstance().checkemailandidgg(user_email);
        if(user == null){

            UserService.singupGoogle(user_name,user_email, hashedPassword + "");
            User users = UserService.checkemailandidgg(user_email);
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", users);
            response.sendRedirect("/THDoAn_war/");
        }else {
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", user);
            response.sendRedirect("/THDoAn_war/");
        }
        DB.me().insert(new Log(Log.INFO,1,"doLogingg", user_name +", "+ user_email +", "+ hashedPassword ,0));
    }
}
