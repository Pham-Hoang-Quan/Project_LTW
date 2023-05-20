package vn.edu.hcmuaf.ttt.service;

import vn.edu.hcmuaf.ttt.db.DBConnect;
import vn.edu.hcmuaf.ttt.db.JDBiConnector;
import vn.edu.hcmuaf.ttt.model.Log;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class LogService {
    public static List<Log> getData() {
        List<Log> list = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                ResultSet rs = statement.executeQuery("SELECT log.id, log.`level`, `user`.user_fullname, log.src," +
                        " log.content, log.createAt, log.`status` FROM `log` JOIN `user` ON log.`user` = `user`.user_id");
                while (rs.next()) {
                    list.add(new Log(rs.getString(1), rs.getInt(2),
                            rs.getString(3), rs.getString(4)
                            , rs.getString(5), rs.getDate(6), rs.getString(7)));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
//        return JDBiConnector.me().withHandle(handle -> {
//            return handle.createQuery("SELECT log.id, log.`level`, `user`.user_fullname, log.src," +
//                       " log.content, log.createAt, log.`status` FROM `log` JOIN `user` ON log.`user` = `user`.user_id").mapToBean(Log.class).collect(Collectors.toList());
//
//        });
    }
    public  static Log logDetail(int id){
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM `log` where log.id = ?")
                    .bind(0,id)
                    .mapToBean(Log.class).first();
        });
    }
    public static void main(String[] args) {
//
        System.out.println(LogService.getCountLog1());
        System.out.println(LogService.getCountLog2());
        System.out.println(LogService.getCountLog3());
        System.out.println(LogService.getCountLog4());
        System.out.println(LogService.getData());
//        System.out.println(LogService.logDetail(120));


//
    }
    public static int getCountLog1() {
        return JDBiConnector.me().withHandle(handle -> handle.createQuery(
                "SELECT COUNT(log.id) FROM `log` JOIN `user` ON log.`user` = `user`.user_id WHERE MONTH(createAt) = (MONTH(CURRENT_DATE) -1)")
                .mapTo(Integer.class).one());
    }

    public static int getCountLog2() {
        return JDBiConnector.me().withHandle(handle -> handle.createQuery(
                "SELECT COUNT(log.id) FROM `log` JOIN `user` ON log.`user` = `user`.user_id WHERE MONTH(createAt) = (MONTH(CURRENT_DATE) -2)")
                .mapTo(Integer.class).one());
    }
    public static int getCountLog3() {
        return JDBiConnector.me().withHandle(handle -> handle.createQuery(
                "SELECT COUNT(log.id) FROM `log` JOIN `user` ON log.`user` = `user`.user_id WHERE MONTH(createAt) = (MONTH(CURRENT_DATE) -3)")
                .mapTo(Integer.class).one());
    }
    public static int getCountLog4() {
        return JDBiConnector.me().withHandle(handle -> handle.createQuery(
                "SELECT COUNT(log.id) FROM `log` JOIN `user` ON log.`user` = `user`.user_id WHERE MONTH(createAt) = (MONTH(CURRENT_DATE) -4)")
                .mapTo(Integer.class).one());
    }
}
