package vn.edu.hcmuaf.ttt.controler;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet(name = "ProvineServlet", value = "/ProvineServlet")
public class ProvineServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Gửi yêu cầu API để lấy danh sách các tỉnh
        String apiEndpoint = "http://140.238.54.136/api/province"; // Đường dẫn API lấy danh sách các tỉnh

        URL url = new URL(apiEndpoint);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "Bearer ");

        // Nhận phản hồi từ API
        int responseCode = conn.getResponseCode();
        String responseBody = "";

        if (responseCode == HttpURLConnection.HTTP_OK) {
            // Đọc dữ liệu phản hồi từ API
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                responseBody += line;
            }
            reader.close();
        } else {
            // Xử lý lỗi nếu có
            responseBody = "Error: " + responseCode;
        }

        conn.disconnect();

        // Gửi kết quả về trang JSP
        request.setAttribute("provinceList", responseBody);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
