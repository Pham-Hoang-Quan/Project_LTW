package vn.edu.hcmuaf.ttt.controler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import vn.edu.hcmuaf.ttt.service.test;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "singinAPI", value = "/singinAPI")
public class singinAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String accessToken=test.login(email, password);
       // tạo ra được token mới
        String responseString = accessToken;

        //lấy mảng token
        Gson gson = new Gson();
        JsonObject jsonResponse = gson.fromJson(responseString, JsonObject.class);
        String accessTokenn = jsonResponse.get("access_token").getAsString();
        //hiển thị token
        request.setAttribute("accessToken", accessTokenn);
        // lấy ra các tỉnh bằng token mới tạo
        String provinces = test.getProvinces(accessTokenn);
        request.setAttribute("provinces", provinces);

        //lấy mảng chứa id và tên tỉnh ra
        String jsonData = provinces;
        try {
            JSONObject jsonObject = new JSONObject(jsonData);
            JSONArray dataArray = jsonObject.getJSONObject("original").getJSONArray("data");
            // Lấy mảng JSON đầy đủ từ chuỗi dữ liệu
            JSONArray provinceArray = dataArray;
            request.setAttribute("provinceArray", provinceArray);
            // Sử dụng mảng JSON lấy được theo nhu cầu của bạn
            System.out.println(provinceArray);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        //
        //gọi api lấy các huyện theo id tỉnh
//       int provinceId = Integer.parseInt(request.getParameter("provinceId"));
        String getDistricts = test.getDistricts(265, accessTokenn);
        request.setAttribute("getDistricts", getDistricts);
        //lấy mảng id và trên các huyện ra
        String jsonDataDis = getDistricts;
        try {
            JSONObject jsonObject = new JSONObject(getDistricts);
            JSONArray dataArray = jsonObject.getJSONObject("original").getJSONArray("data");
            // Lấy mảng JSON đầy đủ từ chuỗi dữ liệu
            JSONArray districtArray = dataArray;
            //hiện thị lên jsp
            request.setAttribute("districtArray", districtArray);
            // Sử dụng mảng JSON lấy được theo nhu cầu của bạn
            System.out.println(districtArray);
        } catch (JSONException e) {
            e.printStackTrace();
        }





        // Giả sử jsonResponse là một đối tượng JSONObject chứa dữ liệu JSON như trong câu trả lời trước đó
        JSONObject jsonResponsee = new JSONObject(provinces);

// Trích xuất mảng "data" từ đối tượng jsonResponse
        JSONArray data = jsonResponsee.getJSONObject("original").getJSONArray("data");

        // Lấy danh sách tỉnh từ API và gán vào biến provinceList
        JSONArray provinceList = jsonResponsee.getJSONArray("data");

// Đặt danh sách tỉnh và tên tỉnh đã chọn vào thuộc tính yêu cầu
        request.setAttribute("provinceList", provinceList);






//        request.setAttribute("mess", "đăng nhập");
        request.getRequestDispatcher("district-list.jsp").forward(request,response);



    }
}
