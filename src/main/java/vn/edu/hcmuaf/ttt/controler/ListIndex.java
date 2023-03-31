package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.model.Cart;
import vn.edu.hcmuaf.ttt.model.Category;
import vn.edu.hcmuaf.ttt.model.Product;

import vn.edu.hcmuaf.ttt.service.ProductService;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ListIndex", value = "")
public class ListIndex extends HttpServlet {

    String name="List_Index";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> listn = ProductService.getLast() ;
        List<Product> lists = ProductService.getSale();
        List<Category> listc = ProductService.getCategory();
        List<Category> lista = ProductService.getCategoryIndex();
        List<Product> listKM = ProductService.getKhoanMini();
        List<Product> listKDL = ProductService.getKhoanDongLuc();
        List<Product> listKBT = ProductService.getKhoanBeTong();

        String CTID = request.getParameter("cName");
        List<Product> listPI = ProductService.getCTID(CTID) ;





        request.setAttribute("listn", listn);
        request.setAttribute("listKM", listKM);
        request.setAttribute("listKDL", listKDL);
        request.setAttribute("listKBT", listKBT);
        request.setAttribute("lists", lists);
        request.setAttribute("lista", lista);
        request.setAttribute("listPI", listPI);
        request.setAttribute("listc", listc);









        request.getRequestDispatcher("index.jsp").forward(request,response);
        DB.me().insert(new Log(Log.INFO,1,name, listn.toString(),0));

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
