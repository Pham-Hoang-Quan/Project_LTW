package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.model.*;
import vn.edu.hcmuaf.ttt.model.Comment;
import vn.edu.hcmuaf.ttt.service.CommentService;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductDetail", value = "/detail")
public class ProductDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id= request.getParameter("id");
        List<Comment> list = new CommentService().getListCommentByProductId(Integer.parseInt(id));
        List<Product> listsptt = ProductService.getSanPhamTuongTu() ;
    if(id!=null){
        Product product = ProductService.getProductById(id);
        request.setAttribute("product", product);
        request.setAttribute("comment", list);
        request.setAttribute("listsptt", listsptt);
        request.getRequestDispatcher("product.jsp").forward(request, response);



    } else
        response.sendError(404, "Product Not Found");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
