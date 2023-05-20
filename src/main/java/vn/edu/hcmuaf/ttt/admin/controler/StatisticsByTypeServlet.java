package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.admin.service.statisticsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "StatisticsByTypeServlet", value = "/StatisticsByTypeServlet")
public class StatisticsByTypeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Integer> accessByYear = statisticsService.getAccessByYear();
        request.setAttribute("accessByYear", accessByYear);
//        ArrayList<Integer> accessByMonth = statisticsService.getAccessByMonth();
//        request.setAttribute("accessByMonth", accessByMonth);
        ArrayList<Integer> byyear = statisticsService.getYear();
        request.setAttribute("year", byyear);
        ArrayList<Integer> byyears= statisticsService.getYear();
        request.setAttribute("yearss", byyears);
//        ArrayList<Integer> totalRevenue = statisticsService.getTotalRevenue();
//        request.setAttribute("totalRevenue", totalRevenue);
        request.getRequestDispatcher("admin/StatisticsByType.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
