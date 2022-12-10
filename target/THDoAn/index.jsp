<%@ page import="vn.edu.hcmuaf.ttt.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<meta http-equiv="Content-Type" charset="UTF-8">

<head>

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
                    <li><a href="login.html" target="_blank"><i class="fa fa-user-o"></i>Đăng Nhập</a></li>
                    <li>
                        <a href="form_dk.html" target="_blank"> <i class="fa fa-dollar"></i>Đăng Ký</a>
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
                            <div>
                                <a href="heart.html">
                                    <i class="fa fa-heart-o"></i>
                                    <span>Yêu Thích</span>
                                    <div class="qty">5</div>
                                </a>
                            </div>
                            <!-- /Wishlist -->

                            <!-- Cart -->
                            <div class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span>Giỏ Hàng</span>
                                    <div class="qty">2</div>
                                </a>
                                <div class="cart-dropdown">
                                    <div class="cart-list">
                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="./img/180-LI(Q).jpg" alt="">
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="product.html">Máy khoan 180-LI</a></h3>
                                                <h4 class="product-price"><span class="qty">1x</span>980.000</h4>
                                            </div>
                                            <button class="delete"><i class="fa fa-close"></i></button>
                                        </div>

                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="./img/may-khoan-bosch-gbm-320(1q).jpg" alt="">
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="product.html">Máy khoan Bosch GBM-320</a></h3>
                                                <h4 class="product-price"><span class="qty">1x</span>900.000</h4>
                                            </div>
                                            <button class="delete"><i class="fa fa-close"></i></button>
                                        </div>
                                    </div>
                                    <div class="cart-summary">
                                        <small>2 Sản Phẩm</small>
                                        <h5>Tổng: 1.880.000</h5>
                                    </div>
                                    <div class="cart-btns">
                                        <a href="cart.html">Xem</a>
                                        <a href="checkout.html">Thanh Toán<i class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
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

    <!-- NAVIGATION -->
    <nav id="navigation">
        <!-- container -->
        <div class="container">
            <!-- responsive-nav -->
            <div id="responsive-nav">
                <!-- NAV -->
                <ul class="main-nav nav navbar-nav">
                    <li><a href="index.jsp">Trang chủ</a></li>
                    <li><a href="store.jsp">Sản Phẩm</a></li>
                    <li><a href="khoan-mini.html">Khoan mini</a></li>
                    <li><a href="khoan-dong-luc.html">Khoan động lực</a></li>
                    <li><a href="khoan-be-tong.html">Khoan bê tông</a></li>
                    <li><a href="khoan-ban.html">Khoan bàn</a></li>
                    <li><a href="phukien.html">Phụ Kiện</a></li>
                    <li><a href="support.html">Hỗ Trợ</a></li>
                </ul>
                <!-- /NAV -->
            </div>
            <!-- /responsive-nav -->
        </div>
        <!-- /container -->
    </nav>
    <!-- /NAVIGATION -->
    <div id="carouselBlk">
        <div id="myCarousel" class="carousel slide">
            <div class="carousel-inner">
                <div class="item active">
                    <div class="container">
                        <!-- <a href="register.html"><img style="width:100%" src="img/carousel/4.png" alt="special offers" /></a> -->
                        <a href="register.html"><img style="width:100%" src="img/3.png" alt="special offers" /></a>
                        <div class="carousel-caption">
                            <h4>Second Thumbnail label</h4>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="container">
                        <a href="register.html"><img style="width:100%" src="img/2.png" alt="" /></a>
                        <div class="carousel-caption">
                            <h4>Second Thumbnail label</h4>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        </div>
                    </div>
                </div>
                <!-- <div class="item">
                    <div class="container">
                        <a href="register.html"><img src="img/1.png" alt="" /></a>
                        <div class="carousel-caption">
                            <h4>Second Thumbnail label</h4>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        </div>

                    </div>
                </div> -->
                <!-- <div class="item">
                    <div class="container">
                        <a href="register.html"><img src="img/carousel/4.png" alt="" /></a>
                        <div class="carousel-caption">
                            <h4>Second Thumbnail label</h4>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        </div>

                    </div>
                </div> -->
                <!-- <div class="item">
                    <div class="container">
                        <a href="register.html"><img src="img/carousel/5.png" alt="" /></a>
                        <div class="carousel-caption">
                            <h4>Second Thumbnail label</h4>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="container">
                        <a href="register.html"><img src="img/carousel/6.png" alt="" /></a>
                        <div class="carousel-caption">
                            <h4>Second Thumbnail label</h4>
                            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        </div>
                    </div>
                </div> -->
            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
        </div>
    </div>
    <!-- SECTION -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- shop -->
                <div class="col-md-4 col-xs-6">
                    <a href="store.jsp " class="cta-btn">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="img/180-LI(Q).jpg" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Khoan<br>Mini</h3>
                                <a href="store.jsp" class="cta-btn">Mua ngay  <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </a>

                </div>
                <!-- /shop -->

                <!-- shop -->
                <div class="col-md-4 col-xs-6">
                    <a href="store.jsp" class="cta-btn">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/may-khoan-dong-luc-bosch-gsb-550-re-bo-set-shop-index(Q)2.jpg" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Khoan<br>Động lực</h3>
                                <a href="store.jsp" class="cta-btn">Mua ngay <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </a>

                </div>
                <!-- /shop -->

                <!-- shop -->
                <div class="col-md-4 col-xs-6">
                    <a href="store.jsp" class="cta-btn">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="img/may-khoan-van-vit-dung-pin-bosch-gsb-180-li-k2-promo-06019f83k2-g-shop-index(Q)3.jpg" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>khoan<br>pin</h3>
                                <a href="store.jsp" class="cta-btn">mua ngay <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </a>

                </div>
                <!-- /shop -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /SECTION -->

    <!-- SECTION -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">

                <!-- section title -->
                <div class="col-md-12">
                    <div class="section-title">
                        <h3 class="title">News</h3>
                        <div class="section-nav">
                            <ul class="section-tab-nav tab-nav">
                                <li class="active"><a data-toggle="tab" href="store.jsp">Khoan Mini</a></li>
                                <li><a data-toggle="tab" href="store.jsp">Khoan động lực</a></li>
                                <li><a data-toggle="tab" href="store.jsp">Khoan bê tông</a></li>
                                <li><a data-toggle="tab" href="store.jsp">Khoan bàn</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /section title -->

                <!-- Products tab & slick -->
                <div class="col-md-12">
                    <div class="row">
                        <div class="products-tabs">
                            <!-- tab -->
                            <div id="tab1" class="tab-pane active">
                                <div class="products-slick" data-nav="#slick-nav-1">
                                    <!-- product -->
                                    <% List<Product> list = (List<Product>) request.getAttribute("listn");
                                        for (Product p:list) { %>

                                    <div class="product">
                                        <div class="product-img">
                                            <img src="<%= p.getImg() %>" alt="">
                                            <div class="product-label">

                                                <span class="new">NEW</span>
                                            </div>
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category"><%= p.getClassify()%> </p>
                                            <h3 class="product-name"><a href="<%= "/THDoAn_war/detail?id=" + p.getId()%>"><%= p.getName()%></a></h3>
                                            <h4 class="product-price"><%= p.getPrice()%> <del class="product-old-price"><%= p.getOldPrice()%></del></h4>
                                            <div class="product-rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="product-btns">
                                                <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Thích</span></button>
                                                <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp"> so sách</span></button>
                                                <button class="quick-view"><a href="<%= "/THDoAn_war/detail?id=" + p.getId()%>"  class=""> <i class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                            </div>
                                        </div>
                                        <div class="add-to-cart">
                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                        </div>
                                    </div>

                                    <% } %>

                                    <!-- /product -->

                                    <!-- product -->

                                    <!-- /product -->
                                </div>
                                <div id="slick-nav-1" class="products-slick-nav"></div>
                            </div>
                            <!-- /tab -->
                        </div>
                    </div>
                </div>
                <!-- Products tab & slick -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>

    <!-- /SECTION -->

    <!-- HOT DEAL SECTION -->
    <div id="hot-deal" class="section">
        <!-- container -->
        <div class="container">

            <!-- row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="hot-deal">
                        <ul class="hot-deal-countdown">
                            <li>
                                <div>
                                    <h3>02</h3>
                                    <span>Days</span>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <h3>10</h3>
                                    <span>Hours</span>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <h3>34</h3>
                                    <span>Mins</span>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <h3>60</h3>
                                    <span>Secs</span>
                                </div>
                            </li>
                        </ul>
                        <!-- <h2 class="text-uppercase">hot deal this week</h2>
                        <p>New Collection Up to 50% OFF</p> -->
                        <h2>.</h2>
                        <a class="primary-btn cta-btn" href="#">Shop now</a>

                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /HOT DEAL SECTION -->

    <!-- SECTION -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">

                <!-- section title -->
                <div class="col-md-12">
                    <div class="section-title">
                        <h3 class="title">Sale</h3>
                        <div class="section-nav">
                            <ul class="section-tab-nav tab-nav">
                                <li class="active"><a data-toggle="tab" href="store.jsp">Khoan mini</a></li>
                                <li><a data-toggle="tab" href="store.jsp">Khoan động lực</a></li>
                                <li><a data-toggle="tab" href="store.jsp">Khoan bê tông</a></li>
                                <li><a data-toggle="tab" href="store.jsp">Khoan bàn</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /section title -->

                <!-- Products tab & slick -->
                <div class="col-md-12">
                    <div class="row">
                        <div class="products-tabs">
                            <!-- tab -->
                            <div id="tab2" class="tab-pane fade in active">
                                <div class="products-slick" data-nav="#slick-nav-2">
                                    <!-- product -->
                                    <% List<Product> list1 = (List<Product>) request.getAttribute("lists");
                                        for (Product p:list1) { %>

                                    <div class="product">
                                        <div class="product-img">
                                            <img src="<%= p.getImg()%>" alt="">
                                            <div class="product-label">
                                                <span class="sale"><%= p.getPercent()%></span>

                                            </div>
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category"><%= p.getClassify()%></p>
                                            <h3 class="product-name"><a href="<%= "/THDoAn_war/detail?id=" + p.getId() %>"><%= p.getName()%> </a></h3>
                                            <h4 class="product-price"><%= p.getPrice()%> <del class="product-old-price"><%= p.getOldPrice()%></del></h4>
                                            <div class="product-rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="product-btns">
                                                <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Thích</span></button>
                                                <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp"> so sách</span></button>
                                                <button class="quick-view"><a href="<%= "/THDoAn_war/detail?id=" + p.getId() %>"  class=""> <i class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                            </div>
                                        </div>
                                        <div class="add-to-cart">
                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                        </div>
                                    </div>
                                    <% } %>
                                    <!-- /product -->

                                    <!-- product -->


                                    <!-- /product -->
                                </div>
                                <div id="slick-nav-2" class="products-slick-nav"></div>
                            </div>
                            <!-- /tab -->
                        </div>
                    </div>
                </div>
                <!-- /Products tab & slick -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /SECTION -->

    <!-- SECTION -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">

                <div class="col-md-4 col-xs-6">
                    <div class="section-title">
                        <h4 class="title">Khoan Mini</h4>
                        <div class="section-nav">
                            <div id="slick-nav-3" class="products-slick-nav"></div>
                        </div>
                    </div>

                    <div class="products-widget-slick" data-nav="#slick-nav-3">
                        <div>
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="./img/may-khoan-bosch-gbm-320(1q).jpg" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Khoan mini</p>
                                    <h3 class="product-name"><a href="product.html">Máy khoan Bosch GBM 320</a></h3>
                                    <h4 class="product-price">980.000 <del class="product-old-price">690.000</del></h4>
                                </div>
                            </div>
<%--                            <% } %>--%>

                            <!-- /product widget -->

                            <!-- product widget -->
<%--                            <div class="product-widget">--%>
<%--                                <div class="product-img">--%>
<%--                                    <img src="./img/may-khoan-xoay-bosch-gbm-13-re-500(2q).jpg" alt="">--%>
<%--                                </div>--%>
<%--                                <div class="product-body">--%>
<%--                                    <p class="product-category">Khoan mini</p>--%>
<%--                                    <h3 class="product-name"><a href="product.html">Máy khoan xoay Bosch GBM 13 RE-500</a></h3>--%>
<%--                                    <h4 class="product-price">1.890.000 <del class="product-old-price">1.690.000</del></h4>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <!-- /product widget -->

                            <!-- product widget -->
<%--                            <div class="product-widget">--%>
<%--                                <div class="product-img">--%>
<%--                                    <img src="./img/may-khoan-MT605-300(3q).jpg" alt="">--%>
<%--                                </div>--%>
<%--                                <div class="product-body">--%>
<%--                                    <p class="product-category">Khoan mini</p>--%>
<%--                                    <h3 class="product-name"><a href="product.html">Máy khoan MT605-300</a></h3>--%>
<%--                                    <h4 class="product-price">1.290.000 <del class="product-old-price">990.000</del></h4>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <!-- product widget -->
                        </div>

                        <div>
                            <!-- product widget -->
<%--                            <div class="product-widget">--%>
<%--                                <div class="product-img">--%>
<%--                                    <img src="./img/may-khoan-bosch-gbm-350-a(4q).jpg" alt="">--%>
<%--                                </div>--%>
<%--                                <div class="product-body">--%>
<%--                                    <p class="product-category">Khoan mini</p>--%>
<%--                                    <h3 class="product-name"><a href="#">Máy khoan Bosch GBM-350</a></h3>--%>
<%--                                    <h4 class="product-price">980.000 <del class="product-old-price">650.990</del></h4>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <!-- /product widget -->

                            <!-- product widget -->
<%--                            <div class="product-widget">--%>
<%--                                <div class="product-img">--%>
<%--                                    <img src="./img/may-khoan-toc-do-cao-maktec-mt652-300(5q).jpg" alt="">--%>
<%--                                </div>--%>
<%--                                <div class="product-body">--%>
<%--                                    <p class="product-category">Khoan mini</p>--%>
<%--                                    <h3 class="product-name"><a href="product.html">Máy khoan tốc độ cao Maktec MT652-300</a></h3>--%>
<%--                                    <h4 class="product-price">1.280.000 <del class="product-old-price">990.000</del></h4>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <!-- /product widget -->

                            <!-- product widget -->
<%--                            <div class="product-widget">--%>
<%--                                <div class="product-img">--%>
<%--                                    <img src="./img/180-LI(Q).jpg" alt="">--%>
<%--                                </div>--%>
<%--                                <div class="product-body">--%>
<%--                                    <p class="product-category">Khoan mini</p>--%>
<%--                                    <h3 class="product-name"><a href="product.html">Máy khoan mini 180-LI</a></h3>--%>
<%--                                    <h4 class="product-price">920.000 <del class="product-old-price">799.000</del></h4>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <!-- product widget -->
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-xs-6">
                    <div class="section-title">
                        <h4 class="title">Khoan động lực</h4>
                        <div class="section-nav">
                            <div id="slick-nav-4" class="products-slick-nav"></div>
                        </div>
                    </div>

                    <div class="products-widget-slick" data-nav="#slick-nav-4">
                        <div>
                            <!-- product widget -->
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="./img/may-khoan-dong-luc-bosch-gsb-13-re-gom-bo-set(1q).jpg" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Khoan động lực</p>
                                    <h3 class="product-name"><a href="product.html">Máy khoan động lực Bosch GSB 13 RE</a></h3>
                                    <h4 class="product-price">1.980.000 <del class="product-old-price">1.820.000 </del></h4>
                                </div>
                            </div>
                            <!-- /product widget -->

                            <!-- product widget -->
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="./img/may-khoan-dong-luc-bosch-gsb-550-re-bo-set-1(2q).jpg" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Khoan động lực</p>
                                    <h3 class="product-name"><a href="product.html">Máy khoan động lực Bosch GSB 550 - 06011A15K7 </a></h3>
                                    <h4 class="product-price">1.780.000 <del class="product-old-price">990.000</del></h4>
                                </div>
                            </div>
                            <!-- /product widget -->

                            <!-- product widget -->
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="./img/may-khoan-dong-luc-bosch-gsb-16-re-300(3q).jpg" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Khoan động lực</p>
                                    <h3 class="product-name"><a href="product.html">Máy khoan động lực Bosch GSB 16 RE</a></h3>
                                    <h4 class="product-price">1.950.000 <del class="product-old-price">1.590.000</del></h4>
                                </div>
                            </div>
                            <!-- product widget -->
                        </div>

                        <div>
                            <!-- product widget -->
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="./img/may-khoan-dong-luc-bosch-gsb-550-a(4q).jpg" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Khoan động lực</p>
                                    <h3 class="product-name"><a href="product.html">Máy khoan động lực Bosch GSB 550</a></h3>
                                    <h4 class="product-price">1.200.000 <del class="product-old-price">990.000</del></h4>
                                </div>
                            </div>
                            <!-- /product widget -->

                            <!-- product widget -->
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="./img/may-khoan-dong-luc-bosch-gsb-13-re-500(5q).jpg" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Khoan động lực</p>
                                    <h3 class="product-name"><a href="product.html">Máy khoan động lực Bosch GSB 13 RE</a></h3>
                                    <h4 class="product-price">1.650.000 <del class="product-old-price">1.390.000</del></h4>
                                </div>
                            </div>
                            <!-- /product widget -->

                            <!-- product widget -->
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="./img/may-khoan-dong-luc-bosch-gsb-550-mp-set-19-chi-tiet(6q).jpg" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Khoan động lực</p>
                                    <h3 class="product-name"><a href="product.html">Máy khoan động lực Bosch GSB 550 MP</a></h3>
                                    <h4 class="product-price">1.710.000 <del class="product-old-price">1.390.000</del></h4>
                                </div>
                            </div>
                            <!-- product widget -->
                            <!-- product widget -->
                        </div>
                    </div>
                </div>

                <div class="clearfix visible-sm visible-xs"></div>

                <div class="col-md-4 col-xs-6">
                    <div class="section-title">
                        <h4 class="title">Khoan bê tông</h4>
                        <div class="section-nav">
                            <div id="slick-nav-5" class="products-slick-nav"></div>
                        </div>
                    </div>

                    <div class="products-widget-slick" data-nav="#slick-nav-5">
                        <div>
                            <!-- product widget -->
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="./img/may-khoan-bua-bosch-gbh-2-26-dre-500x500(1q).jpg" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Khoan bê tông</p>
                                    <h3 class="product-name"><a href="product.html">Máy khoan búa Bosch GBH 2-26 DRE</a></h3>
                                    <h4 class="product-price">4.300.000 <del class="product-old-price">3.750.000</del></h4>
                                </div>
                            </div>
                            <!-- /product widget -->

                            <!-- product widget -->
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="img/may-khoan-bua-bosch-gbh-2-24-dfr-300(2q).jpg" alt="Máy Ảnh Fujifilm Instax Square SQ1 - Hàng Chính Hãng" class="WebpImg__StyledImg-sc-h3ozu8-0 fWjUGo">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Khoan bê tông</p>
                                    <h3 class="product-name"><a href="product.html">Máy khoan búa Bosch GBH 2-24 DFR</a></h3>
                                    <h4 class="product-price">3.980.000 <del class="product-old-price">3.550.000</del></h4>
                                </div>
                            </div>
                            <!-- /product widget -->

                            <!-- product widget -->
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="img/may-khoan-bua-bosch-gbh-2-28-dv-400(3q).jpg" alt="Máy Ảnh Fujifilm X-T100 + Lens 15-45mm (24.2MP) - Hàng Chính Hãng" class="WebpImg__StyledImg-sc-h3ozu8-0 fWjUGo">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Khoan bê tông</p>
                                    <h3 class="product-name"><a href="product.html">Máy khoan búa Bosch GBH 2-28 DV</a></h3>
                                    <h4 class="product-price">5.980.000 <del class="product-old-price">4.990.000</del></h4>
                                </div>
                            </div>
                            <!-- product widget -->
                        </div>

                        <div>
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="img/may-khoan-bua-bosch-gbh-2-24-dre-790w-300(4q).jpg" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Khoan bê tông</p>
                                    <h3 class="product-name"><a href="product.html">Máy khoan búa Bosch GBH 2-24 DRE (790W)</a></h3>
                                    <h4 class="product-price">4.500.000 <del class="product-old-price">3.600.000</del></h4>
                                </div>
                            </div>
                            <!-- /product widget -->

                            <!-- product widget -->
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="img/may-khoan-bua-bosch-gbh-2-24-re-790w(5q).jpg" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Khoan bê tông</p>
                                    <h3 class="product-name"><a href="product.html">Máy khoan búa Bosch GBH 2-24 RE (790W)</a></h3>
                                    <h4 class="product-price">3.400.000 <del class="product-old-price">3.100.000</del></h4>
                                </div>
                            </div>
                            <!-- /product widget -->

                            <!-- product widget -->
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="img/may-khoan-bua-bosch-gbh-2-26e-500(6q).jpg" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Khoan bê tông</p>
                                    <h3 class="product-name"><a href="product.html">Máy khoan búa Bosch GBH 2-26E</a></h3>
                                    <h4 class="product-price">3.900.000 <del class="product-old-price">3.500.000</del></h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


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
                            <input class="input" type="email" placeholder="Nhập email">
                            <button class="newsletter-btn"><i class="fa fa-envelope"></i> Đăng kí</button>
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
                                <li><a href="phukien.html">Phụ kiện<a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="clearfix visible-xs"></div>

                    <div class="col-md-3 col-xs-6">
                        <div class="footer">
                            <h3 class="footer-title">Thông Tin</h3>
                            <ul class="footer-links">
                                <li><a href="about.html">Giới thiệu</a></li>
                                <li><a href="lien_he.html">Liên hệ chúng tôi</a></li>
                                <li><a href="Cs_bao_mat.html">Chính sách bảo mật</a></li>
                                <li><a href="Cs_trahang.html">Đơn hàng và Trả hàng</a></li>
                                <li><a href="đk_đk.html">Điều khoản và điều kiện</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-3 col-xs-6">
                        <div class="footer">
                            <h3 class="footer-title">Dịch Vụ</h3>
                            <ul class="footer-links">
                                <li><a href="login.html">Tài Khoản Của Tôi</a></li>
                                <li><a href="cart.html">Xem Giỏ Hàng</a></li>
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
    <script src="js/bootshop.js"></script>


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