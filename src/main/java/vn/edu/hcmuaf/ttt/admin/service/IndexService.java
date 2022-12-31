package vn.edu.hcmuaf.ttt.admin.service;

import vn.edu.hcmuaf.ttt.db.DBConnect;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class IndexService {
    public static String CountProducts() throws SQLException {
        String Countrow="";
        try {
            Statement statement = DBConnect.getInstall().get();
            ResultSet rs = statement.executeQuery("select count(id) from products");
            while(rs.next()){
                Countrow = rs.getString(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return Countrow;
    }
}
