package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.admin.service.IndexService;
import vn.edu.hcmuaf.ttt.model.Product;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "IndexAdmin", value = "/IndexAdmin")
public class IndexAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> list = ProductService.getData();
        List<Product> listn = ProductService.getLast();

        request.setAttribute("listn", listn);

        String countProduct;
        try {
            countProduct = IndexService.CountProducts();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("countProduct", countProduct);

        request.getRequestDispatcher("admin/index.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
