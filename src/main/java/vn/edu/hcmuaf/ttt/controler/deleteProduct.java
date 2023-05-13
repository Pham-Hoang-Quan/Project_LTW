package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.model.Cart;
import vn.edu.hcmuaf.ttt.model.Product;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "deleteProduct", value = "/deleteProduct")
public class deleteProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");
        String id = request.getParameter("id");
        Product product = ProductService.getProductById(id);
        cart.remove(product.getKey());


        response.sendRedirect("cart.jsp");
        User auth= (User) session.getAttribute("auth");
        if(auth == null){
            DB.me().insert(new Log(Log.INFO,1,"deleteProduct", "id sản phẩm"+id,0));

        }else{
            String user_id = auth.getUser_id();
            int id_u = Integer.parseInt(user_id);
            DB.me().insert(new Log(Log.INFO,id_u,"deleteProduct","id sản phẩm"+ id,0));

        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
