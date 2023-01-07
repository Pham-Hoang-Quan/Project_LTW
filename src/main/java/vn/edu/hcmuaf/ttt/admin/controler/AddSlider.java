package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.admin.service.CategoryService;
import vn.edu.hcmuaf.ttt.admin.service.SliderServive;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddSlider", value = "/AddSlider")
public class AddSlider extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String img = request.getParameter("img");
        String name = request.getParameter("name");

        SliderServive.insertSlider(img, name);

        response.sendRedirect("SliderList");
    }
}
