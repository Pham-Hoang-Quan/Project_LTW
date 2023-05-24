<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.discount" %>
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
    <!-- partial:../../partials/_sidebar.html -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- partial -->
    <div class="main-panel">
      <div class="content-wrapper">
        <div class="page-header">
          <h3 class="page-title">
            <span class="page-title-icon bg-gradient-primary text-white me-2">
              <i class="mdi mdi-account"></i>
            </span> Danh sách mã giảm giá
          </h3>
          <nav aria-label="breadcrumb">
            <ul class="breadcrumb">
              <li class="breadcrumb-item active" aria-current="page">
                <button id="btn-modal" class="btn btn-block btn-lg btn-gradient-primary mt-4">+ Thêm mã</button>
              </li>
            </ul>
          </nav>
        </div>
        <main>
          <div style="width:100% ;" class="col-lg-6 grid-margin stretch-card">
            <div class="card">
              <div style="padding: 0 ;" class="card-body">
                <table id="dis_table" class="table table-hover table-hover table-striped table-bordered">
                  <thead>
                  <tr>
                    <th>Tên</th>
                    <th>Mã giảm giá</th>
                    <th>Giá trị mã</th>
                    <th>Ngày tạo</th>
                    <th>Ngày hết hạn</th>
                  </tr>
                  </thead>
                  <tbody>
                  <% List<discount> list = (List<discount>) request.getAttribute("listDis");
                    for (discount u: list) { %>
                  <tr>
                    <td><%= u.getName()%></td>
                    <td><%=u.getReduce()%></td>
                    <td class="text-danger"> <%=u.getReducedPrice()%>đ </td>
                    <td class="text-success"> <%=u.getCreated_at()%> </td>
                    <td class="text-success"> <%=u.getExpires_at()%> </td>
                    <td>
                      <a style="text-decoration: none" href="<%= "/DeleteDis?idDis=" + u.getId_dis() %>">
                        <label class="badge badge-danger">Xóa<i class="remove mdi mdi-close-circle-outline"></i></label>
                      </a>
                    </td>
                  </tr>
                  <%}%>

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

<div id="modal" class="modal">
<%--  <div style="margin:20px auto ;" class="col-md-6 grid-margin stretch-card">--%>
<%--    <div class="card">--%>
<%--      <div class="card-body">--%>
<%--        <h4 class="card-title">Thêm sản phẩm</h4>--%>
<%--        <p class="card-description"> Nhập thông tin </p>--%>
<%--        <form action="AddDiscount" method="post" class="forms-sample" enctype="multipart/form-data">--%>
<%--          <div class="form-group row">--%>
<%--            <label for="exampleInputUsername2" class="col-sm-3 col-form-label">Tên</label>--%>
<%--            <div class="col-sm-9">--%>
<%--              <input name="nameDis" type="text" class="form-control" id="exampleInputUsername2" placeholder="Tên sản phẩm">--%>
<%--            </div>--%>
<%--          </div>--%>
<%--          <div class="form-group row">--%>
<%--            <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Mã giảm giá</label>--%>
<%--            <div class="col-sm-9">--%>
<%--              <input name="reduce" type="text" class="form-control"  placeholder="0">--%>
<%--            </div>--%>
<%--          </div>--%>
<%--          <div class="form-group row">--%>
<%--            <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Số tiền giảm</label>--%>
<%--            <div class="col-sm-9">--%>
<%--              <input name="reducePrice" type="number" class="form-control" id="exampleInputPassword2" placeholder="0">--%>
<%--            </div>--%>
<%--          </div>--%>
<%--          <div class="form-group row">--%>
<%--            <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Ngày bắt đầu</label>--%>
<%--            <div class="col-sm-9">--%>
<%--              <input name="create" type="datetime-local" class="form-control" id="exampleInputConfirmPassword2" placeholder="Đơn giá">--%>
<%--            </div>--%>
<%--          </div>--%>
<%--          <div class="form-group row">--%>
<%--            <label  class="col-sm-3 col-form-label">Ngày kết thúc</label>--%>
<%--            <div class="col-sm-9">--%>
<%--              <input name="expires" type="datetime-local" class="form-control" id="" placeholder="Mô tả sản phẩm">--%>
<%--            </div>--%>
<%--          </div>--%>
<%--&lt;%&ndash;          <div class="form-group row">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <label for="exampleInputMobile" class="col-sm-3 col-form-label">Thông tin</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class="col-sm-9">&ndash;%&gt;--%>
<%--&lt;%&ndash;              <input name="info" type="text" class="form-control" id="exampleInputMobile" placeholder="Thông tin về sản phẩm">&ndash;%&gt;--%>
<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;          </div>&ndash;%&gt;--%>
<%--          <button type="submit" class="btn btn-gradient-primary me-2 close">Thêm</button>--%>
<%--          <button class="btn btn-light close">Hủy bỏ</button>--%>
<%--        </form>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
  <div style="margin:20px auto ;" class="col-md-6 grid-margin stretch-card">
    <div class="card">
      <div class="card-body">
        <h4 class="card-title">Thêm mã giảm giá</h4>
        <p class="card-description"> Nhập thông tin </p>
        <form action="AddDiscount" method="post" class="forms-sample">
          <div class="form-group">
            <label for="exampleInputUsername1">Tên</label>
            <input name="nameDis" type="text" class="form-control" id="exampleInputUsername1" placeholder= "Mã Giảm...">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">Mã</label>
            <input name="reduce" type="text" class="form-control" id="exampleInputEmail1" placeholder="svfgbv">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Số tiền</label>
            <input name="reducePrice" type="number" class="form-control" id="exampleInputPassword1" placeholder="00000000">
          </div>
          <div class="form-group">
            <label for="exampleInputConfirmPassword1">Ngày băt đầu</label>
            <input name="create" type="datetime-local" class="form-control" id="exampleInputConfirmPassword1" placeholder="Password">
          </div>
          <div class="form-group">
            <label for="exampleInputConfirmPassword2">Ngày kết thúc</label>
            <input name="expires" type="datetime-local" class="form-control" id="exampleInputConfirmPassword2" placeholder="Password">
          </div>
          <button type="submit" class="btn btn-gradient-primary me-2">Lưu</button>
          <button class="btn btn-light">Hủy</button>
        </form>
      </div>
    </div>
  </div>
</div>
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


