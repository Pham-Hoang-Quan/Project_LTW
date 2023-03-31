package vn.edu.hcmuaf.ttt.admin.service;

import vn.edu.hcmuaf.ttt.db.DBConnect;
import vn.edu.hcmuaf.ttt.db.JDBiConnector;
import vn.edu.hcmuaf.ttt.model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

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
//        List<Product> list = new LinkedList<>();
//
//        try {
//            Statement statement = DBConnect.getInstall().get();
//            if(statement!=null) {
//                ResultSet rs = statement.executeQuery("SELECT * FROM products WHERE quantily < 50");
//                while (rs.next()){
//                    list.add(new Product(rs.getString(1), rs.getString(2),
//                            rs.getInt(3), rs.getString(4)
//                            , rs.getString(5), rs.getInt(6), rs.getString(7),rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11)));
//
//                }
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return list;
//    }
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM products WHERE quantily < 50").mapToBean(Product.class).stream().collect(Collectors.toList());
        });
    }
}
