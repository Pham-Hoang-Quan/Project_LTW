package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.admin.service.statisticsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AccessByMonth", value = "/AccessByMonth")
public class AccessByMonth extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int years = Integer.parseInt(request.getParameter("years"));
//        ArrayList<Integer> accessByYear = statisticsService.getAccessByYear();
//        request.setAttribute("accessByYear", accessByYear);
        ArrayList<Integer> accessByMonth = statisticsService.getAccessByMonth(years);
        request.setAttribute("accessByYear", accessByMonth);
        ArrayList<Integer> byyear = statisticsService.getYear();
        request.setAttribute("year", byyear);
        ArrayList<Integer> accessmonth = statisticsService.accessMotnh(years);
        request.setAttribute("yearss", accessmonth);



        request.getRequestDispatcher("admin/StatisticsByType.jsp").forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
