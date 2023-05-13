package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.model.Category;
import vn.edu.hcmuaf.ttt.model.Product;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryControler", value = "/category")
public class CategoryControler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String CTID = request.getParameter("cName");
        List<Product> list = ProductService.getCTID(CTID) ;
        List<Category> listc = ProductService.getCategory();
        List<Product> listsptt = ProductService.getSanPhamTuongTu() ;




        request.setAttribute("list", list);
        request.setAttribute("listc", listc);
        request.setAttribute("listsptt", listsptt);
        request.setAttribute("tag", CTID);

        request.getRequestDispatcher("store.jsp").forward(request,response);
//        DB.me().insert(new Log(Log.INFO,1,"category", CTID + list.toString(),0));



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
