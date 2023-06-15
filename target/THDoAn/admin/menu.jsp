<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item nav-profile">
            <a href="#" class="nav-link">

                <div class="nav-profile-text d-flex flex-column">
                    <% User auth= (User) session.getAttribute("auth");%>
                    <% if(auth==null){ %>
                    <span class="font-weight-bold mb-2">Chưa đăng nhập</span>
                    <% }else {%>
                    <span class="font-weight-bold mb-2"><%= auth.getUser_fullname()%></span>
                    <% } %>
                    <% if (auth.getUser_admin() == 1) { %>
                        <span class="text-secondary text-small">Admin</span>
                    <%}%>
                    <% if (auth.getUser_admin() == 2) { %>
                        <span class="text-secondary text-small">Nhân viên bán hàng</span>
                    <%}%>
                    <% if (auth.getUser_admin() == 3) { %>
                        <span class="text-secondary text-small">Nhân viên đóng gói</span>
                    <%}%>

                </div>
                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
            </a>
        </li>
<%--        //user_admin = 1 là admin => quản lý tất cả trang admin, thăng chức nhân viên, trang thống kê.--%>
<%--        //---------- = 2 là nhân viên bán hàng : chỉ thêm, xóa, sửa sản phẩm, xem doanh thu theo tháng--%>
<%--        // --------- = 3 là nhân viên quản lý đơn hàng: xem trang đơn hàng, xác nhận, hủy đơn--%>

        <% if(auth.getUser_admin() == 1){%>
        <li class="nav-item">
            <a class="nav-link" href="/IndexAdmin">
                <span class="menu-title">Trang chủ</span>
                <i class="mdi mdi-home menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/OrderList">
                <span class="menu-title">Quản lý đơn hàng</span>
                <i class="mdi mdi-crosshairs-gps menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/ProAdmin">
                <span class="menu-title">Quản lý sản phẩm</span>
                <i class="mdi mdi-format-list-bulleted menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/HidenProductList">
                <span class="menu-title">Sản phẩm đã ẩn</span>
                <i class="mdi mdi-format-list-bulleted menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-title">Quản lý người dùng</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-crosshairs-gps menu-icon"></i>
            </a>
            <div class="collapse" id="ui-basic" style="">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="/UserList">Danh sách người dùng</a></li>
                    <li class="nav-item"> <a class="nav-link" href="/UserLockList">Người dùng bị khóa</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/StaffList">
                <span class="menu-title">Quản lý nhân viên</span>
                <i class="mdi mdi-chart-bar menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/DiscoutList">
                <span class="menu-title">Quản lý mã giảm giá</span>
                <i class="mdi mdi-table-large menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/statisticsServlet">
                <span class="menu-title">Thống kê</span>
                <i class="mdi mdi-table-large menu-icon"></i>
            </a>
        </li>

        <li class="nav-item sidebar-actions">
                        <span class="nav-link">
              </span>
        </li>
        <% } %>
        <% if(auth.getUser_admin() == 2){%>
        <li class="nav-item">
            <a class="nav-link" href="/IndexAdmin">
                <span class="menu-title">Trang chủ</span>
                <i class="mdi mdi-home menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/ProAdmin">
                <span class="menu-title">Quản lý sản phẩm</span>
                <i class="mdi mdi-format-list-bulleted menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/HidenProductList">
                <span class="menu-title">Danh sách sản phẩm đã ẩn</span>
                <i class="mdi mdi-format-list-bulleted menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/OrderList">
                <span class="menu-title">Quản lý đơn hàng</span>
                <i class="mdi mdi-crosshairs-gps menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/DiscoutList">
                <span class="menu-title">Quản lý mã giảm giá</span>
                <i class="mdi mdi-table-large menu-icon"></i>
            </a>
        </li>
        <li class="nav-item sidebar-actions">
                        <span class="nav-link">
              </span>
        </li>
        <% } %>
        <% if(auth.getUser_admin() == 3){%>
        <li class="nav-item">
            <a class="nav-link" href="/IndexAdmin">
                <span class="menu-title">Trang chủ</span>
                <i class="mdi mdi-home menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/OrderList">
                <span class="menu-title">Quản lý đơn hàng</span>
                <i class="mdi mdi-crosshairs-gps menu-icon"></i>
            </a>
        </li>

        <li class="nav-item sidebar-actions">
                        <span class="nav-link">
              </span>
        </li>
        <% } %>

    </ul>
</nav>