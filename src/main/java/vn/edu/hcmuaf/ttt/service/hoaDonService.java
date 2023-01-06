package vn.edu.hcmuaf.ttt.service;

import vn.edu.hcmuaf.ttt.db.JDBiConnector;

import java.util.List;
import java.util.stream.Collectors;

public class hoaDonService {
    public hoaDonService(){

    }
    static public  void hoaDon(String soHD ,String user_id, String hoVaTen, String HD_email,String HD_sdt,String city, String disitrict, String ward, String note,String id, String tenSp, String toongGia,String soLuong, String ngayTaoHD){
        JDBiConnector.me().withHandle(h ->
                h.createUpdate(" INSERT INTO hoadon VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)")
                        .bind(0, soHD)
                        .bind(1, user_id)
                        .bind(2,hoVaTen )
                        .bind(3, HD_email)
                        .bind(4, HD_sdt)
                        .bind(5, city)
                        .bind(6, disitrict)
                        .bind(7, ward)
                        .bind(8, note)
                        .bind(9,id)
                        .bind(10, tenSp)
                        .bind(11, toongGia)
                        .bind(12, soLuong)
                        .bind(13,ngayTaoHD)

                        .execute());

    }
    public  static List<hoaDon> getlichSu(String user_id){
        List<hoaDon> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM hoadon WHERE user_id like ?")
                        .bind(0,user_id)
                        .mapToBean(hoaDon.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }


    public static void main(String[] args) {
        System.out.println(getlichSu("7"));

    }

}
