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
                    <li><a href="login.jsp" target="_blank"><i class="fa fa-user-o"></i>Đăng Nhập</a></li>
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
                                        <a href="cart.jsp">Xem</a>
                                        <a href="checkout.jsp">Thanh Toán<i class="fa fa-arrow-circle-right"></i></a>
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
                </ul>
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
                        <li><a href="index.jsp">Trang Chủ</a></li>
                        <li><a href="#">Sản Phẩm</a></li>

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
            <div class="row">
                <!-- ASIDE -->
                <div id="aside" class="col-md-3">
                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Sản Phẩm</h3>
                        <div class="checkbox-filter">

                            <div class="input-checkbox">
                                <input type="checkbox" id="category-1">
                                <label for="category-1">
                                    <span></span>
                                    Máy Khoan Mini
                                    <small>(50)</small>
                                </label>
                            </div>

                            <div class="input-checkbox">
                                <input type="checkbox" id="category-2">
                                <label for="category-2">
                                    <span></span>
                                    Máy Khoan Động Lực
                                    <small>(50)</small>
                                </label>
                            </div>

                            <div class="input-checkbox">
                                <input type="checkbox" id="category-3">
                                <label for="category-3">
                                    <span></span>
                                    Máy Khoan Bê Tông
                                    <small>(50)</small>
                                </label>
                            </div>

                            <div class="input-checkbox">
                                <input type="checkbox" id="category-4">
                                <label for="category-4">
                                    <span></span>
                                    Máy Khoan Bàn
                                    <small>(50)</small>
                                </label>
                            </div>

                            <div class="input-checkbox">
                                <input type="checkbox" id="category-5">
                                <label for="category-5">
                                    <span></span>
                                    Mũi Khoan
                                    <small>(50)</small>
                                </label>
                            </div>
                        </div>
                    </div>
                    <!-- /aside Widget -->

                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Giá</h3>
                        <div class="price-filter">
                            <div id="price-slider"></div>
                            <div class="input-number price-min">
                                <input id="price-min" type="number">
                                <span class="qty-up">+</span>
                                <span class="qty-down">-</span>
                            </div>
                            <span>-</span>
                            <div class="input-number price-max">
                                <input id="price-max" type="number">
                                <span class="qty-up">+</span>
                                <span class="qty-down">-</span>
                            </div>
                        </div>
                    </div>
                    <!-- /aside Widget -->

                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Nhãn Hiệu</h3>
                        <div class="checkbox-filter">
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-1">
                                <label for="brand-1">
                                    <span></span>
                                    Bosch
                                    <small>(38)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-2">
                                <label for="brand-2">
                                    <span></span>
                                    CFCooper
                                    <small>(2)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-3">
                                <label for="brand-3">
                                    <span></span>
                                    DeWalt
                                    <small>(2)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-4">
                                <label for="brand-4">
                                    <span></span>
                                    DongCheng
                                    <small>(1)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-5">
                                <label for="brand-5">
                                    <span></span>
                                    YATO
                                    <small>(1)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-6">
                                <label for="brand-6">
                                    <span></span>
                                    Makita
                                    <small>(3)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-6">
                                <label for="brand-6">
                                    <span></span>
                                    Stanley
                                    <small>(2)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-6">
                                <label for="brand-6">
                                    <span></span>
                                    Trung Quốc
                                    <small>(1)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-6">
                                <label for="brand-6">
                                    <span></span>
                                    INGCO
                                    <small>(1)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-6">
                                <label for="brand-6">
                                    <span></span>
                                    VAC
                                    <small>(1)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-6">
                                <label for="brand-6">
                                    <span></span>
                                    Khác
                                    <small>(1)</small>
                                </label>
                            </div>
                        </div>
                    </div>
                    <!-- /aside Widget -->

                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Sản Phẩm Tương Tự</h3>
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./imgs_phukien/10.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Mũi khoan Bosch</p>
                                <h3 class="product-name"><a href="product.html">Mũi khoan kim cương 6mm Bosch
                                        2608599049</a></h3>
                                <h4 class="product-price">200.000đ <del class="product-old-price">250.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./imgs_phukien/11.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Mũi khoan Bosch</p>
                                <h3 class="product-name"><a href="product.html">Mũi khoan kim cương 12mm Bosch
                                        2608599052</a></h3>
                                <h4 class="product-price">250.000đ <del class="product-old-price">280.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./imgs_phukien/12.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Mũi khoan Stanley</p>
                                <h3 class="product-name"><a href="product.html">Mũi đục dẹp lục giác Stanley
                                        STA54476</a></h3>
                                <h4 class="product-price">79.000đ <del class="product-old-price"></del></h4>
                            </div>
                        </div>
                        <!-- product widget -->
                    </div>

                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./imgs_phukien/13.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Mũi khoan Makita</p>
                                <h3 class="product-name"><a href="product.html">Mũi đục nhọn 255mm chuôi lục giác Makita
                                        D-71283</a></h3>
                                <h4 class="product-price">89.000đ <del class="product-old-price">109.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./imgs_phukien/14.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Mũi khoan Bosch</p>
                                <h3 class="product-name"><a href="product.html">Mũi khoan kim cương 8mm Bosch
                                        2608599050</a></h3>
                                <h4 class="product-price">200.000đ <del class="product-old-price">250.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./imgs_phukien/15.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Mũi khoan Bosch</p>
                                <h3 class="product-name"><a href="product.html">Bộ mũi khoan kim cương 6/6/8mm Bosch
                                        2607011626</a></h3>
                                <h4 class="product-price">520.000đ <del class="product-old-price">680.000đ</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                    </div>
                    <!-- /aside Widget -->
                </div>
                <!-- /ASIDE -->

                <!-- STORE -->
                <div id="store" class="col-md-9">
                    <!-- store top filter -->
                    <!-- <div class="store-filter clearfix">
                        <div class="store-sort">
                            <label>
                                Lọc:
                                <select class="input-select">
                                    <option value="0">New</option>
                                    <option value="1">Sale</option>
                                    <option value="1">Giá Cao</option>
                                    <option value="1">Giáo Thấp</option>
                                </select>
                            </label>

                            <label>
                                Hiện Thị Sản Phẩm:
                                <select class="input-select">
                                    <option value="0">20</option>
                                    <option value="1">50</option>
                                </select>
                            </label>
                        </div>
                        <ul class="store-grid">
                            <li class="active"><i class="fa fa-th"></i></li>
                            <li><a href="#"><i class="fa fa-th-list"></i></a></li>
                        </ul>
                    </div> -->
                    <!-- /store top filter -->

                    <!-- store products -->
                    <div class="row">
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/1.jpg" alt="">
                                    <div class="product-label">
                                        <span class="sale">-10%</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan CFCooper</p>
                                    <h3 class="product-name"><a href="product.html">Mũi khoan rút lõi bê tông
                                            CFCooper</a></h3>
                                    <h4 class="product-price">225.000đ <del class="product-old-price">250.000đ</del>
                                    </h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/2.jpg" alt="">
                                    <div class="product-label">

                                        <span class="new">NEW</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan Bosch</p>
                                    <h3 class="product-name"><a href="product.html">Mũi khoan đa năng Hex-9 Bosch
                                            2607002780 (10 x 90 x 150 mm)</a></h3>
                                    <h4 class="product-price">83.000đ <del class="product-old-price"></del></h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <div class="clearfix visible-sm visible-xs"></div>
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/3.jpg" alt="">
                                    <div class="product-label">
                                        <span class="new">NEW</span>
                                    </div>
                                </div>

                                <div class="product-body">
                                    <p class="product-category">Mũi khoan Bosch</p>
                                    <h3 class="product-name"><a href="product.html">Bộ mũi khoan đa năng Bosch HSS
                                            PointTeQ 10 mũi 1-10mm 2608577348</a></h3>
                                    <h4 class="product-price">250.000đ <del class="product-old-price"></del></h4>
                                    <div class="product-rating">
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <div class="clearfix visible-lg visible-md"></div>




                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/4.jpg" alt="">
                                    <div class="product-label">
                                        <span class="new">NEW</span>
                                    </div>
                                </div>

                                <div class="product-body">
                                    <p class="product-category">Mũi khoan Bosch</p>
                                    <h3 class="product-name"><a href="product.html">Bộ 3 mũi khoan gạch cứng Hex-9 Bosch
                                            2608579511 (5/6/8mm)</a></h3>
                                    <h4 class="product-price">255.000đ <del class="product-old-price"></del></h4>
                                    <div class="product-rating">
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/5.jpg" alt="">
                                    <div class="product-label">
                                        <span class="new">NEW</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan Dongcheng</p>
                                    <h3 class="product-name"><a href="product.html">Mũi khoan rút lõi bê tông Dongcheng
                                            đường kính lớn </a></h3>
                                    <h4 class="product-price">240.000đ <del class="product-old-price"></del></h4>
                                    <div class="product-rating">
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <div class="clearfix visible-sm visible-xs"></div>
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/6.jpg" alt="">
                                    <div class="product-label">
                                        <span class="new">NEW</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan Bosch</p>
                                    <h3 class="product-name"><a href="product.html">Bộ 5 mũi khoan đa năng Hex-9 Bosch
                                            2608589530 (4/5/6/6/8 mm)</a></h3>
                                    <h4 class="product-price">290.000đ <del class="product-old-price"></del></h4>
                                    <div class="product-rating">
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <div class="clearfix visible-lg visible-md visible-sm visible-xs"></div>



                        <!-- product -->
                        <div class="col-md-4 col-xs-6">

                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/7.jpg" alt="">
                                    <div class="product-label">

                                        <span class="new">NEW</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan Bosch</p>
                                    <h3 class="product-name"><a href="product.html">Mũi khoan gạch cứng Bosch 2608579508
                                            Hex-9 8x90</a></h3>
                                    <h4 class="product-price">110.000đ <del class="product-old-price"></del></h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/8.jpg" alt="">
                                    <div class="product-label">

                                        <span class="new">NEW</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan Bosch</p>
                                    <h3 class="product-name"><a href="product.html">Bộ mũi khoan và vặn vít Pick&Click
                                            20 món Bosch 2608522422</a></h3>
                                    <h4 class="product-price">560.000đ <del class="product-old-price"></del></h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <div class="clearfix visible-sm visible-xs"></div>
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/9.jpg" alt="">
                                    <div class="product-label">

                                        <span class="new">NEW</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan Bosch</p>
                                    <h3 class="product-name"><a href="product.html"> Mũi khoan kim cương 10mm Bosch
                                            2608599051</a></h3>
                                    <h4 class="product-price">230.000đ <del class="product-old-price"></del></h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>

                        </div>
                        <!-- /product -->
                        <div class="clearfix visible-lg visible-md visible-sm visible-xs"></div>

                        <!--start 3 product-->
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">

                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/10.jpg" alt="">
                                    <div class="product-label">

                                        <span class="new">NEW</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan Bosch</p>
                                    <h3 class="product-name"><a href="product.html">Mũi khoan kim cương 6mm Bosch
                                            2608599049</a></h3>
                                    <h4 class="product-price">200.000đ <del class="product-old-price"></del></h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/11.jpg" alt="">
                                    <div class="product-label">

                                        <span class="new">NEW</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan Bosch</p>
                                    <h3 class="product-name"><a href="product.html">Mũi khoan kim cương 12mm Bosch
                                            2608599052</a></h3>
                                    <h4 class="product-price">250.000đ <del class="product-old-price"></del></h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <div class="clearfix visible-sm visible-xs"></div>
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/12.jpg" alt="">
                                    <div class="product-label">

                                        <span class="new">NEW</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan Stanley</p>
                                    <h3 class="product-name"><a href="product.html"> Mũi đục dẹp lục giác Stanley
                                            STA54476</a></h3>
                                    <h4 class="product-price">79.000đ <del class="product-old-price"></del></h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>

                        </div>
                        <!-- /product -->
                        <div class="clearfix visible-lg visible-md visible-sm visible-xs"></div>
                        <!--end 3 product-->


                        <!--start 3 product-->
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/13.jpg" alt="">
                                    <div class="product-label">
                                        <span class="sale">-18%</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan Makita</p>
                                    <h3 class="product-name"><a href="product.html">Mũi đục nhọn 255mm chuôi lục giác
                                            Makita D-71283</a></h3>
                                    <h4 class="product-price">89.000đ <del class="product-old-price">109.000đ</del>
                                    </h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/14.png" alt="">
                                    <div class="product-label">
                                        <span class="sale">-20%</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan Bosch</p>
                                    <h3 class="product-name"><a href="product.html">Mũi khoan kim cương 8mm Bosch
                                            2608599050</a></h3>
                                    <h4 class="product-price">200.000đ <del class="product-old-price">250.000đ</del>
                                    </h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <div class="clearfix visible-sm visible-xs"></div>
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/15.jpg" alt="">
                                    <div class="product-label">
                                        <span class="sale">-24%</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan Bosch</p>
                                    <h3 class="product-name"><a href="product.html">Bộ mũi khoan kim cương 6/6/8mm Bosch
                                            2607011626</a></h3>
                                    <h4 class="product-price">520.000đ <del class="product-old-price">680.000đ</del>
                                    </h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <div class="clearfix visible-lg visible-md visible-sm visible-xs"></div>
                        <!--end 3 product-->


                        <!--start 3 product-->
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/16.jpg" alt="">
                                    <div class="product-label">

                                        <span class="new">NEW</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan Bosch</p>
                                    <h3 class="product-name"><a href="product.html">Combo 5 mũi khoan Bosch SDS PLUS-5X</a></h3>
                                    <h4 class="product-price">240.000đ <del class="product-old-price"></del></h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/17.jpg" alt="">
                                    <div class="product-label">

                                        <span class="new">NEW</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan Khác</p>
                                    <h3 class="product-name"><a href="product.html">Mũi khoan rút lõi Hayner</a></h3>
                                    <h4 class="product-price">210.000đ <del class="product-old-price"></del></h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <div class="clearfix visible-sm visible-xs"></div>
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/18.jpg" alt="">
                                    <div class="product-label">
                                        <span class="sale">-11%</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan DeWalt</p>
                                    <h3 class="product-name"><a href="product.html">Bộ mũi khoan và đầu vít 27 chi tiết Dewalt DT71507</a></h3>
                                    <h4 class="product-price">420.000đ <del class="product-old-price">470.000đ</del>
                                    </h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <div class="clearfix visible-lg visible-md visible-sm visible-xs"></div>
                        <!--end 3 product-->


                        <!--start 3 product-->
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">

                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/19.jpg" alt="">
                                    <div class="product-label">

                                        <span class="new">NEW</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan YATO</p>
                                    <h3 class="product-name"><a href="product.html">Bộ mũi khoan phá ốc vít hỏng 12 chi tiết Yato YT-0591</a></h3>
                                    <h4 class="product-price">440.000đ <del class="product-old-price"></del></h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/20.jpg" alt="">
                                    <div class="product-label">

                                        <span class="new">NEW</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan VAC</p>
                                    <h3 class="product-name"><a href="product.html">Mũi khoan lấy mẫu bê tông VAC</a></h3>
                                    <h4 class="product-price">210.000đ <del class="product-old-price"></del></h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <div class="clearfix visible-sm visible-xs"></div>
                        <!-- product -->
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="./imgs_phukien/21.jpg" alt="">
                                    <div class="product-label">

                                        <span class="new">NEW</span>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Mũi khoan Bosch</p>
                                    <h3 class="product-name"><a href="product.html"> Bộ mũi khoan Bosch HSS PointTeQ 2608577349 (13 mũi 1.5-6.5)</a></h3>
                                    <h4 class="product-price">150.000đ <del class="product-old-price"></del></h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">Thích</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp"> so sánh</span></button>
                                        <button class="quick-view"><a href="product.html" class=""> <i
                                                    class="fa fa-eye"></i><span class="tooltipp">xem</span></a></button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                                        hàng</button>
                                </div>
                            </div>

                        </div>
                        <!-- /product -->
                        <div class="clearfix visible-lg visible-md visible-sm visible-xs"></div>
                        <!--end 3 product-->

                    </div>
                    <!-- /store products -->

                    <!-- store bottom filter -->
                    <div class="store-filter clearfix">
                        <span class="store-qty"></span>
                        <ul class="store-pagination">
                            <li class="active">1</li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                        </ul>
                    </div>
                    <!-- /store bottom filter -->
                </div>
                <!-- /STORE -->
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
                            <button class="newsletter-btn"><i class="fa fa-envelope"></i> Đăng Ký</button>
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