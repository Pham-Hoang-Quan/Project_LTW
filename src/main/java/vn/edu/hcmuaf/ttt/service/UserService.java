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
//        if(!user.getUser_password().equals(hashPassword(user_password))
//        ||!user.getUser_name().equals(user_name)) return null;
        return user;
    }

//    private  String hashPassword(String user_password) {
//        try{
//            MessageDigest sha256 = null;
//            sha256 = MessageDigest.getInstance("SHA-256");
//            byte[] hash = sha256.digest(user_password.getBytes());
//            BigInteger number = new BigInteger(1,hash);
//            return number.toString(16);
//        } catch (NoSuchAlgorithmException e) {
//            return null;
//        }
//    }

    public static void main(String[] args) {
        System.out.println(checkLogib("tien","123"));
    }

}
