package vn.edu.hcmuaf.ttt.service;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class test {

    private static final String REGISTER_ENDPOINT = "http://140.238.54.136/api/auth/register";
    private static final String LOGIN_ENDPOINT = "http://140.238.54.136/api/auth/login";

    private static final String PROVINCE_ENDPOINT = "http://140.238.54.136/api/province";
    private static final String AUTHORIZATION_HEADER = "Authorization";
    private static final String BEARER_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTQwLjIzOC41NC4xMzYvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2ODQ4MjY3NDgsImV4cCI6MTY4NDgyNzM0OCwibmJmIjoxNjg0ODI2NzQ4LCJqdGkiOiJISUs4bUtmdUYxNHB2bUk5Iiwic3ViIjoiOTdkZmE0NWM3NmE2NGY2ZTllNGQwZjE4MDlmYTRiZDIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.SjARGR2AcKb3qxnV5RjGncN4hi4bpeD5YbfD4T4zU2w";

    private static final String DISTRICT_ENDPOINT = "http://140.238.54.136/api/district";


    private static final String PARAMETER_PROVINCE_ID = "provinceID";

    private static final String LEAD_TIME_ENDPOINT = "http://140.238.54.136/api/leadTime";


    public static void register(String name, String email, String password, String passwordConfirmation) {
        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            HttpPost httpPost = new HttpPost(REGISTER_ENDPOINT);

            // Tạo danh sách các tham số trong body request
            List<NameValuePair> params = new ArrayList<>();
            params.add(new BasicNameValuePair("name", name));
            params.add(new BasicNameValuePair("email", email));
            params.add(new BasicNameValuePair("password", password));
            params.add(new BasicNameValuePair("password_confirmation", passwordConfirmation));

            // Đặt các tham số trong body request
            httpPost.setEntity(new UrlEncodedFormEntity(params));

            // Gửi request và nhận response
            HttpResponse response = httpClient.execute(httpPost);
            HttpEntity entity = response.getEntity();

            // Xử lý response
            if (entity != null) {
                String responseString = EntityUtils.toString(entity);
                System.out.println(responseString);
                // Xử lý dữ liệu response theo định dạng JSON hoặc XML tùy thuộc vào API Logistic cung cấp
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static String login(String email, String password) {
        String responseString = null;
        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            HttpPost httpPost = new HttpPost(LOGIN_ENDPOINT);

            // Tạo danh sách các tham số trong body request
            List<NameValuePair> params = new ArrayList<>();
            params.add(new BasicNameValuePair("email", email));
            params.add(new BasicNameValuePair("password", password));

            // Đặt các tham số trong body request
            httpPost.setEntity(new UrlEncodedFormEntity(params));

            // Gửi request và nhận response
            HttpResponse response = httpClient.execute(httpPost);
            HttpEntity entity = response.getEntity();

            // Xử lý response
            if (entity != null) {
                responseString = EntityUtils.toString(entity);
                System.out.println(responseString);
                // Xử lý dữ liệu response theo định dạng JSON hoặc XML tùy thuộc vào API Logistic cung cấp
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return responseString;
    }
    public static String getDistricts(int provinceId, String token) {
        String responseString = null;
        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            // Xây dựng URL với tham số provinceID
            String url = DISTRICT_ENDPOINT + "?" + PARAMETER_PROVINCE_ID + "=" + provinceId;
            HttpGet httpGet = new HttpGet(url);

            // Đặt mã thông báo xác thực trong tiêu đề (header)
            httpGet.setHeader(AUTHORIZATION_HEADER, "Bearer " + token);

            // Gửi request và nhận response
            HttpResponse response = httpClient.execute(httpGet);
            HttpEntity entity = response.getEntity();

            // Xử lý response
            if (entity != null) {
                responseString = EntityUtils.toString(entity);
                System.out.println(responseString);

                // Xử lý dữ liệu response theo định dạng JSON hoặc XML tùy thuộc vào API Logistic cung cấp
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return responseString;
    }

    public static String getProvinces(String token) {
        String responseString = null;
        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            HttpGet httpGet = new HttpGet(PROVINCE_ENDPOINT);

            // Đặt mã thông báo xác thực trong tiêu đề (header)
            httpGet.setHeader(AUTHORIZATION_HEADER, "bearer " + token);

            // Gửi request và nhận response
            HttpResponse response = httpClient.execute(httpGet);
            HttpEntity entity = response.getEntity();

            // Xử lý response
            if (entity != null) {
                responseString = EntityUtils.toString(entity);
                System.out.println(responseString);

                // Xử lý dữ liệu response theo định dạng JSON hoặc XML tùy thuộc vào API Logistic cung cấp
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return responseString;
    }

    public static void estimateLeadTime() {
        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            HttpPost httpPost = new HttpPost(LEAD_TIME_ENDPOINT);

            // Đặt mã thông báo xác thực trong tiêu đề (header)
            httpPost.setHeader(AUTHORIZATION_HEADER, "Bearer " + BEARER_TOKEN);

            // Tạo body request
            String body = "from_district_id=2264&from_ward_id=90816&to_district_id=2270&to_ward_id=231013" +
                    "&height=100&length=100&width=100&weight=100";
            StringEntity requestEntity = new StringEntity(body, ContentType.APPLICATION_FORM_URLENCODED);

            // Đặt body request
            httpPost.setEntity(requestEntity);

            // Gửi request và nhận response
            HttpResponse response = httpClient.execute(httpPost);
            HttpEntity entity = response.getEntity();

            // Xử lý response
            if (entity != null) {
                String responseString = EntityUtils.toString(entity);
                System.out.println(responseString);

                // Xử lý dữ liệu response theo định dạng JSON hoặc XML tùy thuộc vào API Logistic cung cấp
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
//        String name = "foxx";
//        String email = "foxx@1234";
//        String password = "123456";
//        String passwordConfirmation = "123456";
//        register(name, email, password, passwordConfirmation);

//
        String email = "fox@1234";
        String password = "123456";
        login(email, password);
//        //{"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTQwLjIzOC41NC4xMzYvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2ODQ4MTU1MjUsImV4cCI6MTY4NDgxNjEyNSwibmJmIjoxNjg0ODE1NTI1LCJqdGkiOiJ5ZThiemRSN2E3WlJMSW9qIiwic3ViIjoiOTdkZmE0NWM3NmE2NGY2ZTllNGQwZjE4MDlmYTRiZDIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.ioqtNeWhzvkXrg_Mpi2vB4jRaP75nm1c0rJ9tkFMeZ4","token_type":"bearer","expires_in":600}
//
//        int provinceId = 269; // ID của tỉnh
//        getDistricts(provinceId, "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTQwLjIzOC41NC4xMzYvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2ODQ4MjY3NDgsImV4cCI6MTY4NDgyNzM0OCwibmJmIjoxNjg0ODI2NzQ4LCJqdGkiOiJISUs4bUtmdUYxNHB2bUk5Iiwic3ViIjoiOTdkZmE0NWM3NmE2NGY2ZTllNGQwZjE4MDlmYTRiZDIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.SjARGR2AcKb3qxnV5RjGncN4hi4bpeD5YbfD4T4zU2w");
//


        //api tỉnh
//        getProvinces("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTQwLjIzOC41NC4xMzYvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2ODQ4MjExNzAsImV4cCI6MTY4NDgyMTc3MCwibmJmIjoxNjg0ODIxMTcwLCJqdGkiOiJtdVdqdGRFTGU2ZmNlRUFZIiwic3ViIjoiOTdkZmE0NWM3NmE2NGY2ZTllNGQwZjE4MDlmYTRiZDIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.hnmClDvZvpqi_acPJlo-oRrgbjRdoGuhp3YjuaplhR8");

//        estimateLeadTime();

    }

}



