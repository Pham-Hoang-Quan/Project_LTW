package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.model.Log;
import vn.edu.hcmuaf.ttt.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListLog", value = "/ListLog")
public class ListLog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Log> logList = LogService.getData();
        request.setAttribute("logList", logList);

        int countLog1 = LogService.getCountLog1();
        request.setAttribute("countLog1", countLog1);

        int countLog2 = LogService.getCountLog2();
        request.setAttribute("countLog2", countLog2);

        int countLog3 = LogService.getCountLog3();
        request.setAttribute("countLog3", countLog3);

        int countLog4 = LogService.getCountLog4();
        request.setAttribute("countLog4", countLog4);

        request.getRequestDispatcher("admin/logTest.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}