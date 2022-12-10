package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.model.Category;
import vn.edu.hcmuaf.ttt.model.Product;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListIndex", value = "/List-Index")
public class ListIndex extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> listn = ProductService.getLast() ;
        List<Product> lists = ProductService.getSale();
        List<Category> lista = ProductService.getCategoryIndex();
        List<Category> listc = ProductService.getCategory();
        String CTID = request.getParameter("cName");
        List<Product> listPI = ProductService.getCTID(CTID) ;
        request.setAttribute("listn", listn);
        request.setAttribute("lists", lists);
        request.setAttribute("lista", lista);
        request.setAttribute("listPI", listPI);
        request.setAttribute("listc", listc);

        request.getRequestDispatcher("index.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
