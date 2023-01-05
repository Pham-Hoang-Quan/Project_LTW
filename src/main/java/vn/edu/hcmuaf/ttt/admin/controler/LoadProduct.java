package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.model.Category;
import vn.edu.hcmuaf.ttt.model.Product;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadProduct", value = "/LoadProduct")
public class LoadProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id= request.getParameter("id");
        List<Category> listc = ProductService.getCategory();

        if (id != null) {
            Product product = ProductService.getProductById(id);
            request.setAttribute("product", product);
        } else {
            response.sendError(404, "Product Not Found");
        }
        request.setAttribute("listc", listc);

        request.getRequestDispatcher("admin/editProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
