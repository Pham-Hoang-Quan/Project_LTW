package vn.edu.hcmuaf.ttt.controler;

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
        List<Product> list = ProductService.getData();
        List<Category> listc = ProductService.getCategory();
        List<Product> listsptt = ProductService.getSanPhamTuongTu() ;
        String indextpage = request.getParameter("index");
        if(indextpage == null){
            indextpage = "1";
        }
        int index = Integer.parseInt(indextpage);



        String[] categories = request.getParameterValues("category");
        double minPrice;
        double maxPrice;
        try {
            minPrice = Double.parseDouble(request.getParameter("minPrice"));
            maxPrice  = Double.parseDouble(request.getParameter("maxPrice"));
        } catch (NullPointerException e) {
            minPrice = 0;
            maxPrice = 0;
        }



        List<Category> classifies = CategoryService.getCategoriesBasedOnId(categories);

        int count = ProductService.countTotalProducts(new ProductFilterParams(maxPrice, minPrice, index, classifies));
        int endPage = count /12;
        if(count % 12 != 0){
            endPage++;
        }


        List<Product> page = ProductService.getFilteredProducts(index, new ProductFilterParams(maxPrice, minPrice, index, classifies));

        request.setAttribute("list", page);


        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        request.setAttribute("listc", listc);
        request.setAttribute("listsptt", listsptt);


    request.getRequestDispatcher("store.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
