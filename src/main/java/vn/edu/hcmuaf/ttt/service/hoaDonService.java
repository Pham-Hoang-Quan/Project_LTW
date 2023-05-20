package vn.edu.hcmuaf.ttt.service;

import vn.edu.hcmuaf.ttt.db.JDBiConnector;
import vn.edu.hcmuaf.ttt.model.hoaDon;

import java.sql.Timestamp;
import java.util.List;
import java.util.stream.Collectors;

public class hoaDonService {
    public hoaDonService() {

    }

    //lấy thông tin từ trang thanh toán
    static public void hoaDon(String soHD, String user_id, String hoVaTen, String HD_email, String HD_sdt, String city, String disitrict, String ward, String note, String id, String tenSp, String toongGia, String soLuong, String ngayTaoHD) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate(" INSERT INTO hoadon VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,0)")
                        .bind(0, soHD)
                        .bind(1, user_id)
                        .bind(2, hoVaTen)
                        .bind(3, HD_email)
                        .bind(4, HD_sdt)
                        .bind(5, city)
                        .bind(6, disitrict)
                        .bind(7, ward)
                        .bind(8, note)
                        .bind(9, id)
                        .bind(10, tenSp)
                        .bind(11, toongGia)
                        .bind(12, soLuong)
                        .bind(13, ngayTaoHD)

                        .execute());

    }

    //lấy mã giảm giá
    static public void discount(int id_dis, String name, String reduce, int reducedPrice, Timestamp created_at, Timestamp expires_at) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate(" INSERT INTO discount VALUES (?,?,?,?,?,?,0)")
                        .bind(0, id_dis)
                        .bind(1, name)
                        .bind(2, reduce)
                        .bind(3, reducedPrice)
                        .bind(4, created_at)
                        .bind(5, expires_at)
                        .execute());
    }


    //lịch sử đơn hàng
    public static List<hoaDon> getlichSu(String user_id) {
        List<hoaDon> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM hoadon WHERE user_id like ?")
                        .bind(0, user_id)
                        .mapToBean(hoaDon.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    public static List<hoaDon> getStatusOrder(String user_id) {
        List<hoaDon> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM hoadon WHERE user_id like ?")
                        .bind(0, user_id)
                        .mapToBean(hoaDon.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    public static List<hoaDon> getdetaibill(int soHD) {
        List<hoaDon> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM hoadon WHERE soHD = ?")
                        .bind(0, soHD)
                        .mapToBean(hoaDon.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    public static List<hoaDon> getdetailOrder(int soHD) {
        List<hoaDon> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM hoadon WHERE soHD = ?").bind(0, soHD)
                        .mapToBean(hoaDon.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }


    //thông tin trạng thái giao hàng
    public static hoaDon getinforOrder(int soHD) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT DISTINCT soHD, TenSP, toongGia, soLuong, ngayTaoHD FROM hoadon WHERE soHD = ?").bind(0, soHD).mapToBean(hoaDon.class).first();
        });
    }

    //cập nhật trạng thái đơn hàng
    public static void updateOrder(int soHD) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("UPDATE hoadon SET status = ? WHERE soHD = ?")
                        .bind(0, soHD)
                        .execute());
    }

    //đơn hàng chi tiết
    public static hoaDon getinfoBill(int soHD) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT DISTINCT HoVaTen, HD_email, HD_sdt, city, district, ward, note, " +
                            "ngayTaoHD FROM hoadon WHERE soHD = ?")
                    .bind(0, soHD)
                    .mapToBean(hoaDon.class).first();
        });
    }

    //chỉnh sủa số lượng khi thêm giỏ hàng
    static public void updateQty(String soluong, String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("UPDATE products\n" +
                                "SET quantily = quantily - ? \n" +
                                "WHERE id = ?")

                        .bind(0, soluong)
                        .bind(1, id)


                        .execute());
    }
    // hiện hóa đơn theo soHD



    public static void main(String[] args) {


    }

}
