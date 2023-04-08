<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                        <form  class="d-flex align-items-center h-100" action="searchAdminProduct" method="post">
                            <div class="input-group">
                                <button type="submit" class="input-group-prepend bg-transparent">
                                    <i class="input-group-text border-0 mdi mdi-magnify"></i>
                                </button>
                                <input name="txt" type="text" class="form-control  todo-list-input" placeholder="Tìm kiếm sản phẩm">
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
                                            </td>
                                        </tr>
                                        <% }%>


                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-6 grid-margin stretch-card">
                            <div class="pagination">
                                <a href="#">&laquo;</a>
                                <%  int tag = (int) request.getAttribute("tag");
                                    int endP = (int) request.getAttribute("endP");
                                    for (int i = 1; i <= endP; i++) {%>
                                        <a class="<%= tag == i ? "active": ""%>" href="ProAdmin?index=<%=i%>"><%=i%></a>
                                <%}%>
                                <a class="active" href="#">&raquo;</a>
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
                    <form action="AddProduct" method="post" class="forms-sample" enctype="multipart/form-data">
<%--                        <div class="form-group row">--%>
<%--                            <label for="exampleInputUsername2" class="col-sm-3 col-form-label">Mã sản phẩm</label>--%>
<%--                            <div class="col-sm-9">--%>
<%--                                <input name="id" type="text" class="form-control"  placeholder="0001">--%>
<%--                            </div>--%>
<%--                        </div>--%>
                        <div class="form-group row">
                            <label for="exampleInputUsername2" class="col-sm-3 col-form-label">Tên</label>
                            <div class="col-sm-9">
                                <input name="name" type="text" class="form-control" id="exampleInputUsername2" placeholder="Tên sản phẩm">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label">Danh mục</label>
                            <div class="col-sm-9">
                                <select name="classify" class="form-control" id="browsers">
                                    <%@ page import="vn.edu.hcmuaf.ttt.model.Category" %>
                                    <%@ page import="java.util.Locale" %>
                                    <%@ page import="java.text.NumberFormat" %>
                                    <% List<Category> lista = (List<Category>) request.getAttribute("listc");
                                        for (Category p:lista) { %>
                                        <option value="<%=p.getcName()%>"><%=p.getcName()%></option>
                                    <%}%>

                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="exampleInputMobile" class="col-sm-3 col-form-label">Ảnh</label>
                            <div class="col-sm-9" method="post">
                                <input name="img" type="file" class="form-control"  placeholder="Url ảnh">
                                <input name="img2"  type="file" class="form-control"  placeholder="Url ảnh">
                                <input name="img3"  type="file" class="form-control"  placeholder="Url ảnh">
                                <input name="img4"  type="file" class="form-control"  placeholder="Url ảnh">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Giảm giá (%)</label>
                            <div class="col-sm-9">
                                <input name="percent" type="number" class="form-control"  placeholder="0">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Số lượng</label>
                            <div class="col-sm-9">
                                <input name="qty" type="number" class="form-control" id="exampleInputPassword2" placeholder="0">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Giá</label>
                            <div class="col-sm-9">
                                <input name="price" type="number" class="form-control" id="exampleInputConfirmPassword2" placeholder="Đơn giá">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="exampleInputMobile" class="col-sm-3 col-form-label">Mô tả</label>
                            <div class="col-sm-9">
                                <input name="content" type="text" class="form-control" id="" placeholder="Mô tả sản phẩm">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="exampleInputMobile" class="col-sm-3 col-form-label">Thông tin</label>
                            <div class="col-sm-9">
                                <input name="info" type="text" class="form-control" id="exampleInputMobile" placeholder="Thông tin về sản phẩm">
                            </div>
                        </div>
<%--                        <div class="form-check form-check-flat form-check-primary">--%>
<%--                            <label class="form-check-label">--%>
<%--                            <input  type="checkbox" class="form-check-input"> Sản phẩm mới !!!<i class="input-helper"></i></label>--%>
<%--                        </div>--%>
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