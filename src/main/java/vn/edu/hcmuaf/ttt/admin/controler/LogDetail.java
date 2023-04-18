package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.model.Log;
import vn.edu.hcmuaf.ttt.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LogDetail", value = "/LogDetail")
public class LogDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            int id = Integer.parseInt(request.getParameter("logid"));

            Log l = LogService.logDetail(id);

            request.setAttribute("log", l);
            request.getRequestDispatcher("admin/logDetail.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
