
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<meta http-equiv="Content-Type" charset="UTF-8">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Drill Technology</title>
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
        
        .login-form {
            width: 340px;
            margin: 30px auto;
            font-size: 15px;
        }
        
        .login-form form {
            margin-bottom: 15px;
            background: #f7f7f7;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            padding: 30px;
        }
        
        .login-form h2 {
            margin: 0 0 15px;
        }
        
        .login-form .hint-text {
            color: #777;
            padding-bottom: 15px;
            text-align: center;
            font-size: 13px;
        }
        
        .form-control,
        .btn {
            min-height: 38px;
            border-radius: 2px;
        }
        
        .login-btn {
            font-size: 15px;
            font-weight: bold;
        }
        
        .or-seperator {
            margin: 20px 0 10px;
            text-align: center;
            border-top: 1px solid #ccc;
        }
        
        .or-seperator i {
            padding: 0 10px;
            background: #f7f7f7;
            position: relative;
            top: -11px;
            z-index: 1;
        }
        
        .social-btn .btn {
            margin: 10px 0;
            font-size: 15px;
            text-align: left;
            line-height: 24px;
        }
        
        .social-btn .btn i {
            float: left;
            margin: 4px 15px 0 5px;
            min-width: 15px;
        }
        
        .input-group-addon .fa {
            font-size: 18px;
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
                            <a href="/THDoAn_war/" class="logo">
                                <img src="./img/Logo250px.png" alt="">
                            </a>
                        </div>
                    </div>
                    <!-- /LOGO -->

                    <!-- SEARCH BAR -->
                    <div class="col-md-6">
                        <div class="header-search">
                            <form action="search" method="post">

                                <input name="txt" class="input" placeholder="Tìm Sản Phẩm">
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
                                <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span>Giỏ Hàng</span>

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
    <div class="login-form signup-form">
        <form action="/THDoAn_war/dologin" method="post">
            <h2 style="font-size:18px;">Đăng nhập</h2>
            <p class="alert-success">${success}</p>
            <div class="text-center social-btn">
                <fb:login-button size="large" scope="public_profile,email" onlogin="checkLoginState();">Đăng nhập bằng FaceBook
                </fb:login-button>

                <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/THDoAn_war/loginGoogle&response_type=code
                  &client_id=105931047224-vs7r2jb3ju6tlal834icl8t67e9h9gdp.apps.googleusercontent.com&approval_prompt=force" class="btn btn-danger btn-block"><i class="fa fa-google"></i>Đăng nhập bằng<b> Google</b></a>

            </div>
            <div class="or-seperator"><i>hoặc</i></div>

             <p class="text-danger">${mess}</p>


            <div class="form-group">

                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <span class="fa fa-user"></span>
                        </span>
                    </div>
                    <input type="text" class="form-control" name="user" placeholder="Tên người dùng" required="required">
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <i class="fa fa-lock"></i>
                        </span>
                    </div>
                    <input type="password" class="form-control" name="pass" placeholder="Mật Khẩu" required="required">
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-success btn-block login-btn">Đăng Nhập</button>
            </div>
            <div class="clearfix">
                <label class="float-left form-check-label"><input type="checkbox" name="remember" id="remember">Nhớ tài khoản?</label>
                <a href="password.jsp"  target="_blank" class="float-right text-success">Quên mật khẩu?</a>
            </div>

        </form>
        <div class="hint-text">Bạn đả đăng ký tài khoản chưa? <a href="form_dk.jsp" class="text-success">Đăng Ký</a></div>

    </div>



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
    <script>
        // This is called with the results from from FB.getLoginStatus().
        function statusChangeCallback(response) {
            console.log('statusChangeCallback');
            console.log(response);
            console.log(response.authResponse.accessToken);
            //alert(response.authResponse.accessToken);
            if (response.status === 'connected') {
                window.location.href='fb_info.jsp?access_token='+response.authResponse.accessToken;
            } else {
                // The person is not logged into your app or we are unable to tell.
                document.getElementById('status').innerHTML = 'Please log ' +
                    'into this app.';
            }
        }
        // This function is called when someone finishes with the Login
        // Button. See the onlogin handler attached to it in the sample
        // code below.
        function checkLoginState() {
            FB.getLoginStatus(function(response) {
                statusChangeCallback(response);
            });
        }
        window.fbAsyncInit = function() {
            FB.init({
                //id của quan
                // appId : '3211636435805195',
                //id của tiên
                appId : '3109656989181170',
                cookie : true, // enable cookies to allow the server to access
                // the session
                xfbml : true, // parse social plugins on this page
                version : 'v2.8' // use graph api version 2.8
            });
            FB.getLoginStatus(function(response) {
                statusChangeCallback(response);
            });
        };
        // Load the SDK asynchronously
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
        // Here we run a very simple test of the Graph API after login is
        // successful. See statusChangeCallback() for when this call is made.
    </script>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/nouislider.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/bootshop.js"></script>

</body>

</html>