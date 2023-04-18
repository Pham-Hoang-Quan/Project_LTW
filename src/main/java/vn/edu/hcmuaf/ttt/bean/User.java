package vn.edu.hcmuaf.ttt.bean;

import java.io.Serializable;

public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    private String user_id;
    private String user_fullname;
    private String user_name;
    private String account;
    private String email;
    private String user_sdt;
    private String user_password;
    private int user_admin;

    private boolean verified_email;


    private String id;

    private String id_fb;

    private int looked;

    public User(){

    }

    public User(String user_id, String user_fullname, String user_name, String account, String email, String user_sdt, String user_password, int user_admin, boolean verified_email, String id, String id_fb, int looked) {
        this.user_id = user_id;
        this.user_fullname = user_fullname;
        this.user_name = user_name;
        this.account = account;
        this.email = email;
        this.user_sdt = user_sdt;
        this.user_password = user_password;
        this.user_admin = user_admin;
        this.verified_email = verified_email;
        this.id = id;
        this.id_fb = id_fb;
        this.looked = looked;
    }

    public String getId_fb() {
        return id_fb;
    }

    public void setId_fb(String id_fb) {
        this.id_fb = id_fb;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public boolean isVerified_email() {
        return verified_email;
    }

    public void setVerified_email(boolean verified_email) {
        this.verified_email = verified_email;
    }

    public int getLooked() {
        return looked;
    }

    public void setLooked(int looked) {
        this.looked = looked;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_fullname() {
        return user_fullname;
    }

    public void setUser_fullname(String user_fullname) {
        this.user_fullname = user_fullname;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getemail() {
        return email;
    }

    public void setUser_email(String user_email) {
        this.email = user_email;
    }

    public String getUser_sdt() {
        return user_sdt;
    }

    public void setUser_sdt(String user_sdt) {
        this.user_sdt = user_sdt;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public int getUser_admin() {
        return user_admin;
    }

    public void setUser_admin(int user_admin) {
        this.user_admin = user_admin;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id='" + user_id + '\'' +
                ", user_fullname='" + user_fullname + '\'' +
                ", user_name='" + user_name + '\'' +
                ", account='" + account + '\'' +
                ", email='" + email + '\'' +
                ", user_sdt='" + user_sdt + '\'' +
                ", user_password='" + user_password + '\'' +
                ", user_admin=" + user_admin +
                ", verified_email=" + verified_email +
                ", id='" + id + '\'' +
                ", id_fb='" + id_fb + '\'' +
                ", looked=" + looked +
                '}';
    }
}
