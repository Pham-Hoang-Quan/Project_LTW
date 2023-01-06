package vn.edu.hcmuaf.ttt.model;

import java.io.Serializable;
import java.sql.Date;

public class hoaDon implements Serializable {
    private int soHD;
    private String user_id;
    private String hoVaTen;
    private String HD_email;
    private String HD_sđt;
    private String city;
    private String disitrict;
    private String ward;
    private String note;
    private String id;
    private String tenSp;
    private String toongGia;

    private String soLuong;
    private Date ngayTaoHD ;

    public hoaDon(){

    }

    public hoaDon(int soHD, String user_id, String hoVaTen, String HD_email, String HD_sđt, String city, String disitrict, String ward, String note, String id, String tenSp, String toongGia, String soLuong, Date ngayTaoHD) {
        this.soHD = soHD;
        this.user_id = user_id;
        this.hoVaTen = hoVaTen;
        this.HD_email = HD_email;
        this.HD_sđt = HD_sđt;
        this.city = city;
        this.disitrict = disitrict;
        this.ward = ward;
        this.note = note;
        this.id = id;
        this.tenSp = tenSp;
        this.toongGia = toongGia;
        this.soLuong = soLuong;
        this.ngayTaoHD = ngayTaoHD;
    }

    public int getSoHD() {
        return soHD;
    }

    public void setSoHD(int soHD) {
        this.soHD = soHD;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getHoVaTen() {
        return hoVaTen;
    }

    public void setHoVaTen(String hoVaTen) {
        this.hoVaTen = hoVaTen;
    }

    public String getHD_email() {
        return HD_email;
    }

    public void setHD_email(String HD_email) {
        this.HD_email = HD_email;
    }

    public String getHD_sđt() {
        return HD_sđt;
    }

    public void setHD_sđt(String HD_sđt) {
        this.HD_sđt = HD_sđt;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDisitrict() {
        return disitrict;
    }

    public void setDisitrict(String disitrict) {
        this.disitrict = disitrict;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTenSp() {
        return tenSp;
    }

    public void setTenSp(String tenSp) {
        this.tenSp = tenSp;
    }

    public String getToongGia() {
        return toongGia;
    }

    public void setToongGia(String toongGia) {
        this.toongGia = toongGia;
    }

    public String getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(String soLuong) {
        this.soLuong = soLuong;
    }

    public Date getNgayTaoHD() {
        return ngayTaoHD;
    }

    public void setNgayTaoHD(Date ngayTaoHD) {
        this.ngayTaoHD = ngayTaoHD;
    }

    @Override
    public String toString() {
        return "hoaDon{" +
                "soHD=" + soHD +
                ", user_id='" + user_id + '\'' +
                ", hoVaTen='" + hoVaTen + '\'' +
                ", HD_email='" + HD_email + '\'' +
                ", HD_sđt='" + HD_sđt + '\'' +
                ", city='" + city + '\'' +
                ", disitrict='" + disitrict + '\'' +
                ", ward='" + ward + '\'' +
                ", note='" + note + '\'' +
                ", id='" + id + '\'' +
                ", tenSp='" + tenSp + '\'' +
                ", toongGia='" + toongGia + '\'' +
                ", soLuong='" + soLuong + '\'' +
                ", ngayTaoHD=" + ngayTaoHD +
                '}';
    }
}
