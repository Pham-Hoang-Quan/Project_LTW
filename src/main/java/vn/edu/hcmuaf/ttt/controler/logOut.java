package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.model.Category;
import vn.edu.hcmuaf.ttt.model.Product;
import vn.edu.hcmuaf.ttt.model.hoaDon;
import vn.edu.hcmuaf.ttt.service.ProductService;
import vn.edu.hcmuaf.ttt.service.UserService;
import vn.edu.hcmuaf.ttt.service.hoaDonService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "logOut", value = "/logOut")
public class logOut extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        session.invalidate();
        response.sendRedirect("/THDoAn_war/");


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
