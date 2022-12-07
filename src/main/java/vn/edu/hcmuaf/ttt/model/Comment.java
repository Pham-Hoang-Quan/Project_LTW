package vn.edu.hcmuaf.ttt.model;

import java.io.Serializable;
import java.sql.Date;

public class Comment implements Serializable {
    private String user_fullname;
    private String user_id ;
    private int id ;
    private Date ngayTao ;
    private String comment_text ;
    private int rating ;
    public  Comment(){

    }

    public Comment(String user_fullname, String user_id, int id, Date ngayTao, String comment_text, int rating) {
        this.user_fullname = user_fullname;
        this.user_id = user_id;
        this.id = id;
        this.ngayTao = ngayTao;
        this.comment_text = comment_text;
        this.rating = rating;
    }

    public String getUser_fullname() {
        return user_fullname;
    }

    public void setUser_fullname(String user_fullname) {
        this.user_fullname = user_fullname;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }

    public String getComment_text() {
        return comment_text;
    }

    public void setComment_text(String comment_text) {
        this.comment_text = comment_text;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "user_fullname='" + user_fullname + '\'' +
                ", user_id='" + user_id + '\'' +
                ", id=" + id +
                ", ngayTao=" + ngayTao +
                ", comment_text='" + comment_text + '\'' +
                ", rating=" + rating +
                '}';
    }
}
