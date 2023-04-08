package vn.edu.hcmuaf.ttt.Logingg;

import vn.edu.hcmuaf.ttt.bean.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginGoogleServlet", value = "/loginGoogle")
public class LoginGoogleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public LoginGoogleServlet() {
        super();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            User user = GoogleUtils.getUserInfo(accessToken);
            request.setAttribute("id", user.getId());
            request.setAttribute("name", user.getUser_fullname());
            request.setAttribute("email", user.getemail());

            RequestDispatcher dis = request.getRequestDispatcher("indexlogingg.jsp");
            dis.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
