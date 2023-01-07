package vn.edu.hcmuaf.ttt.admin.service;

import vn.edu.hcmuaf.ttt.db.DBConnect;
import vn.edu.hcmuaf.ttt.model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

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
    public static List<Product> needToAdd() {
        List<Product> list = new LinkedList<>();

        try {
            Statement statement = DBConnect.getInstall().get();
            if(statement!=null) {
                ResultSet rs = statement.executeQuery("SELECT * FROM products WHERE quantily < 50");
                while (rs.next()){
                    list.add(new Product(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getInt(12),rs.getString(13),rs.getString(14)));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}
