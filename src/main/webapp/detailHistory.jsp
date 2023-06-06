<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.ttt.service.CommentService" %>
<%@ page import="vn.edu.hcmuaf.ttt.admin.service.HoaDon" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<jsp:useBean id="cart" class="vn.edu.hcmuaf.ttt.model.Cart" scope="session"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<meta http-equiv="Content-Type" charset="UTF-8">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Drill Technology</title>
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

  <!-- Bootstrap -->
  <link type="text/css" rel="stylesheet" href="css1/bootstrap.min.css" />
  <%--    drop--%>
  <link type="text/css" rel="stylesheet" href="css1/sty.css" />
  <script defer src="js/dro.js"></script>

  <!-- Slick -->
  <link type="text/css" rel="stylesheet" href="css1/slick.css" />
  <link type="text/css" rel="stylesheet" href="css1/slick-theme.css" />

  <!-- nouislider -->
  <link type="text/css" rel="stylesheet" href="css1/nouislider.min.css" />

  <!-- Font Awesome Icon -->
  <link rel="stylesheet" href="css1/font-awesome.min.css">

  <!-- Custom stlylesheet -->
  <link type="text/css" rel="stylesheet" href="css1/style.css" />

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
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
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    .gach-ngang {
      display: block;
      width: 100%;
      height: 2px;
      background-color: black;
      margin-bottom: 30px;
      margin-top: 30px;
    }

    .profile-container {
      display: flex;

      margin: 0 auto;
      background-color: #f5f5f5;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .menu-container {
      flex: 1;
      background-color: #ffffff;
      color: #fff;
      padding: 20px;
      text-align: right;
    }

    .menu-container ul {
      list-style-type: none;
      padding: 0;
      text-align: right; /* Đặt chữ chỗ menu nằm bên trái */
    }

    .menu-container li {
      margin-bottom: 10px;
    }

    .profile-content {
      flex: 3;
      padding: 20px;
    }

    .profile-image {
      width: 200px;
      height: 200px;
      border-radius: 50%;
      margin-bottom: 20px;
    }
    .menu-container h2 .menu-image {
      width: 30px;
      height: 10px;
      border-radius: 50%;
      margin-bottom: 10px;
    }

    .profile-info {
      margin-bottom: 20px;
    }

    .profile-info h2 {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .profile-info p {
      margin: 0;
    }
    .button-dep {
      display: inline-block;
      padding: 10px 20px;
      font-size: 16px;
      border: none;
      background-color: #D10024;
      color: white;
      text-align: center;
      text-decoration: none;
      border-radius: 4px;
      cursor: pointer;
      transition: background-color 0.3s ease;


    }

    .button-dep:hover {
      background-color: #9f001a;
    }
  </style>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style>.status-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    height: 10px;
    background-color: #f0f0f0;
  }
  .status-bar2 {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    height: 10px;
    background-color: #f5f5f5;
    margin-top: 20px;
  }
  .status-item {
    flex: 1;
    text-align: right;
    font-size: 30px;
    line-height: 10px;
    color: #777777;
    font-weight: bold;
  }
  .status-item2 {
    flex: 1;
    text-align: right;
    font-size: 15px;
    line-height: 10px;
    color: #777777;
    font-weight: bold;
  }

  .status-item i {

    margin-right: 5px;

  }


  .active {
    color: #600112;
    background-color: #D10024;
    height: 10px;
    display: flex;
    justify-content:  right;
    align-items: center;



  }

  </style>
  <style>
    .product-list {
      display: flex;
      flex-direction: column;


    }

    .product-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 10px;
      background-color: #f2f2f2;
      padding: 10px;
    }

    .product-name {
      flex-grow: 1;
      margin-right: 10px;
    }

    .product-price {
      font-weight: bold;
    }

  </style>
  <style>
    .price-list {
      width: 100%;
    }

    .price-item {
      display: flex;
      justify-content: space-between;
      align-items: center;

    }

    .price-name {
      flex-basis: 70%;
      text-align: right;
      padding: 10px;
      border: 1px solid #e5e3e3;
    }

    .price-price {
      flex-basis: 30%;
      text-align: right;
      padding: 10px;
      border: 1px solid #e5e3e3;
    }

  </style>
  <style>
    .roww {
      display: flex;
      margin-top: 10px;
    }

    .columnn {
      flex: 1;


    }

    .columnn2 {
      text-align: right;
    }

  </style>
</head>

<body>
<!-- HEADER -->
<header>
  <!-- TOP HEADER -->
  <div id="top-header">
    <div class="container">
      <ul class="header-links pull-left">
        <li><a href="tel:0929831012"><i class="fa fa-phone"></i>0989839121</a></li>
        <li><a href="mailto: abc@example.com"><i class="fa fa-envelope-o"></i> DH20DT@email.com</a></li>
        <li>
          <a target="_blank" href="https://www.google.com/maps/place/C%C3%B4ng+ty+Cu%E1%BB%99c+S%E1%BB%91ng+Xanh+(GLAB)/@10.8712764,106.7891868,17z/data=!4m12!1m6!3m5!1s0x3175276398969f7b:0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRwLiBI4buTIENow60gTWluaA!8m2!3d10.8712764!4d106.7917617!3m4!1s0x3174d89ddbf832ab:0xedd62ee42a254940!8m2!3d10.8730978!4d106.787919"><i class="fa fa-map-marker"></i>TP.Hồ Chí Minh</a>
        </li>
      </ul>
      <ul class="header-links pull-right">

        <% User auth= (User) session.getAttribute("auth");%>
        <% if(auth==null){ %>
        <li><a href="login.jsp" target="_blank"><i class="fa fa-user-o"></i> Bạn chưa đăng nhập</a></li>
        <% }else {%>
        <div class="dropdown">
          <div style="cursor: pointer"><li><a href="/lichsu"><i class="fa fa-user-o"></i>Chào bạn: <%= auth.getUser_fullname()%><i class="fa fa-caret-down" style="color:#f0e2ff;"></i></a></li></div>
          <div class="dropdown-content">
            <a href="userInfo.jsp">Thông tin tài khoản</a>
            <a href="uadateInfo.jsp">Cập nhật tài khoản</a>
            <a href="/lichsu">Đơn mua</a>
            <a href="/logOut" >Đăng xuất</a>
          </div>
        </div>

        <% if(auth.getUser_admin() == 1){%>
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

            <!-- /Wishlist -->

            <!-- Cart -->
            <div class="dropdown">
              <a href="cart.jsp" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">

                <i class="fa fa-shopping-cart"></i>
                <span> Giỏ Hàng</span>
                <div class="qty">${cart.quantily}</div>
              </a>

            </div>
            <!-- /Cart -->

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
<!-- /HEADER -->


<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
  <!-- container -->
  <div class="container">
    <!-- row -->

    <div class="row">

      <div class="col-md-12">
        <ul class="breadcrumb-tree">
          <li><a href="/">Trang chủ</a></li>
          <li><a href="/List-Product">Tài khoản</a></li>


        </ul>
      </div>

    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<div class="profile-container">
  <div class="menu-container" style="color: #0b0c0d">
    <h4><img src="img/avtprofile/avatar-mac-dinh.png" alt="Menu Image" class="profile-image" style="width: 50px; height: 50px;"><%=auth.getUser_fullname()%></h4>
    <ul>
      <li><a href="userInfo.jsp">Tài khoản của tôi</a></li>
      <li><a href="uadateInfo.jsp">Cập nhật tài khoản</a></li>
      <li><a href="#">Đơn mua</a></li>
      <li><a href="/logOut">Đăng xuất</a></li>
    </ul>
  </div>
<% hoaDon tthoaDon = (hoaDon) request.getAttribute("tthoaDon");%>
    <% oderdetail oder_detail = (oderdetail) request.getAttribute("oder_detail");%>






<%--0. chờ xác nhận
    1. đang giao
    2. hoàn thanh
    3. hủy đơn--%>

<%if(tthoaDon.getStatus() == 0){%>
  <div class="profile-content">
    <div class="status-bar">
      <div class="status-item active">
        <i class="fas fa-clipboard"></i>
      </div>
<%--      <div class="status-item">--%>
<%--        <i class="fas fa-clipboard-check"></i>--%>
<%--      </div>--%>
      <div class="status-item">
        <i class="fas fa-truck"></i>
      </div>
      <div class="status-item">
        <i class="fas fa-tags"></i>
      </div>
      <div class="status-item">
        <i class="fas fa-check"></i>
      </div>
    </div>
<%--1. đang giao--%>
    <%} if (tthoaDon.getStatus() == 1){%>
    <div class="profile-content">
      <div class="status-bar">
        <div class="status-item active">
          <i class="fas fa-clipboard"></i>
        </div>
<%--        <div class="status-item active">--%>
<%--          <i class="fas fa-clipboard-check"></i>--%>
<%--        </div>--%>
        <div class="status-item active">
          <i class="fas fa-truck"></i>
        </div>
        <div class="status-item active">
          <i class="fas fa-tags"></i>
        </div>
        <div class="status-item">
          <i class="fas fa-check"></i>
        </div>
      </div>
<%--2. hoanf thanh--%>
      <%} if (tthoaDon.getStatus() == 2){%>
      <div class="profile-content">
        <div class="status-bar">
          <div class="status-item active">
            <i class="fas fa-clipboard"></i>
          </div>
<%--          <div class="status-item active">--%>
<%--            <i class="fas fa-clipboard-check"></i>--%>
<%--          </div>--%>
          <div class="status-item active">
            <i class="fas fa-truck"></i>
          </div>
          <div class="status-item active">
            <i class="fas fa-tags"></i>
          </div>
          <div class="status-item active">
            <i class="fas fa-check"></i>
          </div>
        </div>
<%--        3. hủy đơn--%>
          <%} if (tthoaDon.getStatus() == 3){%>
          <div class="profile-content">
            <div class="status-bar">
              <div class="status-item active">
                <i class="fas fa-clipboard"></i>
              </div>
<%--              <div class="status-item ">--%>
<%--                <i class="fas fa-clipboard-check"></i>--%>
<%--              </div>--%>
              <div class="status-item active">
                <i class="fas fa-times"></i>
              </div>
              <div class="status-item ">
                <i class="fas fa-tags"></i>
              </div>
              <div class="status-item ">
                <i class="fas fa-check"></i>
              </div>
            </div>

            <%}%>

<%if(tthoaDon.getStatus() == 3){%>
            <div class="status-bar2">
              <div class="status-item2 ">
                Chờ xác nhận
              </div>
              <%--      <div class="status-item2 ">--%>
              <%--        Đã xác nhận--%>
              <%--      </div>--%>
              <div class="status-item2 ">
              Đơn bị hủy
              </div>
              <div class="status-item2 ">
                Đang giao
              </div>

              <div class="status-item2 ">
                Đã nhận hàng
              </div>

            </div>
            <%} else {%>
            <div class="status-bar2">
              <div class="status-item2 ">
                Chờ xác nhận
              </div>
              <%--      <div class="status-item2 ">--%>
              <%--        Đã xác nhận--%>
              <%--      </div>--%>
              <div class="status-item2 ">
                Đã giao bên vận chuyển
              </div>
              <div class="status-item2 ">
                Đang giao
              </div>

              <div class="status-item2 ">
                Đã nhận hàng
              </div>

            </div>
            <%}%>


<%--            --%>
<%--            <div class="status-bar2">--%>
<%--              <div class="roww">--%>
<%--                <div class="columnn">--%>
<%--                  <p>Trở lại</p>--%>
<%--                </div>--%>
<%--                <div class="columnn columnn2">--%>
<%--                  <p>Mã đơn hàng</p>--%>
<%--                </div>--%>
<%--              </div>--%>

<%--            </div>--%>




            <%if(tthoaDon.getStatus() == 2){%>

            <button style="margin-top: 25px;" type="submit" class="button-dep">Đánh giá</button>

            <%}if(tthoaDon.getStatus() == 0){%>
              <form action="/updateStatuss" method="post">
                <input type="text" name="soHD" style="display: none" value="<%=tthoaDon.getSoHD()%>">
            <button style="margin-top: 25px;" type="submit" class="button-dep">Hủy Đơn</button>
              </form>
            <%}if(tthoaDon.getStatus() == 1){%>
            <form action="updateSuccess" method="post">
              <input type="text" name="soHD" style="display: none" value="<%=tthoaDon.getSoHD()%>">
            <button style="margin-top: 25px;" type="submit" class="button-dep">Đã nhận được hàng</button>
            </form>
            <%}if(tthoaDon.getStatus() == 3){%>
            <button style="margin-top: 25px;  background-color: #f5f5f5;  border: 2px solid #D10024; color: #D10024;" type="submit" class="button-dep">Đơn bị hủy</button>
            <%}%>
<form action="Savepdf" method="post">
  <input type="text" style="display: none" name="soHD" value="<%=tthoaDon.getSoHD()%>">
            <button style="margin-top: 25px;background-color: #f5f5f5;  border: 2px solid #D10024; color: #D10024;" type="submit" class="button-dep">Xuất Hóa Đơn (PDF)</button>
</form>

                          <div class="roww">
                            <div class="columnn">
                           <a href="lichsu?user_id=<%=auth.getUser_id()%>"><p style="color: #7a7a7a"><i class="fas fa-chevron-left"></i> TRỞ LẠI</p></a>
                            </div>
                            <div class="columnn columnn2">
                              <p>Mã đơn hàng: <%=tthoaDon.getSoHD()%> | ngày mua : <%=tthoaDon.getNgayTaoHD()%></p>
                            </div>
                          </div>


    <div class="gach-ngang"></div>

    <div class="profile-info">

      <h5>Địa chỉ nhận hàng</h5>
      <p><%=tthoaDon.getHoVaTen()%></p>
      <p><%=tthoaDon.getHD_sdt()%></p>
      <p><%=tthoaDon.getCity()%>, <%=tthoaDon.getDistrict()%>, <%=tthoaDon.getWard()%></p>
      <p>Ghi chú: <%=tthoaDon.getNote()%></p>
    </div>
    <div class="gach-ngang"></div>
            <% List<hoaDon> productOder = (List<hoaDon>) request.getAttribute("productOder");
              int total = 0 ;%>
             <% for (hoaDon po:productOder) {%>
    <div class="product-list">
      <div class="product-item">
        <div class="product-name"><%=po.getTenSp()%> x <%=po.getSoLuong()%></div>
        <%
          String s = po.getToongGia();
          int i = Integer.parseInt(s);
          int SL = Integer.parseInt(po.getSoLuong());
          int giaSL = i / SL;
          total+=i;
          Locale locale = new Locale("vi");
          NumberFormat format = NumberFormat.getCurrencyInstance(locale);
          String tt = format.format(giaSL).split(",")[0];


        %>

        <div class="product-price"><%=tt%> đ</div>

      </div>

    </div>
            <%}%>
            <%Locale localee = new Locale("vi");
              NumberFormat formatt = NumberFormat.getCurrencyInstance(localee);
              String tn = formatt.format(total).split(",")[0];

              String TransportFee = formatt.format(oder_detail.getTransportFee()).split(",")[0];
              String discountFee = formatt.format(oder_detail.getDiscountFee()).split(",")[0];

            %>
    <div class="price-list">
      <div class="price-item">
        <div class="price-name">Tổng tiền hàng</div>
        <div class="price-price"><%=tn%> đ</div>
      </div>
      <div class="price-item">
        <div class="price-name">Phí vận chuyển</div>
        <div class="price-price"><%= TransportFee%> đ</div>
      </div>
      <div class="price-item">
        <div class="price-name"> Phí giảm giá</div>
        <div class="price-price"><%=discountFee%></div>
      </div>
      <div class="price-item">
        <div class="price-name">Thành tiền</div>
        <%if(oder_detail.getDiscountFee() == 0){
          int totalprice = oder_detail.getTotalPrice() + oder_detail.getTransportFee();
          String  totalPrice = formatt.format(totalprice).split(",")[0];
        %>
        <div class="price-price"><%=totalPrice%> đ</div>
        <%} else {%>
        <div class="price-price"><%=oder_detail.getTotalPrice()%> đ</div>
        <%}%>
      </div>
    </div>



  </div>
</div>





<!-- NEWSLETTER -->
<div id="newsletter" class="section">
  <!-- container -->
  <div class="container">
    <!-- row -->
    <div class="row">
      <div class="col-md-12">
        <div class="newsletter">
          <p>Đăng Ký <strong>Bản Tin</strong></p>
          <form>
            <input class="input" type="email" placeholder="Nhập Email của bạn">
            <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
          </form>
          <ul class="newsletter-follow">
            <li>
              <a href="#"><i class="fa fa-facebook"></i></a>
            </li>
            <li>
              <a href="#"><i class="fa fa-twitter"></i></a>
            </li>
            <li>
              <a href="#"><i class="fa fa-instagram"></i></a>
            </li>
            <li>
              <a href="#"><i class="fa fa-pinterest"></i></a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /NEWSLETTER -->

<!-- FOOTER -->
<footer id="footer">
  <!-- top footer -->
  <div class="section">
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-md-3 col-xs-6">
          <div class="footer">
            <h3 class="footer-title">About </h3>
            <p>Địa Chỉ Thông Tin Liên Lạc</p>
            <ul class="footer-links">
              <li>
                <a target="_blank" href="https://www.google.com/maps/place/C%C3%B4ng+ty+Cu%E1%BB%99c+S%E1%BB%91ng+Xanh+(GLAB)/@10.8712764,106.7891868,17z/data=!4m12!1m6!3m5!1s0x3175276398969f7b:0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRwLiBI4buTIENow60gTWluaA!8m2!3d10.8712764!4d106.7917617!3m4!1s0x3174d89ddbf832ab:0xedd62ee42a254940!8m2!3d10.8730978!4d106.787919"><i class="fa fa-map-marker"></i>TP.Hồ Chí Minh</a>
              </li>
              <li><a href="tel:0929831012"><i class="fa fa-phone"></i>0929831012</a></li>
              <li><a href="mailto: abc@example.com"><i class="fa fa-envelope-o"></i>DH20DT@email.com</a></li>
            </ul>
          </div>
        </div>

        <div class="col-md-3 col-xs-6">
          <div class="footer">
            <h3 class="footer-title">Sản Phảm</h3>
            <ul class="footer-links">
              <li><a href="khoan-mini.html">Khoan mini</a></li>
              <li><a href="khoan-dong-luc.html">Khoan động lực</a></li>
              <li><a href="khoan-be-tong.html">Khoan bê tông</a></li>
              <li><a href="khoan-ban.html">Khoan bàn</a></li>
              <li><a href="phukien.html">Phụ kiện</a></li>
            </ul>
          </div>
        </div>

        <div class="clearfix visible-xs"></div>

        <div class="col-md-3 col-xs-6">
          <div class="footer">
            <h3 class="footer-title">Thông Tin</h3>
            <ul class="footer-links">
              <li><a href="about.jsp">Giới thiệu</a></li>
              <li><a href="lien_he.jsp">Liên hệ chúng tôi</a></li>
              <li><a href="Cs_bao_mat.jsp">Chính sách bảo mật</a></li>
              <li><a href="Cs_trahang.jsp">Đơn hàng và Trả hàng</a></li>
              <li><a href="dk_dk.jsp">Điều khoản và điều kiện</a></li>
            </ul>
          </div>
        </div>

        <div class="col-md-3 col-xs-6">
          <div class="footer">
            <h3 class="footer-title">Dịch Vụ</h3>
            <ul class="footer-links">
              <li><a href="login.jsp">Tài Khoản Của Tôi</a></li>
              <li><a href="cart.jsp">Xem Giỏ Hàng</a></li>
              <li><a href="heart.html">Danh Sách Yêu Thích</a></li>
              <li><a href="support.html">Hổ Trợ</a></li>
            </ul>
          </div>
        </div>
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /top footer -->

  <!-- bottom footer -->
  <div id="bottom-footer" class="section">
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-md-12 text-center">
          <ul class="footer-payments">
            <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
            <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
            <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
            <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
            <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
            <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
          </ul>

        </div>
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /bottom footer -->
</footer>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>

</body>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const loadEl = document.querySelector('#load');
    // // 🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
    // // The Firebase SDK is initialized and available here!
    //
    // firebase.auth().onAuthStateChanged(user => { });
    // firebase.database().ref('/path/to/ref').on('value', snapshot => { });
    // firebase.firestore().doc('/foo/bar').get().then(() => { });
    // firebase.functions().httpsCallable('yourFunction')().then(() => { });
    // firebase.messaging().requestPermission().then(() => { });
    // firebase.storage().ref('/path/to/ref').getDownloadURL().then(() => { });
    // firebase.analytics(); // call to activate
    // firebase.analytics().logEvent('tutorial_completed');
    // firebase.performance(); // call to activate
    //
    // // 🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥

    try {
      let app = firebase.app();
      let features = [
        'auth',
        'database',
        'firestore',
        'functions',
        'messaging',
        'storage',
        'analytics',
        'remoteConfig',
        'performance',
      ].filter(feature => typeof app[feature] === 'function');
      loadEl.textContent = `Firebase SDK loaded with ${features.join(', ')}`;
    } catch (e) {
      console.error(e);
      loadEl.textContent = 'Error loading the Firebase SDK, check the console.';
    }
  });
</script>
</body>

</html>