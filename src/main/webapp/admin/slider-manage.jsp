<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.ttt.admin.model.Slider" %>
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
                            </span> Quản lý Slider
                    </h3>
                    <nav aria-label="breadcrumb">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item active" aria-current="page">
                                <button id="btn-modal" class="btn btn-block btn-lg btn-gradient-primary mt-4">+ Thêm ảnh</button>
                            </li>
                        </ul>
                    </nav>
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
                                        <th>Ngày thêm</th>
                                        <th>Thao tác</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <% List<Slider> list = (List<Slider>) request.getAttribute("listSlider");
                                        for (Slider s: list) { %>
                                    <tr>
                                        <td><%= s.getName()%></td>
                                        <td style="text-align: center; width: 50%"> <img style="width: 70%; height: 70%; border-radius: 0;" src="<%=s.getImg()%>"> </td>
                                        <td class="text-danger"> <%=s.getCreated()%> </td>
                                        <td>
                                            <a href="<%= "/DeleteSlider?img=" + s.getImg() %>">
                                                <label class="badge badge-danger">Xóa <i class="remove mdi mdi-close-circle-outline"></i></label>
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

<div id="modal" class="modal">
    <div style="margin:20px auto ;" class="col-md-6 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Thêm ảnh slider</h4>
                <p class="card-description"> </p>
                <form action="AddSlider" method="post" class="forms-sample">
                    <div class="form-group row">
                        <label for="exampleInputUsername2" class="col-sm-3 col-form-label">Ảnh</label>
                        <div class="col-sm-9">
                            <input name="img" type="text" class="form-control"  placeholder="url">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="exampleInputUsername2" class="col-sm-3 col-form-label">Tên</label>
                        <div class="col-sm-9">
                            <input name="name" type="text" class="form-control" id="exampleInputUsername2" placeholder="Tên slider">
                        </div>


                        <button type="submit" class="btn btn-gradient-primary me-2 close">Thêm</button>
                        <button class="btn btn-light close">Hủy bỏ</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
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