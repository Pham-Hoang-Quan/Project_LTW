<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
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
                            </span> Quản lý người dùng
                        </h3>
                        <nav aria-label="breadcrumb">
                            <div class="search-field d-none d-md-block">
                                <form action="SearchUser" method="post" class="d-flex align-items-center h-100">
                                    <div class="input-group">
                                        <button type="submit" class="input-group-prepend bg-transparent">
                                            <i class="input-group-text border-0 mdi mdi-magnify"></i>
                                        </button>
                                        <input name="txt" type="text" class="form-control todo-list-input" placeholder="Tìm kiếm...">
                                    </div>
                                </form>
                            </div>
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
                                                <th>username</th>
                                                <th>Email</th>
                                                <th>Điện thoại</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <% List<User> list = (List<User>) request.getAttribute("listUser");
                                            for (User u: list) { %>
                                        <tr>
                                            <td><%= u.getUser_fullname()%></td>
                                            <td><%=u.getUser_name()%></td>
                                            <td class="text-danger"> <%=u.getUser_email()%> </td>
                                            <td class="text-success"> <%=u.getUser_sdt()%> </td>
                                            <td>
                                                <a href="<%= "/THDoAn_war/DeleteUser?id=" + u.getUser_id() %>">
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
</body>

</html>