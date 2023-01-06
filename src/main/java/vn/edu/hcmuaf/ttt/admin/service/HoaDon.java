//package vn.edu.hcmuaf.ttt.admin.service;
//
//import vn.edu.hcmuaf.ttt.db.DBConnect;
//import vn.edu.hcmuaf.ttt.model.Product;
//import vn.edu.hcmuaf.ttt.model.hoaDon;
//
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
//import java.util.LinkedList;
//import java.util.List;
//
//public class HoaDon {
//    public static List<HoaDon> listHD() {
//        List<HoaDon> list = new LinkedList<>();
//        try {
//            Statement statement = DBConnect.getInstall().get();
//            if(statement!=null) {
//                ResultSet rs = statement.executeQuery("SELECT  * FROM hoadon");
//                while (rs.next()){
//                    list.add(new hoaDon(rs.getInt(1),rs.getString(2),rs.getString(3),
//                            rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),
//                            rs.getString(8),rs.getString(9),rs.getString(10),
//                            rs.getString(11)));
//                }
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return list;
//    }
//
//    public static void main(String[] args) {
//        for (HoaDon h: listHD()) {
//            System.out.println(h);
//        }
//    }
//}
