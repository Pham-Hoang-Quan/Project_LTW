<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Product" %>
<%@ page import="java.util.List" %>
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
  <%--        <jsp:include page="nav.jsp"></jsp:include>--%>
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
                            <i class="mdi mdi-cart"></i>
                            </span> Quản lý đơn hàng
          </h3>
          <%--                        <nav aria-label="breadcrumb">--%>
          <%--                            <div class="search-field d-none d-md-block">--%>
          <%--                                <form class="d-flex align-items-center h-100" action="SearchOrder">--%>
          <%--                                    <div class="input-group">--%>
          <%--                                        <div class="input-group-prepend bg-transparent">--%>
          <%--                                            <i class="input-group-text border-0 mdi mdi-magnify"></i>--%>
          <%--                                        </div>--%>
          <%--                                        <input name="txt" type="text" class="form-control todo-list-input" placeholder="Tìm kiếm đơn hàng">--%>
          <%--                                    </div>--%>
          <%--                                </form>--%>
          <%--                            </div>--%>
          <%--                        </nav>--%>
        </div>

        <main>

          <input class="" id="tab1" type="radio" name="tabs" checked>
          <label for="tab1">Chưa giao</label>

          <input id="tab2" type="radio" name="tabs">
          <label for="tab2">Đã giao</label>



          <section id="content1">
            <div style="width:100% ;" class="col-lg-6 grid-margin stretch-card">
              <div class="card">
                <div style="padding: 0 ;" class="card-body">
                  <table class="table table-hover">
                    <thead>
                    <tr>
                      <th>Mã đơn</th>
                      <th>Tên khách hàng</th>
                      <th>Trị giá</th>
                      <th>Điện thoại</th>
                      <th>Thao tác</th>

                    </tr>
                    </thead>
                    <tbody>
                    <% List<hoaDon> list = (List<hoaDon>) request.getAttribute("listHD0");
                      for (hoaDon h: list) { %>
                    <tr>
                      <td><%=h.getSoHD()%></td>
                      <td><%=h.getHoVaTen()%></td>
                      <%  int tg = Integer.parseInt(h.getToongGia());
                        Locale locale = new Locale("vi");
                        NumberFormat format = NumberFormat.getCurrencyInstance(locale);
                        String gia1 = format.format(tg).split(",")[0];
                      %>
                      <td class="text-danger"> <%=gia1%> đ </td>

                      <td><%=h.getHD_sdt()%></td>
                      <td>
                        <a style="text-decoration: none" href="<%= "/THDoAn_war/AcceptOrder?SoHD=" + h.getSoHD() %>">
                          <label class="badge badge-success">Xác nhận</label>
                        </a>
                        <a style="text-decoration: none" href="<%= "/THDoAn_war/DeleteOrder?SoHD=" + h.getSoHD() %>">
                          <label class="badge badge-danger">Hủy đơn</label>
                        </a>
                        <a style="text-decoration: none" href="<%= "/THDoAn_war/DetailBill?SoHD=" + h.getSoHD() %>">
                          <label class="badge badge-info">Xem chi tiết</label>
                        </a>

                      </td>


                    </tr>
                    <%}%>

                    </tbody>
                  </table>
                </div>
              </div>
            </div>

          </section>

          <section id="content2">

            <div style="width:100% ;" class="col-lg-6 grid-margin stretch-card">
              <div class="card">
                <div style="padding: 0 ;" class="card-body">
                  <table class="table table-hover">
                    <thead>
                    <tr>
                      <th>Mã đơn</th>
                      <th>Tên khách hàng</th>
                      <th>Trị giá</th>
                      <th>Thao tác</th>

                    </tr>
                    </thead>
                    <tbody>
                    <% List<hoaDon> list1 = (List<hoaDon>) request.getAttribute("listHD1");
                      for (hoaDon h: list1) { %>
                    <tr>
                      <td><%=h.getSoHD()%></td>
                      <td><%=h.getHoVaTen()%></td>
                      <%  int tg = Integer.parseInt(h.getToongGia());
                        Locale locale = new Locale("vi");
                        NumberFormat format = NumberFormat.getCurrencyInstance(locale);
                        String gia = format.format(tg).split(",")[0];
                      %>
                      <td class="text-danger"> <%=gia%> đ </td>
                      <%--                                                <td class="text-danger"> <%=h.getToongGia()%> đ </td>--%>
                      <td><%=h.getHD_sdt()%></td>
                      <td>
                        <a style="text-decoration: none" href="<%= "/THDoAn_war/DeleteOrder?SoHD=" + h.getSoHD() %>">
                          <label class="badge badge-danger">Xóa</label>
                        </a>
                        <a style="text-decoration: none" href="<%= "/THDoAn_war/DetailBill?SoHD=" + h.getSoHD() %>">
                          <label class="badge badge-info">Xem chi tiết</label>
                        </a>

                      </td>


                    </tr>
                    <%}%>

                    </tbody>
                  </table>
                </div>
              </div>
            </div>


          </section>


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
<style>
  @import url("https://fonts.googleapis.com/css?family=Open+Sans:400,600,700");
  @import url("https://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css");
  *,
  *:before,
  *:after {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  html,
  body {
    height: 100%;
  }

  body {
    font: 14px/1 'Open Sans', sans-serif;
    color: #555;
    background: #eee;
  }

  h1 {
    padding: 10px 0;
    font-weight: 400;
    text-align: center;
  }

  p {
    margin: 0 0 20px;
    line-height: 1.5;
  }

  main {
    min-width: 320px;
    max-width: 1200px;
    padding-top: 0px;
    margin: 0 auto;
    background: #fff;
  }

  section {
    display: none;
    padding: 20px 0 0;
    padding-left: 20px;
    border-top: 1px solid #ddd;
  }

  input {
    display: none;
  }

  label {
    display: inline-block;
    margin: 0 0 -1px;
    padding: 15px 25px;
    font-weight: 600;
    text-align: center;
    color: #bbb;
    border: 1px solid transparent;
  }

  label:before {
    font-family: fontawesome;
    font-weight: normal;
    margin-right: 10px;
  }

  label[for*='1']:before {
    content: '\f1cb';
  }

  label[for*='2']:before {
    content: '\f17d';
  }

  label[for*='3']:before {
    content: '\f16b';
  }

  label[for*='4']:before {
    content: '\f1a9';
  }

  label:hover {
    color: #888;
    cursor: pointer;
  }

  input:checked+label {
    color: #555;
    border: 1px solid #ddd;
    border-top: 2px solid orange;
    border-bottom: 1px solid #fff;
  }

  #tab1:checked~#content1,
  #tab2:checked~#content2,
  #tab3:checked~#content3,
  #tab4:checked~#content4 {
    display: block;
  }

  @media screen and (max-width: 650px) {
    label {
      font-size: 0;
    }
    label:before {
      margin: 0;
      font-size: 18px;
    }
  }

  @media screen and (max-width: 400px) {
    label {
      padding: 15px;
    }
  }
</style>