package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.model.Category;
import vn.edu.hcmuaf.ttt.model.Product;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
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

        int count = ProductService.getTotalProducts();
        int endPage = count /12;
        if(count % 12 != 0){
            endPage++;
        }

        List<String> classifies = new ArrayList<String>();
                classifies.add("Khoan mini");
        classifies.add("Khoan bàn");
        List<Product> page = ProductService.getFilteredProducts(index, new ProductFilterQueryParams(700000, 1000, index, classifies));

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
