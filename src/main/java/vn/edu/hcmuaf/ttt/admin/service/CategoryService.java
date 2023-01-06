package vn.edu.hcmuaf.ttt.admin.service;

import vn.edu.hcmuaf.ttt.db.JDBiConnector;

public class CategoryService {
    public static void deleteCategory(String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from category where cid = ? ")
                        .bind(0, id)
                        .execute());
    }

    static public  void insertCategory(String id, String name){
        JDBiConnector.me().withHandle(h ->
                h.createUpdate(" INSERT into category VALUES (?,?)")
                        .bind(0, id)
                        .bind(1,name )
                        .execute());
    }
}
