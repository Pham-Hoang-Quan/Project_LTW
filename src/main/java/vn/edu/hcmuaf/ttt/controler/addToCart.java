package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.model.Cart;
import vn.edu.hcmuaf.ttt.model.Category;
import vn.edu.hcmuaf.ttt.model.Product;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "addToCart", value = "/addToCart")
public class addToCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");
        User auth= (User) session.getAttribute("auth");
        String id = request.getParameter("id");


        Product product = ProductService.getProductById(id);
        product.setQuantily(1);
        cart.put(product);


        List<Product> list = ProductService.getData();
        List<Category> listc = ProductService.getCategory();
        List<Product> listsptt = ProductService.getSanPhamTuongTu();
        String indextpage = request.getParameter("index");
        if (indextpage == null) {
            indextpage = "1";
        }
        int index = Integer.parseInt(indextpage);
        int count = ProductService.getTotalProducts();
        int endPage = count / 12;
        if (count % 12 != 0) {
            endPage++;
        }
        List<Product> page = ProductService.pagingProduct(index);

        request.setAttribute("list", page);
        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        request.setAttribute("listc", listc);
        request.setAttribute("listsptt", listsptt);

        request.getRequestDispatcher("store.jsp").forward(request, response);

        //log
        if (auth == null) {
            DB.me().insert(new Log(Log.INFO,1,request.getRequestURI(), "thêm vào giỏ hàng: " + id,0));
        } else {
            String user_id = auth.getUser_id();
            int id_u = Integer.parseInt(user_id);
            DB.me().insert(new Log(Log.INFO,id_u,request.getRequestURI(), "Thêm vào giỏ hàng: " + id ,0));
        }
        //


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
