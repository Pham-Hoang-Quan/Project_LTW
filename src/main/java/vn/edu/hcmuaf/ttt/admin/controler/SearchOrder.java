package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.admin.service.HoaDon;
import vn.edu.hcmuaf.ttt.admin.service.UserService;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.model.hoaDon;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchOrder", value = "/SearchOrder")
public class SearchOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchTxt = request.getParameter("txt");
        List<hoaDon> list = HoaDon.searchOrder(searchTxt);

        List<hoaDon> listHD0 = HoaDon.getListHD0(0);
        request.setAttribute("listHD0", listHD0);

        List<hoaDon> listHD1 = HoaDon.getListHD0(1);
        request.setAttribute("listHD1", listHD1);


        request.setAttribute("listHD0", list);
        request.getRequestDispatcher("admin/user-manage.jsp").forward(request, response);
    }
}
