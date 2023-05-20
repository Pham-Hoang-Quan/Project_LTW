package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.model.Cart;
import vn.edu.hcmuaf.ttt.model.discount;
import vn.edu.hcmuaf.ttt.service.discountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SoLuong", value = "/doSoLuong")
public class doSoLuong extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("submit")) {
            List<String[]> listHoadon = new ArrayList<>();
            int idi = Integer.parseInt(request.getParameter("countSP"));
            for (int i = 1; i <= idi; i++) {
                String id = request.getParameter("productId" + 1);
                String soLuong = request.getParameter("quantity" + i);
                String[] s = new String[2];
                s[0] = id;
                s[1] = soLuong;
                listHoadon.add(s);
            }
            HttpSession session = request.getSession(true);
            Cart cart = (Cart) session.getAttribute("cart");
//            User auth= (User) session.getAttribute("auth");
//            String user_id = auth.getUser_id();
//            int id_u = Integer.parseInt(user_id);

            for (String[] s :
                    listHoadon) {
                cart.put(s[0], Integer.parseInt(s[1]));


                //log
                User auth = (User) session.getAttribute("auth");
                if (auth == null) {
                    DB.me().insert(new Log(Log.INFO, 1, "Thêm số lượng", "id sản phẩm" + s[0] + ", Số lượng" + s[1], 0));
                } else {
                    String user_id = auth.getUser_id();
                    int id_u = Integer.parseInt(user_id);
                    DB.me().insert(new Log(Log.INFO, id_u, "Thêm số lượng", "id sản phẩm" + s[0] + ", Số lượng" + s[1], 0));

                }
                //

            }
            session.removeAttribute("cart");
            session.setAttribute("cart", cart);
            response.sendRedirect("checkout.jsp");


        } else if (action.equals("apply")) {

            String enter_dis = request.getParameter("enter_dis");
            discount dis = discountService.checkDiscount(enter_dis);

            if (dis == null) {
                request.setAttribute("discount_err", "mã giảm giá sai");
                request.getRequestDispatcher("cart.jsp").forward(request, response);
//log
//                HttpSession session = request.getSession(true);
//                User auth= (User) session.getAttribute("auth");
//                String user_id = auth.getUser_id();
//                int id_u = Integer.parseInt(user_id);
//                if(auth== null){
//                    DB.me().insert(new Log(Log.INFO,1,"doSoLuong", "nhập mã giảm giá sai: " + dis ,0));
//                }else {
//
//                    DB.me().insert(new Log(Log.INFO,id_u,"doSoLuong", "nhập mã giảm giá sai" + dis ,0));
//
//                }
                //
                //log
                HttpSession session = request.getSession(true);
                User auth = (User) session.getAttribute("auth");
                if (auth == null) {
                    DB.me().insert(new Log(Log.INFO,1,"doSoLuong", "nhập mã giảm giá sai: " + dis ,0));
                } else {
                    String user_id = auth.getUser_id();
                    int id_u = Integer.parseInt(user_id);
                    DB.me().insert(new Log(Log.INFO,id_u,"doSoLuong", "nhập mã giảm giá sai" + dis ,0));
                }
                //


            } else {


                HttpSession session = request.getSession(true);
                session.setAttribute("discount", dis);
                discount discount = (discount) session.getAttribute("discount");
                if (discount.getStatus() == 1) {
                    HttpSession sessionn = request.getSession(false); // Lấy session hiện tại nếu nó đã tồn tại
                    if (sessionn != null) { // Kiểm tra xem session có tồn tại không
                        sessionn.removeAttribute("discount"); // Xóa session có tên là "session1"
                    }
                    request.setAttribute("discount_errr", "mã giảm giá đã được sử dụng");
                    request.getRequestDispatcher("cart.jsp").forward(request, response);
//                    //log
//                    HttpSession sessionnn = request.getSession(true);
//                    User auth= (User) sessionnn.getAttribute("auth");
//                    String user_id = auth.getUser_id();
//                    int id_u = Integer.parseInt(user_id);
//                    if(auth== null){
//                        DB.me().insert(new Log(Log.INFO,1,"doSoLuong", "nhập mã giảm giá đã sử dụng: " + dis ,0));
//                    }else {
//
//                        DB.me().insert(new Log(Log.INFO,id_u,"doSoLuong", "nhập mã giảm giá đã sử dụng" + dis ,0));
//
//                    }
//                    //
                    //log
                    HttpSession sessionnn = request.getSession(true);
                    User auth= (User) sessionnn.getAttribute("auth");
                    if (auth == null) {
                        DB.me().insert(new Log(Log.INFO,1,"doSoLuong", "nhập mã giảm giá đã sử dụng: " + dis ,0));
                    } else {
                        String user_id = auth.getUser_id();
                        int id_u = Integer.parseInt(user_id);
                        DB.me().insert(new Log(Log.INFO,id_u,"doSoLuong", "nhập mã giảm giá đã sử dụng" + dis ,0));
                    }
                    //


                } else {

                    request.getRequestDispatcher("cart.jsp").forward(request, response);

//                    //log
//                    HttpSession sessionm = request.getSession(true);
//                    User auth= (User) sessionm.getAttribute("auth");
//                    String user_id = auth.getUser_id();
//                    int id_u = Integer.parseInt(user_id);
//                    if(auth== null){
//                        DB.me().insert(new Log(Log.INFO,1,"doSoLuong", "áp dụng mã giảm giá: " + dis ,0));
//                    }else {
//
//                        DB.me().insert(new Log(Log.INFO,id_u,"doSoLuong", "áp dụng mã giam" + dis ,0));
//
//                    }
//                    //
                    //log
                    HttpSession sessionm = request.getSession(true);
                   User auth= (User) sessionm.getAttribute("auth");
                    if (auth == null) {
                        DB.me().insert(new Log(Log.INFO,1,"doSoLuong", "áp dụng mã giảm giá: " + dis ,0));
                    } else {
                        String user_id = auth.getUser_id();
                        int id_u = Integer.parseInt(user_id);
                        DB.me().insert(new Log(Log.INFO,id_u,"doSoLuong", "áp dụng mã giam" + dis ,0));
                    }

                    //
                }


            }
        }
    }


}
