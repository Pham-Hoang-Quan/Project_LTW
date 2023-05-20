<%@ page import="vn.edu.hcmuaf.ttt.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Category" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<head>
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

  <!-- partial:partials/_navbar.html -->
  <jsp:include page="nav.jsp"></jsp:include>
  <!-- partial -->
  <div class="container-fluid page-body-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- partial -->
    <div class="main-panel">
      <div class="content-wrapper">
        <div  class="modal1">
          <% User p= (User) request.getAttribute("userr"); %>
          <div style="margin:20px auto ; width: 100%" class="col-md-6 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Chi tiết nhân viên</h4>
                <form action="EditUser" method="post" class="forms-sample" >
                  <div class="form-group row">
                    <label for="exampleInputUsername2" class="col-sm-3 col-form-label">Mã nhân viên</label>
                    <div class="col-sm-9">
                      <input name="idUser" type="text" class="form-control"  placeholder="0001" value="<%=p.getUser_id()%>">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="exampleInputUsername2" class="col-sm-3 col-form-label">Tên</label>
                    <div class="col-sm-9">
                      <input name="fullname" value="<%=p.getUser_fullname()%>" type="text" class="form-control" id="exampleInputUsername2" placeholder="Tên sản phẩm">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label  class="col-sm-3 col-form-label">Chức vụ</label>
                    <div class="col-sm-9">
                      <select name="admin" class="form-control" id="browsers">
                        <% if(p.getUser_admin() == 2) { %>
                        <option value="2" selected>Nhân viên bán hàng</option>
                        <option value="3">Nhân viên kho</option>
                        <%}%>
                        <% if(p.getUser_admin() == 3) { %>
                        <option value="2">Nhân viên bán hàng</option>
                        <option value="3 selected">Nhân viên kho</option>
                        <%}%>
                      </select>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Email</label>
                    <div class="col-sm-9">
                      <input name="email" value="<%= p.getEmail()%>" class="form-control"  placeholder="0">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="exampleInputPassword2" class="col-sm-3 col-form-label">SĐT</label>
                    <div class="col-sm-9">
                      <input name="sdt" value="<%=p.getUser_sdt()%>" class="form-control" id="exampleInputPassword2" placeholder="0">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Username</label>
                    <div class="col-sm-9">
                      <input name="username" value="<%= p.getUser_name()%>" class="form-control" id="exampleInputConfirmPassword2" placeholder="Đơn giá">
                    </div>
                  </div>
<%--                  <div class="form-group row">--%>
<%--                    <label for="exampleInputMobile" class="col-sm-3 col-form-label">Mô tả</label>--%>
<%--                    <div class="col-sm-9">--%>
<%--                      <input name="content" value="<%=p.getContent()%>" type="text" class="form-control" id="" placeholder="Mô tả sản phẩm">--%>
<%--                    </div>--%>
<%--                  </div>--%>
<%--                  <div class="form-group row">--%>
<%--                    <label for="exampleInputMobile" class="col-sm-3 col-form-label">Thông tin</label>--%>
<%--                    <div class="col-sm-9">--%>
<%--                      <input name="info" value="<%=p.getInfo()%>" type="text" class="form-control" id="exampleInputMobile" placeholder="Thông tin về sản phẩm">--%>
<%--                    </div>--%>
<%--                  </div>--%>
                  <button type="submit" class="btn btn-gradient-primary me-2 close">Lưu</button>
                  <button href="/StaffList" class="btn btn-light close">Quay Lại</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
      <!-- partial:partials/_footer.html -->
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
<script src="admin/assets/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="admin/assets/vendors/chart.js/Chart.min.js"></script>
<script src="admin/assets/js/jquery.cookie.js" type="text/javascript"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="admin/assets/js/off-canvas.js"></script>
<script src="admin/assets/js/hoverable-collapse.js"></script>
<script src="admin/assets/js/misc.js"></script>
<!-- endinject -->
<!-- Custom js for this page -->
<script src="admin/assets/js/dashboard.js"></script>
<script src="admin/assets/js/todolist.js"></script>
<!-- End custom js for this page -->
</body>

</html>