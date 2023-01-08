package vn.edu.hcmuaf.ttt.model;

import java.io.Serializable;
import java.sql.Date;

public class hoaDon implements Serializable {
    private int soHD;
    private String user_id;
    private String hoVaTen;
    private String HD_email;
    private String HD_sdt;
    private String city;
    private String district;
    private String ward;
    private String note;
    private String id;
    private String tenSp;
    private String toongGia;

    private String soLuong;
    private Date ngayTaoHD ;
    private  int status;

    public hoaDon(){

    }

    public hoaDon(int soHD, String user_id, String hoVaTen, String HD_email, String HD_sdt, String city, String district, String ward, String note, String id, String tenSp, String toongGia, String soLuong, Date ngayTaoHD, int status) {
        this.soHD = soHD;
        this.user_id = user_id;
        this.hoVaTen = hoVaTen;
        this.HD_email = HD_email;
        this.HD_sdt = HD_sdt;
        this.city = city;
        this.district = district;
        this.ward = ward;
        this.note = note;
        this.id = id;
        this.tenSp = tenSp;
        this.toongGia = toongGia;
        this.soLuong = soLuong;
        this.ngayTaoHD = ngayTaoHD;
        this.status = status;
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

    public String getHD_sdt() {
        return HD_sdt;
    }

    public void setHD_sdt(String HD_sdt) {
        this.HD_sdt = HD_sdt;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "hoaDon{" +
                "soHD=" + soHD +
                ", user_id='" + user_id + '\'' +
                ", hoVaTen='" + hoVaTen + '\'' +
                ", HD_email='" + HD_email + '\'' +
                ", HD_sđt='" + HD_sdt + '\'' +
                ", city='" + city + '\'' +
                ", disitrict='" + district + '\'' +
                ", ward='" + ward + '\'' +
                ", note='" + note + '\'' +
                ", id='" + id + '\'' +
                ", tenSp='" + tenSp + '\'' +
                ", toongGia='" + toongGia + '\'' +
                ", soLuong='" + soLuong + '\'' +
                ", ngayTaoHD=" + ngayTaoHD +
                ", status=" + status +
                '}';
    }
}