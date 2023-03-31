package vn.edu.hcmuaf.ttt.service;

import vn.edu.hcmuaf.ttt.admin.service.HoaDon;
import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.db.JDBiConnector;
import vn.edu.hcmuaf.ttt.model.Comment;

import java.util.List;
import java.util.stream.Collectors;

public class CommentService {
    public CommentService() {
    }

    public List<Comment> getListCommentByProductId(int products_id) {

        List<Comment> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("select user.user_fullname,comment.* from comment inner join user on user.user_id = comment.user_id where comment.id = ?")
                        .bind(0, products_id)
                        .mapToBean(Comment.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    public boolean createNewComment(String user_id,
                                    int id,
                                    String ngayTao,
                                    String comment_text,
                                    int rating) {

        Object o = JDBiConnector.me().withHandle(handle ->
                handle.createUpdate("insert into comment values (?,?,?,?,?)")
                        .bind(0, user_id)
                        .bind(1, id)
                        .bind(2, ngayTao)
                        .bind(3, comment_text)
                        .bind(4, rating)
                        .execute()
        );
        return o == null ? false : true;
    }

    static public boolean checkUserPurchase(String user_id, String id) {
        boolean hasPurchased = false;
        JDBiConnector.me().withHandle(handle ->
                handle.createQuery("SELECT* from hoadon WHERE user_id =? AND id = ?")
                        .bind(0, user_id)
                        .bind(1, id)
                        .mapToBean(HoaDon.class).first()
        );
        return hasPurchased;

    }
}

