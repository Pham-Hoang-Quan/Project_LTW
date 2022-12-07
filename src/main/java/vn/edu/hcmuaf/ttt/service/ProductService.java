package vn.edu.hcmuaf.ttt.service;

import vn.edu.hcmuaf.ttt.db.DBConnect;
import vn.edu.hcmuaf.ttt.db.JDBiConnector;
import vn.edu.hcmuaf.ttt.model.Category;
import vn.edu.hcmuaf.ttt.model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductService {
    public static List<Product> getData(){
        List<Product> list = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if(statement!=null) {
                //lấy sản phẩm bk
//                ResultSet rs = statement.executeQuery("select * from products order by rand() limit 3");
                //....
                ResultSet rs = statement.executeQuery("select * from products");
                while (rs.next()){
                    list.add(new Product(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getBoolean(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11)));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;


    }

    public static List<Product> getKhoanMini() {
        List<Product> list = new LinkedList<>();

        try {
            Statement statement = DBConnect.getInstall().get();
            if(statement!=null) {
                ResultSet rs = statement.executeQuery("select * from products where classify = 'khoan mini'");
                while (rs.next()){
                    list.add(new Product(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getBoolean(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11)));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static List<Category> getCategory(){
        List<Category> list = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if(statement!=null) {
                ResultSet rs = statement.executeQuery("SELECT * FROM category;");
                while (rs.next()){
                    list.add(new Category(rs.getInt(1),rs.getString(2)));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;

    }
//lay sản phẩm mới
    public  static List<Product> getLast(){
        List<Product> list = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if(statement!=null) {
                ResultSet rs = statement.executeQuery("SELECT * FROM products WHERE isNew = 1  limit 5");
                while (rs.next()){
                    list.add(new Product(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getBoolean(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11)));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    // sản phẩm sale
public static   List<Product> getSale(){
    List<Product> list = new LinkedList<>();
    try {
        Statement statement = DBConnect.getInstall().get();
        if(statement!=null) {
            ResultSet rs = statement.executeQuery("SELECT * FROM products WHERE isNew = 0  limit 5");
            while (rs.next()){
                list.add(new Product(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getBoolean(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11)));
            }
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    return list;
}
   //sản phẩm tương tự
   public static   List<Product> getSanPhamTuongTu(){
       List<Product> list = new LinkedList<>();
       try {
           Statement statement = DBConnect.getInstall().get();
           if(statement!=null) {
               ResultSet rs = statement.executeQuery("select * from products order by rand() limit 3");
               while (rs.next()){
                   list.add(new Product(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getBoolean(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11)));
               }
           }
       } catch (SQLException e) {
           throw new RuntimeException(e);
       }
       return list;
   }

    public  static   List<Product> getCTID(String cName){
//        List<Product> list = new LinkedList<>();
//        try {
//            Statement statement = DBConnect.getInstall().get();
//            if(statement!=null) {
//                ResultSet rs = statement.executeQuery("select * from products WHERE classify = ? ");
//                statement.setString()
//                while (rs.next()){
//                    list.add(new Product(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getBoolean(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11)));
//                }
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return list;
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from products WHERE classify = ?").bind(0,cName).mapToBean(Product.class).stream()
                    .collect(Collectors.toList());


        });
    }





    public static  Product getProductById(String id){
       return JDBiConnector.me().withHandle(handle -> {
           return handle.createQuery("select * from products where id = ?").bind(0,id).mapToBean(Product.class).first();


       });
    }





    public static void main(String[] args) {
//        String sql="INSERT INTO category VALUES";
//        List<Category> data = getCategory();
//        for (Category o : data){
//            sql+="("+o.getId()+",'"+p.getName()+"','"+p.getImg()+"',"+p.getPrice()+",'"+p.getClassify()+"','"+p.getOldPrice()+"',"+p.isNew()+",'"+p.getPercent()+"'),";
//        }
//System.out.println(sql);
//        System.out.println(getProductById("1"));
        ProductService dao = new ProductService();
        List<Product> lists = dao.getCTID("Khoan bê tông");
        for(Product o : lists){
            System.out.println(o);

        }
    }


}
