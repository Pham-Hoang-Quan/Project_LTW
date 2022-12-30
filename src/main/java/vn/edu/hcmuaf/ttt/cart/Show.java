package vn.edu.hcmuaf.ttt.cart;

import vn.edu.hcmuaf.ttt.model.Cart;
import vn.edu.hcmuaf.ttt.model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "Show", value = "/cart/show")
public class Show extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       Cart cart = (Cart) request.getSession().getAttribute("cart");
       if(cart == null){
           response.getWriter().println("gio hang trong");
       }
       else {
           Collection<Product> list = cart.getListproduct();
           for (Product p:list){
               response.getWriter().println(p);
           }

       }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
