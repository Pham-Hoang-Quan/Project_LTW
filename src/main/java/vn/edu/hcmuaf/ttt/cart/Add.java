package vn.edu.hcmuaf.ttt.cart;

import vn.edu.hcmuaf.ttt.model.Cart;
import vn.edu.hcmuaf.ttt.model.Product;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Add", value = "/cart/add")
public class Add extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Product p = ProductService.getProductById(id);
        p.setQuantily(1);
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if(cart==null){
            cart= new Cart();
        }
        cart.put(p);
        request.getSession().setAttribute("cart",cart);
        response.sendRedirect("show");




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
