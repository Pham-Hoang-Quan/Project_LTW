package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.model.Category;
import vn.edu.hcmuaf.ttt.model.Product;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProAdmin", value = "/ProAdmin")
public class ProAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        boolean isLoggedIn = user != null;
        boolean isNormalUser = isLoggedIn && user.getUser_admin() != 1;
        if (!isLoggedIn || isNormalUser) {
            response.sendRedirect("/THDoAn_war/List-Product");
        } else {
            List<Product> list = ProductService.getData();
            List<Category> listc = ProductService.getCategory();

            String indextpage = request.getParameter("index");
            if (indextpage == null) {
                indextpage = "1";
            }
            int index = Integer.parseInt(indextpage);

            List<Product> page = ProductService.pagingProductAdmin(index);

            request.setAttribute("list", page);

            // phân trang
            int count = ProductService.countProduct(); // số lượng sp trong database
            int endPage = count / 10; // mỗi trang có 10 sản phẩm
            if (count % 10 != 0) {
                endPage++;
            }

//        request.setAttribute("list", list);
            request.setAttribute("listc", listc);
            request.setAttribute("endP", endPage);
            request.setAttribute("tag", index);
            request.getRequestDispatcher("admin/product-manage.jsp").forward(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
