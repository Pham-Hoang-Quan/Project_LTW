package vn.edu.hcmuaf.ttt.service;

import vn.edu.hcmuaf.ttt.common.types.ProductFilterParams;
import vn.edu.hcmuaf.ttt.common.types.ProductFilterQuery;
import vn.edu.hcmuaf.ttt.db.DBConnect;
import vn.edu.hcmuaf.ttt.db.JDBiConnector;
import vn.edu.hcmuaf.ttt.model.Category;
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

    private static final String withSelectProdudcts = "SELECT * FROM products";

    private static final String withPriceFiltering = "price >= :minPrice AND price <= :maxPrice ";
    private static final String withClassifyFiltering = "classify IN (<classifies>) ";
    private static final String countProduct = "SELECT COUNT(id) FROM products";
    private static final String withPagination = "LIMIT 12 OFFSET :offset";
    private static final String fetchProductsWithFiltering = new StringBuilder().append(withSelectProdudcts)
            .append(" WHERE ")
            .append(withClassifyFiltering)
            .append("AND ")
            .append(withPriceFiltering).toString();



    private ProductService() {

    }

    public static ProductService getInstance() {
        if (instance == null) {
            instance = new ProductService();

        }
        return instance;
    }

    public static List<Product> getData() {

//
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM products ").mapToBean(Product.class).stream().collect(Collectors.toList());
        });

    }


    // đếm bao nhiêu sản phẩm từ hàm getData()
    public static int countProduct() {
        return getData().size();
    }
    //sản phẩm khoan Bê Mini cho index
    public static List<Product> getKhoanMini() {
//        List<Product> list = new LinkedList<>();
//
//        try {
//            Statement statement = DBConnect.getInstall().get();
//            if (statement != null) {
//                ResultSet rs = statement.executeQuery("select * from products where classify = 'khoan mini' order by rand() LIMIT 3");
//                while (rs.next()) {
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
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from products WHERE classify = 'khoan mini' order by rand() LIMIT 3").mapToBean(Product.class).stream().collect(Collectors.toList());
        });
    }
    //sản phẩm khoan Bê động lực cho index
    public static List<Product> getKhoanDongLuc() {
//        List<Product> list = new LinkedList<>();
////
////        try {
////            Statement statement = DBConnect.getInstall().get();
////            if (statement != null) {
////                ResultSet rs = statement.executeQuery("select * from products where classify = 'khoan động lực' order by rand() LIMIT 3");
////                while (rs.next()) {
////                    list.add(new Product(rs.getString(1), rs.getString(2),
////                            rs.getInt(3), rs.getString(4)
////                            , rs.getString(5), rs.getInt(6), rs.getString(7),rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11)));
////
////                }
////            }
////        } catch (SQLException e) {
////            throw new RuntimeException(e);
////        }
////        return list;
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from products WHERE classify = 'khoan động lực' order by rand() LIMIT 3").mapToBean(Product.class).stream().collect(Collectors.toList());
        });
    }

    public static List<Product> getKhoanBeTong() {
//        List<Product> list = new LinkedList<>();
//
//        try {
//            Statement statement = DBConnect.getInstall().get();
//            if (statement != null) {
//                ResultSet rs = statement.executeQuery("select * from products where classify = 'khoan bê tông' order by rand() LIMIT 3");
//                while (rs.next()) {
//                    list.add(new Product(rs.getString(1), rs.getString(2),
//                            rs.getInt(3), rs.getString(4)
//                            , rs.getString(5), rs.getInt(6), rs.getString(7),rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11)));
//                    //                    list.add(new Product(rs.getString(1), rs.getString(2),
////                            rs.getInt(3), rs.getString(4)
////                            , rs.getString(5), rs.getInt(6), rs.getString(7),
////                            rs.getInt(8), rs.getString(9), rs.getString(10)));
//                }
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return list;
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from products WHERE classify = 'khoan bê tông' order by rand() LIMIT 3").mapToBean(Product.class).stream().collect(Collectors.toList());
        });
    }


    public static List<Category> getCategory() {
        List<Category> list = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                ResultSet rs = statement.executeQuery("SELECT * FROM category;");
                while (rs.next()) {
                    list.add(new Category(rs.getInt(1), rs.getString(2)));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;

    }

    //lay sản phẩm mới
    public static List<Product> getLast() {

        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM products WHERE isNew = 1  limit 5").mapToBean(Product.class).stream().collect(Collectors.toList());
        });
    }

    // sản phẩm sale
    public static List<Product> getSale() {
//        List<Product> list = new LinkedList<>();
//        try {
//            Statement statement = DBConnect.getInstall().get();
//            if (statement != null) {
//                ResultSet rs = statement.executeQuery("SELECT * FROM products WHERE isNew = 2 limit 5");
//                while (rs.next()) {
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
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM products WHERE isNew = 2 limit 5").mapToBean(Product.class).stream().collect(Collectors.toList());
        });
    }


    public static List<String> getImgDetail() {
        List<String> list = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                ResultSet rs = statement.executeQuery("select link_img from products JOIN images on products.id = images.pro_id\n" +
                        "WHERE products.id = 1");
                while (rs.next()) {
                    list.add(rs.getString(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;

    }
    //sản phẩm tương tự
    public static List<Product> getSanPhamTuongTu() {
//        List<Product> list = new LinkedList<>();
//        try {
//            Statement statement = DBConnect.getInstall().get();
//            if (statement != null) {
//                ResultSet rs = statement.executeQuery("select * from products order by rand() limit 4");
//                while (rs.next()) {
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
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from products  order by rand() limit 4").mapToBean(Product.class).stream().collect(Collectors.toList());
        });
    }

    public static List<Product> getCTID(String cName) {
        List<Product> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("select  * from products WHERE classify = ?")
                        .bind(0, cName)
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    // Quan lam thu
//    public static List<String> getImgDetail(int id) {
//        List<Product> list = JDBiConnector.me().withHandle(handle ->
//                handle.createQuery("select link_img from products JOIN images on products.id = images.pro_id WHERE products.id = ?")
//                        .bind(0, id)
//                        .mapToBean(Product.class)
//                        .stream()
//                        .collect(Collectors.toList())
//        );
//        return list;
//    }

    public static List<Category> getCategoryIndex() {
        List<Category> list = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                ResultSet rs = statement.executeQuery("SELECT * FROM category limit 3;");
                while (rs.next()) {
                    list.add(new Category(rs.getInt(1), rs.getString(2)));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;

    }
//


    // Phương thức lấy sản phẩm từ csdl bằng id
    public static Product getProductById(String id) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * FROM products WHERE id = ?").bind(0, id).mapToBean(Product.class).first();


        });
    }
    // lây hình ảnh sản phẩm bằng id pro
    public static Product getImgByProID(String id) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM products WHERE  pro_id = ? LIMIT 1").bind(0, id).mapToBean(Product.class).first();


        });
    }


    //tim liem sp bang ten
    public static List<Product> searchByName(String txtSearch) {
        List<Product> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("select * FROM products WHERE `name` LIKE ? ")
                        .bind(0, "%" + txtSearch + "%")
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    public static int countTotalProducts(ProductFilterParams filterParams) {
        boolean shouldGetProductsByAllClassifies = filterParams.getClassifies() == null || filterParams.getClassifies().size() == 0;
        if (shouldGetProductsByAllClassifies) {
            return JDBiConnector.me().withHandle(handle -> handle.createQuery(
                            countProduct
                    )
                    .mapTo(Integer.class).one());

        }

        return JDBiConnector.me().withHandle(handle -> handle.createQuery(
                        new StringBuilder().append(countProduct)
                                .append(" WHERE ")
                                .append(withPriceFiltering)
                                .append(" AND ")
                                .append(withClassifyFiltering)
                )
                .bindBean(new ProductFilterQuery(filterParams.getMaxPrice(), filterParams.getMinPrice(), 0, filterParams.getClassifies()))
                .bindList("classifies", filterParams.getClassifies())
                .mapTo(Integer.class).one());
    }

    static public int getTotalProducts() {
        try {
            Statement statement = DBConnect.getInstall().get();
            if (statement != null) {
                //của thu
                // ResultSet rs = statement.executeQuery("SELECT COUNT(*) FROM products WHERE classify IN ('Khoan mini', 'Khoan bàn') and price <= 700000");
                //đếm số sản phẩm để phân trang
                ResultSet rs = statement.executeQuery("SELECT COUNT(*) FROM products");
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    public static String getFetchProductsWithFilteringSql() {
        return fetchProductsWithFiltering;
    }

    public static String withPagination() {
        return withPagination;
    }

    public static List<Product> getFilteredProducts(ProductFilterParams productQuery) {
        boolean shouldGetProductsByAllClassifies = productQuery.getClassifies() == null || productQuery.getClassifies().size() == 0;
        if (shouldGetProductsByAllClassifies) {
            return JDBiConnector.me().withHandle(handle -> handle.createQuery(
                            new StringBuilder().append(withSelectProdudcts)
                                    .append(" WHERE ")
                                    .append(withPriceFiltering)
                                    .append(withPagination)
                    )
                    .bindBean(new ProductFilterQuery(productQuery.getMaxPrice(), productQuery.getMinPrice(), productQuery.getPageIndex(), new ArrayList<>()))
                    .mapToBean(Product.class)
                    .stream()
                    .collect(Collectors.toList()));
        }

        return JDBiConnector.me().withHandle(handle -> handle.createQuery(
                        new StringBuilder().append(fetchProductsWithFiltering).append(withPagination)
                )
                .bindBean(new ProductFilterQuery(productQuery.getMaxPrice(), productQuery.getMinPrice(), productQuery.getPageIndex(), productQuery.getClassifies()))
                .bindList("classifies", productQuery.getClassifies())
                .mapToBean(Product.class)
                .stream()
                .collect(Collectors.toList()));

    }

    public static List<Product> pagingProduct(int index) {
        List<Product> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM products limit ?,12")
                        .bind(0, (index - 1) * 12)
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
        //SELECT products.*, images.link_img FROM images,products WHERE images.pro_id = products.id ;
    }
    //Phân trang sản phẩm trên admin
    public static List<Product> pagingProductAdmin(int index) {
        List<Product> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM products limit ?,10")
                        .bind(0, (index - 1) * 10)
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }
    public static void deleteProduct(String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from products where id = ? ")
                        .bind(0, id)
                        .execute());
    }


    static public void insertProduct(String name, String classify, String img, String img2, String img3, String img4, String percent, int qty, int price,
                                     String content, String info) {

        JDBiConnector.me().withHandle(h ->
                h.createUpdate(" INSERT into products( name, img, img2, img3, img4, price, classify, percent, quantily, content, info) VALUES (?,?,?,?,?,?,?,?,?,?,?)")

                        //.bind(0, id)
                        .bind(0, name)
                        .bind(1, img)
                        .bind(2, img2)
                        .bind(3, img3)
                        .bind(4, img4)
                        .bind(5, price)
                        .bind(6, classify)
                        .bind(7, percent)
                        .bind(8, qty)
                        .bind(9, content)
                        .bind(10, info)
                        .execute());
    }



    static public void editProduct(String id, String name, String classify, String percent, int qty, int price,
                                   String content, String info) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate(" update products set name = ?, price = ?, classify = ?, percent = ?, quantily = ?, content = ?, info = ? where id = ?")
                        .bind(0, name)
                        .bind(1, price)
                        .bind(2, classify)
                        .bind(3, percent)
                        .bind(4, qty)
                        .bind(5, content)
                        .bind(6, info)
                        .bind(7, id)
                        .execute());
    }


    public static void main(String[] args) {
//        System.out.println(ProductService.pagingProduct(1));
        System.out.println(ProductService.getProductById("1"));

//
    }


}