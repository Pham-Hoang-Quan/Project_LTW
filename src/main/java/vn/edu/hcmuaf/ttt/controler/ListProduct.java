package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.common.types.ProductFilterParams;
import vn.edu.hcmuaf.ttt.common.util.LastPageCalculator;
import vn.edu.hcmuaf.ttt.common.util.ProductQueryRetriever;
import vn.edu.hcmuaf.ttt.model.Category;
import vn.edu.hcmuaf.ttt.model.Product;
import vn.edu.hcmuaf.ttt.service.CategoryService;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListProduct", value = "/List-Product")
public class ListProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> listc = ProductService.getCategory();
        List<Product> listsptt = ProductService.getSanPhamTuongTu();

        ProductFilterParams params = ProductQueryRetriever.getProductFilterParams(
                request.getParameter("minPrice"),
                request.getParameter("maxPrice"),
                request.getParameterValues("category"),
                request.getParameter("index")
        );

        List<Product> page = ProductService.getFilteredProducts(params);

        request.setAttribute("list", page);

        request.setAttribute("endP", LastPageCalculator.getEndPage(params));
        request.setAttribute("tag", params.getPageIndex());

        request.setAttribute("listc", listc);
        request.setAttribute("listsptt", listsptt);

        request.getRequestDispatcher("store.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
