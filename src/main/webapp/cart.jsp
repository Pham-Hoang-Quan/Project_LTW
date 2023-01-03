<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Cart" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Product" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.Category" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<meta http-equiv="Content-Type" charset="UTF-8">
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

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
                            <a href="/THDoAn_war/" class="logo">
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
                            <div>
                                <a href="cart.jsp">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span>Giỏ Hàng</span>
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

    <!-- NAVIGATION -->
    <nav id="navigation">
        <!-- container -->
        <div class="container">
            <!-- responsive-nav -->
            <div id="responsive-nav">
                <!-- NAV -->
<%--                <ul class="main-nav nav navbar-nav">--%>
<%--                    <ul class="main-nav nav navbar-nav">--%>
<%--                        <li><a href="/THDoAn_war/">Trang chủ</a></li>--%>
<%--                        <li><a href="/THDoAn_war//List-Product">Sản Phẩm</a></li>--%>
<%--                        <% List<Category> lista = (List<Category>) request.getAttribute("listc");--%>
<%--                            for (Category p:lista) { %>--%>
<%--                        <li> <a  href="<%= "/THDoAn_war/category?cName=" + p.getcName()%>"><%= p.getcName()%></a></li>--%>
<%--                        <% } %>--%>
<%--                        <li><a href="support.html">Hỗ Trợ</a></li>--%>
<%--                    </ul>--%>
<%--                </ul>--%>
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
                        <li><a href="/THDoAn_war/">Trang Chủ</a></li>
                        <li><a href="#">Giỏ Hàng</a></li>

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
                                    Khoan mini
                                    <small>(120)</small>
                                </label>
                            </div>

                            <div class="input-checkbox">
                                <input type="checkbox" id="category-2">
                                <label for="category-2">
                                    <span></span>
                                    Khoan động lực
                                    <small>(740)</small>
                                </label>
                            </div>

                            <div class="input-checkbox">
                                <input type="checkbox" id="category-3">
                                <label for="category-3">
                                    <span></span>
                                    Khoan bê tông
                                    <small>(1450)</small>
                                </label>
                            </div>

                            <div class="input-checkbox">
                                <input type="checkbox" id="category-4">
                                <label for="category-4">
                                    <span></span>
                                    Khoan bàn
                                    <small>(578)</small>
                                </label>
                            </div>

                            <div class="input-checkbox">
                                <input type="checkbox" id="category-5">
                                <label for="category-5">
                                    <span></span>
                                    Phụ kiện
                                    <small>(120)</small>
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
                                    <small>(578)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-2">
                                <label for="brand-2">
                                    <span></span>
                                    CFCooper
                                    <small>(125)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-3">
                                <label for="brand-3">
                                    <span></span>
                                    DeWalt
                                    <small>(755)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-4">
                                <label for="brand-4">
                                    <span></span>
                                    DongCheng
                                    <small>(578)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-5">
                                <label for="brand-5">
                                    <span></span>
                                    YATO
                                    <small>(125)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-6">
                                <label for="brand-6">
                                    <span></span>
                                    Makita
                                    <small>(755)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-6">
                                <label for="brand-6">
                                    <span></span>
                                    Stanley
                                    <small>(755)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-6">
                                <label for="brand-6">
                                    <span></span>
                                    Trung Quốc
                                    <small>(755)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-6">
                                <label for="brand-6">
                                    <span></span>
                                    INGCO
                                    <small>(755)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-6">
                                <label for="brand-6">
                                    <span></span>
                                    VAC
                                    <small>(755)</small>
                                </label>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-6">
                                <label for="brand-6">
                                    <span></span>
                                    Khác
                                    <small>(755)</small>
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
                                <img src="./img/product12.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Khoan động lực</p>
                                <h3 class="product-name"><a href="product.html"> Máy khoan động lực Bosch GSB 16 RE</a>
                                </h3>
                                <h4 class="product-price">1.590.000đ <del class="product-old-price">1.950.000đ</del>
                                </h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./img/product14.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Khoan bàn</p>
                                <h3 class="product-name"><a href="product.html"> Máy khoan bàn 13mm Hồng Ký KD600</a>
                                </h3>
                                <h4 class="product-price">2.590.000đ<del class="product-old-price"></del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./img/product15.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Khoan động lực</p>
                                <h3 class="product-name"><a href="product.html"> Máy khoan động lực Bosch GSB 550</a>
                                </h3>
                                <h4 class="product-price">1.200.000đ<del class="product-old-price"></del></h4>

                            </div>
                        </div>
                        <!-- product widget -->
                    </div>

                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./img/product17.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Khoan mini</p>
                                <h3 class="product-name"><a href="product.html"> Máy khoan bắn vít Benyu BY6113</a></h3>
                                <h4 class="product-price">590.000đ<del class="product-old-price">690.000đ</del></h4>

                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./img/product09.jpg" alt="">
                            </div>
                            <div class="product-body">
                                v class="product-body">
                                <p class="product-category">Khoan bàn</p>
                                <h3 class="product-name"><a href="product.html">Máy khoan phay phi 16 WDDM ZX7016</a>
                                </h3>
                                <h4 class="product-price">18.000.000đ <del class="product-old-price"></del></h4>

                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="./img/product19.jpg" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Khoan bê tông</p>
                                <h3 class="product-name"><a href="product.html"> Máy khoan bê tông Ken 2826BS</a></h3>
                                <h4 class="product-price">1.380.000đ<del class="product-old-price">1.950.000đ</del></h4>
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
                    <div class="cart-table-area section-padding-100">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12 col-lg-8">
                                    <div class="cart-title mt-50">
                                        <h2>Giỏ Hàng</h2>
                                    </div>

                                    <div class="cart-table clearfix">
                                        <table class="table table-responsive">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>Tên</th>
                                                    <th>Giá</th>
                                                    <th>Số Lượng</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <%Cart cart =(Cart) session.getAttribute("cart");
                                                double tongtien = 0;
                                            %>
                                            <%for (Product c:cart.getListproduct()) {
                                            tongtien+=c.getPrice();
                                            %>
                                            <%Locale locale = new Locale("vi");
                                                NumberFormat format = NumberFormat.getCurrencyInstance(locale);
                                                String tn = format.format(c.getPrice()).split(",")[0];
                                            %>
                                                <tr>
                                                    <td class="cart_product_img">
                                                        <a href="#"><img src="<%= c.getImg()%>" alt="Product"></a>
                                                    </td>
                                                    <td class="cart_product_desc">
                                                        <h5><%= c.getName()%></h5>
                                                    </td>
                                                    <td class="price">
                                                        <span><%=tn%> đ </span>
                                                    </td>
                                                    <td class="qty">
                                                        <div class="qty-btn d-flex">
                                                            <p>SL</p>
                                                            <div class="quantity">
                                                                <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i
                                                                        class="fa fa-minus"
                                                                        aria-hidden="true"></i></span>
                                                                <input type="number" class="qty-text" id="qty" step="1" min="1" max="300" name="quantity" value="1">
                                                                <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i
                                                                        class="fa fa-plus"
                                                                        aria-hidden="true"></i></span>
                                                            </div>
                                                        </div>

                                                    </td>
                                                    <td>
                                                        <a class="delete-product" href="/THDoAn_war/deleteProduct?id=<%=c.getId()%>">
                                                            <i class="fa-solid fa-trash-can"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                               <%}%>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-4">
                                    <div class="cart-summary">
                                        <h4>TỔNG</h4>
                                        <ul class="summary-table">
                                            <%Locale locale = new Locale("vi");
                                                NumberFormat format = NumberFormat.getCurrencyInstance(locale);
                                                String tt = format.format(tongtien).split(",")[0];
                                            %>
                                            <li><span>Tiền Hàng:</span> <span><%=tt%>đ</span></li>
                                            <li><span>Vận Chuyển:</span> <span>Free</span></li>
                                            <li><span>Tổng Tiền:</span> <span><%=tt%>đ</span></li>
                                        </ul>
                                        <div class="cart-btn mt-100">
                                            <a href="checkout.jsp" class="btn amado-btn w-100">Thanh Toán</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /store products -->

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
                                <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa-brands fa-instagram"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa-brands fa-pinterest"></i></a>
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