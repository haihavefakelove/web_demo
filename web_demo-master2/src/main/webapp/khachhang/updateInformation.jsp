<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 16/10/2024
  Time: 10:41 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Information</title>
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
        body {
            background: linear-gradient(135deg, #e0f7fa, #80deea);
            background-attachment: fixed;
        }

        .container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 50px;
            border: 1px solid #dee2e6;
        }

        h2 {
            color: #00796b;
        }

        .btn-primary {
            background-color: #0288d1;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0277bd;
        }

        .form-control, .form-select {
            border-radius: 5px;
            border: 1px solid #ced4da;
        }

        label {
            color: #455a64;
        }
        .padding_top{
            padding-top: 50px;
        }


    </style>


</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<% String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
        + request.getContextPath();
%>
<%
    String baoLoi = request.getAttribute("baoLoi") +"";
    baoLoi=(baoLoi.equals("null")) ? "" : baoLoi;
    String cl = request.getAttribute("cl") +"";
    if(!cl.equals("green")) cl = "red";

    String hoVaTen = request.getAttribute("hoVaTen") + "";
    hoVaTen = (hoVaTen.equals("null")) ? "" : hoVaTen;

    String gioiTinh = request.getAttribute("gioiTinh") + "";
    gioiTinh = (gioiTinh.equals("null")) ? "" : gioiTinh;

    String ngaySinh = request.getAttribute("ngaySinh") + "";
    ngaySinh = (ngaySinh.equals("null")) ? "" : ngaySinh;

    String diaChiKhachHang = request.getAttribute("diaChiKhachHang") + "";
    diaChiKhachHang = (diaChiKhachHang.equals("null")) ? "" : diaChiKhachHang;

    String diaChiMuaHang = request.getAttribute("diaChiMuaHang") + "";
    diaChiMuaHang = (diaChiMuaHang.equals("null")) ? "" : diaChiMuaHang;

    String dienThoai = request.getAttribute("dienThoai") + "";
    dienThoai = (dienThoai.equals("null")) ? "" : dienThoai;%>
<div class="container mt-5 padding_top">
    <h2 class="text-center mb-4">Cập Nhật Thông Tin Người Dùng</h2>
    <div style="color: <%=cl%>" id="baoLoi">
        <%=baoLoi%>
    </div>
    <form action="<%=url%>/khach-hang" method="post">
        <input type="hidden" name="hanhDong" value="update">
        <div class="mb-3">
            <label for="hoVaTen" class="form-label">Họ và tên</label>
            <input type="text" class="form-control" id="hoVaTen" name="hoVaTen" placeholder="Nhập họ và tên" value="<%=hoVaTen%>">
        </div>
        <div class="mb-3">
            <label for="ngaySinh" class="form-label">Ngày sinh</label> <input
                type="date" class="form-control" id="ngaySinh" name="ngaySinh" value="<%=ngaySinh%>">
        </div>

        <div class="mb-3">
            <label for="gioiTinh" class="form-label">Giới Tính</label>
            <select class="form-select" name="gioiTinh" id="gioiTinh">
                <option value="" disabled selected>Chọn giới tính</option>
                <option value="Nam" <%=(gioiTinh.equals("Nam")) ? "selected='selected'" : "" %> >Nam</option>
                <option value="Nữ" <%=(gioiTinh.equals("nữ")) ? "selected='selected'" : "" %>>Nữ</option>
                <option value="Khác"<%=(gioiTinh.equals("khác")) ? "selected='selected'" : "" %>>Khác</option>
            </select>

        </div>

        <div class="mb-3">
            <label for="diaChiKhachHang" class="form-label">Địa chỉ
                khách hàng</label>
            <input type="text" class="form-control" id="diaChiKhachHang" name="diaChiKhachHang"
                                      placeholder="Nhập địa chỉ"    value="<%=diaChiKhachHang%>">
        </div>

        <div class="mb-3">
            <label for="diaChiNhanHang" class="form-label">Địa Chỉ Nhận Hàng</label>
            <input type="text" class="form-control"name="diaChiNhanHang" id="diaChiNhanHang" placeholder="Nhập địa chỉ nhận hàng" value="<%=diaChiMuaHang%>">
        </div>

        <div class="mb-3">
            <label for="dienThoai" class="form-label">Số Điện Thoại</label>
            <input type="tel" class="form-control" id="dienThoai" name="dienThoai"  value="<%=dienThoai%>" placeholder="Nhập số điện thoại">
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary">Cập Nhật</button>
        </div>
    </form>
</div>
<footer>
    <%@include file="../footer.jsp"%>
</footer>
</body>
</html>
