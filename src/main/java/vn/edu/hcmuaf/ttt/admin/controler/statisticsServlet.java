package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.admin.service.statisticsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.Year;
import java.util.ArrayList;

@WebServlet(name = "statisticsServlet", value = "/statisticsServlet")
public class statisticsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Integer> stayear = statisticsService.getYearR();
        request.setAttribute("stayear", stayear);
        ArrayList<Integer> tongyear = statisticsService.getTongDonTheoNam();
        request.setAttribute("tongyear", tongyear);
        ArrayList<Integer> year = statisticsService.getYear();
        request.setAttribute("year", year);
        ArrayList<Integer> totalRevenue = statisticsService.getTotalRevenue();
        request.setAttribute("totalRevenue", totalRevenue);
        int userFb = statisticsService.getFacebookAcc();
        request.setAttribute("userFb", userFb);
        int userGg = statisticsService.getGGAccount();
        request.setAttribute("userGg", userGg);
        int userNm = statisticsService.getNormalAcc();
        request.setAttribute("userNm", userNm);
        int userttNm = statisticsService.getTotalNormalAcc();
        request.setAttribute("userttNm", userttNm);
        int userttGG = statisticsService.getTotalGGAccount();
        request.setAttribute("userttGG", userttGG);
        int userttFB = statisticsService.getTotalFacebookAcc();
        request.setAttribute("userttFB", userttFB);
        request.getRequestDispatcher("admin/statistics.jsp").forward(request,response);

//        int yearr = Integer.parseInt(request.getParameter("yearr"));
//
//
//
//        ArrayList<Integer> sta = statisticsService.getMonths(yearr);
//        request.setAttribute("sta", sta);
//        ArrayList<Integer> tongdon = statisticsService.getTongDonTheoThang(yearr);
//          request.setAttribute("tongdon", tongdon);

//
//        ArrayList<Integer> year = statisticsService.getYear();
//        request.setAttribute("year", year);
//        ArrayList<Integer> year1 = (ArrayList<Integer>) request.getAttribute("year");
//        for (int y : year1) {
//            ArrayList<Integer> sta = statisticsService.getMonths(y);
//            request.setAttribute("sta", sta);
//            ArrayList<Integer> tongdon = statisticsService.getTongDonTheoThang(y);
//            request.setAttribute("tongdon", tongdon);
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
