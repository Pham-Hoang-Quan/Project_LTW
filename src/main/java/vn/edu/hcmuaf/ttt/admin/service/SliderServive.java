package vn.edu.hcmuaf.ttt.admin.service;

import vn.edu.hcmuaf.ttt.admin.model.Slider;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DBConnect;
import vn.edu.hcmuaf.ttt.db.JDBiConnector;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class SliderServive {
    public static List<Slider> listSlider() {
        List<Slider> list = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if(statement!=null) {
                ResultSet rs = statement.executeQuery("SELECT * FROM slider");
                while (rs.next()){
                    list.add(new Slider(rs.getString(1), rs.getString(2), rs.getDate(3)));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static void deleteSlider(String img) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from slider where img = ? ")
                        .bind(0, img)
                        .execute());
    }
    static public  void insertSlider(String img, String name){
        JDBiConnector.me().withHandle(h ->
                h.createUpdate(" INSERT into slider VALUES (?,?, CURDATE())")
                        .bind(0, img)
                        .bind(1,name )
                        .execute());
    }
}
