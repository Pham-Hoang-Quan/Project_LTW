package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.service.CommentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Comment", value = "/Comment")
public class Comment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdComment = request.getParameter("userIdComment");
        int productIdComment = Integer.parseInt(request.getParameter("productIdComment"));
        String textComment = request.getParameter("textComment");
        int ratingComment = Integer.parseInt(request.getParameter("ratingComment"));
        String dateComment = request.getParameter("dateComment");


        new CommentService().createNewComment(userIdComment,productIdComment,dateComment,textComment,ratingComment);
        response.sendRedirect("/THDoAn_war/detail?id="+productIdComment);

    }
}
