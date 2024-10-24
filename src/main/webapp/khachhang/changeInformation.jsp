<%@ page import="model.khachHang" %>
<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 13/08/2024
  Time: 10:41 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>changeInformation</title>
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
    <style>
        .red {
            color: red;
        }
        html, body {
            height: 100%;
            margin: 0;
        }
        footer {
            background-color: #f1f1f1;

        }
        th{
            text-align: center;
        }
    </style>

    <link rel="stylesheet" href="../css/font/fontawesome-free-6.4.0-web/css/all.min.css">
    <link rel="stylesheet" href="../css/main.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<%
    Object object = session.getAttribute("khachHang");
    khachHang khachhang = null;
    if (object != null)
        khachhang = (khachHang) object;
    if (khachhang == null) {
%>

<h1>Bạn chưa đăng nhập vào hệ thống. Vui lòng quay lại trang chủ!</h1>
<%
} else {
%>
<%
    String baoLoi = request.getParameter("baoLoi") + "";
    baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;

    String hoVaTen = khachhang.getHoVaten();
    String gioiTinh = khachhang.getGioiTinh();
    String ngaySinh = khachhang.getNgaySinh().toString();

    String diaChiKhachHang = khachhang.getDiaChi();

    String diaChiNhanHang = khachhang.getDiaChiNhanHang();

    String dienThoai = khachhang.getSoDienThoai();

    String email = khachhang.getEmail();

    boolean dongYNhanMail = khachhang.isDangKyNhanBangTin();
%>
<% String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
        + request.getContextPath();
%>
<div class="container pt-5">
    <div class="container pt-5">
        <div class="text-center mb-4">
            <h1>THÔNG TIN TÀI KHOẢN</h1>
        </div>

        <div class="red" id="baoLoi" role="alert">
            <%= baoLoi %>
        </div>

        <form class="form" action="<%=url%>/khach-hang" method="post">
            <input type="hidden" name="hanhDong" value="changeInformation">

            <div class="row g-4">
                <div class="col-md-6">
                    <h3>Thông tin khách hàng</h3>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="hoVaTen" name="hoVaTen" placeholder="Họ và tên" value="<%=hoVaTen%>">
                        <label for="hoVaTen">Họ và tên</label>
                    </div>
                    <div class="form-floating mb-3">
                        <select class="form-select" id="gioiTinh" name="gioiTinh">
                            <option value="" disabled selected>Chọn giới tính</option>
                            <option value="Nam" <%=(gioiTinh.equals("Nam")) ? "selected" : "" %>>Nam</option>
                            <option value="Nữ" <%=(gioiTinh.equals("Nữ")) ? "selected" : "" %>>Nữ</option>
                            <option value="Khác" <%=(gioiTinh.equals("Khác")) ? "selected" : "" %>>Khác</option>
                        </select>
                        <label for="gioiTinh">Giới Tính</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" id="ngaySinh" name="ngaySinh" value="<%=ngaySinh%>">
                        <label for="ngaySinh">Ngày sinh</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="tel" class="form-control" id="dienThoai" name="dienThoai" placeholder="Điện thoại" value="<%=dienThoai%>">
                        <label for="dienThoai">Điện thoại</label>
                    </div>
                </div>

                <div class="col-md-6">
                    <h3>Địa chỉ</h3>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="diaChiKhachHang" name="diaChiKhachHang" placeholder="Địa chỉ khách hàng" value="<%=diaChiKhachHang%>">
                        <label for="diaChiKhachHang">Địa chỉ khách hàng</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="diaChiNhanHang" name="diaChiNhanHang" placeholder="Địa chỉ nhận hàng" value="<%=diaChiNhanHang%>">
                        <label for="diaChiNhanHang">Địa chỉ nhận hàng</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" id="email" name="email" placeholder="Email" value="<%=email%>">
                        <label for="email">Email</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="dongYNhanMail" name="dongYNhanMail" <%=(dongYNhanMail ? "checked" : "")%> >
                        <label class="form-check-label" for="dongYNhanMail">
                            Đồng ý nhận email
                        </label>
                    </div>
                </div>
            </div>

            <div class="text-center mt-4">
                <button class="btn btn-primary btn-lg" type="submit" name="submit" id="submit">Lưu thông tin</button>
            </div>
        </form>
    </div>
</div>


<%
    }
%>
<footer>
    <%@include file="../footer.jsp"%>
</footer>
</body>
</html>
