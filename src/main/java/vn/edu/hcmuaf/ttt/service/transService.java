package vn.edu.hcmuaf.ttt.service;

import vn.edu.hcmuaf.ttt.db.JDBiConnector;

public class transService {
    public  transService(){}
    static public  void trans(String soHD, String id, String name,String qty){
        JDBiConnector.me().withHandle(h ->
                h.createUpdate(" INSERT INTO trans VALUES (?,?,?,?)")
                        .bind(0, soHD)

                        .bind(0, id)
                        .bind(1,name )
                        .bind(2, qty)
                        .execute());

    }

}
