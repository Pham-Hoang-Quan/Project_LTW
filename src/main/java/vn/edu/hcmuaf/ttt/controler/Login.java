package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.model.Cart;
import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Login", value = "/dologin")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String user_name = request.getParameter("user");
     String user_password = request.getParameter("pass");
        User user = UserService.getInstance().checkLogib(user_name,user_password);
        Cart cart = new Cart(user,0,0);
      if(user == null){
          request.setAttribute("mess", "Sai Tên người dùng hoặc Mật khẩu");
          request.getRequestDispatcher("login.jsp").forward(request,response);
      }else {


          HttpSession session = request.getSession(true);
          session.setAttribute("auth", user);

          session.setAttribute("cart",cart);
          response.sendRedirect("/THDoAn_war");


//          response.sendRedirect("index1.jsp");
      }

    }
}
