<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Product" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Category" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<jsp:useBean id="cart" class="vn.edu.hcmuaf.ttt.model.Cart" scope="session"/>
<%@ page import="vn.edu.hcmuaf.ttt.model.hoaDon" %>
<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Drill Technology</title>
  <link rel="shortcut icon" href="admin/assets/images/favicon.ico" />


  <!-- Google font -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
  <%--    drop--%>
  <link type="text/css" rel="stylesheet" href="css1/sty.css" />
  <script defer src="js/dro.js"></script>

  <!-- Bootstrap -->
  <link type="text/css" rel="stylesheet" href="css1/bootstrap.min.css" />

  <!-- Slick -->
  <link type="text/css" rel="stylesheet" href="css1/slick.css" />
  <link type="text/css" rel="stylesheet" href="css1/slick-theme.css" />

  <!-- nouislider -->
  <link type="text/css" rel="stylesheet" href="css1/nouislider.min.css" />

  <!-- Font Awesome Icon -->
  <link rel="stylesheet" href="css1/font-awesome.min.css">

  <!-- Custom stlylesheet -->
  <link type="text/css" rel="stylesheet" href="css1/style.css" />
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
</head>

<body>
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

          </div>
          <!-- /Wishlist -->

          <!-- Cart -->

          <!-- /Cart -->

          <!-- Menu Toogle -->

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

<!-- NAVIGATION -->
<nav id="navigation">
  <!-- container -->
  <div class="container">
    <!-- responsive-nav -->
    <div id="responsive-nav">
      <!-- NAV -->

      <!-- /NAV -->
    </div>
    <!-- /responsive-nav -->
  </div>
  <!-- /container -->
</nav>
<!-- /NAVIGATION -->

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
  <!-- container -->
  <div class="container">
    <!-- row -->
    <div class="row">
      <div class="col-md-12">

        <ul class="breadcrumb-tree">
          <li><a href="/">Trang Chủ</a></li>
          <li class="#">Chi tiết đơn hàng</li>
        </ul>
      </div>
    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="section">
  <!-- container -->
  <div class="container">
    <!-- row -->
    <% hoaDon h = (hoaDon) request.getAttribute("TTHD");%>
    <div class="row">
      <form action="/doHoaDon" method="post">
        <div class="col-md-7">
          <!-- Billing Details -->
          <div class="billing-details">
            <p>Đơn hàng ngày: <%=h.getNgayTaoHD()%></p>
            <div class="section-title">
              <h3 class="title">Thông tin giao hàng</h3>
            </div>
            <div class="form-group">
              <div><strong>Họ và tên: </strong><%= h.getHoVaTen()%></div>
            </div>

            <div class="form-group">
              <div><strong>Email giao hàng: </strong><%= h.getHD_email()%></div>
            </div>
            <div class="form-group">
              <div><strong>Số điện thoại gia hàng: </strong><%= h.getHD_sdt()%></div>
            </div>



            <div class="form-group">
              <div class="input-checkbox">
                <input type="checkbox" id="create-account">

                <div class="caption">
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.
                  </p>
                  <input class="input" type="password" name="password" placeholder="Enter Your Password">
                </div>
              </div>
            </div>
          </div>
          <!-- /Billing Details -->

          <!-- Shiping Details -->
          <div class="shiping-details">
            <div class="section-title">
              <h3 class="title">ĐỊA CHỈ GIAO HÀNG</h3>
            </div>

            <div class="form-group">
              <div><strong>Thành Phố/Tỉnh: </strong><%= h.getCity()%></div>
            </div>
            <div class="form-group">
              <div><strong>Quận/Huyuện: </strong><%= h.getDistrict()%></div>

            </div>
            <div class="form-group">
              <div><strong>Phường/xã: </strong><%= h.getWard()%></div>

            </div>

          </div>
          <!-- /Shiping Details -->

          <!-- Order notes -->
          <div class="order-notes">
            <div><strong>Ghi chú khác: </strong><%= h.getNote()%></div>
          </div>
          <!-- /Order notes -->
        </div>

        <!-- Order Details -->

        <div class="col-md-5 order-details">

          <div class="section-title text-center">
            <h3 class="title">Hóa Đơn</h3>
          </div>
          <div class="order-summary">

            <div class="order-col">
              <div><strong>SẢN PHẨM</strong></div>
              <div><strong>Số lượng</strong></div>
              <div><strong>Giá</strong></div>
            </div>





            <div class="order-products">
              <% List<hoaDon> listhh = (List<hoaDon>) request.getAttribute("LSsoHD");
                int total = 0 ;
              %>


              <%  for (hoaDon hh:listhh) {
               String s = hh.getToongGia();
               int i = Integer.parseInt(s);

               total+=i;
              %>
              <%Locale locale = new Locale("vi");
                NumberFormat format = NumberFormat.getCurrencyInstance(locale);
                String gia = format.format(i).split(",")[0];
              %>
              <div class="order-col" >
                <div><%=hh.getTenSp()%></div>
                <div>x<%=hh.getSoLuong()%></div>
                <div><%=gia%> đ</div>

              </div>
              <%}%>
            </div>
            <div class="order-col">
              <div>Phí giao hàng</div>
              <div><strong>MIỄN PHÍ</strong></div>
            </div>
            <div class="order-col">
              <%Locale locale = new Locale("vi");
                NumberFormat format = NumberFormat.getCurrencyInstance(locale);
                String tn = format.format(total).split(",")[0];
              %>
              <div><strong>TỔNG GÍA TRỊ ĐƠN HÀNG</strong></div>
              <div><strong><%=tn%> đ </strong></div>



            </div>
          </div>
        </div>
        <!-- /Order Details -->
      </form>
    </div>


    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /SECTION -->

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
            <input class="input" type="email" placeholder="Nhập Email Của Bạn">
            <button class="newsletter-btn"><i class="fa fa-envelope"></i>Đăng Ký</button>
          </form>
          <ul class="newsletter-follow">
            <li>
              <a href="#"><i class="fa fa-facebook" style="margin: 10px"></i></a>
            </li>
            <li>
              <a href="#"><i class="fa fa-twitter" style="margin: 10px"></i></a>
            </li>
            <li>
              <a href="#"><i class="fa fa-instagram" style="margin: 10px"></i></a>
            </li>
            <li>
              <a href="#"><i class="fa fa-pinterest" style="margin: 10px"></i></a>
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
