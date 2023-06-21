<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page import="vn.edu.hcmuaf.ttt.model.hoaDon" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>


<head>
    <meta http-equiv="Content-Type" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Drill Technology</title>

    <link rel="shortcut icon" href="admin/assets/images/favicon.ico" />

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css1/bootstrap.min.css" />
    <!-- <link rel="stylesheet" href="css1/bootstrap.min.css"> -->

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css1/slick.css" />
    <link type="text/css" rel="stylesheet" href="css1/slick-theme.css" />

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css1/nouislider.min.css" />

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css1/font-awesome.min.css">
    <%--    drop--%>
    <link type="text/css" rel="stylesheet" href="css1/sty.css" />
    <script defer src="js/dro.js"></script>

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css1/style.css" />
    <link type="text/css" rel="stylesheet" href="css1/style_ab.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css1/font-awesome.min.css">

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
<%--    css cho bnt xuất hóa đơn--%>
    <style>
        .btn {
            background-color: #ffffff;
            border: none;
            color: #d10024;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
            transition: all 0.3s ease-in-out;
            border: 2px solid #d10024;
        }

        .btn:hover {
            color: white;
            background-color: #d10024;
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.93);
        }

        .fa:hover {
            color: white;
        }

    </style>
<%--    --%>
    <style type="text/css">
        .containerr {
            margin: auto;
            width: 600px;
            padding: 20px;
            border: 1px solid #ddd;
            font-family: Arial, sans-serif;
        }
        h1 {
            text-align: center;
        }
        .invoice-infoo {
            margin-bottom: 20px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }
        .invoice-infoo h2 {
            margin-top: 0;
            margin-bottom: 5px;
        }
        .invoice-infoo p {
            margin: 0;
            font-size: 14px;
            line-height: 1.5;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tfoot td {
            padding: 10px;
            font-weight: bold;
            text-align: right;
        }
    </style>

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
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
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
                    <div style="cursor: pointer"><li><a target=""><i class="fa fa-user-o"></i>Chào bạn: <%= auth.getUser_fullname()%><i class="fa fa-caret-down" style="color:#f0e2ff;"></i></a></li></div>
                    <div class="dropdown-content">
                        <a href="userInfo.jsp">Thông tin tài khoản</a>
                        <a href="uadateInfo.jsp">Cập nhật tài khoản</a>
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
                    <li><a href="/">Trang chủ</a></li>
                    <li><a href="#">Đặt hàng thành công</a></li>





                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->

<!-- container -->

<!-- row -->

<div class="container" id="container">


    <h1 style="color: #1bce3a;"><i class="fa fa-check" aria-hidden="true"></i>Đặt hàng thành công</h1>
<%--    <% hoaDon h = (hoaDon) request.getAttribute("infoCus");%>--%>
<%--    <%int sohd = (int) session.getAttribute("sohdd");%>--%>
<%--    <div><%=sohd%></div>--%>
<%--    <div>x<%=h.getDistrict()%></div>--%>
<%--    <div><%=h.getHoVaTen()%></div>--%>
<%--    <div>x<%=h.getNgayTaoHD()%></div>--%>
<%--    <div><%=h.getWard()%></div>--%>

<%--        <% List<hoaDon> listhh = (List<hoaDon>) request.getAttribute("detailsHD");--%>
<%--            int total = 0 ;--%>
<%--        %>--%>


<%--        <%  for (hoaDon hh:listhh) {--%>
<%--            String s = hh.getToongGia();--%>
<%--            int i = Integer.parseInt(s);--%>

<%--            total+=i;--%>
<%--        %>--%>
<%--        <%--%>
<%--            Locale locale = new Locale("vi");--%>
<%--            NumberFormat format = NumberFormat.getCurrencyInstance(locale);--%>
<%--            String gia = format.format(i).split(",")[0];--%>
<%--        %>--%>
<%--        <div class="order-col" >--%>
<%--            <div><%=hh.getTenSp()%></div>--%>
<%--            <div>x<%=hh.getSoLuong()%></div>--%>
<%--            <div><%=gia%> đ</div>--%>

<%--        </div>--%>
<%--        <%}%>--%>
<%--    </div>--%>
<%--    <div class="order-col">--%>
<%--        <div>Phí giao hàng</div>--%>
<%--        <div><strong>MIỄN PHÍ</strong></div>--%>
<%--    </div>--%>
<%--    <div class="order-col">--%>
<%--        <%Locale locale = new Locale("vi");--%>
<%--            NumberFormat format = NumberFormat.getCurrencyInstance(locale);--%>
<%--            String tn = format.format(total).split(",")[0];--%>
<%--        %>--%>
<%--        <div><strong>TỔNG GÍA TRỊ ĐƠN HÀNG</strong></div>--%>
<%--        <div><strong><%=tn%> đ </strong></div>--%>
    <form method="post" action="Savepdf">
    <% hoaDon h = (hoaDon) request.getAttribute("infoCus");%>
    <%int sohd = (int) session.getAttribute("sohdd");%>
    <div class="containerr">
        <h1>Hóa đơn</h1>
        <p><strong>Số hóa đơn:</strong> <%=sohd%></p>

        <div class="invoice-infoo">
            <h2>Thông tin khách hàng</h2>
            <p><strong>Tên:</strong> <%=h.getHoVaTen()%></p>
            <p><strong>Email:</strong> <%=h.getHD_email()%></p>
            <p><strong>SĐT:</strong> <%=h.getHD_sdt()%></p>
            <p><strong>Địa chỉ :</strong> Thành Phố/Tỉnh: <%=h.getCity()%>, Quận/ Huyện: <%=h.getDistrict()%>, Phường/Xã: <%=h.getWard()%></p>
            <p><strong>Ghi chú:</strong> <%=h.getNote()%></p>
            <p><strong>Ngày tạo hóa đơn:</strong> <%=h.getNgayTaoHD()%></p>

            <input class="input" name="soHD"  style="display: none"  value="<%=sohd%>" type="text">


        </div>
        <table>
            <thead>
            <tr>
                <th>Tên Sản Phẩm</th>
                <th>Số lượng</th>
                <th>Giá cả</th>
                <th>Tổng</th>

            </tr>
            </thead>
            <tbody>
            <% List<hoaDon> listhh = (List<hoaDon>) request.getAttribute("detailsHD");
                int total = 0 ;
            %>


            <%  for (hoaDon hh:listhh) {
                String s = hh.getToongGia();
                int i = Integer.parseInt(s);

                total+=i;
            %>
            <%
                Locale locale = new Locale("vi");
                NumberFormat format = NumberFormat.getCurrencyInstance(locale);
                String gia = format.format(i).split(",")[0];
            %>
            <%
                int SL = Integer.parseInt(hh.getSoLuong());
                int giaSL = i / SL;
            %>

            <%
                Locale localer = new Locale("vi");
                NumberFormat formatr = NumberFormat.getCurrencyInstance(localer);
                String giaSLL = formatr.format(giaSL).split(",")[0];
            %>
            <tr>
                <td><%=hh.getTenSp()%></td>
                <td><%=hh.getSoLuong()%></td>
                <td><%=giaSLL%> đ</td>
                <td><%=gia%> đ</td>
            </tr>
<%}%>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="3">Phí giao hàng</td>
                <td>Miễn phí</td>
            </tr>
            <tr>

                <td colspan="3">Phí giảm</td>
                <td>$4.00</td>
            </tr>
            <%Locale localee = new Locale("vi");
                NumberFormat formatt = NumberFormat.getCurrencyInstance(localee);
                String tn = formatt.format(total).split(",")[0];
            %>
            <tr>
                <td colspan="3">Tổng hóa đơn</td>
                <td><%=tn%> đ</td>
            </tr>
            </tfoot>
        </table>
    </div>




        <button class="btn">Lưu hóa đơn bằng PDF <i class="fa fa-file-pdf-o" style="color: #d10024"></i></button>


    </form>



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
                        <button class="newsletter-btn"><i class="fa fa-envelope"></i> Đăng ký</button>
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
                            <li><a href="#"><i class="fa fa-map-marker"></i>TP.Hồ Chí Minh</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>0929831012</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>DH20DT@email.com</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Sản Phảm</h3>
                        <ul class="footer-links">
                            <li><a href="#">Khoan mini</a></li>
                            <li><a href="#">Khoan động lực</a></li>
                            <li><a href="#">Khoan bê tông</a></li>
                            <li><a href="#">Khoan bàn</a></li>
                            <li><a href="#">phụ kiện</a></li>
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
                            <li><a href="#">Tài Khoản Của Tôi</a></li>
                            <li><a href="#">Xem Giỏ Hàng</a></li>
                            <li><a href="#">Danh Sách Yêu Thích</a></li>
                            <li><a href="#">Theo Dõi Đơn Hàng Của Tôi</a></li>
                            <li><a href="#">Hổ Trợ</a></li>
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
                    <span class="copyright">
									<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <!-- Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" >Colorlib</a> -->
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								</span>
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