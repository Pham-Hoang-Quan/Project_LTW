package vn.edu.hcmuaf.ttt.service;

import vn.edu.hcmuaf.ttt.db.JDBiConnector;

public class hoaDonService {
    public hoaDonService(){

    }
    static public  void hoaDon(String user_id, String hoVaTen, String HD_email,String HD_sdt,String city, String disitrict, String ward, String note, String tenSp, String toongGia){
        JDBiConnector.me().withHandle(h ->
                h.createUpdate(" INSERT INTO hoadon VALUES (null,?,?,?,?,?,?,?,?,?,?)")

                        .bind(0, user_id)
                        .bind(1,hoVaTen )
                        .bind(2, HD_email)
                        .bind(3, HD_sdt)
                        .bind(4, city)
                        .bind(5, disitrict)
                        .bind(6, ward)
                        .bind(7, note)
                        .bind(8, tenSp)
                        .bind(9, toongGia)
                        .execute());

    }
}
