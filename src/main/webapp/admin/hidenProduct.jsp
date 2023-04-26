<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="vn.edu.hcmuaf.ttt.model.Product" %>
<%@ page import="java.util.List" %>
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
  <jsp:include page="nav.jsp"></jsp:include>
  <!-- partial -->
  <div class="container-fluid page-body-wrapper">

    <jsp:include page="menu.jsp"></jsp:include>
    <!-- partial -->
    <div class="main-panel">
      <div style="padding-top: 0 ;" class="content-wrapper">

        <div class="page-header">
          <h3 class="page-title">
                            <span class="page-title-icon bg-gradient-primary text-white me-2">
                            <i class="mdi mdi-bitbucket"></i>
                            </span> Sản phẩm đã ẩn
          </h3>
        </div>
        <main>
          <div style="width:100% ;" class="col-lg-6 grid-margin stretch-card">
            <div class="card">
              <div style="padding: 0 ;" class="card-body">
                <table class="table table-hover">
                  <thead>
                  <tr>
                    <th>Tên</th>
                    <th>Ảnh</th>
                    <th>Phân loại</th>
                    <th>Giá</th>
                    <th>Thao tác</th>

                  </tr>
                  </thead>
                  <tbody>
                  <% List<Product> list = (List<Product>) request.getAttribute("list");
                    for (Product p: list) { %>
                  <tr>
                    <td> <%= p.getName()%></td>
                    <td>
                      <img src="<%= p.getImg()%>" alt="">
                    </td>
                    <td class="text-success"> <%= p.getClassify()%> </td>
                    <%
                      Locale locale = new Locale("vi");
                      NumberFormat format = NumberFormat.getCurrencyInstance(locale);
                      String gia = format.format(p.getPrice()).split(",")[0];
                    %>
                    <td class="text-danger"><%=gia%>đ</td>
                    <td>
                      <a style="text-decoration: none" href="<%= "/THDoAn_war/detail?id=" + p.getId()%>" title="Xem">
                        <label class="badge badge-success"><i style="cursor: pointer" class="mdi mdi-eye"></i></label>
                      </a>
                      <a style="text-decoration: none" title="Xóa" href="<%= "/THDoAn_war/DeleteProduct?id=" + p.getId() %>">
                        <label class="badge badge-danger"><i style="cursor: pointer" class="remove mdi mdi-close-circle-outline"></i></label>
                      </a>
                      <a title="Sửa" href="<%= "/THDoAn_war/LoadProduct?id=" + p.getId() %>" >
                        <label class="badge badge-warning"><i style="cursor: pointer" class="mdi mdi-auto-fix"></i></label>
                      </a>
                      <a title="Hiển thị sản phẩm" href="<%= "/THDoAn_war/UnhidenProduct?id=" + p.getId() %>" >
                        <label class="badge badge-warning"><i style="cursor: pointer" class="mdi mdi-auto-fix">Mở sản phẩm</i></label>
                      </a>
                    </td>
                  </tr>
                  <% }%>


                  </tbody>
                </table>
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
<script>
  // Get the modal
  var modal = document.getElementById("modal");

  // Get the button that opens the modal
  var btn = document.getElementById("btn-modal");

  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close")[0];

  // When the user clicks on the button, open the modal
  btn.onclick = function() {
    modal.style.display = "block";
  }

  // When the user clicks on <span> (x), close the modal
  span.onclick = function() {
    modal.style.display = "none";
  }

  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
</script>
<style>
  .modal {
    display: none;
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: #818181a8;
  }
</style>
<%--css phân trang--%>
<style>
  .pagination {
    display: inline-block;
  }

  .pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
  }
</style>