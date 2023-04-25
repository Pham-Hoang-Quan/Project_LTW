package vn.edu.hcmuaf.ttt.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

@WebServlet("/loginAPI")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Gửi yêu cầu đăng nhập đến API
        JSONObject json = new JSONObject();
        json.put("email", email);
        json.put("password", password);

        HttpClient client = HttpClientBuilder.create().build();
        HttpPost post = new HttpPost("https://api.shipchung.vn/v1/auth/login");
        post.setHeader("Content-Type", "application/json");
        post.setEntity(new StringEntity(json.toString()));

        HttpResponse httpResponse = client.execute(post);
        HttpEntity entity = httpResponse.getEntity();
        String responseString = EntityUtils.toString(entity, "UTF-8");
        JSONObject responseObject = new JSONObject(responseString);

        // Kiểm tra kết quả đăng nhập
        if (httpResponse.getStatusLine().getStatusCode() == 200) {
            // Lưu thông tin đăng nhập vào session
            request.getSession().setAttribute("access_token", responseObject.getString("access_token"));
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}


