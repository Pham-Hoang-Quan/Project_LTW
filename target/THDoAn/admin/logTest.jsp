<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Log" %>
<%@ page import="java.time.LocalDate" %>

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

<%--    Datatable--%>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js">
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
    <!-- DataTables -->
    <link rel="stylesheet"
          type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <script type="text/javascript"
            charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js">
    </script>
</head>

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
                            <% User auth= (User) session.getAttribute("auth");%>
                            <% if(auth==null){ %>
                            <span class="font-weight-bold mb-2">Nguyễn Thị Tiên</span>
                            <% }else {%>
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
                    <a class="nav-link" href="/IndexAdmin">
                        <span class="menu-title">Trang chủ</span>
                        <i class="mdi mdi-home menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/OrderList">
                        <span class="menu-title">Quản lý đơn hàng</span>
                        <i class="mdi mdi-crosshairs-gps menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ProAdmin">
                        <span class="menu-title">Quản lý sản phẩm</span>
                        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/HidenProductList">
                        <span class="menu-title">Sản phẩm đã ẩn</span>
                        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                        <span class="menu-title">Quản lý người dùng</span>
                        <i class="menu-arrow"></i>
                        <i class="mdi mdi-crosshairs-gps menu-icon"></i>
                    </a>
                    <div class="collapse" id="ui-basic" style="">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="/UserList">Danh sách người dùng</a></li>
                            <li class="nav-item"> <a class="nav-link" href="/UserLockList">Người dùng bị khóa</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/StaffList">
                        <span class="menu-title">Quản lý nhân viên</span>
                        <i class="mdi mdi-chart-bar menu-icon"></i>
                    </a>
                </li>
                <%--        <li class="nav-item">--%>
                <%--            <a class="nav-link" href="/CategoryAdmin">--%>
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
                            <i class="mdi mdi-account"></i>
                            </span> Theo dõi trang bán hàng
                    </h3>

                </div>
                <div class="row">
                    <div class="col-lg-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Lượt truy cập trong 4 tháng gần đây</h4>
                                <canvas id="lineChart" style="height:250px"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Lượt truy cập trong 4 tháng gần đây</h4>
                                <canvas id="barChart" style="height:230px"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <main>
                    <div style="width:100%; max-width: 100%" class="col-lg-6 grid-margin stretch-card">
                        <div class="card">
                            <div style="padding: 0 ;" class="card-body">
                                <table id="log_table" class="table table-hover table-striped table-bordered" style="width: 100%; ">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Mức độ nghiệm trọng</th>
                                        <th>Người thực hiện</th>
                                        <th>Ngày thực hiện</th>
                                        <th>Thao tác</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <% List<Log> list = (List<Log>) request.getAttribute("logList");
                                        for (Log u: list) { %>
                                    <tr>
                                        <td><%= u.getId()%></td>

<%--                                        <td><%=u.getLevel()%></td>--%>
                                        <td>
                                            <% if(u.getLevel() == 0) { %>
                                            <label class="badge badge-success">NORMAL</label>
                                            <%}%>
                                            <% if(u.getLevel() == 1) { %>
                                            <label class="badge badge-info ">ALERT</label>
                                            <%}%>
                                            <% if(u.getLevel() == 2) { %>
                                            <label class="badge badge-warning">WARNING</label>
                                            <%}%>
                                            <% if(u.getLevel() == 3) { %>
                                            <label class="badge badge-danger">CRITICAL</label>
                                            <%}%>
                                        </td>
                                        <td class="text-success"> <%=u.getUser()%> </td>
                                        <td class="text-success"> <%=u.getCreate()%> </td>
                                        <td>
                                            <a href="<%= "/LogDetail?logid=" + u.getId() %>">
                                                <label class="badge badge-info">Xem chi tiết</label>
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

<style>
    @import url('https://fonts.googleapis.com/css?family=Noto+Serif+TC');
    html, body {
        width: 100%;
        height: 100%;
        font-family: 'Noto Serif TC';
        font-size: 18px;
    }
</style>

<!-- endinject -->
<!-- Plugin js for this page -->
<script src="admin/assets/vendors/chart.js/Chart.min.js"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<%--<script src="admin/assets/js/off-canvas.js"></script>--%>
<%--<script src="admin/assets/js/hoverable-collapse.js"></script>--%>
<%--<script src="admin/assets/js/misc.js"></script>--%>
<!-- endinject -->
<!-- Custom js for this page -->
<script src="admin/assets/js/chart.js"></script>
<!-- End custom js for this page -->
<script>
    <%
        LocalDate today = LocalDate.now();
        int month = today.getMonthValue();
    %>
    $(function () {
        /* ChartJS
         * -------
         * Data and config for chartjs
         */
        'use strict';

        var dataLog = {
            <%--labels: ["<%=month - 6%>", "<%=month - 5%>", "<%=month - 3%>", "<%=month - 2%>", "<%=month - 1%>", "<%=month%>"],--%>
            labels: ["<%=month - 3%>", "<%=month - 2%>", "<%=month - 1%>", "<%=month%>"],
            datasets: [{
                label: '# of Votes',
                <%
                int countLog1 = (int) request.getAttribute("countLog1");
                int countLog2 = (int) request.getAttribute("countLog2");
                int countLog3 = (int) request.getAttribute("countLog3");
                int countLog4 = (int) request.getAttribute("countLog4");
                %>
                <%--data: ["<%= countLog1%>", 50, 3, 5],--%>
                data: [<%=countLog1%>, <%=countLog2%>, <%=countLog3%>, <%=countLog4%>],
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
                fill: false
            }]
        };
        var dataDark = {
            labels: ["2013", "2014", "2014", "2015", "2016", "2017"],
            datasets: [{
                label: '# of Votes',
                data: [10, 19, 3, 5, 2, 3],
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
                fill: false
            }]
        };
        var multiLineData = {
            labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
            datasets: [{
                label: 'Dataset 1',
                data: [12, 19, 3, 5, 2, 3],
                borderColor: [
                    '#587ce4'
                ],
                borderWidth: 2,
                fill: false
            },
                {
                    label: 'Dataset 2',
                    data: [5, 23, 7, 12, 42, 23],
                    borderColor: [
                        '#ede190'
                    ],
                    borderWidth: 2,
                    fill: false
                },
                {
                    label: 'Dataset 3',
                    data: [15, 10, 21, 32, 12, 33],
                    borderColor: [
                        '#f44252'
                    ],
                    borderWidth: 2,
                    fill: false
                }
            ]
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
                data: [30, 40, 30],
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
                'Pink',
                'Blue',
                'Yellow',
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
<script>
    var table;
    var urlUsers = "https://jsonplaceholder.typicode.com/users";
    function initTableData() {

        //Data from an URL ?
        $.get(urlUsers, function(responseData) {
            //Mofify "responseData" before showing ?

            table = $('#log_table').DataTable({
                "processing": true,


            });
        }).fail(function() {
            alert( "Cannot get data from URL" );
        });
    }

    $(document).ready(function (){
        initTableData();
        $("#list-header").on({
            mouseenter: function() {
                $(this).css("background-color", "lightgray");
            },
            mouseleave: function(){
                $(this).css("background-color", "lightblue");
            },
        });
        $("#btnReloadData").on("click", function() {
            //alert("reload data...")
            table.ajax.reload();
        });
    });
console.log("datatable");
</script>
<script type="text/javascript"
        charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js">
</script>