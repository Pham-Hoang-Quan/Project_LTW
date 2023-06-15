<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Log" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">







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

          <div style="width:100% ;" class="col-lg-6 grid-margin stretch-card">
            <div class="card">
              <div style="padding: 0 ;" class="card-body">
                <table class="table table-striped" id="users" style="width: 100%;">
                  <thead >
                  <tr id="list-header">
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">Phone</th>
                  </tr>

                  </thead>
                  <tbody>
                  <tr>
                    <td>fad</td>
                    <td>fad</td>
                    <td>fad</td>
                    <td>fad</td>
                    <td>fad</td>
                  </tr>
                  <tr>
                    <td>fad</td>
                    <td>fad</td>
                    <td>fad</td>
                    <td>ab</td>
                    <td>fad</td>
                  </tr>
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
<!-- endinject -->
<!-- Plugin js for this page -->
<!-- End plugin js for this page -->
<!-- inject:js -->

<!-- endinject -->
<!-- Custom js for this page -->
<!-- End custom js for this page -->
</body>

</html>

