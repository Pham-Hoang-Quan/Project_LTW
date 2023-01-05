package vn.edu.hcmuaf.ttt.service;

import vn.edu.hcmuaf.ttt.db.DBConnect;
import vn.edu.hcmuaf.ttt.db.JDBiConnector;
import vn.edu.hcmuaf.ttt.model.Category;
import vn.edu.hcmuaf.ttt.model.Comment;
import vn.edu.hcmuaf.ttt.model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductService {

    private static ProductService instance;

    private ProductService(){

    }
    public static ProductService getInstance(){
        if(instance == null){
            instance = new ProductService();

        }
        return instance;
    }
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
                    list.add(new Product(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getInt(12),rs.getString(13),rs.getString(14)));
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
                    list.add(new Product(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getInt(12),rs.getString(13),rs.getString(14)));
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
                    list.add(new Product(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getInt(12),rs.getString(13),rs.getString(14)));
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
            ResultSet rs = statement.executeQuery("SELECT * FROM products WHERE isNew = 2 limit 5");
            while (rs.next()){
                list.add(new Product(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getInt(12),rs.getString(13),rs.getString(14)));
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
               ResultSet rs = statement.executeQuery("select * from products order by rand() limit 4");
               while (rs.next()){
                   list.add(new Product(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getInt(12),rs.getString(13),rs.getString(14)));
               }
           }
       } catch (SQLException e) {
           throw new RuntimeException(e);
       }
       return list;
   }

    public static    List<Product> getCTID(String cName){
        List<Product> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("select * from products WHERE classify = ?")
                        .bind(0,cName)
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }
    public static List<Category> getCategoryIndex(){
        List<Category> list = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if(statement!=null) {
                ResultSet rs = statement.executeQuery("SELECT * FROM category limit 3;");
                while (rs.next()){
                    list.add(new Category(rs.getInt(1),rs.getString(2)));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;

    }
//






    public  static Product getProductById(String id){
       return JDBiConnector.me().withHandle(handle -> {
           return handle.createQuery("select * from products where id = ?").bind(0,id).mapToBean(Product.class).first();


       });
    }
    public  static List<Product> searchByName(String txtSearch){
        List<Product> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("select * from products WHERE `name` LIKE ? || classify LIKE  ?")
                        .bind(0,"%" + txtSearch +"%")
                        .bind(1,"%" + txtSearch +"%")
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    public  static List<Product> searchByCategory(String txtSearch){
        List<Product> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("select * from category WHERE cName LIKE ? ")
                        .bind(0,"%" + txtSearch +"%")
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    static public int getTotalProducts(){
        try {
            Statement statement = DBConnect.getInstall().get();
            if(statement!=null) {
                ResultSet rs = statement.executeQuery("SELECT COUNT(*) FROM products");
                while (rs.next()){
               return  rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    public static List<Product> pagingProduct(int index) {
        List<Product> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM products limit ?,12")
                        .bind(0, (index-1)*12)
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }






    public static void main(String[] args) {

        System.out.println(getSale());
//
    }



}
