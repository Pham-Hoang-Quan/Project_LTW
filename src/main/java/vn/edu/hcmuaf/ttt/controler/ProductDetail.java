package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.model.*;
import vn.edu.hcmuaf.ttt.model.Comment;
import vn.edu.hcmuaf.ttt.service.CommentService;
import vn.edu.hcmuaf.ttt.service.ProductService;
import vn.edu.hcmuaf.ttt.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductDetail", value = "/detail")
public class ProductDetail extends HttpServlet {
    String name="Product_Detail";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id= request.getParameter("id");
        List<Comment> list = new CommentService().getListCommentByProductId(Integer.parseInt(id));
        List<Product> listsptt = ProductService.getSanPhamTuongTu() ;
        List<Category> listc = ProductService.getCategory();
//        String user_name = request.getParameter("user");
//        String user_password = request.getParameter("pass");
//        User user = UserService.getInstance().checkLogib(user_name,user_password);
    if(id!=null) {
        Product product = ProductService.getProductById(id);
        request.setAttribute("product", product);
        request.setAttribute("comment", list);
        request.setAttribute("listsptt", listsptt);
        request.setAttribute("listc", listc);
//        HttpSession session = request.getSession(true);
//        session.setAttribute("auth", user);
        request.getRequestDispatcher("product.jsp").forward(request, response);
        DB.me().insert(new Log(Log.INFO,1,name, product.toString(),0));



    } else
    response.sendError(404, "Product Not Found");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
