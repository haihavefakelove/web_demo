<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 13/10/2024
  Time: 11:44 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>notify</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
            crossorigin="anonymous">
    <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/main.css">
</head>
<style>
    html, body {
        height: 100%;
        margin: 0;
        background-color: rgb(248, 249, 250);
    }

    .wrapper {
        min-height: 80%;
        display: flex;
        flex-direction: column;
    }

    footer {
        background-color: #f1f1f1;

    }

    th {
        text-align: center;
    }

    .notification-item {
        border-bottom: 1px solid #eee;
        padding: 10px 0;
    }

    .notification-item:last-child {
        border-bottom: none;
    }

    .user-avatar {
        width: 40px;
        height: 40px;
    }

    .sub-menu {
        list-style: none;
        padding-left: 20px;
    }

    .sub-menu-item {
        padding: 5px 0;
    }

    .sub-menu-item.active, .nav-link.active {
        font-weight: bold;
    }
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container mt-5 wrapper" style="padding-top: 50px">
    <div class="row">
        <!-- Left Sidebar -->
        <div class="col-md-3 bg-light p-3" style="padding-top: 20px; margin-top: 24px; margin-bottom: 0;">
            <div class="d-flex align-items-center mb-4">
                <img src="/api/placeholder/40/40" alt="User Avatar" class="user-avatar rounded-circle me-2">
                <div>
                    <h5 class="mb-0">hoadam487</h5>
                    <a href="#" class="text-decoration-none">Sửa Hồ Sơ</a>
                </div>
            </div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="toggleSubMenu('accountSubMenu')">Tài Khoản Của Tôi</a>
                    <ul id="accountSubMenu" class="sub-menu" style="display: none;">
                        <li class="sub-menu-item"><a href="#" onclick="showContent('accountOverview')">Tài khoản của
                            tôi</a></li>
                        <li class="sub-menu-item"><a href="#" onclick="showContent('address')">Địa chỉ</a></li>
                        <li class="sub-menu-item"><a href="#" onclick="showContent('changePassword')">Đổi mật khẩu</a>
                        </li>
                        <li class="sub-menu-item"><a href="#" onclick="showContent('linkedBank')">Ngân hàng liên kết</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" href="#">Đơn Mua</a></li>
                <li class="nav-item"><a class="nav-link" href="#" onclick="showContent('notifications')">Thông Báo</a>
                </li>
            </ul>
        </div>

        <!-- Main Content Area -->
        <div class="col-md-9 p-3" style="background-color: white">
            <div id="accountOverview" class="content-section" style="display: none;">
                <h3>Tài khoản của tôi</h3>
                <p>Đây là nội dung tổng quan về tài khoản của bạn.</p>
                <!-- Thêm nội dung chi tiết về tài khoản  -->
            </div>
            <div id="address" class="content-section" style="display: none;">
                <h3>Địa chỉ</h3>
                <p>Quản lý địa chỉ giao hàng của bạn.</p>
                <!-- Thêm form quản lý địa chỉ -->
            </div>
            <div id="changePassword" class="content-section" style="display: none;">
                <h3>Đổi mật khẩu</h3>
                <p>Thay đổi mật khẩu tài khoản của bạn.</p>
                <!-- Thêm form đổi mật khẩu -->
            </div>
            <div id="linkedBank" class="content-section" style="display: none;">
                <h3>Ngân hàng liên kết</h3>
                <p>Quản lý tài khoản ngân hàng liên kết của bạn.</p>
                <!-- Thêm thông tin về ngân hàng liên kết-->
            </div>
            <div id="notifications" class="content-section" style="display: none;">
                <h3 style="text-align: center">Thông Báo</h3>
                <div class="notification-list">
                    <div class="notification-item d-flex align-items-center">
                        <img src="/api/placeholder/50/50" alt="Notification Icon" class="me-3">
                        <div>
                            <h5 class="mb-1">Chấp nhận yêu cầu hủy đơn</h5>
                            <p class="mb-1">Yêu cầu hủy đơn hàng của bạn đã được chấp nhận. Đơn hàng 240914VNH5A4T7 đã
                                được hủy thành công.</p>
                            <small class="text-muted">11:24 14-09-2024</small>
                        </div>
                        <a href="#" class="ms-auto btn btn-sm btn-outline-primary">Xem Chi Tiết</a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function toggleSubMenu(id) {
        var subMenu = document.getElementById(id);
        if (subMenu.style.display === "none") {
            subMenu.style.display = "block";
            showContent('accountOverview');
        } else {
            subMenu.style.display = "none";
        }
    }

    function showContent(id) {
        var contents = document.getElementsByClassName('content-section');
        for (var i = 0; i < contents.length; i++) {
            contents[i].style.display = 'none';
        }
        document.getElementById(id).style.display = 'block';

        var menuItems = document.querySelectorAll('.sub-menu-item, .nav-link');
        for (var i = 0; i < menuItems.length; i++) {
            menuItems[i].classList.remove('active');
        }
        event.target.classList.add('active');
    }
</script>
<%@include file="../footer.jsp" %>
</body>
</html>
