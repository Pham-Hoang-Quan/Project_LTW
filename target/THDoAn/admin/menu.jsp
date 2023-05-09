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
                    <span class="text-secondary text-small">Admin</span>
                </div>
                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="http://localhost:8080/THDoAn_war/IndexAdmin">
                <span class="menu-title">Trang chủ</span>
                <i class="mdi mdi-home menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="http://localhost:8080/THDoAn_war/OrderList">
                <span class="menu-title">Quản lý đơn hàng</span>

                <i class="mdi mdi-crosshairs-gps menu-icon"></i>
            </a>

        </li>
        <li class="nav-item">
            <a class="nav-link" href="http://localhost:8080/THDoAn_war/UserList">
                <span class="menu-title">Quản lý người dùng</span>
                <i class="mdi mdi-contacts menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="http://localhost:8080/THDoAn_war/ProAdmin">
                <span class="menu-title">Quản lý sản phẩm</span>
                <i class="mdi mdi-format-list-bulleted menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="http://localhost:8080/THDoAn_war/SliderList">
                <span class="menu-title">Quản lý slider</span>
                <i class="mdi mdi-chart-bar menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="http://localhost:8080/THDoAn_war/CategoryAdmin">
                <span class="menu-title">Quản lý quản danh mục</span>
                <i class="mdi mdi-table-large menu-icon"></i>
            </a>
        </li>

        <li class="nav-item sidebar-actions">
                        <span class="nav-link">
              </span>
        </li>
    </ul>
</nav>