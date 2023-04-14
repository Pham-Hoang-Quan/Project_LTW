<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="java.util.Random" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<meta http-equiv="Content-Type" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome to Firebase Hosting</title>
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="css/slick.css" />
<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />
<link type="text/css" rel="stylesheet" href="css/base.css" />
<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="css/style.css" />
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


</head>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Welcome to Firebase Hosting</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

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

    body {
      color: rgba(255, 255, 255, 0.932);
      background: #f5f3f3;
      font-family: 'Roboto', sans-serif;
    }

    .form-control {
      height: 40px;
      box-shadow: none;
      color: #969fa4;
    }

    .form-control:focus {
      border-color: #5cb85c;
    }

    .form-control,
    .btn {
      border-radius: 3px;
    }

    .signup-form {
      width: 450px;
      margin: 0 auto;
      padding: 30px 0;
      font-size: 15px;
    }

    .signup-form h2 {
      color: #636363;
      margin: 0 0 15px;
      position: relative;
      text-align: center;
    }

    .signup-form h2:before,
    .signup-form h2:after {
      content: "";
      height: 2px;
      width: 30%;
      background: #d4d4d4;
      position: absolute;
      top: 50%;
      z-index: 2;
    }

    .signup-form h2:before {
      left: 0;
    }

    .signup-form h2:after {
      right: 0;
    }

    .signup-form .hint-text {
      color: #999;
      margin-bottom: 30px;
      text-align: center;
    }

    .signup-form form {
      color: #999;
      border-radius: 3px;
      margin-bottom: 15px;
      background: #f2f3f7;
      box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
      padding: 30px;
    }

    .signup-form .form-group {
      margin-bottom: 20px;
    }

    .signup-form input[type="checkbox"] {
      margin-top: 3px;
    }

    .signup-form .btn {
      font-size: 16px;
      font-weight: bold;
      min-width: 140px;
      outline: none !important;
    }

    .signup-form .row div:first-child {
      padding-right: 10px;
    }

    .signup-form .row div:last-child {
      padding-left: 10px;
    }

    .signup-form a {
      color: #fff;
      text-decoration: underline;
    }

    .signup-form a:hover {
      text-decoration: none;
    }

    .signup-form form a {
      color: #5cb85c;
      text-decoration: none;
    }

    .signup-form form a:hover {
      text-decoration: underline;
    }
  </style>
</head>

<body>
<header>
  <!-- TOP HEADER -->
  <div id="top-header">
    <div class="container">
      <ul class="header-links pull-left">
        <li><a href="#"><i class="fa fa-phone"></i>0989839121</a></li>
        <li><a href="#"><i class="fa fa-envelope-o"></i> DH20DT@email.com</a></li>
        <li><a href="#"><i class="fa fa-map-marker"></i>TP.Hồ Chí Minh</a></li>
      </ul>
      <ul class="header-links pull-right">

        <% User auth= (User) session.getAttribute("auth");%>
        <% if(auth==null){ %>
        <li><a href="login.jsp" target="_blank"><i class="fa fa-user-o"></i> Bạn chưa đăng nhập</a></li>
        <% }else {%>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
            <i class="fa fa-user-o"></i>
            <span style="cursor: pointer;">Chào bạn: <%= auth.getUser_fullname()%> <i class="fa fa-caret-down" style="color:#f0e2ff;"></i></span>
          </a>
          <div class="cart-dropdown">
            <h4>THÔNG TIN TÀI KHOẢN</h4>
            <div class="cart-summary">
              <h5> <%= auth.getUser_fullname()%></h5>
              <p><a href="userInfo.jsp" style="color: #0b0c0d">Tài khoản của tôi</a></p>
              <p><a href="uadateInfo.jsp"  style="color: #0b0c0d">Cập nhật tài khoản</a></p>
              <p> <a href="/THDoAn_war/logOut" target="_blank" style="color: #0b0c0d">Đăng xuất</a></p>

            </div>
          </div>

        </li>

        <% if(auth.getUser_admin() == 1){%>
        <li><a href="/THDoAn_war/IndexAdmin" target="_blank"> <i class="fa fa-cog"></i>Quản Lý</a></li>
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
            <a href="index.jsp" class="logo">
              <img src="./img/Logo250px.png" alt="">
            </a>
          </div>
        </div>
        <!-- /LOGO -->

        <!-- SEARCH BAR -->
        <div class="col-md-6">
          <div class="header-search">
            <form>

              <input class="input" placeholder="Tìm Sản Phẩm">
              <button class="search-btn"><i class="fa fa-search"></i></button>
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
<div class="signup-form">
  <%--        <form action="/THDoAn_war/forgot-password" method="post">--%>
  <form action="/THDoAn_war/passRamdom" method="post">
    <h2 style="font-size:18px;">Mật khẩu mới cua bạn là</h2>
    <% User user = (User) session.getAttribute("user");%>
    <%  Random r = new Random();
            int passRamdom = r.nextInt(10000000);%>


    <div class="form-group">
      <input type="text" class="form-control" style="display: none" name="user" placeholder="" value="<%=user.getUser_id()%>" required="required">
      <h4>Tên người dùng: <%=user.getUser_name()%></h4>
      <h4>Mật Khẩu mới: <%=passRamdom%></h4>
      <input type="text" class="form-control"style="display: none" name="user" placeholder="" value="<%=user.getUser_name()%>" required="required">
      <input type="text" class="form-control" name="passRD" style="display: none" placeholder="" value="<%=passRamdom%>" required="required">


    </div>




    <div class="form-group">
      <button type="submit" class="btn btn-success btn-lg btn-block">Đến trang đăng nhập</button>
    </div>
    <div class="text-center"> Bạn có cần hổ trợ không? <a href="#">Hộ Trợ</a></div>
  </form>
</div>
</form>


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