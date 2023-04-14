package vn.edu.hcmuaf.ttt.MailOTP;

import java.util.Date;

public class OTP  {

    private  String codeOTP;
    private String created_at;
    private String expires_at;

    public  OTP(){

    }

    public OTP(String codeOTP, String created_at, String expires_at) {
        this.codeOTP = codeOTP;
        this.created_at = created_at;
        this.expires_at = expires_at;
    }

    public String getCodeOTP() {
        return codeOTP;
    }

    public void setCodeOTP(String codeOTP) {
        this.codeOTP = codeOTP;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getExpires_at() {
        return expires_at;
    }

    public void setExpires_at(String expires_at) {
        this.expires_at = expires_at;
    }

    @Override
    public String toString() {
        return "OTP{" +
                "codeOTP='" + codeOTP + '\'' +
                ", created_at='" + created_at + '\'' +
                ", expires_at='" + expires_at + '\'' +
                '}';
    }
}
