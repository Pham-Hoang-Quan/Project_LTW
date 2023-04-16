package vn.edu.hcmuaf.ttt.MailOTP;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.JDBiConnector;
import vn.edu.hcmuaf.ttt.model.Product;

import java.sql.Timestamp;
import java.util.List;
import java.util.stream.Collectors;

public class OTPService {

    static public  void codeOTP(int otp_number, Timestamp created_at, Timestamp expires_at){
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO `mailotp` VALUES (?,?,?)")
                        .bind(0, otp_number)
                        .bind(1, created_at)
                        .bind(2, expires_at)


                        .execute());

    }



//check OTP
    static public OTP checkCodeOTP(String codeOTP) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery(" SELECT* FROM mailotp WHERE codeOTP = ?")
                    .bind(0, codeOTP)

                    .mapToBean(OTP.class).first();


        });

    }
    //lấy tg hết hạn của OTP
//        public static List<OTP> expires_at() {
//
//            return JDBiConnector.me().withHandle(handle -> {
//                return handle.createQuery("SELECT expires_at FROM mailotp ").mapToBean(OTP.class).stream().collect(Collectors.toList());
//            });
//        }

    static public OTP expires_at() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery(" SELECT expires_at FROM mailotp")

                    .mapToBean(OTP.class).first();


        });

    }

    //update mật ramdom theo id
    static  public  void  updatePassRD(String user_pass, String user_id){
        JDBiConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE `user` SET user_password =? WHERE user_id = ?;")
                        .bind(0,user_pass)
                        .bind(1,user_id).execute());
    }



    public static void main(String[] args) {
System.out.println(OTPService.expires_at());
    }


}




