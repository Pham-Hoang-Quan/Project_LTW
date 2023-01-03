
<%@ page import="vn.edu.hcmuaf.ttt.model.Product" %>
<%@ page import="java.util.List" %>

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
        <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                <a class="navbar-brand brand-logo" href="http://localhost:8080/THDoAn_war/IndexAdmin"><img src="admin/assets/images/LogoWeb.png" alt="logo" /></a>
                <a class="navbar-brand brand-logo-mini" href="http://localhost:8080/THDoAn_war/IndexAdmin"><img src="admin/assets/images/LogoWeb.png" alt="logo" /></a>
            </div>

        </nav>
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial:../../partials/_sidebar.html -->
            <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <ul class="nav">
                    <li class="nav-item nav-profile">
                        <a href="#" class="nav-link">
                            <div class="nav-profile-image">
                                <img src="admin/assets/images/faces/face1.jpg" alt="profile">
                                <span class="login-status online"></span>
                                <!--change to offline or busy as needed-->
                            </div>
                            <div class="nav-profile-text d-flex flex-column">
                                <span class="font-weight-bold mb-2"> Hoàng Quân</span>
                                <span class="text-secondary text-small">Admin</span>
                            </div>
                            <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/THDoAn_war/IndexAdmin">
                            <span class="menu-title">Trang chủ</span>
                            <i class="mdi mdi-home menu-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="oder-manage.html">
                            <span class="menu-title">Quản lý đơn hàng</span>

                            <i class="mdi mdi-crosshairs-gps menu-icon"></i>
                        </a>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="user-manage.html">
                            <span class="menu-title">Quản lý người dùng</span>
                            <i class="mdi mdi-contacts menu-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="http://localhost:8080/THDoAn_war/ProAdmin">
                            <span class="menu-title">Quản lý sản phẩm</span>
                            <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="statistical.html">
                            <span class="menu-title">Thống kê</span>
                            <i class="mdi mdi-chart-bar menu-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin-manage.html">
                            <span class="menu-title">Quản lý quản trị viên</span>
                            <i class="mdi mdi-table-large menu-icon"></i>
                        </a>
                    </li>

                    <li class="nav-item sidebar-actions">
                        <span class="nav-link">


              </span>
                    </li>
                </ul>
            </nav>
            <!-- partial -->
            <div class="main-panel">
                <div style="padding-top: 0 ;" class="content-wrapper">

                    <div class="page-header">
                        <h3 class="page-title">
                            <span class="page-title-icon bg-gradient-primary text-white me-2">
                            <i class="mdi mdi-bitbucket"></i>
                            </span> Quản lý sản phẩm
                        </h3>
                        <nav aria-label="breadcrumb">
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item active" aria-current="page">
                                    <button id="btn-modal" class="btn btn-block btn-lg btn-gradient-primary mt-4">+ Thêm sản phẩm</button>
                                </li>
                            </ul>
                        </nav>
                    </div>

                    <main>
                        <form class="d-flex align-items-center h-100" action="#">
                            <div class="input-group">
                                <div class="input-group-prepend bg-transparent">
                                    <i class="input-group-text border-0 mdi mdi-magnify"></i>
                                </div>
                                <input type="text" class="form-control  todo-list-input" placeholder="Tìm kiếm sản phẩm">
                            </div>
                        </form>
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
                                            <td><img src="<%= p.getImg()%>" alt=""></td>
                                            <td class="text-success"> <%= p.getClassify()%> </td>
                                            <td class="text-danger"><%=p.getPrice()%>đ</td>
                                            <td>
                                                <a href="<%= "/THDoAn_war/detail?id=" + p.getId()%>" title="Xem">
                                                    <label class="badge badge-success"><i style="cursor: pointer" class="mdi mdi-eye"></i></label>
                                                </a>
                                                <a  title="Xóa">
                                                    <label class="badge badge-danger"><i style="cursor: pointer" class="remove mdi mdi-close-circle-outline"></i></label>
                                                </a>
                                                <a title="Sửa">
                                                    <label class="badge badge-warning"><i style="cursor: pointer" class="mdi mdi-auto-fix"></i></label>
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
    <div id="modal" class="modal">
        <div style="margin:20px auto ;" class="col-md-6 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Thêm sản phẩm</h4>
                    <p class="card-description"> Nhập thông tin </p>
                    <form class="forms-sample">
                        <div class="form-group row">
                            <label for="exampleInputUsername2" class="col-sm-3 col-form-label">Mã sản phẩm</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="exampleInputUsername2" placeholder="0001">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="exampleInputUsername2" class="col-sm-3 col-form-label">Tên</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="exampleInputUsername2" placeholder="Tên sản phẩm">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Danh mục</label>
                            <div class="col-sm-9">
                                <input type="email" class="form-control" id="exampleInputEmail2" placeholder="Vd: khoan mini">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="exampleInputMobile" class="col-sm-3 col-form-label">Ảnh</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="exampleInputMobile" placeholder="Url ảnh">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Ngày tạo</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Ngày ra mắt">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Giá</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="exampleInputConfirmPassword2" placeholder="Đơn giá">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="exampleInputMobile" class="col-sm-3 col-form-label">Mô tả</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="exampleInputMobile" placeholder="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="exampleInputMobile" class="col-sm-3 col-form-label">Nhà sản xuất</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="exampleInputMobile" placeholder="Nhập mã nhà sản xuất">
                            </div>
                        </div>
                        <div class="form-check form-check-flat form-check-primary">
                            <label class="form-check-label">
                      <input type="checkbox" class="form-check-input"> Sản phẩm mới !!!<i class="input-helper"></i></label>
                        </div>
                        <button type="submit" class="btn btn-gradient-primary me-2 close">Thêm</button>
                        <button class="btn btn-light close">Hủy bỏ</button>
                    </form>
                </div>
            </div>
        </div>
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