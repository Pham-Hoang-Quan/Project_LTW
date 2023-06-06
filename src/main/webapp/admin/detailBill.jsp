<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Product" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.hoaDon" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.oderdetail" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Drill Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="admin/assets/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="admin/assets/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <!-- endinject -->
  <!-- Layout styles -->
  <link rel="stylesheet" href="admin/assets/css/style.css">
  <!-- End layout styles -->
  <link rel="shortcut icon" href="admin/assets/images/favicon.ico" />

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style>.status-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    height: 10px;
    background-color: #f0f0f0;

  }
  .status-bar2 {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    height: 10px;
    background-color: #ffffff;
    margin-top: 20px;
      margin-bottom: 30px;
  }
  .status-item {
    flex: 1;
    text-align: right;
    font-size: 30px;
    line-height: 10px;
    color: #777777;
    font-weight: bold;
  }
  .status-item2 {
    flex: 1;
    text-align: right;
    font-size: 15px;
    line-height: 10px;
    color: #777777;
    font-weight: bold;
  }

  .status-item i {

    margin-right: 5px;

  }


  .active {
    color: #600112;
    background-color: #D10024;
    height: 10px;
    display: flex;
    justify-content:  right;
    align-items: center;



  }
  </style>
</head>

<body>
<div class="container-scroller">
  <!-- partial:../../partials/_navbar.html -->
  <!-- partial -->
  <jsp:include page="nav.jsp"></jsp:include>
  <div class="container-fluid page-body-wrapper">
    <!-- partial:../../partials/_sidebar.html -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- partial -->
    <div class="main-panel">
      <div class="content-wrapper">
        <div class="page-header">
          <h3 class="page-title">
                            <span class="page-title-icon bg-gradient-primary text-white me-2">
                            <i class="mdi mdi-account"></i>
                            </span> Chi tiết hóa đơn
          </h3>
        </div>
        <main>
          <div style="width:100% ; padding: 10px" class="col-lg-6 grid-margin stretch-card">
            <div class="card">

                <% hoaDon h = (hoaDon) request.getAttribute("TTHD1");%>
                <% oderdetail oder_detaill = (oderdetail) request.getAttribute("oder_detaill");%>
              <div class="card-body">


<%----%>
                  <%if(h.getStatus() == 0) {%>
    <div class="status-bar">
        <div class="status-item active">
            <i class="mdi mdi-clipboard"></i>
        </div>
        <div class="status-item ">
            <i class="mdi mdi-truck"></i>
        </div>
        <div class="status-item ">
            <i class="mdi mdi-dropbox"></i>
        </div>
        <div class="status-item ">
            <i class="mdi mdi-check"></i>
        </div>
    </div>
    <%} if(h.getStatus() == 1){%>
    <div class="status-bar">
        <div class="status-item active">
            <i class="mdi mdi-clipboard"></i>
        </div>
        <div class="status-item active">
            <i class="mdi mdi-truck"></i>
        </div>
        <div class="status-item active">
            <i class="mdi mdi-dropbox"></i>
        </div>
        <div class="status-item ">
            <i class="mdi mdi-check"></i>
        </div>
    </div>
    <%} if(h.getStatus() == 2){%>
    <div class="status-bar">
        <div class="status-item active">
            <i class="mdi mdi-clipboard"></i>
        </div>
        <div class="status-item active">
            <i class="mdi mdi-truck"></i>
        </div>
        <div class="status-item active">
            <i class="mdi mdi-dropbox"></i>
        </div>
        <div class="status-item active">
            <i class="mdi mdi-check"></i>
        </div>
    </div>
    <%} if(h.getStatus() == 3){%>
    <div class="status-bar">
        <div class="status-item active">
            <i class="mdi mdi-clipboard"></i>
        </div>
        <div class="status-item active">
            <i class="mdi mdi-close"></i>
        </div>
        <div class="status-item  ">
            <i class="mdi mdi-dropbox"></i>
        </div>
        <div class="status-item ">
            <i class="mdi mdi-check"></i>
        </div>
    </div>
    <%}%>
<% if(h.getStatus() == 3){%>
    <div class="status-bar2">
        <div class="status-item2 ">
            Chờ xác nhận
        </div>
        <div class="status-item2 ">
           Đơn đã hủy
        </div>
        <div class="status-item2 ">
            Đang giao
        </div>
        <div class="status-item2 ">
            Đã nhận hàng
        </div>
    </div>
    <%} else {%>
    <div class="status-bar2">
        <div class="status-item2 ">
            Chờ xác nhận
        </div>
        <div class="status-item2 ">
            Đã giao bên vận chuyển
        </div>
        <div class="status-item2 ">
            Đang giao
        </div>
        <div class="status-item2 ">
            Đã nhận hàng
        </div>
    </div>
    <%}%>

<%----%>


                <div style="">

                  <div>
                    <p> <strong class="">Số hóa đơn: </strong> <%=h.getSoHD()%> </p>
                    <p> <strong class="">Ngày đặt:</strong> <%=h.getNgayTaoHD()%> </p>
                    <p> <strong class="">Tên khách hàng:</strong> <%= h.getHoVaTen()%> </p>
                  </div>

                  <div>

                    <p> <strong class="">Email: </strong> <%= h.getHD_email()%></p>
                    <p> <strong class="">Số điện thoại: </strong> <%= h.getHD_sdt()%></p>
                    <p> <strong class="">Địa chỉ:</strong> <%= h.getWard()%> <%= h.getDistrict()%> <%= h.getCity()%></p>

                  </div>
                </div>


                <div class="table-responsive">
                  <table class="table">
                    <thead>
                    <% List<hoaDon> listhh = (List<hoaDon>) request.getAttribute("LSsoHD");
                      int total = 0 ;
                    %>




                    <tr>
                      <th> <strong>Tên Sản Phẩm</strong></th>
                      <th> <strong>Số Lượng</strong> </th>
                      <th> <strong>Thành tiền</strong> </th>
                    </tr>
                    </thead>
                    <tbody>
                    <%  for (hoaDon hh:listhh) {
                      String s = hh.getToongGia();
                      int i = Integer.parseInt(s);

                      total+=i;
                    %>

                    <tr>
                      <td>
                        <%=hh.getTenSp()%>
                      </td>
                      <td>
                        <%=hh.getSoLuong()%>
                      </td>
                      <%Locale locale = new Locale("vi");
                        NumberFormat format = NumberFormat.getCurrencyInstance(locale);
                        String j = format.format(i).split(",")[0];
                      %>
                      <td>
                        <%= j%>đ
                      </td>
                      <td>
                      </td>
                    </tr>
<%}%>

                    </tbody>
                  </table>
                  <p> </p>
                 <div>
                   <%Locale locale = new Locale("vi");
                     NumberFormat format = NumberFormat.getCurrencyInstance(locale);
                     String gia = format.format(total).split(",")[0];

                     String transportFee = format.format(oder_detaill.getTransportFee()).split(",")[0];
                       String discountFee = format.format(oder_detaill.getDiscountFee()).split(",")[0];
                       String totall = format.format(oder_detaill.getTotalPrice()).split(",")[0];
                   %>
                     <p> <strong class="">Phí giao hàng: </strong> <%=transportFee%> đ</p>
                     <p> <strong class="">Phí giảm giá: </strong> <%=discountFee%> đ</p>

                     <%if(oder_detaill.getDiscountFee() == 0){
                     int i = oder_detaill.getTotalPrice() + oder_detaill.getTransportFee();
                         String totalg = format.format(i).split(",")[0];
                     %>
                     <p> <span class="card-title"> <strong>Tổng tiền: </strong><%=totalg%>đ</span> </p>
                     <%} else {%>
                     <p> <span class="card-title"> <strong>Tổng tiền: </strong><%=totall%>đ</span> </p>
                     <%}%>

                 </div>

                </div>
              </div>
            </div>
          </div>
        </main>
      </div>
      <!-- content-wrapper ends -->
      <!-- partial:../../partials/_footer.html -->
      <footer class="footer">

      </footer>
      <!-- partial -->
    </div>
    <!-- main-panel ends -->
  </div>
  <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="../../admin/assets/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="../../admin/assets/js/off-canvas.js"></script>
<script src="../../admin/assets/js/hoverable-collapse.js"></script>
<script src="../../admin/assets/js/misc.js"></script>
<!-- endinject -->
<!-- Custom js for this page -->
<!-- End custom js for this page -->
</body>

</html>