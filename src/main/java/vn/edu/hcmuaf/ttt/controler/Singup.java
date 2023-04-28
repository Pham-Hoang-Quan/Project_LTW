package vn.edu.hcmuaf.ttt.controler;

<<<<<<< HEAD
import vn.edu.hcmuaf.ttt.bean.Log;
=======
import org.mindrot.jbcrypt.BCrypt;
>>>>>>> 19e1a260646893a61756f7bd4295f261f7f10bd5
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "Singup", value = "/dosingup")
public class Singup extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_name = request.getParameter("user_name");
        String user_password = request.getParameter("user_password");
        String user_fullname = request.getParameter("user_fullname");

        String hashedPassword = BCrypt.hashpw(user_password, BCrypt.gensalt(12));

        String account = request.getParameter("account");
        String user_email = request.getParameter("user_email");
        String user_sdt = request.getParameter("user_sdt");
        String re_pass = request.getParameter("repass");
        User a = UserService.checkExist(user_name);
        
        if( a == null){
            if(user_password != null && user_password.length() <8 ){
                request.setAttribute("meseger", "mật khẩu phải ít nhất 8 ký tự");
                request.getRequestDispatcher("form_dk.jsp").forward(request,response);
            }else if(user_password != null && !user_password.matches(".*[!@#$%^&*()].*") ) {
                request.setAttribute("mesegers", "mật khẩu phải có ít nhất một ký tự đặt biệt");
                request.getRequestDispatcher("form_dk.jsp").forward(request, response);

            }else {

                if(user_password.equals(re_pass)){
                    UserService.singup(user_fullname,user_name,account,user_email,user_sdt, hashedPassword);
                    response.sendRedirect("login.jsp");
                    DB.me().insert(new Log(Log.INFO,1,"dosingup-singup", user_fullname + ", " + user_name + ", "+ account + ", "+ user_email + ", "+ user_sdt+ ", " + user_password,0));
                }else{
                    request.setAttribute("messs", "Mật khẩu không trùng khớp!");
                    request.getRequestDispatcher("form_dk.jsp").forward(request,response);
                    DB.me().insert(new Log(Log.INFO,1,"dosingup-Mật khẩu không trùng khớp", user_password +",mật khẩu nhập lại:  " + re_pass ,0));
                }
            }




        }else {
            request.setAttribute("mess", "Tên người dùng đã tồn tại, vui lòng đặt tên khác!");
            request.getRequestDispatcher("form_dk.jsp").forward(request,response);
            DB.me().insert(new Log(Log.INFO,1,"dosingup-Tên người dùng đã tồn tại", user_name,0));
        }
    }

    }

