package vn.edu.hcmuaf.ttt.controler;

<<<<<<< HEAD
import vn.edu.hcmuaf.ttt.bean.Log;
=======
import org.mindrot.jbcrypt.BCrypt;
>>>>>>> 19e1a260646893a61756f7bd4295f261f7f10bd5
import vn.edu.hcmuaf.ttt.bean.LoginUser;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.model.Cart;
import vn.edu.hcmuaf.ttt.service.CookieUtils;
import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet(name = "Login", value = "/dologin")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          String username = CookieUtils.get("user", request);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LoginUser userl = new LoginUser();
        String user_name = request.getParameter("user");
        String user_password = request.getParameter("pass");

<<<<<<< HEAD
        User user = UserService.getInstance().checkLogib(user_name, user_password);

=======
        User user = UserService.getInstance().checkLogib(user_name);

        Cart cart = new Cart(user,0,0);

      if(user == null){
          request.setAttribute("mess", "Sai Tên người dùng hoặc Mật khẩu");
          request.getRequestDispatcher("login.jsp").forward(request,response);
      } else {
          String hashedPassword = user.getUser_password();
          boolean passMatch = BCrypt.checkpw(user_password, hashedPassword);
          if (passMatch) {
              HttpSession session = request.getSession(true);
              session.setAttribute("auth", user);
              session.setAttribute("cart",cart);
              session.setAttribute("userId", user.getUser_id());
          }
>>>>>>> 19e1a260646893a61756f7bd4295f261f7f10bd5

        Cart cart = new Cart(user, 0, 0);
        if (user == null) {
            request.setAttribute("mess", "Sai Tên người dùng hoặc Mật khẩu");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            DB.me().insert(new Log(Log.INFO,1,"dologin-Sai Tên người dùng hoặc Mật khẩu", user_name + ", " + user_password,0));
        } else {
            if (user.getLooked() == 1) {
                request.setAttribute("locked", "Tài khoản bạn đã bị khóa vui lòng liên hệ hotline: 18008080 để mở khóa.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                DB.me().insert(new Log(Log.WARNING,1,"dologin-Tài khoản bạn đã bị khóa",user_name + ", " + user_password,0));
            } else {
                HttpSession session = request.getSession(true);
                session.setAttribute("auth", user);
                session.setAttribute("cart",cart);


                if (userl.isRemember()) {
                    CookieUtils.add("user", user_name, 2, response);

<<<<<<< HEAD
                } else {
                    CookieUtils.add("user", user_name, 0, response);

                }

                request.setAttribute("messs", "Bạn đã đăng nhập thành công");
                response.sendRedirect("/THDoAn_war/");
                DB.me().insert(new Log(Log.INFO,1,"dologin-đăng nhập thành công", user_name + ", " + user_password,0));

            }


//          response.sendRedirect("index1.jsp");
        }
=======
          request.setAttribute("messs", "Bạn đã đăng nhập thành công");
          response.sendRedirect("/THDoAn_war/");
//          response.sendRedirect("index1.jsp");
      }
>>>>>>> 19e1a260646893a61756f7bd4295f261f7f10bd5
    }

}
