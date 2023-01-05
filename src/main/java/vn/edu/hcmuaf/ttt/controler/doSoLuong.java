package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SoLuong", value = "/doSoLuong")
public class doSoLuong extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<String[]> listHoadon = new ArrayList<>();
        int idi = Integer.parseInt(request.getParameter("countSP"));
        for (int i = 1; i <= idi; i++) {

            String id = request.getParameter("productId"+1);

            String soLuong = request.getParameter("quantity" +i);
            String[] s = new String[2];
            s[0] = id;

            s[1] = soLuong;
            listHoadon.add(s);
        }
        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");
        for (String[] s:
             listHoadon) {
            cart.put(s[0],Integer.parseInt(s[1]));
        }
        session.removeAttribute("cart");
        session.setAttribute("cart",cart);
        response.sendRedirect("checkout.jsp");


    }
}
