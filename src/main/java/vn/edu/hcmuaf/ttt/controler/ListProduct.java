package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.common.types.ProductFilterParams;
import vn.edu.hcmuaf.ttt.common.util.LastPageCalculator;
import vn.edu.hcmuaf.ttt.common.util.ProductQueryRetriever;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.model.Category;
import vn.edu.hcmuaf.ttt.model.Product;
import vn.edu.hcmuaf.ttt.service.CategoryService;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Base64;
import java.nio.ByteBuffer;

@WebServlet(name = "ListProduct", value = "/List-Product")
public class ListProduct extends HttpServlet {
    String name="List-Product";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//phần lọc ở đây
        List<Category> listc = ProductService.getCategory();
        ProductFilterParams params = ProductQueryRetriever.getProductFilterParams(
                request.getParameter("minPrice"),
                request.getParameter("maxPrice"),
                request.getParameterValues("category"),
                request.getParameter("index")
        );
        List<Product> page = ProductService.getFilteredProducts(params);
        List<Product> listsptt = ProductService.getSanPhamTuongTu();

//
        request.setAttribute("list", page);
        request.setAttribute("endP", LastPageCalculator.getEndPage(params));
        request.setAttribute("tag", params.getPageIndex());
        request.setAttribute("listc", listc);
        request.setAttribute("listsptt", listsptt);

//tien sủa lại phân trang(chưa có lọc)
//        List<Category> listc = ProductService.getCategory();
//        List<Product> listsptt = ProductService.getSanPhamTuongTu() ;
//        String indextpage = request.getParameter("index");
//        if(indextpage == null){
//            indextpage = "1";
//        }
//        int index = Integer.parseInt(indextpage);
//        int count = ProductService.getTotalProducts();
//        int endPage = count /12;
//        if(count % 12 != 0){
//            endPage++;
//        }
//        List<Product> page = ProductService.pagingProduct(index);
//
//        request.setAttribute("list", page);
//        request.setAttribute("endP", endPage);
//        request.setAttribute("tag", index);
//        request.setAttribute("listc", listc);
//        request.setAttribute("listsptt", listsptt);
//        request.setAttribute("list", filter);
//                request.setAttribute("endP", LastPageCalculator.getEndPage(params));
//        request.setAttribute("tag", params.getPageIndex());

//        HttpSession session = request.getSession(false);
//        String userId = (String) session.getAttribute("userId");
//        int userid = Integer.parseInt(userId);

//        int id_user = Integer.parseInt(user_id);

//
//        request.getRequestDispatcher("store.jsp").forward(request, response);
//        if (session != null) {
              // Lấy giá trị id user từ session
            String userId = request.getParameter("u");


//mã hóa id bằng Base64
        byte[] decodedBytes = Base64.getDecoder().decode(userId);
        String decodedText = new String(decodedBytes);
        int userid = Integer.parseInt(decodedText);

            request.getRequestDispatcher("store.jsp").forward(request, response);
            DB.me().insert(new Log(Log.INFO,userid,name, page.toString(),0));



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
