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


    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #f2f2f2;
            padding: 8px;
            border-left: none;
            border-right: none;
        }

        th {
            background-color: #f2f2f2;
            text-align: left;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:hover {
            background-color: #e5e5e5;
            cursor: pointer;
        }
    </style>
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
                            </span> Quản lý người dùng
                        </h3>
                        <nav aria-label="breadcrumb">
                            <div class="search-field d-none d-md-block">
                                <form action="SearchUser" method="post" class="d-flex align-items-center h-100">
<%--                                    <div class="input-group">--%>
<%--                                        <button type="submit" class="input-group-prepend bg-transparent">--%>
<%--                                            <i class="input-group-text border-0 mdi mdi-magnify"></i>--%>
<%--                                        </button>--%>
<%--                                        <input name="txt" type="text" class="form-control todo-list-input" placeholder="Tìm kiếm...">--%>
<%--                                    </div>--%>
                                </form>
                            </div>
                        </nav>
                    </div>
                    <main>
                        <div style="width:100% ;" class="col-lg-6 grid-margin stretch-card">
                            <div class="card">
                                <div style="padding: 20px ;" class="card-body">

                                    <table id="myTablee" style="padding: 20px;">
                                        <thead>
                                        <tr>
                                            <th>Tên</th>
                                            <th>username</th>
                                            <th>Email</th>
                                            <th>Điện thoại</th>
                                            <th>      </th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <% List<User> list = (List<User>) request.getAttribute("listUser");
                                            for (User u: list) { %>
                                        <tr>
                                            <td><%= u.getUser_fullname()%></td>
                                            <td><%=u.getUser_name()%></td>
                                            <td class="text-danger"> <%=u.getEmail()%> </td>
                                            <td class="text-success"> <%=u.getUser_sdt()%> </td>
                                            <td>
                                                <a href="<%= "/DeleteUser?id=" + u.getUser_id() %>">
                                                    <label class="badge badge-danger">Xóa <i class="remove mdi mdi-close-circle-outline"></i></label>
                                                </a>
                                            </td>
                                        </tr>
                                      <%}%>
                                        </tbody>
                                    </table>

<%--                                    <table class="table table-hover">--%>
<%--                                        <thead>--%>
<%--                                            <tr>--%>
<%--                                                <th>Tên</th>--%>
<%--                                                <th>username</th>--%>
<%--                                                <th>Email</th>--%>
<%--                                                <th>Điện thoại</th>--%>
<%--                                            </tr>--%>
<%--                                        </thead>--%>
<%--                                        <tbody>--%>
<%--                                        <% List<User> list = (List<User>) request.getAttribute("listUser");--%>
<%--                                            for (User u: list) { %>--%>
<%--                                        <tr>--%>
<%--                                            <td><%= u.getUser_fullname()%></td>--%>
<%--                                            <td><%=u.getUser_name()%></td>--%>
<%--                                            <td class="text-danger"> <%=u.getEmail()%> </td>--%>
<%--                                            <td class="text-success"> <%=u.getUser_sdt()%> </td>--%>
<%--                                            <td>--%>
<%--                                                <a href="<%= "/DeleteUser?id=" + u.getUser_id() %>">--%>
<%--                                                    <label class="badge badge-danger">Xóa <i class="remove mdi mdi-close-circle-outline"></i></label>--%>
<%--                                                </a>--%>
<%--                                            </td>--%>
<%--                                        </tr>--%>
<%--                                        <%}%>--%>

<%--                                        </tbody>--%>
<%--                                    </table>--%>
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


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            var table = $('#myTablee').DataTable( {
                language: {
                    search: "Tìm kiếm",
                    paginate: {
                        next: "Sau",
                        previous: "Trước"
                    },
                    info: "Hiển thị từ _START_ đến _END_ của _TOTAL_ mục",
                    lengthMenu: "Hiển thị _MENU_ mục",
                    infoFiltered: "(được lọc từ _MAX_ tổng số mục)",
                    infoEmpty: "Không tìm thấy mục nào",
                    emptyTable: "Không có dữ liệu"
                }
            });

            $('#myTablee tbody').on('mouseover', 'tr', function() {
                $(this).css('background-color', '#e5e5e5');
            });

            $('#myTablee tbody').on('mouseout', 'tr', function() {
                $(this).css('background-color', '');
            });
        });
    </script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
</body>

</html>