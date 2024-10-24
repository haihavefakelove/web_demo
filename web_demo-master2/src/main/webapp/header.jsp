<%@ page import="model.khachHang" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 20/08/2024
  Time: 11:28 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<style>
    .input_search {
        width: 500px;
        height: 50px;
    }


</style>
<%
    khachHang kh = (khachHang) request.getSession().getAttribute("khachHang");
%>
<%
    String baoLoi = request.getAttribute("baoLoi") + "";
    baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;
    String cl = request.getAttribute("cl") + "";
    if (!cl.equals("green")) cl = "red";
%>
<link rel="stylesheet" href="css/font/fontawesome-free-6.4.0-web/css/all.min.css">
<link rel="stylesheet" href="<%=url%>/css/main.css">
<nav class="navbar navbar-expand-lg bg-body-tertiary padding-background">
    <div class="container-fluid background-header">
        <a class="navbar-brand" href="<%=url%>/index.jsp">
            <img src="http://localhost:8080/bookStores/img/White%20Black%20Minimalist%20Brand%20Logo.png"
                 alt="Bootstrap" height="80">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=url%>/index.jsp">Trang Chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="font-weight: 400; color: var(--text-color)">Combo giảm giá</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Các Loại
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Sách Mới</a></li>
                        <li><a class="dropdown-item" href="#">Sách Cũ</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">any else</a></li>
                    </ul>
                </li>
            </ul>
            <form action="<%=url%>/products-information?hd=search-product" method="post" class="d-flex " role="search">
                <input class="form-control me-2 input_search" type="search"
                       name="search" placeholder="Nội dung tìm kiếm" aria-label="Search">
                <button class="btn btn-outline-success btn-background" type="submit">search</button>
            </form>
            <div class="ms-auto d-flex align-items-center">
                <div class="me-3">
                    <a href="<%=url%>/product/cart.jsp" class="btn btn-outline-light">
                        <i class="fa fa-shopping-cart"></i> Giỏ hàng
                    </a>
                </div>
                <%
                    Object obj = session.getAttribute("khachHang");
                    khachHang khachHang = null;
                    if (obj != null)
                        khachHang = (khachHang) obj;

                    if (khachHang == null) {
                %>
                <a class="btn btn-primary" style="white-space: nowrap;" href="khachhang/dangnhap.jsp">
                    Đăng nhập
                </a>
                <% } else { %>
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 bg-infor ">
                    <li class="nav-item dropdown dropstart">
                        <a class="nav-link dropdown-toggle background-taiKhoan" href="#" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false"> <%=kh.getHoVaten()%>
                        </a>
                        <ul class="dropdown-menu">
                            <%
                                if ("admin".equals(khachHang.getVaiTro())) {
                            %>
                            <li><a class="dropdown-item" href="<%=url%>/admin-servlet?active=danh-sach-san-pham1">Danh
                                sách sản phẩm</a></li>
                            <li><a class="dropdown-item" href="<%=url%>/admin/addProducts.jsp">Thêm sản phẩm</a></li>
                            <li><a class="dropdown-item" href="<%=url%>/admin-servlet?active=danh-sach-user">Quản lý
                                người dùng</a></li>
                            <li><a class="dropdown-item" href="<%=url%>/admin-servlet?active=billManagement">Quản lý đơn hàng</a></li>
                            <li><a class="dropdown-item" href="<%=url%>/admin/Revenue.jsp">Doanh thu</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="<%=url%>/khach-hang?hanhDong=sign-out">Thoát tài
                                khoản</a></li>
                            <% } else { %>
                            <li><a class="dropdown-item" href="<%=url%>/khach-hang?hanhDong=mybill">Đơn hàng của tôi</a></li>
                            <li><a class="dropdown-item" href="<%=url%>/khachhang/notify.jsp">Thông báo</a></li>
                       <%--     <li><a class="dropdown-item" href="<%=url%>/khachhang/changeInformation.jsp">Thay đổi thông
                                tin</a></li>--%>
                            <li><a class="dropdown-item" href="<%=url%>/khachhang/updateInformation.jsp"> Cập nhật thông tin
                                </a></li>
                            <li><a class="dropdown-item" href="<%=url%>/khachhang/changePassword.jsp">Đổi mật khẩu</a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="<%=url%>/khach-hang?hanhDong=sign-out">Thoát tài
                                khoản</a></li>
                            <% } %>
                        </ul>
                    </li>
                </ul>
                <% } %>
            </div>
        </div>
    </div>
</nav>