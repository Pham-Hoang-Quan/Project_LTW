package vn.edu.hcmuaf.ttt.controler;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "updateFullname", value = "/update-fullname")
public class updateFullname extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_fullname = request.getParameter("user_fullnameN");
        String user_id  = request.getParameter("user_id");
        int id_user = Integer.parseInt(user_id);
        String account  = request.getParameter("account");
        String user_name = request.getParameter("user_name");
        String user_email = request.getParameter("user_email");
        String user_sdt = request.getParameter("user_sdt");
        String user_pass = request.getParameter("user_passNew");

        String enterpass_old = request.getParameter("enterpass_old");
        String pass_old = request.getParameter("pass_old");

        //mã hóa
        String hashedPassword = BCrypt.hashpw(user_pass, BCrypt.gensalt());
        boolean match = BCrypt.checkpw(enterpass_old, pass_old);
//        BCrypt.checkpw(user_password, user.getUser_password())
//        User a = UserService.checkExist(user_name);

//        if(a == null){
            if(user_pass != null && user_pass.length() <8 ){
//                request.setAttribute("meseger", "mật khẩu phải ít nhất 8 ký tự");
                request.getRequestDispatcher("updateInfo.jsp").forward(request,response);
            }else if(user_pass != null && !user_pass.matches(".*[!@#$%^&*()].*") ) {
//                request.setAttribute("mesegers", "mật khẩu phải có ít nhất một ký tự đặt biệt");
                request.getRequestDispatcher("updateInfo.jsp").forward(request, response);

            }else{
                if(match == true){
                    UserService.updateFull_name(user_fullname,user_name, account, user_email,user_sdt, hashedPassword, user_id);
                    HttpSession session = request.getSession(false);
                    session.invalidate();
                    request.setAttribute("success","cập nhật tài khoản thành công mời bạn đăng nhập lại");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    DB.me().insert(new Log(Log.INFO,id_user,"update-fullname", user_fullname+", "+user_name+", "+ account+", "+ user_email+", "+user_sdt +", "+ user_pass ,0));


                }  else {
                    request.setAttribute("messerger","mật khẩu cũ không trùng khớp");
                    request.getRequestDispatcher("updateInfo.jsp").forward(request,response);
                    DB.me().insert(new Log(Log.WARNING,id_user,"update-fullname_mật khẩu cũ không trùng khớp", enterpass_old ,0));

                }
            }


//
//        }else {
//            request.setAttribute("mess", "Tên người dùng đã tồn tại, vui lòng đặt tên khác!");
//            request.getRequestDispatcher("uadateInfo.jsp").forward(request,response);
//            DB.me().insert(new Log(Log.INFO,id_user,"update-nhập tên người dùng bị trùng", user_name,0));

//        }
        }





}
