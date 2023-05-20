package vn.edu.hcmuaf.ttt.admin.service;

import vn.edu.hcmuaf.ttt.db.DBConnect;
import vn.edu.hcmuaf.ttt.db.JDBiConnector;
import vn.edu.hcmuaf.ttt.model.discount;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class DiscountService {
    public static List<discount> listDiscount() {
        List<discount> list = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if(statement!=null) {
                ResultSet rs = statement.executeQuery("SELECT * FROM discount where status = 0");
                while (rs.next()){
                    list.add(new discount(rs.getInt(1),rs.getString(2),rs.getString(3),
                            rs.getInt(4),rs.getTimestamp(5),rs.getTimestamp(6),rs.getInt(7)));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    static public  void deleteDis(String id_dis){
        JDBiConnector.me().withHandle(h ->
                h.createUpdate(" delete from discount where id_dis = ?")
                        .bind(0, id_dis)
                        .execute());
    }

    static public  void insertDis(String name,String reduce,int reducedPrice ,String creted, String expires){
        JDBiConnector.me().withHandle(h ->
                h.createUpdate(" INSERT INTO discount(name, reduce, reducedPrice, created_at, expires_at, status)  VALUES (?, ?, ?,?,?,0);")
                        .bind(0, name)
                        .bind(1, reduce)
                        .bind(2,reducedPrice)
                        .bind(3,creted)
                        .bind(4, expires)
                        .execute());
    }
}
