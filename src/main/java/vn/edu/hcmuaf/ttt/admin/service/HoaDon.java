package vn.edu.hcmuaf.ttt.admin.service;

import vn.edu.hcmuaf.ttt.db.JDBiConnector;

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
    public static void main(String[] args) {
        for (hoaDon h: getListHD0(0)) {
            System.out.println(h);
        }
    }
}
