package vn.edu.hcmuaf.ttt.admin.service;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DBConnect;
import vn.edu.hcmuaf.ttt.db.JDBiConnector;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public class UserService {
    public static List<User> listUser() {
        List<User> list = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if(statement!=null) {
                ResultSet rs = statement.executeQuery("SELECT * FROM user where user_admin = 0");
                while (rs.next()){
                    list.add(new User(rs.getString(1),rs.getString(2),rs.getString(3),
                            rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),
                            rs.getInt(8),rs.getBoolean(9),rs.getString(10),rs.getString(11),rs.getInt(12)));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static List<User> listStaff() {
        List<User> list = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if(statement!=null) {
                ResultSet rs = statement.executeQuery("SELECT * FROM user where user_admin > 1");
                while (rs.next()){
                    list.add(new User(rs.getString(1),rs.getString(2),rs.getString(3),
                            rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),
                            rs.getInt(8),rs.getBoolean(9),rs.getString(10),rs.getString(11),rs.getInt(12)));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public static List<User> listLockUser() {
        List<User> list = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if(statement!=null) {
                ResultSet rs = statement.executeQuery("SELECT * FROM user where looked = 1 ");
                while (rs.next()){
                    list.add(new User(rs.getString(1),rs.getString(2),rs.getString(3),
                            rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),
                            rs.getInt(8),rs.getBoolean(9),rs.getString(10),rs.getString(11),rs.getInt(12)));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static void deleteUser(String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from user where user_id = ? ")
                        .bind(0, id)
                        .execute());
    }

    public static void unlockUser(String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update user set looked = 0 where user_id = ? ")
                        .bind(0, id)
                        .execute());
    }

    static public User detailUser(String id) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery(" SELECT * FROM `user` WHERE user_id = ?")
                    .bind(0, id)
                    .mapToBean(User.class).first();
        });
    }

    public  static List<User> searchByFullName(String txtSearch){
        List<User> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("select * from user WHERE (`user_fullname` LIKE ? or `user_id` like ? or `user_email` like ? or `user_sdt` like ? or `user_name` like ?) and `user_admin` = 0 and user_id > 1 ")
                        .bind(0,"%" + txtSearch +"%")
                        .bind(1,"%" + txtSearch +"%")
                        .bind(2,"%" + txtSearch +"%")
                        .bind(3,"%" + txtSearch +"%")
                        .bind(4,"%" + txtSearch +"%")
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    static public void editUser(int id, String name, int admin, String email,
                                   String sdt, String username) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update user set user_id = ?, user_fullname = ?, user_admin = ?, user_email = ?, user_sdt = ?, user_name = ? where user_id = ?")
                        .bind(0, id)
                        .bind(1, name)
                        .bind(2, admin)
                        .bind(3, email)
                        .bind(4, sdt)
                        .bind(5, username)
                        .bind(6, id)
                        .execute());
    }
}
