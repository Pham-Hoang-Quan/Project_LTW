package vn.edu.hcmuaf.ttt.bean;

public class LoginUser {
    private String user_name;
    private String user_password;
    private boolean remember;

    public LoginUser(){

    }

    public LoginUser(String user_name, String user_password, boolean remember) {
        this.user_name = user_name;
        this.user_password = user_password;
        this.remember = remember;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public boolean isRemember() {
        return remember;
    }

    public void setRemember(boolean remember) {
        this.remember = remember;
    }

    @Override
    public String toString() {
        return "LoginUser{" +
                "user_name='" + user_name + '\'' +
                ", user_password='" + user_password + '\'' +
                ", remember=" + remember +
                '}';
    }
}
