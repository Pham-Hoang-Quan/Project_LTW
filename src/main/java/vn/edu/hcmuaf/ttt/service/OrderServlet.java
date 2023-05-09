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
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accessToken = (String) request.getSession().getAttribute("access_token");

        HttpClient client = HttpClientBuilder.create().build();
        HttpGet get = new HttpGet("https://api.shipchung.vn/v1/orders");
        get.setHeader("Authorization", "Bearer " + accessToken);

        HttpResponse httpResponse = client.execute(get);
        HttpEntity entity = httpResponse.getEntity();
        String responseString = EntityUtils.toString(entity, "UTF-8");

        // Xử lý kết quả trả về
        // ...
    }
}
