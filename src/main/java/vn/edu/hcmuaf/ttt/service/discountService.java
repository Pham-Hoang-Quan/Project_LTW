package vn.edu.hcmuaf.ttt.service;

import vn.edu.hcmuaf.ttt.MailOTP.OTP;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.JDBiConnector;
import vn.edu.hcmuaf.ttt.model.discount;

import java.util.List;
import java.util.stream.Collectors;

public class discountService {

    private discountService(){

    }
// lấy kiểm tra mã giảm giá

//    static public discount checkDiscount(String reduce) {
//        return JDBiConnector.me().withHandle(handle -> {
//            return handle.createQuery("SELECT * FROM discount WHERE reduce =?")
//                    .bind(0, reduce)
//                    .mapToBean(discount.class).first();
//
//
//        });
//
//    }

    public  static discount checkDiscount(String reduce){
        List<discount> dis = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM discount WHERE reduce =?").bind(0,reduce).mapToBean(discount.class).stream().collect(Collectors.toList())
        );
        if(dis.size() != 1) return null;
        discount discoutt = dis.get(0);
        return discoutt;
    }

    // cập nhật đã sử dụng mã giảm giá
    static  public  void  updateStatus(String reduce){
        JDBiConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE discount SET `status` = 1 WHERE reduce = ?")
                        .bind(0,reduce)
                        .execute());
    }



    public static void main(String[] args) {
        updateStatus("null");
    }

}
