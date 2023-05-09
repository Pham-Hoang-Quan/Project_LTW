<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Product" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.hoaDon" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
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
</head>

<body>
<div class="container-scroller">
  <!-- partial:../../partials/_navbar.html -->
  <!-- partial -->
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
              <div class="card-body">
                <div style="">
                  <% hoaDon h = (hoaDon) request.getAttribute("TTHD1");%>
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
                   %>
                    <p> <span class="card-title"> <strong>Tổng tiền:</strong><%=gia%>đ</span> </p>
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