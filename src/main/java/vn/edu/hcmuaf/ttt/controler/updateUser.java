package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "updateUser", value = "/update_user")
public class updateUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id = request.getParameter("uesr_id");
        String user_name = request.getParameter("user_nameN");
        String pass_old = request.getParameter("pass_old");
        String pass = request.getParameter("user_passwordN");
        String user_fullname = request.getParameter("user_fullnameN");
        String account = request.getParameter("accountN");
        String user_email = request.getParameter("user_emailN");
        String user_sdt = request.getParameter("user_sdtN");
        String pass_new = request.getParameter("pass_new");
        String pass_old1 = request.getParameter("pass_old1");


        if(pass_old.equals(pass_old1)){
            UserService.updateUser(user_fullname,user_name,account,user_email,user_sdt,pass_new,user_id);
            HttpSession session = request.getSession(false);
            session.invalidate();
            request.getRequestDispatcher("index1.jsp").forward(request,response);

        }
        else {
            request.setAttribute("messerger","mật khẩu cũ không trùng khớp");
            request.getRequestDispatcher("uadateInfo.jsp").forward(request,response);
        }

    }
}
