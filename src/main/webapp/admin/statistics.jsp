<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Log" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Product" %>
<%@ page import="vn.edu.hcmuaf.ttt.admin.service.statisticsService" %>

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
  <link rel="shortcut icon" href="admin/assets/images/favicon.ico"/>
  <script src="admin/assets/js/dashboard.js"></script>
  <script src="admin/assets/js/todolist.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="admin/assets/vendors/chart.js/Chart.min.js"></script>
  <script src="admin/assets/js/chart.js"></script>
  <script src="admin/assets/js/off-canvas.js"></script>
  <script src="admin/assets/js/hoverable-collapse.js"></script>
  <script src="admin/assets/js/misc.js"></script>
  <script src="admin/assets/js/jquery.cookie.js" type="text/javascript"></script>
  <script src="admin/assets/vendors/js/vendor.bundle.base.js"></script>


  <%--    Datatable--%>
  <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script
          src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
  </script>
  <!-- DataTables -->
  <link rel="stylesheet"
        type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
  <script type="text/javascript"
          charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js">
  </script>
</head>
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
<body>
<div class="container-scroller">
  <!-- partial:../../partials/_navbar.html -->
  <%--    <jsp:include page="nav.jsp"></jsp:include>--%>
  <!-- partial -->
  <div class="container-fluid page-body-wrapper">
    <!-- partial:../../partials/_sidebar.html -->
    <nav class="sidebar sidebar-offcanvas" id="sidebar">
      <ul class="nav">
        <li class="nav-item nav-profile">
          <a href="#" class="nav-link">

            <div class="nav-profile-text d-flex flex-column">
              <% User auth = (User) session.getAttribute("auth");%>
              <% if (auth == null) { %>
              <span class="font-weight-bold mb-2">Nguyễn Thị Tiên</span>
              <% } else {%>
              <span class="font-weight-bold mb-2"><%= auth.getUser_fullname()%></span>
              <% } %>
              <span class="text-secondary text-small">Admin</span>


            </div>
            <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
          </a>
        </li>
        <%--        //user_admin = 1 là admin => quản lý tất cả trang admin, thăng chức nhân viên, trang thống kê.--%>
        <%--        //---------- = 2 là nhân viên bán hàng : chỉ thêm, xóa, sửa sản phẩm, xem doanh thu theo tháng--%>
        <%--        // --------- = 3 là nhân viên quản lý đơn hàng: xem trang đơn hàng, xác nhận, hủy đơn--%>


        <li class="nav-item">
          <a class="nav-link" href="http://localhost:8080/IndexAdmin">
            <span class="menu-title">Trang chủ</span>
            <i class="mdi mdi-home menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="http://localhost:8080/OrderList">
            <span class="menu-title">Quản lý đơn hàng</span>
            <i class="mdi mdi-crosshairs-gps menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="http://localhost:8080/ProAdmin">
            <span class="menu-title">Quản lý sản phẩm</span>
            <i class="mdi mdi-format-list-bulleted menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="http://localhost:8080/HidenProductList">
            <span class="menu-title">Sản phẩm đã ẩn</span>
            <i class="mdi mdi-format-list-bulleted menu-icon"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link collapsed" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
             aria-controls="ui-basic">
            <span class="menu-title">Quản lý người dùng</span>
            <i class="menu-arrow"></i>
            <i class="mdi mdi-crosshairs-gps menu-icon"></i>
          </a>
          <div class="collapse" id="ui-basic" style="">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"><a class="nav-link" href="http://localhost:8080/UserList">Danh
                sách người dùng</a></li>
              <li class="nav-item"><a class="nav-link"
                                      href="http://localhost:8080/UserLockList">Người dùng bị
                khóa</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="http://localhost:8080/StaffList">
            <span class="menu-title">Quản lý nhân viên</span>
            <i class="mdi mdi-chart-bar menu-icon"></i>
          </a>
        </li>
        <%--        <li class="nav-item">--%>
        <%--            <a class="nav-link" href="http://localhost:8080/CategoryAdmin">--%>
        <%--                <span class="menu-title">Quản lý quản danh mục</span>--%>
        <%--                <i class="mdi mdi-table-large menu-icon"></i>--%>
        <%--            </a>--%>
        <%--        </li>--%>

        <li class="nav-item sidebar-actions">
                        <span class="nav-link">
              </span>
        </li>


      </ul>
    </nav>
    <!-- partial -->
    <div class="main-panel">
      <div class="content-wrapper">
        <div class="page-header">
          <h3 class="page-title">
                            <span class="page-title-icon bg-gradient-primary text-white me-2">
                  <i class="mdi mdi-home"></i>
                </span> Trang thống kê
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
                <img src="admin/assets/images/dashboard/circle.svg" class="card-img-absolute"
                     alt="circle-image"/>
                <h4 class="font-weight-normal mb-3"> Doanh thu <i
                        class="mdi mdi-chart-line mdi-24px float-right"></i>
                </h4>

                <h2 class="mb-5">123 đ</h2>
              </div>
            </div>
          </div>
          <div class="col-md-4 stretch-card grid-margin">
            <div class="card bg-gradient-info card-img-holder text-white">
              <div class="card-body">
                <a href="http://localhost:8080/StatisticsByTypeServlet">
                  <img src="admin/assets/images/dashboard/circle.svg" class="card-img-absolute"
                       alt="circle-image"/>
                  <h4 class="font-weight-normal mb-3">Thông kê số lượng truy cập <i
                          class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                  </h4></a>

                <h2 class="mb-5">123</h2>

              </div>
            </div>
          </div>
          <div class="col-md-4 stretch-card grid-margin">
            <div class="card bg-gradient-success card-img-holder text-white">
              <div class="card-body">
                <img src="admin/assets/images/dashboard/circle.svg" class="card-img-absolute"
                     alt="circle-image">
                <h4 class="font-weight-normal mb-3">Số lượng sản phẩm<i
                        class="mdi mdi-diamond mdi-24px float-right"></i>
                </h4>
                <h2 class="mb-5">123</h2>
                <% ArrayList<Integer> months = (ArrayList<Integer>) request.getAttribute("stayear");
                %>
                <% ArrayList<Integer> tongdontheothang = (ArrayList<Integer>) request.getAttribute("tongyear");
                %>
                <% ArrayList<Integer> totalRevenues = (ArrayList<Integer>) request.getAttribute("totalRevenue");
                %>

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
                  <%--                  <a href="http://localhost:8080/StatisticsByTypeServlet" class="button">Click Me</a>--%>

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
                        <td><%= month %>
                        </td>
                        <td><%= total %>
                        </td>
                        <td><%= totalR %>
                        </td>
                      </tr>
                      <%
                        }
                      %>
                      <!-- Add more rows for other months and years -->
                      <tr class="total-row">
                        <td>Total</td>
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
        <div class="row">
          <div class="col-md-6 stretch-card grid-margin">
            <div class="card m-2">
              <div class="card-body">
                <h4 class="card-title">Thống kê loại tài khoản</h4>
                <canvas id="pieChart" style="height:250px"></canvas>
              </div>
            </div>
            <div class="card m-2">
              <div class="card-body">
                <h4 class="card-title">Thống kê sản phẩm bán chạy</h4>
                <canvas id="barChart" style="height:250px"></canvas>
              </div>
            </div>
          </div>
        </div>
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

<style>
  @import url('https://fonts.googleapis.com/css?family=Noto+Serif+TC');

  html, body {
    width: 100%;
    height: 100%;
    font-family: 'Noto Serif TC';
    font-size: 18px;
  }
</style>
<script src="admin/assets/vendors/chart.js/Chart.min.js"></script>
<script>
  $(function () {
    /* ChartJS
     * -------
     * Data and config for chartjs
     */
    'use strict';

    <%
        ArrayList<Integer> dataa = statisticsService.getBestSellerSL();
        int a = dataa.get(0);
        int b = dataa.get(1);
        int c = dataa.get(2);
        int d = dataa.get(3);
        ArrayList<String> dataaId = statisticsService.getBestSellerId();
        String e = dataaId.get(0);
        String f = dataaId.get(1);
        String g = dataaId.get(2);
        String h = dataaId.get(3);
//        ArrayList<String> dataaName = statisticsService.getBestSellerName();
//        String i = dataaName.get(0);
//        String j = dataaName.get(1);
//        String k = dataaName.get(2);
//        String l = dataaName.get(3);
        int fbUser = (int) request.getAttribute("userFb");
        int nmUser = (int) request.getAttribute("userNm");
        int ggUser = (int) request.getAttribute("userGg");
    %>
    var dataLog = {
      labels: ["<%=e%>", "<%=f%>", "<%=g%>", "<%=h%>"],
      datasets: [{
        label: `Sản phẩm`,
        data: [<%=a%>, <%=b%>, <%=c%>, <%=d%>],
        backgroundColor: [
          'rgba(255, 99, 132, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)'
        ],
        borderColor: [
          'rgba(255,99,132,1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)'
        ],
        borderWidth: 1,
        fill: false
      }]
    };
    var options = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      },
      legend: {
        display: false
      },
      elements: {
        point: {
          radius: 0
        }
      }

    };
    var optionsDark = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          },
          gridLines: {
            color: '#322f2f',
            zeroLineColor: '#322f2f'
          }
        }],
        xAxes: [{
          ticks: {
            beginAtZero: true
          },
          gridLines: {
            color: '#322f2f',
          }
        }],
      },
      legend: {
        display: false
      },
      elements: {
        point: {
          radius: 0
        }
      }

    };
    var doughnutPieData = {
      datasets: [{
        data: [<%=fbUser%>, <%=nmUser%>, <%=ggUser%>],
        backgroundColor: [
          'rgba(255, 99, 132, 0.5)',
          'rgba(54, 162, 235, 0.5)',
          'rgba(255, 206, 86, 0.5)',
          'rgba(75, 192, 192, 0.5)',
          'rgba(153, 102, 255, 0.5)',
          'rgba(255, 159, 64, 0.5)'
        ],
        borderColor: [
          'rgba(255,99,132,1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)'
        ],
      }],

      // These labels appear in the legend and in the tooltips when hovering different arcs
      labels: [
        'Facebook',
        'Normal',
        'Google',
      ]
    };
    var doughnutPieOptions = {
      responsive: true,
      animation: {
        animateScale: true,
        animateRotate: true
      }
    };
    var areaData = {
      labels: ["2013", "2014", "2015", "2016", "2017"],
      datasets: [{
        label: '# of Votes',
        data: [12, 19, 3, 5, 2, 3],
        backgroundColor: [
          'rgba(255, 99, 132, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)'
        ],
        borderColor: [
          'rgba(255,99,132,1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)'
        ],
        borderWidth: 1,
        fill: true, // 3: no fill
      }]
    };

    var areaDataDark = {
      labels: ["2013", "2014", "2015", "2016", "2017"],
      datasets: [{
        label: '# of Votes',
        data: [12, 19, 3, 5, 2, 3],
        backgroundColor: [
          'rgba(255, 99, 132, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)'
        ],
        borderColor: [
          'rgba(255,99,132,1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)'
        ],
        borderWidth: 1,
        fill: true, // 3: no fill
      }]
    };

    var areaOptions = {
      plugins: {
        filler: {
          propagate: true
        }
      }
    }

    var areaOptionsDark = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          },
          gridLines: {
            color: '#322f2f',
            zeroLineColor: '#322f2f'
          }
        }],
        xAxes: [{
          ticks: {
            beginAtZero: true
          },
          gridLines: {
            color: '#322f2f',
          }
        }],
      },
      plugins: {
        filler: {
          propagate: true
        }
      }
    }

    var multiAreaData = {
      labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
      datasets: [{
        label: 'Facebook',
        data: [8, 11, 13, 15, 12, 13, 16, 15, 13, 19, 11, 14],
        borderColor: ['rgba(255, 99, 132, 0.5)'],
        backgroundColor: ['rgba(255, 99, 132, 0.5)'],
        borderWidth: 1,
        fill: true
      },
        {
          label: 'Twitter',
          data: [7, 17, 12, 16, 14, 18, 16, 12, 15, 11, 13, 9],
          borderColor: ['rgba(54, 162, 235, 0.5)'],
          backgroundColor: ['rgba(54, 162, 235, 0.5)'],
          borderWidth: 1,
          fill: true
        },
        {
          label: 'Linkedin',
          data: [6, 14, 16, 20, 12, 18, 15, 12, 17, 19, 15, 11],
          borderColor: ['rgba(255, 206, 86, 0.5)'],
          backgroundColor: ['rgba(255, 206, 86, 0.5)'],
          borderWidth: 1,
          fill: true
        }
      ]
    };

    var multiAreaOptions = {
      plugins: {
        filler: {
          propagate: true
        }
      },
      elements: {
        point: {
          radius: 0
        }
      },
      scales: {
        xAxes: [{
          gridLines: {
            display: false
          }
        }],
        yAxes: [{
          gridLines: {
            display: false
          }
        }]
      }
    }

    var scatterChartData = {
      datasets: [{
        label: 'First Dataset',
        data: [{
          x: -10,
          y: 0
        },
          {
            x: 0,
            y: 3
          },
          {
            x: -25,
            y: 5
          },
          {
            x: 40,
            y: 5
          }
        ],
        backgroundColor: [
          'rgba(255, 99, 132, 0.2)'
        ],
        borderColor: [
          'rgba(255,99,132,1)'
        ],
        borderWidth: 1
      },
        {
          label: 'Second Dataset',
          data: [{
            x: 10,
            y: 5
          },
            {
              x: 20,
              y: -30
            },
            {
              x: -25,
              y: 15
            },
            {
              x: -10,
              y: 5
            }
          ],
          backgroundColor: [
            'rgba(54, 162, 235, 0.2)',
          ],
          borderColor: [
            'rgba(54, 162, 235, 1)',
          ],
          borderWidth: 1
        }
      ]
    }

    var scatterChartDataDark = {
      datasets: [{
        label: 'First Dataset',
        data: [{
          x: -10,
          y: 0
        },
          {
            x: 0,
            y: 3
          },
          {
            x: -25,
            y: 5
          },
          {
            x: 40,
            y: 5
          }
        ],
        backgroundColor: [
          'rgba(255, 99, 132, 0.2)'
        ],
        borderColor: [
          'rgba(255,99,132,1)'
        ],
        borderWidth: 1
      },
        {
          label: 'Second Dataset',
          data: [{
            x: 10,
            y: 5
          },
            {
              x: 20,
              y: -30
            },
            {
              x: -25,
              y: 15
            },
            {
              x: -10,
              y: 5
            }
          ],
          backgroundColor: [
            'rgba(54, 162, 235, 0.2)',
          ],
          borderColor: [
            'rgba(54, 162, 235, 1)',
          ],
          borderWidth: 1
        }
      ]
    }

    var scatterChartOptions = {
      scales: {
        xAxes: [{
          type: 'linear',
          position: 'bottom'
        }]
      }
    }

    var scatterChartOptionsDark = {
      scales: {
        xAxes: [{
          type: 'linear',
          position: 'bottom',
          gridLines: {
            color: '#322f2f',
            zeroLineColor: '#322f2f'
          }
        }],
        yAxes: [{
          gridLines: {
            color: '#322f2f',
            zeroLineColor: '#322f2f'
          }
        }]
      }
    }
    // Get context with jQuery - using jQuery's .get() method.
    if ($("#barChart").length) {
      var barChartCanvas = $("#barChart").get(0).getContext("2d");
      // This will get the first returned node in the jQuery collection.
      var barChart = new Chart(barChartCanvas, {
        type: 'bar',
        data: dataLog,
        options: options
      });
    }

    if ($("#barChartDark").length) {
      var barChartCanvasDark = $("#barChartDark").get(0).getContext("2d");
      // This will get the first returned node in the jQuery collection.
      var barChartDark = new Chart(barChartCanvasDark, {
        type: 'bar',
        data: dataDark,
        options: optionsDark
      });
    }

    if ($("#lineChart").length) {
      var lineChartCanvas = $("#lineChart").get(0).getContext("2d");
      var lineChart = new Chart(lineChartCanvas, {
        type: 'line',
        data: dataLog,
        options: options
      });
    }

    if ($("#lineChartDark").length) {
      var lineChartCanvasDark = $("#lineChartDark").get(0).getContext("2d");
      var lineChartDark = new Chart(lineChartCanvasDark, {
        type: 'line',
        data: dataDark,
        options: optionsDark
      });
    }

    if ($("#linechart-multi").length) {
      var multiLineCanvas = $("#linechart-multi").get(0).getContext("2d");
      var lineChart = new Chart(multiLineCanvas, {
        type: 'line',
        data: multiLineData,
        options: options
      });
    }

    if ($("#areachart-multi").length) {
      var multiAreaCanvas = $("#areachart-multi").get(0).getContext("2d");
      var multiAreaChart = new Chart(multiAreaCanvas, {
        type: 'line',
        data: multiAreaData,
        options: multiAreaOptions
      });
    }

    if ($("#doughnutChart").length) {
      var doughnutChartCanvas = $("#doughnutChart").get(0).getContext("2d");
      var doughnutChart = new Chart(doughnutChartCanvas, {
        type: 'doughnut',
        data: doughnutPieData,
        options: doughnutPieOptions
      });
    }

    if ($("#pieChart").length) {
      var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
      var pieChart = new Chart(pieChartCanvas, {
        type: 'pie',
        data: doughnutPieData,
        options: doughnutPieOptions
      });
    }

    if ($("#areaChart").length) {
      var areaChartCanvas = $("#areaChart").get(0).getContext("2d");
      var areaChart = new Chart(areaChartCanvas, {
        type: 'line',
        data: areaData,
        options: areaOptions
      });
    }

    if ($("#areaChartDark").length) {
      var areaChartCanvas = $("#areaChartDark").get(0).getContext("2d");
      var areaChart = new Chart(areaChartCanvas, {
        type: 'line',
        data: areaDataDark,
        options: areaOptionsDark
      });
    }

    if ($("#scatterChart").length) {
      var scatterChartCanvas = $("#scatterChart").get(0).getContext("2d");
      var scatterChart = new Chart(scatterChartCanvas, {
        type: 'scatter',
        data: scatterChartData,
        options: scatterChartOptions
      });
    }

    if ($("#scatterChartDark").length) {
      var scatterChartCanvas = $("#scatterChartDark").get(0).getContext("2d");
      var scatterChart = new Chart(scatterChartCanvas, {
        type: 'scatter',
        data: scatterChartDataDark,
        options: scatterChartOptionsDark
      });
    }

    if ($("#browserTrafficChart").length) {
      var doughnutChartCanvas = $("#browserTrafficChart").get(0).getContext("2d");
      var doughnutChart = new Chart(doughnutChartCanvas, {
        type: 'doughnut',
        data: browserTrafficData,
        options: doughnutPieOptions
      });
    }
  });
</script>
<script type="text/javascript"
        charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js">
</script>