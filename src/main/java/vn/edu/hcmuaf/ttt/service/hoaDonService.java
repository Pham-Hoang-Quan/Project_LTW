package vn.edu.hcmuaf.ttt.service;

import vn.edu.hcmuaf.ttt.admin.service.HoaDon;
import vn.edu.hcmuaf.ttt.db.JDBiConnector;
import vn.edu.hcmuaf.ttt.model.hoaDon;
import vn.edu.hcmuaf.ttt.model.oderdetail;

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

    //lấy thông tin mã giảm giá, phí vận chuyển

    public static void oderdetail(int soHD, int discountFee, int transportFee, int totalPrice) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate(" INSERT INTO oderdetail VALUES (?,?,?,?)")
                        .bind(0, soHD)
                        .bind(1, discountFee)
                        .bind(2, transportFee)
                        .bind(3, totalPrice)
                        .execute());
    }

    //lấy mã giảm giá
    static public void discount(int id_dis, String name, String reduce, int reducedPrice, Timestamp created_at, Timestamp expires_at) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate(" INSERT  INTO discount VALUES (?,?,?,?,?,?,0)")
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

    // lấy ra đơn hàng đang chờ xác nhận
    public static List<hoaDon> getOderXN(String user_id, int status) {
        List<hoaDon> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("SELECT * FROM hoadon WHERE user_id like ? AND `status` = ?")
                        .bind(0, user_id)
                        .bind(1, status)
                        .mapToBean(hoaDon.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    // update trạng thái đơn hàng sang bị hủy
    public static void updateStatus(int soHD) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("UPDATE hoadon SET `status` = 3 WHERE soHD = ?")
                        .bind(0, soHD)
                        .execute());
    }
// upddate sang trạng thái giao thành công
public static void updateStatus2(int soHD) {
    JDBiConnector.me().withHandle(h ->
            h.createUpdate("UPDATE hoadon SET `status` = 2 WHERE soHD = ?")
                    .bind(0, soHD)
                    .execute());
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
                handle.createQuery("SELECT id, TenSp, toongGia, soLuong  FROM hoadon WHERE soHD = ?")
                        .bind(0, soHD)
                        .mapToBean(hoaDon.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    public static List<hoaDon> getdetaibilll(int soHD) {
        List<hoaDon> list = JDBiConnector.me().withHandle(handle ->
                handle.createQuery("SELECT hoadon.id, hoadon.TenSp, hoadon.toongGia, hoadon.soLuong , products.price, products.img  FROM hoadon, products WHERE products.id = hoadon.id AND soHD = ?")
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
            return handle.createQuery("\n" +
                            "SELECT DISTINCT  soHD, user_id, HoVaTen, HD_email, HD_sdt, city, district, ward, note, ngayTaoHD, `status` FROM hoadon WHERE soHD = ?")
                    .bind(0, soHD)
                    .mapToBean(hoaDon.class).first();
        });
    }
    //lấy chi tiết đơn hàng đang chờ xác nhận
    public static hoaDon getoderX(int soHD) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("\n" +
                            "SELECT DISTINCT  soHD, user_id, HoVaTen, HD_email, HD_sdt, city, district, ward, note, ngayTaoHD, `status` FROM hoadon WHERE soHD = ? AND `status` = 1")
                    .bind(0, soHD)
                    .mapToBean(hoaDon.class).first();
        });
    }

    // 0: chờ xác nhận
    // 1:đã xác nhận
    // 2 đang giao
    // 3 đã giao
    // 4 hủy đơn
    //lấy chi tiết đơn các đơn hàng đang vận chuyển





    // lâý phí giao hàng theo sohd
    public static oderdetail getodertran(int soHD) {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT DISTINCT * FROM oderdetail WHERE soHD = ?")
                    .bind(0, soHD)
                    .mapToBean(oderdetail.class).first();
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

    public static void main(String[] args) {




    }

}
