package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.admin.service.HoaDon;
import vn.edu.hcmuaf.ttt.bean.Log;
import vn.edu.hcmuaf.ttt.db.DB;
import vn.edu.hcmuaf.ttt.model.Cart;
import vn.edu.hcmuaf.ttt.model.Product;
import vn.edu.hcmuaf.ttt.model.discount;
import vn.edu.hcmuaf.ttt.model.hoaDon;
import vn.edu.hcmuaf.ttt.service.ProductService;
import vn.edu.hcmuaf.ttt.service.discountService;
import vn.edu.hcmuaf.ttt.service.hoaDonService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

@WebServlet(name = "hoaDonCon", value = "/doHoaDon")
public class hoaDonCon extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int soHD = Integer.parseInt(request.getParameter("soHD"));
        String user_id = request.getParameter("userID");
        int id_user = Integer.parseInt(user_id);
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String city = request.getParameter("city");
        String dis = request.getParameter("dis");
        String wa = request.getParameter("wa");
        String note = request.getParameter("note");
        String dateComment = request.getParameter("dateComment");
        String name_dis = request.getParameter("name_dis");
        String reduce = request.getParameter("reduce");
        int reducedPrice = Integer.parseInt(request.getParameter("reducedPrice"));
        String reduceSesstion = request.getParameter("reduceSesstion");
        int transportFee = Integer.parseInt(request.getParameter("price-logistic"));
        int discountFee = Integer.parseInt(request.getParameter("discountFee"));
//        int totalprice = Integer.parseInt(request.getParameter("totalprice"));
        String stotalprice = request.getParameter("totalprice");
        int totalprice = Integer.parseInt(stotalprice);


        //lấy mã giảm giá


        //tạo thời gian cho mã giảm giá

        Timestamp created_at = new Timestamp(System.currentTimeMillis());
        // mã giảm giá hết hạn trong 3 tháng
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, 3);
        Timestamp expiresAt = new Timestamp(calendar.getTimeInMillis());
        Random idDis = new Random();
        int id_dis = idDis.nextInt(10000);


        List<String[]> listHoadon = new ArrayList<>();
        int idi = Integer.parseInt(request.getParameter("countSP"));
        for (int i = 1; i <= idi; i++) {
            String qty = request.getParameter("qty" + i);
            String id = request.getParameter("id" + i);
            String nameSP = request.getParameter("nameSP" + i);
            String soLuong = request.getParameter("soLuong" + i);
            String tongGia = request.getParameter("gia" + i);

            String[] s = new String[4];

            s[0] = id;
            s[1] = nameSP;
            s[2] = soLuong;
            s[3] = tongGia;

            listHoadon.add(s);
        }
//        Random r = new Random();
//        int soHD = r.nextInt(10000);
        HttpSession sessio= request.getSession();
        sessio.setAttribute("sohdd", soHD);



        for (String[] s :
                listHoadon) {



            HttpSession session = request.getSession(true);
            Cart cart = (Cart) session.getAttribute("cart");
            Product product = ProductService.getProductById(s[0]);
            cart.remove(product.getKey());
            HttpSession sessionn = request.getSession(false); // Lấy session hiện tại nếu nó đã tồn tại
            if (sessionn != null) { // Kiểm tra xem session có tồn tại không
                sessionn.removeAttribute("discount"); // Xóa session có tên là "session1"
            }
            //cập nhật mã giảm giá đã sử dụng
            discountService.updateStatus(reduceSesstion);
            //lưu hóa đơn
            new hoaDonService().hoaDon(soHD + "", user_id, fullName, email, tel, city, dis, wa, note, s[0], s[1], s[3], s[2], dateComment);
            //lưu phí vận chuyển, phí giảm giá, tổng tiền
            hoaDonService.oderdetail(Integer.parseInt(soHD + ""), discountFee,transportFee, totalprice);

            // lưu mã giảm giá
            hoaDonService.discount(id_dis, name_dis, reduce, reducedPrice, created_at, expiresAt);
            //cập nhật số  lượng
            new hoaDonService().updateQty(s[2], s[0]);


            //log
            DB.me().insert(new Log(Log.INFO, id_user, "doHoaDon-Lập hóa đơn", "soHD: " + soHD + ", Họ và Tên:" + fullName + ", Email: " + email + ", SĐT: " + tel + ", Thành Phố: " + city + ", Quận: " + dis + ", Xã: " + wa + ", ghi chú: " + note + ", Tên sản Phẩm: " + s[1] + ", Tổng giá: " + s[3] + ", số lượng: " + s[2], 0));




        }
//        request.getRequestDispatcher("login.jsp").forward(request,response);
        response.sendRedirect("/");

    }


}

