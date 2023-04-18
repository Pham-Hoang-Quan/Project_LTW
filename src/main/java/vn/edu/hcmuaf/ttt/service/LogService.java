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
//            return handle.createQuery("SELECT * FROM log").mapToBean(Log.class).stream().collect(Collectors.toList());
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
        System.out.println(LogService.logDetail(311));

//
    }
}
