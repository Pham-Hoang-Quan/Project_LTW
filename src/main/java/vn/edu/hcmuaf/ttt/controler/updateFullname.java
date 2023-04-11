package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.bean.User;
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
        String account  = request.getParameter("account");
        String user_name = request.getParameter("user_name");
        String user_email = request.getParameter("user_email");
        String user_sdt = request.getParameter("user_sdt");
        String user_pass = request.getParameter("user_passNew");
        String enterpass_old = request.getParameter("enterpass_old");
        String pass_old = request.getParameter("pass_old");
        User a = UserService.checkExist(user_name);

        if(a == null){
            if(user_pass != null && user_pass.length() <8 ){
//                request.setAttribute("meseger", "mật khẩu phải ít nhất 8 ký tự");
                request.getRequestDispatcher("uadateInfo.jsp").forward(request,response);
            }else if(user_pass != null && !user_pass.matches(".*[!@#$%^&*()].*") ) {
//                request.setAttribute("mesegers", "mật khẩu phải có ít nhất một ký tự đặt biệt");
                request.getRequestDispatcher("uadateInfo.jsp").forward(request, response);

            }else{
                if(enterpass_old.equals(pass_old)){
                    UserService.updateFull_name(user_fullname,user_name, account, user_email,user_sdt, user_pass, user_id);
                    HttpSession session = request.getSession(false);
                    session.invalidate();
                    request.setAttribute("success","cập nhật tài khoản thành công mời bạn đăng nhập lại");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }  else {
                    request.setAttribute("messerger","mật khẩu cũ không trùng khớp");
                    request.getRequestDispatcher("uadateInfo.jsp").forward(request,response);
                }
            }



        }else {
            request.setAttribute("mess", "Tên người dùng đã tồn tại, vui lòng đặt tên khác!");
            request.getRequestDispatcher("uadateInfo.jsp").forward(request,response);
        }
        }





}
