<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 03/08/2024
  Time: 10:36 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
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
    <script src="../javascript/main.js"></script>
    <style>
        .red {
            color: red;
        }
        body{
            background: linear-gradient(to bottom, rgba(199 ,21 ,133 ,0.7  ), rgba(0, 191, 255, 0.7));
        }
    </style>
</head>
<body>
<%
    String baoLoi = request.getAttribute("baoLoi")+"";
    baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;


    String tenDangNhap = request.getAttribute("tenDangNhap") + "";
    tenDangNhap = (tenDangNhap.equals("null")) ? "" : tenDangNhap;

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

    String diaChiNhanHang = request.getAttribute("diaChiNhanHang") + "";
    diaChiNhanHang = (diaChiNhanHang.equals("null")) ? "" : diaChiNhanHang;

    String dienThoai = request.getAttribute("dienThoai") + "";
    dienThoai = (dienThoai.equals("null")) ? "" : dienThoai;

    String email = request.getAttribute("email") + "";
    email = (email.equals("null")) ? "" : email;

    String dongYNhanMail = request.getAttribute("dongYNhanMail") + "";
    dongYNhanMail = (dongYNhanMail.equals("null")) ? "" : dongYNhanMail;

%>
<div class="container" style="background: linear-gradient(to bottom, rgba(255, 191, 0, 0.7  ), rgba(0, 191, 255, 0.7));">
    <div class="text-center" style="padding-top: 20px">
        <h1>ĐĂNG KÝ TÀI KHOẢN</h1>
    </div>
    <div class="red" id="baoLoi">
        <%=baoLoi%>
    </div>
    <%
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
    %>
    <form class="form-control" style="background:linear-gradient(to bottom, rgba(199, 21, 133, 0.3  ), rgba(0, 191, 255, 0.3 )); border: 0 solid  " action="<%=url%>/khach-hang" method="POST">
        <input type="hidden" name="hanhDong" value="sign-up">
        <div class="row">
<%--            <div class="col-sm-6">--%>
                <h3 class="text-center">Tài khoản</h3>
                <div class="mb-3">
                    <label for="tenDangNhap" class="form-label">Tên đăng nhập<span class="red">*</span></label>
                    <input type="text" class="form-control" id="tenDangNhap" name="tenDangNhap"
                           value="<%=tenDangNhap%>">
                </div>
                <div class="mb-3">
                    <label for="matKhau" class="form-label">Mật khẩu<span class="red">*</span></label>
                    <input type="password" class="form-control" id="matKhau" name="matKhau"
                           onkeyup="kiemTraMatKhau()">
                </div>
                <div class="mb-3">
                    <label for="matKhauNhapLai" class="form-label">Nhập lại
                        mật khẩu<span class="red">*</span> <span id="msg" class="red"></span>
                    </label> <input type="password" class="form-control" id="matKhauNhapLai"
                                    name="matKhauNhapLai" onkeyup="kiemTraMatKhau()">
                </div>
                <hr/>
               <%-- <h3>Thông tin khách hàng</h3>
                <div class="mb-3">
                    <label for="hoVaTen" class="form-label">Họ và tên</label> <input
                        type="text" class="form-control" id="hoVaTen" name="hoVaTen" value="<%=hoVaTen%>">
                </div>
                <div class="mb-3">
                    <label for="gioiTinh" class="form-label">Giới tính</label>
                    <select
                                class="form-control" id="gioiTinh" name="gioiTinh">
                        <option></option>
                        <option value="Nam" <%=(gioiTinh.equals("Nam")) ? "selected='selected'" : "" %> >Nam</option>
                        <option value="Nữ" <%=(gioiTinh.equals("nữ")) ? "selected='selected'" : "" %>>Nữ</option>
                        <option value="Khác"<%=(gioiTinh.equals("khác")) ? "selected='selected'" : "" %>>Khác</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="ngaySinh" class="form-label">Ngày sinh</label> <input
                        type="date" class="form-control" id="ngaySinh" name="ngaySinh" value="<%=ngaySinh%>">
                </div>--%>
<%--            </div>--%>
<%--            <div class="col-sm-6">--%>
    <%--            <h3>Địa chỉ</h3>
                <div class="mb-3">
                    <label for="diaChiKhachHang" class="form-label">Địa chỉ
                        khách hàng</label> <input type="text" class="form-control"
                                                  id="diaChiKhachHang" name="diaChiKhachHang"
                                                  value="<%=diaChiKhachHang%>">
                </div>
                <div class="mb-3">
                    <label for="diaChiMuaHang" class="form-label">Địa chỉ mua
                        hàng</label> <input type="text" class="form-control" id="diaChiMuaHang"
                                            name="diaChiMuaHang" value="<%=diaChiMuaHang%>">
                </div>
                <div class="mb-3">
                    <label for="diaChiNhanHang" class="form-label">Địa chỉ
                        nhận hàng</label> <input type="text" class="form-control"
                                                 id="diaChiNhanHang" name="diaChiNhanHang" value="<%=diaChiNhanHang%>">
                </div>
                <div class="mb-3">
                    <label for="dienThoai" class="form-label">Điện thoại</label> <input
                        type="tel" class="form-control" id="dienThoai" name="dienThoai" value="<%=dienThoai%>">
                </div>--%>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label> <input
                        type="email" class="form-control" id="email" name="email" value="<%=email%>">
                </div>
                <hr/>
                <div class="mb-3">
                    <label for="dongYDieuKhoan" class="form-label">Đồng ý với
                        <a>điều khoản của công ty </a><span id="red">*</span>
                    </label> <input type="checkbox" class="form-check-input"
                                    id="dongYDieuKhoan" name="dongYDieuKhoan" required="required"
                                    onchange="xuLyChonDongY()">
                </div>
                <div class="mb-3">
                    <label for="dongYNhanMail" class="form-label">Đồng ý nhận
                        email</label> <input type="checkbox" class="form-check-input"
                                             id="dongYNhanMail" name="dongYNhanMail" value="<%=dongYNhanMail%>">
                </div>
                <div class="mb-3" style="width: 10%; margin: auto;">
                <input class="btn btn-primary form-control" type="submit"
                       value="Đăng ký" name="submit" id="submit" style="visibility: hidden; "/>
                </div>
            </div>
<%--        </div>--%>
    </form>
</div>
</body>
</html>
