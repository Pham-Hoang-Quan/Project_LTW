<%@ page import="vn.edu.hcmuaf.ttt.model.hoaDon" %>
<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: KHANH NHU
  Date: 4/29/2023
  Time: 11:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- <%--
  Created by IntelliJ IDEA.
  User: KHANH NHU
  Date: 4/25/2023
  Time: 12:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
-->
<html>
<!-- Font Awesome -->
<link
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
        rel="stylesheet"
/>
<!-- Google Fonts -->
<link
        href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
        rel="stylesheet"
/>
<!-- MDB -->
<link
        href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
        rel="stylesheet"
/>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Drill Technology</title>
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="css1/bootstrap.min.css"/>

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="css1/slick.css"/>
<link type="text/css" rel="stylesheet" href="css1/slick-theme.css"/>

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="css1/nouislider.min.css"/>

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="css1/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="css1/style.css"/>

<!-- update the version number as needed -->
<script defer src="/__/firebase/9.5.0/firebase-app-compat.js"></script>
<!-- include only the Firebase features as you need -->
<script defer src="/__/firebase/9.5.0/firebase-auth-compat.js"></script>
<script defer src="/__/firebase/9.5.0/firebase-database-compat.js"></script>
<script defer src="/__/firebase/9.5.0/firebase-firestore-compat.js"></script>
<script defer src="/__/firebase/9.5.0/firebase-functions-compat.js"></script>
<script defer src="/__/firebase/9.5.0/firebase-messaging-compat.js"></script>
<script defer src="/__/firebase/9.5.0/firebase-storage-compat.js"></script>
<script defer src="/__/firebase/9.5.0/firebase-analytics-compat.js"></script>
<script defer src="/__/firebase/9.5.0/firebase-remote-config-compat.js"></script>
<script defer src="/__/firebase/9.5.0/firebase-performance-compat.js"></script>
<!--
  initialize the SDK after all desired features are loaded, set useEmulator to false
  to avoid connecting the SDK to running emulators.
-->
<script defer src="/__/firebase/init.js?useEmulator=true"></script>


<style media="screen">
    body {
        background: #ffffff;
        color: rgba(0, 0, 0, 0.87);
        font-family: Roboto, Helvetica, Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    #message {
        background: white;
        max-width: 360px;
        margin: 100px auto 16px;
        padding: 32px 24px;
        border-radius: 3px;
    }

    #message h2 {
        color: #ffa100;
        font-weight: bold;
        font-size: 16px;
        margin: 0 0 8px;
    }

    #message h1 {
        font-size: 22px;
        font-weight: 300;
        color: rgba(0, 0, 0, 0.6);
        margin: 0 0 16px;
    }

    #message p {
        line-height: 140%;
        margin: 16px 0 24px;
        font-size: 14px;
    }

    #message a {
        display: block;
        text-align: center;
        background: #039be5;
        text-transform: uppercase;
        text-decoration: none;
        color: white;
        padding: 16px;
        border-radius: 4px;
    }

    #message,
    #message a {
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
    }

    #load {
        color: rgba(0, 0, 0, 0.4);
        text-align: center;
        font-size: 13px;
    }

    @media (max-width: 600px) {
        body,
        #message {
            margin-top: 0;
            background: white;
            box-shadow: none;
        }

        body {
            border-top: 16px solid #ffa100;
        }
    }
</style>
<head>
    <title>Title</title>
</head>
<style>
    @media (min-width: 1025px) {
        .h-custom {
            height: 130vh !important;
        }
    }

    .horizontal-timeline .items {
        border-top: 2px solid #ddd;
    }

    .horizontal-timeline .items .items-list {
        position: relative;
        margin-right: 0;
    }

    .horizontal-timeline .items .items-list:before {
        content: "";
        position: absolute;
        height: 8px;
        width: 8px;
        border-radius: 50%;
        background-color: #ddd;
        top: 0;
        margin-top: -5px;
    }

    .horizontal-timeline .items .items-list {
        padding-top: 15px;
    }
</style>

<body>
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="tel:0929831012"><i class="fa fa-phone"></i>0989839121</a></li>
                <li><a href="mailto: abc@example.com"><i class="fa fa-envelope-o"></i> DH20DT@email.com</a></li>
                <li>
                    <a target="_blank"
                       href="https://www.google.com/maps/place/C%C3%B4ng+ty+Cu%E1%BB%99c+S%E1%BB%91ng+Xanh+(GLAB)/@10.8712764,106.7891868,17z/data=!4m12!1m6!3m5!1s0x3175276398969f7b:0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRwLiBI4buTIENow60gTWluaA!8m2!3d10.8712764!4d106.7917617!3m4!1s0x3174d89ddbf832ab:0xedd62ee42a254940!8m2!3d10.8730978!4d106.787919"><i
                            class="fa fa-map-marker"></i>TP.Hồ Chí Minh</a>
                </li>
            </ul>
            <ul class="header-links pull-right">

                <% User auth = (User) session.getAttribute("auth");%>
                <% if (auth == null) { %>
                <li><a href="login.jsp" target="_blank"><i class="fa fa-user-o"></i> Bạn chưa đăng nhập</a></li>
                <% } else {%>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                        <i class="fa fa-user-o"></i>
                        <span style="cursor: pointer;">Chào bạn: <%= auth.getUser_fullname()%> <i
                                class="fa fa-caret-down" style="color:#f0e2ff;"></i></span>
                    </a>
                    <%--                        <div class="cart-dropdown">--%>
                    <h4>THÔNG TIN TÀI KHOẢN</h4>
                    <div class="cart-summary">
                        <h5><%= auth.getUser_fullname()%>
                        </h5>
                        <p><a href="userInfo.jsp" style="color: #0b0c0d">Tài khoản của tôi</a></p>
                        <p><a href="uadateInfo.jsp" style="color: #0b0c0d">Cập nhật tài khoản</a></p>
                        <p><a href="/logOut" target="_blank" style="color: #0b0c0d">Đăng xuất</a></p>

                    </div>
                    <%--                        </div>--%>

                </li>

                <% if (auth.getUser_admin() == 1) {%>
                <li><a href="/IndexAdmin" target="_blank"> <i class="fa fa-cog"></i>Quản Lý</a></li>
                <%}%>
                <% } %>
                <li>
                    <a href="form_dk.jsp" target="_blank"> <i class="fa fa-dollar"></i>Đăng Ký</a>
                </li>
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="/" class="logo">
                            <img src="./img/Logo250px.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->


                <div class="col-md-6">
                    <div class="header-search">
                        <form action="search" method="post">

                            <input name="s" class="input" placeholder="Tìm Sản Phẩm">
                            <button type="submit" class="search-btn"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->

                        <div>
                            <a href="cart.jsp">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Giỏ Hàng</span>
                                <div class="qty">${cart.quantily}</div>
                            </a>
                        </div>


                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<section class="h-100 h-custom" style="background-color: #eee;">
    <% hoaDon h = (hoaDon) request.getAttribute("TTHD");%>
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-12 col-xl-10">
                <div class="card border-top border-bottom border-3" style="border-color: #D10024 !important;">
                    <div class="card-body p-5">

                        <p class="lead fw-bold mb-5" style="color: #D10024;">Trạng Thái Giao Hàng</p>

                        <div class="row">
                            <div class="col mb-3">
                                <p class="small text-muted mb-1">Ngày đặt hàng</p>
                                <p><%=h.getNgayTaoHD()%>
                                </p>
                            </div>
                            <div class="col mb-3">
                                <p class="small text-muted mb-1">#Mã đơn hàng</p>
                                <p><%=h.getSoHD()%>
                                </p>
                            </div>
                        </div>

                        <div class="mx-n5 px-5 py-4" style="background-color: #f2f2f2;">
                            <div class="row">
                                <div class="col-md-8 col-lg-9">
                                    <p>Tên sản phẩm</p>
                                </div>
                                <div class="col-md-4 col-lg-3">
                                    <p>Số lượng</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-8 col-lg-9">
                                    <p class="mb-0"><%=h.getTenSp()%>
                                    </p>
                                </div>
                                <div class="col-md-4 col-lg-3">
                                    <p class="mb-0">x<%=h.getSoLuong()%>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="row my-4">
                            <div class="col-md-4 offset-md-8 col-lg-3 offset-lg-9">
                                <p class="lead fw-bold mb-0" style="color: #D10024;">
                                    Thành tiền: <%=h.getToongGia()%>đ
                                </p>
                            </div>
                        </div>

                        <p class="lead fw-bold mb-4 pb-2" style="color: #D10024;">Theo dõi đơn hàng</p>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="horizontal-timeline">
                                    <ul class="list-inline items d-flex justify-content-between">

                                        <% if (h.getStatus()==0) {%>

                                        <li class="list-inline-item items-list">
                                            <p class="py-1 px-2 rounded text-white" style="background-color: #D10024;">
                                                Đặt hàng thành công</p>
                                        </li>
                                        <li class="list-inline-item items-list">
                                            <p style="margin-right: -8px;">Đang giao</p>
                                        </li>
                                        <li class="list-inline-item items-list">
                                            <p style="margin-right: -8px;">Đã giao</p>
                                        </li>

                                        <%} else {%>

                                        <li class="list-inline-item items-list">
                                            <p style="margin-right: -8px;">Đặt hàng thành công</p>
                                        </li>
                                        <li class="list-inline-item items-list">
                                            <p class="py-1 px-2 rounded text-white" style="background-color: #D10024;">
                                                Đang giao
                                            </p>
                                        </li>
                                        <li class="list-inline-item items-list">
                                            <p class="py-1 px-2 rounded text-white" style="background-color: #D10024;">
                                                Đã giao
                                            </p>
                                        </li>
                                        <%}%>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <p class="mt-4 pt-2 mb-0">Hỗ trợ / <a href="#!" style="color: #D10024;">Liên hệ</a></p>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>

