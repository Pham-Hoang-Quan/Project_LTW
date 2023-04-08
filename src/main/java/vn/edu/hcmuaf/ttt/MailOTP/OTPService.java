package vn.edu.hcmuaf.ttt.MailOTP;

import vn.edu.hcmuaf.ttt.db.JDBiConnector;

import java.sql.Timestamp;

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

    //khóa người dùng khi nhập sai mã otp quá 3 lần
    static public boolean updateLockUser(String user_id) {
        JDBiConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE `user` SET locked = 1 WHERE user_id = ?;")
                        .bind(0,user_id).execute());
        return false;
    }

    //mở khóa người dùng
    static public boolean updateUnlockUser(String user_email) {
        JDBiConnector.me().withHandle(handle ->
                handle.createUpdate("UPDATE `user` SET locked = 0 WHERE user_email = ?;")
                        .bind(0,user_email).execute());
        return false;
    }

    public static void main(String[] args) {

        System.out.println(OTPService.updateLockUser("21"));
    }


}




