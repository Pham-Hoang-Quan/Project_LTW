package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.admin.service.CategoryService;
import vn.edu.hcmuaf.ttt.bean.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteCategory", value = "/DeleteCategory")
public class DeleteCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        boolean isLoggedIn = user != null;
        boolean isNormalUser = isLoggedIn && user.getUser_admin() != 1;
        if (!isLoggedIn || isNormalUser)  {
            response.sendRedirect("/THDoAn_war/List-Product");
        } else {
            String id = request.getParameter("id");
            CategoryService.deleteCategory(id);
            response.sendRedirect("CategoryAdmin");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
