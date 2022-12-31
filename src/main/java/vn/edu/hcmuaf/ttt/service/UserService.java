package vn.edu.hcmuaf.ttt.service;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.JDBiConnector;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class UserService {
    private static UserService instance;


    private static Map<String, String> users = new HashMap<>();
    static {
        users.put("admin", "admin");
        users.put("user", "user");
        users.put("ti", "123");
    }

    private UserService(){

    }

    public static UserService getInstance(){
        if(instance == null){
            instance = new UserService();

        }
        return instance;
    }

    public  static User checkLogib(String user_name, String user_password){
        List<User> users = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM `user` WHERE user_name = ? AND user_password = ?").bind(0,user_name).bind(1,user_password).mapToBean(User.class).stream().collect(Collectors.toList())
        );
        if(users.size() != 1) return null;
        User user = users.get(0);
        return user;
    }

    public  static User checkExist(String user_name){
        List<User> users = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM `user` WHERE user_name = ?").bind(0,user_name).mapToBean(User.class).stream().collect(Collectors.toList())
        );
        if(users.size() != 1) return null;
        User user = users.get(0);
        return user;
    }

    static public  void singup(String user_fullname, String user_name, String accout, String user_email,String user_sdt, String user_password){
       JDBiConnector.me().withHandle(h ->
               h.createUpdate("INSERT INTO `user` VALUES (null,?,?,?,?,?,?, 0)")
                .bind(0, user_name)
                .bind(0, user_fullname)
                .bind(1, user_name)
                .bind(2, accout)
                .bind(3, user_email)
                .bind(4, user_sdt)
                .bind(5, user_password)
                .execute());

    }








    public static void main(String[] args) {
        System.out.println(checkLogib("tien","123"));
    }

}
