package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.admin.service.statisticsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "statisticsMoth", value = "/statisticsMoth")
public class statisticsMoth extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int yearr = Integer.parseInt(request.getParameter("yearr"));
        ArrayList<Integer> sta = statisticsService.getMonths(yearr);
        request.setAttribute("stayear", sta);
        ArrayList<Integer> tongdon = statisticsService.getTongDonTheoThang(yearr);
        request.setAttribute("tongyear", tongdon);
        ArrayList<Integer> year = statisticsService.getYear();
        request.setAttribute("year", year);
        ArrayList<Integer> revenueByMonth = statisticsService.getRevenueByMonth(yearr);
        request.setAttribute("totalRevenue", revenueByMonth);


        request.getRequestDispatcher("admin/statistics.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
