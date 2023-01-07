package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.model.Category;
import vn.edu.hcmuaf.ttt.model.Product;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchControl", value = "/search")
public class SearchControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String txtSearch = request.getParameter("s");

        List<Category> listc = ProductService.getCategory();
        List<Product> listsptt = ProductService.getSanPhamTuongTu() ;
        List<Product> listsearch = ProductService.searchByName(txtSearch);


        request.setAttribute("list", listsearch);

        request.setAttribute("listc", listc);
        request.setAttribute("listsptt", listsptt);

        request.getRequestDispatcher("store.jsp").forward(request,response);
    }
}
