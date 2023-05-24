<%@ page import="vn.edu.hcmuaf.ttt.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.ArrayList" %>
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

  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 100px;
    }

    th, td {
      padding: 10px;
      text-align: center;
    }

    th {
      background-color: #f2f2f2;
      color: #333;
    }

    tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    .total-row {
      font-weight: bold;
      background-color: #ccc;
    }
  </style>
  <style>
    .year-dropdown {
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .year-dropdown option {
      padding: 8px;
    }
  </style>
</head>

<body>

<div class="container-scroller">

  <!-- partial:partials/_navbar.html -->
  <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
      <a class="navbar-brand brand-logo" href="index.jsp"><img src="admin/assets/images/LogoWeb.png" alt="logo" /></a>
      <a class="navbar-brand brand-logo-mini" href="index.jsp"><img src="assets/images/LogoWeb.png" alt="logo" /></a>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-stretch">
      <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
        <span class="mdi mdi-menu"></span>
      </button>
      <div class="search-field d-none d-md-block">
        <form class="d-flex align-items-center h-100" action="#">
          <div class="input-group">
            <div class="input-group-prepend bg-transparent">
              <i class="input-group-text border-0 mdi mdi-magnify"></i>
            </div>
            <input type="text" class="form-control bg-transparent border-0" placeholder="Tìm kiếm">
          </div>
        </form>
      </div>
      <ul class="navbar-nav navbar-nav-right">



        <li class="nav-item dropdown">

          <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
            <h6 class="p-3 mb-0">Notifications</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item preview-item">
              <div class="preview-thumbnail">
                <div class="preview-icon bg-success">
                  <i class="mdi mdi-calendar"></i>
                </div>
              </div>
              <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                <h6 class="preview-subject font-weight-normal mb-1">Event today</h6>
                <p class="text-gray ellipsis mb-0"> Just a reminder that you have an event today </p>
              </div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item preview-item">
              <div class="preview-thumbnail">
                <div class="preview-icon bg-warning">
                  <i class="mdi mdi-settings"></i>
                </div>
              </div>
              <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                <h6 class="preview-subject font-weight-normal mb-1">Settings</h6>
                <p class="text-gray ellipsis mb-0"> Update dashboard </p>
              </div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item preview-item">
              <div class="preview-thumbnail">
                <div class="preview-icon bg-info">
                  <i class="mdi mdi-link-variant"></i>
                </div>
              </div>
              <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                <h6 class="preview-subject font-weight-normal mb-1">Launch Admin</h6>
                <p class="text-gray ellipsis mb-0"> New admin wow! </p>
              </div>
            </a>
            <div class="dropdown-divider"></div>
            <h6 class="p-3 mb-0 text-center">See all notifications</h6>
          </div>
        </li>

      </ul>
      <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
        <span class="mdi mdi-menu"></span>
      </button>
    </div>
  </nav>
  <!-- partial -->
  <div class="container-fluid page-body-wrapper">
    <!-- partial:partials/_sidebar.html -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- partial -->
    <div class="main-panel">
      <div class="content-wrapper">
        <div class="page-header">
          <h3 class="page-title">
                            <span class="page-title-icon bg-gradient-primary text-white me-2">
                  <i class="mdi mdi-home"></i>
                </span> Trang chủ
          </h3>
          <nav aria-label="breadcrumb">
            <ul class="breadcrumb">

            </ul>
          </nav>
        </div>
        <div class="row">
          <div class="col-md-4 stretch-card grid-margin">
            <div class="card bg-gradient-danger card-img-holder text-white">
              <div class="card-body">
                <img src="admin/assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                <h4 class="font-weight-normal mb-3"> Doanh thu <i class="mdi mdi-chart-line mdi-24px float-right"></i>
                </h4>

                <h2 class="mb-5">123 đ</h2>
                <% ArrayList<Integer> months = (ArrayList<Integer>) request.getAttribute("stayear");
                 %>
                <% ArrayList<Integer> tongdontheothang = (ArrayList<Integer>) request.getAttribute("tongyear");
                %>
                <% ArrayList<Integer> totalRevenues = (ArrayList<Integer>) request.getAttribute("totalRevenue");
                %>
<%--                <li><%= months %></li>--%>

<%--                <% } %>--%>

              </div>
            </div>
          </div>
          <div class="col-md-4 stretch-card grid-margin">
            <div class="card bg-gradient-info card-img-holder text-white">
              <div class="card-body">
                <a href="/StatisticsByTypeServlet">
                <img src="admin/assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                <h4 class="font-weight-normal mb-3">Thông kê số lượng truy cập <i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                </h4></a>

                <h2 class="mb-5">123</h2>

              </div>
            </div>
          </div>
          <div class="col-md-4 stretch-card grid-margin">
            <div class="card bg-gradient-success card-img-holder text-white">
              <div class="card-body">
                <img src="admin/assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image">
                <h4 class="font-weight-normal mb-3">Số lượng sản phẩm<i class="mdi mdi-diamond mdi-24px float-right"></i>
                </h4>
                <h2 class="mb-5">123</h2>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-12 grid-margin">
            <div class="card">
              <div class="card-body">
                <div class="row1">
                  <h4 style="display:inline-block ;" class="card-title">Thống kê hóa đơn</h4>
                </div>





                <div class="table-responsive">


                  <select class="year-dropdown" onchange="navigateToYear(this.value)">
                    <option value="">-- chọn năm --</option>
                    <% ArrayList<Integer> year = (ArrayList<Integer>) request.getAttribute("year");
                      for (int y : year) { %>
                    <option value="<%=y%>">-- <%=y%> --</option>
                    <%}%>

                    <!-- Thêm các tùy chọn khác cho các năm khác -->
                  </select>
<%--                  <a href="/StatisticsByTypeServlet" class="button">Click Me</a>--%>

                  <script>
                    function navigateToYear(year) {
                      if (year) {
                        window.location.href = 'statisticsMoth?yearr=' + year;
                      }
                    }
                  </script>


<%--                  <table class="table">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                      <th> Tên </th>--%>
<%--                      <th> Danh mục </th>--%>
<%--                      <th> Giá </th>--%>
<%--                      <th> ID </th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                  --%>
<%--                    <tr>--%>
<%--                      <td>--%>
<%--                        <img src="<%= p.getImg()%>" class="me-2" alt="image"> <%= p.getName()%>--%>
<%--                      </td>--%>
<%--                      <td> <%= p.getClassify() %> </td>--%>
<%--                      <td>--%>
<%--                        <%Locale locale1 = new Locale("vi");--%>
<%--                          NumberFormat format1 = NumberFormat.getCurrencyInstance(locale1);--%>
<%--                          String g = format1.format(p.getPrice()).split(",")[0];--%>
<%--                        %>--%>
<%--                        <label class="badge badge-gradient-success"> <%=g%> đ</label>--%>
<%--                      </td>--%>
<%--                      <td> <%= p.getId() %> </td>--%>
<%--                    </tr>--%>
<%--                    <% };%>--%>

<%--                    </tbody>--%>
<%--&lt;%&ndash;                  </table>&ndash;%&gt;--%>


<%--  <canvas id="salesChart"></canvas>--%>
<%--  <script>--%>
<%--    // Dữ liệu mẫu--%>
<%--    // var months = [1, 2, 3, 4, 5, 6];--%>
<%--    var months = <%=months%>;--%>
<%--    // var sales1 = [1000, 1500,900];--%>
<%--    var sales1 = <%=tongdontheothang %>;--%>
<%--    var sales2 = [10, 15,3];--%>

<%--    // Vẽ biểu đồ--%>
<%--    var ctx = document.getElementById('salesChart').getContext('2d');--%>
<%--    var salesChart = new Chart(ctx, {--%>
<%--      type: 'line',--%>
<%--      data: {--%>
<%--        labels: months,--%>
<%--        datasets: [--%>
<%--          {--%>
<%--            label: 'Tổng số hóa đơn',--%>
<%--            data: sales1,--%>
<%--            fill: false,--%>
<%--            borderColor: 'rgba(75, 192, 192, 1)',--%>
<%--            borderWidth: 1--%>
<%--          },--%>
<%--          {--%>
<%--            label: 'Total Sales 2',--%>
<%--            data: sales2,--%>
<%--            fill: false,--%>
<%--            borderColor: 'rgba(192, 75, 192, 1)',--%>
<%--            borderWidth: 1--%>
<%--          }--%>
<%--        ]--%>
<%--      },--%>
<%--      options: {--%>
<%--        scales: {--%>
<%--          y: {--%>
<%--            beginAtZero: true--%>
<%--          }--%>
<%--        },--%>
<%--        elements: {--%>
<%--          line: {--%>
<%--            tension: 0.4 // Điều chỉnh độ cong của đường--%>
<%--          }--%>
<%--        }--%>
<%--      }--%>
<%--    });--%>
<%--  </script>--%>





                  <canvas id="myChart"></canvas>

                  <script>
                    // Dữ liệu cho biểu đồ
                    var chartData = {
                      // labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6'],
                      labels: <%=months%>,
                      datasets: [
                        {
                          type: 'line',
                          label: 'Doanh thu',
                          data: <%=totalRevenues%>,
                          borderColor: 'rgba(255, 99, 132, 1)',
                          backgroundColor: 'rgba(255, 99, 132, 0.2)',
                          fill: true,
                          lineTension: 0.3,
                          yAxisID: 'y-axis-1'
                        },
                        {
                          type: 'bar',
                          label: 'Số lượng sản phẩm bán ra',
                          data:<%=tongdontheothang %>,
                          backgroundColor: 'rgba(54, 162, 235, 0.5)',
                          borderColor: 'rgba(54, 162, 235, 1)',
                          borderWidth: 1,
                          yAxisID: 'y-axis-2'
                        }

                      ]
                    };

                    // Vẽ biểu đồ
                    var ctx = document.getElementById('myChart').getContext('2d');
                    var myChart = new Chart(ctx, {
                      type: 'bar',
                      data: chartData,
                      options: {
                        responsive: true,
                        title: {
                          display: true,
                          text: 'Biểu đồ kết hợp với đường cong'
                        },
                        scales: {
                          yAxes: [
                            {
                              id: 'y-axis-1',
                              type: 'linear',
                              position: 'left',
                              ticks: {
                                beginAtZero: true
                              }
                            },
                            {
                              id: 'y-axis-2',
                              type: 'linear',
                              position: 'right',
                              ticks: {
                                beginAtZero: true
                              }
                            }
                          ]
                        }
                      }
                    });
                  </script>
<div>
                  <table>
                    <thead>
                    <tr>


                      <th>Thời gian(năm/tháng)

                      </th>
                      <th>Số lượng bán ra</th>
                      <th>Doanh thu</th>
                    </tr>
                    </thead>
                    <tbody>

                    <%
                      for (int i = 0; i < months.size(); i++) {
                        int month = months.get(i);
                        int total = tongdontheothang.get(i);
                        int totalR = totalRevenues.get(i);


                    %>
                    <tr>
                      <td><%= month %></td>
                      <td><%= total %></td>
                      <td><%= totalR %></td>
                    </tr>
                    <%
                      }
                    %>
                    <!-- Add more rows for other months and years -->
                    <tr class="total-row">
                      <td >Total</td>
                      <td></td>
                      <td>$50,000</td>
                    </tr>
                    </tbody>
                  </table>
</div>



                </div>
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