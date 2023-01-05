package vn.edu.hcmuaf.ttt.service;

import vn.edu.hcmuaf.ttt.db.JDBiConnector;

public class hoaDonService {
    public hoaDonService(){

    }
    static public  void hoaDon(String soHD ,String user_id, String hoVaTen, String HD_email,String HD_sdt,String city, String disitrict, String ward, String note,String id, String tenSp, String toongGia,String soLuong){
        JDBiConnector.me().withHandle(h ->
                h.createUpdate(" INSERT INTO hoadon VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)")
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

                        .execute());

    }

}
