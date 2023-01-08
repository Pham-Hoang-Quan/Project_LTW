package vn.edu.hcmuaf.ttt.admin.service;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.DBConnect;
import vn.edu.hcmuaf.ttt.db.JDBiConnector;
import vn.edu.hcmuaf.ttt.model.hoaDon;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public class HoaDon {
    public static List<hoaDon> getListHD0(int status){
        List<hoaDon> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("select * from hoadon WHERE status = ?")
                        .bind(0,status)
                        .mapToBean(hoaDon.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }
    public static List<hoaDon> getListHD1(int status){
        List<hoaDon> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("select * from hoadon WHERE status = ?")
                        .bind(0,status)
                        .mapToBean(hoaDon.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    static public  void acceptOrder(String soHD){
        JDBiConnector.me().withHandle(h ->
                h.createUpdate(" update hoadon set status = 1 where soHD = ?")
                        .bind(0, soHD)
                        .execute());
    }
    static public  void deleteOrder(String soHD){
        JDBiConnector.me().withHandle(h ->
                h.createUpdate(" delete from hoadon where soHD = ?")
                        .bind(0, soHD)
                        .execute());
    }

    public static String CountHD() throws SQLException {
        String Countrow="";
        try {
            Statement statement = DBConnect.getInstall().get();
            ResultSet rs = statement.executeQuery("select count(soHD) from hoadon");
            while(rs.next()){
                Countrow = rs.getString(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return Countrow;
    }

    public static List<String> getTienHH() {
        List<String> list = new LinkedList<>();
        try {
            Statement statement = DBConnect.getInstall().get();
            if(statement!=null) {
                ResultSet rs = statement.executeQuery("SELECT toongGia FROM hoadon");
                while (rs.next()){
                    list.add(rs.getString(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public  static List<hoaDon> searchOrder(String txtSearch){
        List<hoaDon> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("select * from hoaDon WHERE (`soHD` LIKE ? or `HoVaTen` like ? or `HD_sdt` like ? or `HD_email` like ? or `ngayTaoHD` like ?) ")
                        .bind(0,"%" + txtSearch +"%")
                        .bind(1,"%" + txtSearch +"%")
                        .bind(2,"%" + txtSearch +"%")
                        .bind(3,"%" + txtSearch +"%")
                        .bind(4,"%" + txtSearch +"%")
                        .mapToBean(hoaDon.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }
    public static void main(String[] args) {
        for (hoaDon h: getListHD0(0)) {
            System.out.println(h);
        }
    }
}
