<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Random" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<jsp:useBean id="cart" class="vn.edu.hcmuaf.ttt.model.Cart" scope="session"/>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Drill Technology</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css1/slick.css"/>
    <link type="text/css" rel="stylesheet" href="css1/slick-theme.css"/>
    <%--    drop--%>
    <link type="text/css" rel="stylesheet" href="css1/sty.css"/>
    <script defer src="js/dro.js"></script>

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
<%--vnp--%>
    <link href="/assets/bootstrap.min.css" rel="stylesheet"/>
    <!-- Custom styles for this template -->
    <link href="/assets/jumbotron-narrow.css" rel="stylesheet">
    <script src="/assets/jquery-1.11.3.min.js"></script>
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
                <div class="dropdown">
                    <div style="cursor: pointer"><li><a href="/lichsu"><i class="fa fa-user-o"></i>Chào bạn: <%= auth.getUser_fullname()%><i class="fa fa-caret-down" style="color:#f0e2ff;"></i></a></li></div>
                    <div class="dropdown-content">
                        <a href="userInfo.jsp">Thông tin tài khoản</a>
                        <a href="uadateInfo.jsp">Cập nhật tài khoản</a>
                        <a href="/lichsu">Đơn mua</a>
                        <a href="/logOut" >Đăng xuất</a>
                    </div>
                </div>

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
                            <img src="img/Logo250px.png" alt="">
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
                    <li><a href="#">Trang Chủ</a></li>
                    <li class="active">Thanh Toán</li>
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
            <form action="/doHoaDon"  method="post" class="row">
<%--                <form   action="/ajaxServlet" id="frmCreateOrder" method="post" class="row">--%>

                <div class="col-md-7">
                    <!-- Billing Details -->
                    <div class="billing-details">
                        <div class="section-title">
                            <h3 class="title">Thông tin giao hàng</h3>
                        </div>

                        <% if (auth == null) { %>
                        <input class="input" name="userID" style="display: none" value="1" type="text">
                        <% } else {%>
                        <input class="input" name="userID" style="display: none" value="<%= auth.getUser_id()%>"
                               type="text">
                        <% } %>

                        <div class="form-group">
                            <input class="input" type="text" name="fullName" placeholder="Họ và Tên">
                        </div>
                        <%--                        <div class="form-group">--%>
                        <%--                            <input class="input" type="text" name="last-name" placeholder="Tên">--%>
                        <%--                        </div>--%>
                        <div class="form-group">
                            <input class="input" type="email" name="email" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <input class="input" type="tel" name="tel" placeholder="Điện Thoại">
                        </div>

                        <!-- <div class="form-group">
                            <input class="input" type="text" name="country" placeholder="Quốc Gia">
                        </div> -->
                        <!-- <div class="form-group">
                            <input class="input" type="text" name="zip-code" placeholder="ZIP Code">
                        </div> -->

                        <div class="form-group">
                            <div class="input-checkbox">
                                <input type="checkbox" id="create-account">

                                <div class="caption">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                        incididunt.
                                    </p>
                                    <input class="input" type="password" name="password"
                                           placeholder="Enter Your Password">
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
                        <%--                        <div class="input-checkbox">--%>
                        <%--                            <input type="checkbox" id="shiping-address">--%>
                        <%--                            <label for="shiping-address">--%>
                        <%--                                <span></span>--%>
                        <%--                                ĐỊA CHỈ GIAO HÀNG--%>
                        <%--                            </label>--%>
                        <%--                            <div class="caption">--%>
                        <%--                                <div class="form-group">--%>
                        <%--                                    <input class="input" type="text" name="first-name" placeholder="Họ Và Tên">--%>
                        <%--                                </div>--%>
                        <%--                                <!-- <div class="form-group">--%>
                        <%--                                    <input class="input" type="text" name="last-name" placeholder="Last Name">--%>
                        <%--                                </div> -->--%>
                        <%--                                <div class="form-group">--%>
                        <%--                                    <input class="input" type="email" name="email" placeholder="Email">--%>
                        <%--                                </div>--%>
                        <%--                                <div class="form-group">--%>
                        <%--                                    <input class="input" type="text" name="address" placeholder="Địa Chỉ">--%>
                        <%--                                </div>--%>
                        <%--                                <div class="form-group">--%>
                        <%--                                    <input class="input" type="text" name="city" placeholder="Thành Phố">--%>
                        <%--                                </div>--%>
                        <%--                                <!-- <div class="form-group">--%>
                        <%--                                    <input class="input" type="text" name="country" placeholder="Quốc Gia">--%>
                        <%--                                </div> -->--%>
                        <%--                                <!-- <div class="form-group">--%>
                        <%--                                    <input class="input" type="text" name="zip-code" placeholder="ZIP Code">--%>
                        <%--                                </div> -->--%>
                        <%--                                <div class="form-group">--%>
                        <%--                                    <input class="input" type="tel" name="tel" placeholder="Điện Thoại">--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>


                        <div class="form-group">
                            <%--                            <input class="input" type="text" name="city" placeholder="Thành Phố/Tỉnh">--%>
                            <select name="city" class="input" id="province">
                                <option value="">Thành Phố/Tỉnh</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <%--                            <input class="input" type="text" name="dis" placeholder="Quận/Huyuện">--%>
                            <select name="dis" class="input" id="district">
                                <option value="">Quận/Huyuện</option>
                            </select>

                        </div>
                        <div class="form-group">
                            <%--                            <input class="input" type="text" name="wa" placeholder="Phường/xã">--%>
                            <select name="wa" class="input" id="ward">
                                <option value="">Phường/xã</option>
                            </select>

                        </div>


                    </div>
                    <!-- /Shiping Details -->

                    <!-- Order notes -->
                    <div class="order-notes">
                        <textarea class="input" name="note" placeholder="Ghi chú khác"></textarea>
                    </div>
                    <!-- /Order notes -->
                </div>

                <!-- Order Details -->

                <div class="col-md-5 order-details">

                    <div class="section-title text-center">
                        <h3 class="title">Hóa Đơn</h3>
                    </div>
                    <% Random r = new Random();
                        int soHD = r.nextInt(10000);
                    %>
                    <input class="input" name="soHD" style="display: none" value="<%=soHD%>" type="text">

                    <div class="order-summary">

                        <div class="order-col">
                            <div><strong>SẢN PHẨM</strong></div>
                            <div><strong>Số lượng</strong></div>
                            <div><strong>Giá</strong></div>
                        </div>


                        <%
                            Cart cartt = (Cart) session.getAttribute("cart");
                            int tongtien = 0;
                            int i = 0;
                        %>
                        <%
                            for (Product c : cartt.getListproduct()) {
                                tongtien += (c.getPrice() * c.getQuantily());
                                i++;
                        %>
                        <%
                            Locale locale = new Locale("vi");
                            NumberFormat format = NumberFormat.getCurrencyInstance(locale);
                            String tn = format.format(c.getPrice() * c.getQuantily()).split(",")[0];
                        %>
                        <div class="order-products">
                            <div class="order-col pro-col" >
                                <div><%=c.getName()%>
                                </div>
                                <div class="pro-col-num">x <%=c.getQuantily()%>
                                </div>
                                <div><%=tn%>đ</div>
                            </div>
                        </div>
                        <input class="input" name="id<%=i%>" style="display: none" value="<%=c.getId()%>" type="text">
                        <input class="input" name="gia<%=i%>" style="display: none"
                               value="<%=c.getPrice()*c.getQuantily()%>" type="text">
                        <input class="input" name="nameSP<%=i%>" style="display: none" value="<%=c.getName()%>"
                               type="text">
                        <input class="input" name="soLuong<%=i%>" style="display: none" value="<%=c.getQuantily()%>"
                               type="text">
                        <input class="input" name="id<%=i%>" style="display: none" value="<%=c.getId()%>" type="text">
                        <% Date currentDate = Date.valueOf(LocalDate.now()); %>

                        <input class="date" name="dateComment" style="display: none" value="<%=currentDate.toString()%>"
                               type="text">

                        <%}%>
                        <% discount discount = (discount) session.getAttribute("discount");%>
                        <input class="input" name="countSP" style="display: none"
                               value="<%=cartt.getListproduct().size()%>" type="number">
                        <div class="order-col">
                            <div>Phí giao hàng</div>
                            <div><strong id="price-logistic">----</strong></div>
                            <input type="hidden" id="price-logistic-total" name="price-logistic" value="">
                            <input type="text"style="display: none" id="price-logistic" name="price-logistic" value="">
                        </div>
                        <div class="order-col">
                            <div>ước lượng thời gian giao hàng: </div>
                            <div><strong id="time-logistic">----</strong></div>
                            <input type="hidden" id="time-logistic-total" name="time-logistic" value="">
                        </div>
<%--                        <p id ="time_logistic_p">Ước lượng thời gian:--%>
<%--                            <span id ="time_logistic"></span>--%>


                        <%if (discount != null) {%>
                        <div class="order-col">
                            <div>Đã áp dụng mã giảm giá <%=discount.getReduce()%>
                            </div>
                            <input class="date" style="display: none" name="reduceSesstion"
                                   value="<%=discount.getReduce()%>" type="text">

                            <%
                                Locale locale = new Locale("vi");
                                NumberFormat format = NumberFormat.getCurrencyInstance(locale);
                                String reduPrice = format.format(discount.getReducedPrice()).split(",")[0];
                            %>
                            <div><strong>-<%=reduPrice%>
                                <input type="text" style="display: none" name="discountFee" value="<%=discount.getReducedPrice()%>">
                            </strong></div>
                        </div>
                        <div class="order-col">
                            <div><strong>TỔNG</strong></div>
                            <% int tonggia = (int) (tongtien - discount.getReducedPrice());%>
                            <%
                                Locale local = new Locale("vi");
                                NumberFormat forma = NumberFormat.getCurrencyInstance(local);
                                String tt = forma.format(tonggia).split(",")[0];
                            %>

                            <div><strong class="order-total" id="price-total-display"><%=tt %>
                            </strong></div>

                            <input class="input" name="tongTien" id="price-total-format" style="display: none" value="<%=tt%>đ" type="text">

                            <input class="input" id="price-total" name="totalprice" value="<%=tonggia%>" type="hidden">

                        </div>
                        <%
                            // Lấy đối tượng HttpSession từ request
                            HttpSession sessionm = request.getSession();
                            // Lưu giá trị vào session
                            int price = tonggia;
                            sessionm.setAttribute("price", price);
                        %>
                        <%} else {%>
                        <%--                        <div class="order-col">--%>
                        <%--                            <div>Nhập mã giảm giá</div>--%>
                        <%--                            <input class="input" type="text" name="enter_dis" placeholder="Nhập mã giảm giá">--%>
                        <%--                            <button type="submit" name="action" class="primary-btn order-submit" value="apply">Áp dụng</button>--%>
                        <%--                        </div>--%>
                        <div class="order-col">
                            <input class="date" style="display: none" name="reduceSesstion" value="null" type="text">
                            <div><strong>TỔNG</strong></div>
                            <%
                                Locale local = new Locale("vi");
                                NumberFormat forma = NumberFormat.getCurrencyInstance(local);
                                String tt = forma.format(tongtien).split(",")[0];
                            %>
                            <input type="text" style="display: none" name="discountFee" value="0">

                            <div><strong class="order-total" id="price-total-display"><%=tt %>
                            </strong></div>

                            <input class="input" name="tongTien" id="price-total-format" style="display: none" value="<%=tt%>đ" type="text">
                            <input class="input" id="price-total"  name="totalprice" value="<%=tongtien%>" type="hidden">
<%--                            <% double dototalprice = tongtien;--%>
<%--                            int totalprice= (int) dototalprice;--%>
<%--                            %>--%>


                        </div>
                        <%
                            // Lấy đối tượng HttpSession từ request
                            HttpSession sessionm = request.getSession();

                            // Lưu giá trị vào session
                            int price = tongtien;

                            sessionm.setAttribute("price", price);


                        %>
                        <%}%>
                        <%
                            int length = 5; // Độ dài chuỗi mong muốn
                            String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"; // Các ký tự có thể xuất hiện trong chuỗi
                            Random rnd = new Random();

                            StringBuilder sb = new StringBuilder(length);
                            for (int j = 0; j < length; j++) {
                                sb.append(characters.charAt(rnd.nextInt(characters.length())));
                            }
                            String randomString = sb.toString();
                        %>
                        <%if (tongtien > 10000000) {%>
                        <li><span>Tặng bạn mã giảm giá 1000k: </span> <span><%=randomString%></span></li>
                        <input class="date" style="display: none" name="reduce" value="<%=randomString%>" type="text">
                        <input class="date" style="display: none" name="name_dis" value="ma1000k" type="text">
                        <input class="date" style="display: none" name="reducedPrice" value="1000000" type="text">
                        <%} else if (tongtien > 5000000) {%>
                        <li><span>Tặng bạn mã giảm giá 500k: </span> <span><%=randomString%></span></li>
                        <input class="date" style="display: none" name="reduce" value="<%=randomString%>" type="text">
                        <input class="date" style="display: none" name="name_dis" value="ma500k" type="text">
                        <input class="date" style="display: none" name="reducedPrice" value="500000" type="text">
                        <%} else if (tongtien > 3000000) {%>
                        <li><span>Tặng bạn mã giảm giá 100k: </span> <span><%=randomString%></span></li>
                        <input class="date" style="display: none" name="reduce" value="<%=randomString%>" type="text">
                        <input class="date" style="display: none" name="name_dis" value="ma100k" type="text">
                        <input class="date" style="display: none" name="reducedPrice" value="100000" type="text">
                        <%} else {%>
                        <li><span>Hãy mua tổng giá sản phẩm trên 3.000.000 đ để được tặng mã giảm giá </span></li>
                        <input class="date" name="reduce" style="display: none" value="<%=randomString%>" type="text">
                        <input class="date" name="name_dis" style="display: none" value="null" type="text">
                        <input class="date" name="reducedPrice" style="display: none" value="0" type="text">

                        <%}%>


                    </div>
                    <div class="payment-method">
                        <div class="input-radio">

                            <input type="radio" name="payment" id="payment-1" onclick="handleRadioSelection(this.value)" value="2">
                            <label for="payment-1">
                                <span></span>
                                Chuyển khoản trực tiếp
                            </label>
                            <div class="caption">
<%--                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor--%>
<%--                                    incididunt ut labore et dolore magna aliqua.</p>--%>
<%--                           <a href="/vnpay_pay.jsp"><p>Giao dịch thanh toán</p></a>--%>
<%--    <form action="/ajaxServlet" id="frmCreateOrder" method="post">--%>
        <div class="form-group">

            <input style="display: none" class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" name="amount" type="number" value="100000" />
        </div>

        <div class="form-group">

            <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">
            <label for="bankCode">Thanh Toán qua VNPAY</label><br>



        </div>
<%--    </form>--%>



                            </div>
                        </div>
                        <!-- <div class="input-radio">
                            <input type="radio" name="payment" id="payment-2">
                            <label for="payment-2">
                                <span></span>
                                Thanh toán séc
                            </label>
                            <div class="caption">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna aliqua.</p>
                            </div>
                        </div> -->
                        <div class="input-radio">
                            <input type="radio" name="payment" id="payment-3" onclick="handleRadioSelection(this.value)" value="1">
                            <label for="payment-3">
                                <span></span>
                                Sau khi giao hàng
                            </label>
                            <div class="caption">
<%--                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor--%>
<%--                                    incididunt ut labore et dolore magna aliqua.</p>--%>
                                <p>
                                    Phí thu hộ: ₫0 VNĐ. Ưu đãi về phí vận chuyển (nếu có) áp dụng cả với phí thu hộ.</p>
                            </div>
                        </div>
                    </div>

                    <%--                    <a href="#" class="primary-btn order-submit">Đặt hàng</a>--%>

                    <%--                  --%>

                    <button type="submit" name="action" class="primary-btn order-submit" value="submit">Đặt hàng
                    </button>
                    <div class="input-checkbox">
                        <input type="checkbox" id="terms">
                        <label for="terms">
                            <span></span>
                            Bạn đọc rõ và chấp nhận <a href="#">Điều khoản và điều kiện</a>
                        </label>

                    </div>
                </div>
                <%--                <input class="date" name="soHD" style="display: none" value="<%=soHD.getSoHD()%>" type="text">--%>
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
                                <a target="_blank"
                                   href="https://www.google.com/maps/place/C%C3%B4ng+ty+Cu%E1%BB%99c+S%E1%BB%91ng+Xanh+(GLAB)/@10.8712764,106.7891868,17z/data=!4m12!1m6!3m5!1s0x3175276398969f7b:0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRwLiBI4buTIENow60gTWluaA!8m2!3d10.8712764!4d106.7917617!3m4!1s0x3174d89ddbf832ab:0xedd62ee42a254940!8m2!3d10.8730978!4d106.787919"><i
                                        class="fa fa-map-marker"></i>TP.Hồ Chí Minh</a>
                            </li>
                            <li><a href="tel:0929831012"><i class="fa fa-phone"></i>0929831012</a></li>
                            <li><a href="mailto: abc@example.com"><i class="fa fa-envelope-o"></i>DH20DT@email.com</a>
                            </li>
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
    document.addEventListener('DOMContentLoaded', function () {
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.26.1/axios.min.js"
        integrity="sha512-bPh3uwgU5qEMipS/VOmRqynnMXGGSRv+72H/N260MQeXZIK4PG48401Bsby9Nq5P5fz7hy5UGNmC/W1Z51h2GQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
    jQuery(function () {
        const province = $('#province');
        const procol = $('.pro-col');
        var numberProduct = 0;
        console.log( Array.from(procol.children()))
        const arr =  Array.from(procol.children())
        arr.map((col,index)=>{
            if (col.className === 'pro-col-num'){
                const texts = col.innerText
                const number = parseInt(texts.split(' ')[1])
                numberProduct+= number
            }
        })

console.log(numberProduct)
        const callAPI = async ()=> {
            await fetch('http://140.238.54.136/api/auth/login', {
                method: "POST", // *GET, POST, PUT, DELETE, etc.
                mode: "cors", // no-cors, *cors, same-origin
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(
                    {
                        email: 'fox@1234',
                        password: '123456'
                    }
                )
            })
                .then((response) => {
                    return response.json()
                })
                .then((data) => {
                    const accessToken = data.access_token
                    localStorage.setItem('accessToken', accessToken)
                })
            await fetch('http://140.238.54.136/api/province', {
                method: "GET", // *GET, POST, PUT, DELETE, etc.
                mode: "cors", // no-cors, *cors, same-origin
                headers: {
                    "Authorization": "Bearer " + localStorage.getItem('accessToken'),
                },
            })
                .then((response) => {
                    return response.json()
                })
                .then((data) => {
                    let proviceDatas = data.original.data;
                    province.append(`<option value="" >--Chọn--</option>`)

                    proviceDatas.map((p, index) => {
                        province.append(`<option value="` + p.ProvinceName + `" id="` + p.ProvinceID + `">` + p.ProvinceName + `</option>`)
                    })
                })

            const district = $('#district')
            province.on('change', async function (e) {
                district.empty();
                var idValueSelected = $(this).children(":selected").attr("id");
                // console.log(idValueSelected)
                await fetch('http://140.238.54.136/api/district' + "?provinceID=" + idValueSelected, {
                    method: "GET", // *GET, POST, PUT, DELETE, etc.
                    mode: "cors", // no-cors, *cors, same-origin
                    headers: {
                        "Authorization": "Bearer " + localStorage.getItem('accessToken'),
                    },
                })
                    .then((response) => {
                        return response.json()
                    })
                    .then((data) => {
                        let districtDatas = data.original.data;
                        district.append(`<option value="" >--Chọn--</option>`)
                        districtDatas.map((d, index) => {
                            district.append(`<option value="` + d.DistrictName + `" id="` + d.DistrictID + `">` + d.DistrictName + `</option>`)
                        })
                    })
            })


//--------------------------//
            const ward = $('#ward')
            district.on('change', async function (e) {
                ward.empty();
                var idValueSelected = $(this).children(":selected").attr("id");
                // console.log(idValueSelected)
                await fetch('http://140.238.54.136/api/ward' + "?districtID=" + idValueSelected, {
                    method: "GET", // *GET, POST, PUT, DELETE, etc.
                    mode: "cors", // no-cors, *cors, same-origin
                    headers: {
                        "Authorization": "Bearer " + localStorage.getItem('accessToken'),
                    },
                })
                    .then((response) => {
                        return response.json()
                    })
                    .then((data) => {
                        let wardDatas = data.original.data;
                        ward.append(`<option value="" >--Chọn--</option>`)
                        wardDatas.map((w, index) => {
                            ward.append(`<option value="` + w.WardName + `" id="` + w.WardCode + `">` + w.WardName + `</option>`)
                        })
                    })
            })

            //---------------//
            var idWardFrom = 90737;
            var idDistrictFrom = 3695;
            const sizeM = {
                height: 20,
                width: 15,
                length: 20,
                weight: 1500
            }


            ward.on('change', async function (e) {
                let idWardValueSelected = $(this).children(":selected").attr("id");
                let idDistrictValueSelected = district.children(":selected").attr("id");
                var details = {
                    'from_district_id': idDistrictFrom,
                    'from_ward_id': idWardFrom,
                    'to_district_id': idDistrictValueSelected,
                    'to_ward_id': idWardValueSelected,
                    'height': (sizeM.height * numberProduct),
                    'length': (sizeM.length * numberProduct) ,
                    'width': (sizeM.width * numberProduct) ,
                    'weight': (sizeM.weight * numberProduct)
                };


                var formBody = [];
                for (var property in details) {
                    var encodedKey = encodeURIComponent(property);
                    var encodedValue = encodeURIComponent(details[property]);
                    formBody.push(encodedKey + "=" + encodedValue);
                }
                formBody = formBody.join("&");
                // get fee logistic
                await fetch('http://140.238.54.136/api/calculateFee', {
                    method: "POST", // *GET, POST, PUT, DELETE, etc.
                    // mode: "cors",
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
                        "Authorization": "Bearer "+localStorage.getItem('accessToken'),
                    },body: formBody
                })
                    .then((response) => {
                        return response.json()
                    })
                    .then((datas) => {
                        let moneyLogistic =  datas.data[0].service_fee;
                        const price_logistic_p = document.getElementById('price-logistic')

                        const price_logistic_input_format = document.getElementById('price-total-format')
                        const price_logistic_input = document.getElementById('price-total')
                        const beforePrice = parseFloat(price_logistic_input.value)
                        const priceTotalFormat = beforePrice + parseFloat(moneyLogistic)
                        console.log(priceTotalFormat)
                        const price_logistic_display = document.getElementById('price-total-display')
                        price_logistic_input_format.value = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(priceTotalFormat)
                        price_logistic_display.innerText = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(priceTotalFormat)
                        const price_logistic_total = document.getElementById('price-logistic-total')
                        price_logistic_total.value = moneyLogistic
                        price_logistic_p.innerText = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(moneyLogistic)

                    })

                //get time logistic
                await fetch('http://140.238.54.136/api/leadTime', {
                    method: "POST", // *GET, POST, PUT, DELETE, etc.
                    // mode: "cors",
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
                        "Authorization": "Bearer "+localStorage.getItem('accessToken'),
                    },body: formBody
                })
                    .then((response) => {
                        return response.json()
                    })
                    .then((datas) => {
                         let timeLogistic =  datas.data[0].timestamp;
                        const date = new Date(parseInt(timeLogistic) * 1000);
                        const time_logistic_p = document.getElementById('time-logistic')
                        const time_logistic_total = document.getElementById('time-logistic-total')
                        time_logistic_total.value = timeLogistic
                        console.log(datas);
                         time_logistic_p.innerText = date.toLocaleTimeString('vi-VN', {hour12: true})+", "+ date.toLocaleDateString('vi-VN');
                    })
            });
        }
        callAPI()

    })
</script>
<%--vnpay--%>
<link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
<script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
<script type="text/javascript">
    $("#frmCreateOrder").submit(function () {
        var postData = $("#frmCreateOrder").serialize();
        var submitUrl = $("#frmCreateOrder").attr("action");
        $.ajax({
            type: "POST",
            url: submitUrl,
            data: postData,
            dataType: 'JSON',
            success: function (x) {
                if (x.code === '00') {
                    if (window.vnpay) {
                        vnpay.open({width: 768, height: 600, url: x.data});
                    } else {
                        location.href = x.data;
                    }
                    return false;
                } else {
                    alert(x.Message);
                }
            }
        });
        return false;
    });
</script>

<%--radio--%>
<script>
    var selectedRadioId = null;

    function handleRadioSelection(radioId) {
        selectedRadioId = radioId;
        console.log("Selected radio ID: " + selectedRadioId);
    }

    document.getElementById("paymentForm").addEventListener("submit", function (event) {
        event.preventDefault(); // Ngăn chặn submit form mặc định

        if (selectedRadioId !== null) {
            var input = document.createElement("input");
            input.setAttribute("type", "hidden");
            input.setAttribute("name", "selectedRadioId");
            input.setAttribute("value", selectedRadioId);
            this.appendChild(input);
        }

        this.submit(); // Gửi form đến servlet
    });
</script>
</body>

</html>