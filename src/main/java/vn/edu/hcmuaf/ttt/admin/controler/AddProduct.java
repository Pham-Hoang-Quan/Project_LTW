package vn.edu.hcmuaf.ttt.admin.controler;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "AddProduct", value = "/AddProduct")
@MultipartConfig(maxFileSize = 2048 * 2048)
public class AddProduct extends HttpServlet {
    private String dbURL = "jdbc:mysql://localhost:3306/shops";
    private String dbUser = "root";
    private String dbPass = "";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        boolean isLoggedIn = user != null;
        boolean isNormalUser = isLoggedIn && user.getUser_admin() != 1;
        if (!isLoggedIn || isNormalUser) {
            response.sendRedirect("/THDoAn_war/List-Product");
        } else {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String classify = request.getParameter("classify");

            InputStream inputStream = null;
            InputStream inputStream2 = null;
            InputStream inputStream3 = null;
            InputStream inputStream4 = null;

            Part filePart1 = request.getPart("img");
            if (filePart1 != null) {
                // prints out some information for debugging
                System.out.println(filePart1.getName());
                System.out.println(filePart1.getSize());
                System.out.println(filePart1.getContentType());

                // obtains input stream of the upload file
                inputStream = filePart1.getInputStream();
            }

            Part filePart2 = request.getPart("img2");
            if (filePart2 != null) {
                // prints out some information for debugging
                System.out.println(filePart2.getName());
                System.out.println(filePart2.getSize());
                System.out.println(filePart2.getContentType());

                // obtains input stream of the upload file
                inputStream2 = filePart2.getInputStream();
            }

            Part filePart3 = request.getPart("img3");
            if (filePart3 != null) {
                // prints out some information for debugging
                System.out.println(filePart3.getName());
                System.out.println(filePart3.getSize());
                System.out.println(filePart3.getContentType());

                // obtains input stream of the upload file
                inputStream3 = filePart3.getInputStream();
            }

            Part filePart4 = request.getPart("img4");
            if (filePart4 != null) {
                // prints out some information for debugging
                System.out.println(filePart4.getName());
                System.out.println(filePart4.getSize());
                System.out.println(filePart4.getContentType());

                // obtains input stream of the upload file
                inputStream4 = filePart4.getInputStream();
            }

            String percent = request.getParameter("percent");
            int qty = Integer.parseInt(request.getParameter("qty"));
            int price = Integer.parseInt(request.getParameter("price"));
            String content = request.getParameter("content");
            String info = request.getParameter("info");

            Connection conn = null;

            try {
                // connects to the database
                DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                // constructs SQL statement
                String sql = "INSERT into products(name, img, img2, img3, img4, price, classify, percent, quantily, content, info) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, name);
                statement.setInt(6, price);
                statement.setString(7, classify);
                statement.setString(8, percent);
                statement.setInt(9, qty);
                statement.setString(10, content);
                statement.setString(11, info);

                if (inputStream != null) {
                    // fetches input stream of the upload file for the blob column
                    statement.setBlob(2, inputStream);

                }

                if (inputStream2 != null) {
                    // fetches input stream of the upload file for the blob column
                    statement.setBlob(3, inputStream2);

                }

                if (inputStream3 != null) {
                    // fetches input stream of the upload file for the blob column
                    statement.setBlob(4, inputStream3);
                }

                if (inputStream4 != null) {
                    // fetches input stream of the upload file for the blob column
                    statement.setBlob(5, inputStream3);
                }

                // sends the statement to the database server
                int row = statement.executeUpdate();
                if (row > 0) {

                }
            } catch (SQLException ex) {

            } finally {
                if (conn != null) {
                    // closes the database connection
                    try {
                        conn.close();
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
                // forwards to the message page
                response.sendRedirect("ProAdmin");
            }

        }
    }
}
