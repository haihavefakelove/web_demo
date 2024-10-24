<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Sản Phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/main.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 50px;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 2.5rem;
            color: #343a40;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: bold;
        }

        .red {
            color: red;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        #baoLoi {
            margin-bottom: 20px;
            font-weight: bold;
        }
        .footer {
            background-color: #333;
            color: white;
            padding: 40px 0;
            margin-top: 50px;
        }

        .footer h5 {
            color: #ffc107;
            margin-bottom: 20px;
        }

        .footer ul {
            list-style: none;
            padding: 0;
        }

        .footer ul li {
            margin-bottom: 10px;
        }

        .footer ul li a {
            color: white;
            text-decoration: none;
        }

        .footer ul li a:hover {
            color: #ffc107;
        }

        .social-icons {
            font-size: 24px;
        }

        .social-icons a {
            color: white;
            margin-right: 15px;
        }

        .social-icons a:hover {
            color: #ffc107;
        }

        .footer-bottom {
            background-color: #222;
            padding: 15px 0;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<%
    String baoLoi = request.getAttribute("baoLoi") + "";
    baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;
    String cl = request.getAttribute("cl") + "";
    if (!cl.equals("green")) cl = "red";

    String maSanPham = request.getAttribute("maSanPham") + "";
    maSanPham = (maSanPham.equals("null")) ? "" : maSanPham;

    String tenSanPham = request.getAttribute("tenSanPham") + "";
    tenSanPham = (tenSanPham.equals("null")) ? "" : tenSanPham;

    String maTacGia = request.getAttribute("maTacGia") + "";
    maTacGia = (maTacGia.equals("null")) ? "" : maTacGia;

    String namXuatBan = request.getAttribute("namXuatBan") + "";
    namXuatBan = (namXuatBan.equals("null")) ? "" : namXuatBan;

    String giaGoc = request.getAttribute("giaGoc") + "";
    giaGoc = (giaGoc.equals("null")) ? "" : giaGoc;

    String giaBan = request.getAttribute("giaBan") + "";
    giaBan = (giaBan.equals("null")) ? "" : giaBan;

    String soLuong = request.getAttribute("soLuong") + "";
    soLuong = (soLuong.equals("null")) ? "" : soLuong;

    String maTheLoai = request.getAttribute("maTheLoai") + "";
    maTheLoai = (maTheLoai.equals("null")) ? "" : maTheLoai;

    String moTa = request.getAttribute("moTa") + "";
    moTa = (moTa.equals("null")) ? "" : moTa;
%>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container pt-5">
    <div class="text-center">
        <h1>THÊM SẢN PHẨM</h1>
    </div>
    <div style="color: <%= cl %>" id="baoLoi">
        <%= baoLoi %>
    </div>
    <form class="form-control" action="<%= url %>/admin-servlet" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="active" value="them-san-pham">
        <div class="row">
            <div class="col-sm-6">
                <div class="mb-3">
                    <label for="maSanPham" class="form-label">Mã Sản Phẩm <span class="red">*</span></label>
                    <input type="text" class="form-control" id="maSanPham" name="maSanPham" value="<%= maSanPham %>" required>
                </div>
                <div class="mb-3">
                    <label for="maTacGia" class="form-label">Mã Tác Giả <span class="red">*</span></label>
                    <input type="text" class="form-control" id="maTacGia" name="maTacGia" value="<%= maTacGia %>" required>
                </div>
                <div class="mb-3">
                    <label for="namXuatBan" class="form-label">Năm Xuất Bản <span class="red">*</span></label>
                    <input type="number" class="form-control" id="namXuatBan" name="namXuatBan" value="<%= namXuatBan %>" required>
                </div>
                <div class="mb-3">
                    <label for="giaGoc" class="form-label">Giá Gốc <span class="red">*</span></label>
                    <input type="number" class="form-control" id="giaGoc" name="giaGoc" value="<%= giaGoc %>" required>
                </div>
                <div class="mb-3">
                    <label for="giaBan" class="form-label">Giá Bán <span class="red">*</span></label>
                    <input type="number" class="form-control" id="giaBan" name="giaBan" value="<%= giaBan %>" required>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="mb-3">
                    <label for="tenSanPham" class="form-label">Tên Sản Phẩm <span class="red">*</span></label>
                    <input type="text" class="form-control" id="tenSanPham" name="tenSanPham" value="<%= tenSanPham %>" required>
                </div>
                <div class="mb-3">
                        <label for="maTheLoai" class="form-label">Mã Thể Loại <span class="red">*</span></label>
                        <select class="form-select" id="maTheLoai" name="maTheLoai">
                            <option value="" disabled selected>Chon the loai </option>
                            <option value="truyện tranh" <%=maTheLoai%> >truyện tranh</option>
                            <option value="trinh thám" <%=maTheLoai%> >trinh thám</option>
                            <option value="tiểu thuyết" <%=maTheLoai%> >tiểu thuyết</option>
                            <option value="thần thoại " <%=maTheLoai%> >thần thoại </option>
                            <option value="phiêu lưu" <%=maTheLoai%> >phiêu lưu </option>
                            <option value="ngôn tình" <%=maTheLoai%> >ngôn tình</option>
                            <option value="kinh dị" <%=maTheLoai%> >kinh dị</option>
                            <option value="học đường" <%=maTheLoai%>>học đường</option>
                            <option value="cổ tích "<%=maTheLoai%>>cổ tích </option>
                        </select>
                </div>
                <div class="mb-3">
                    <label for="soLuong" class="form-label">Số Lượng <span class="red">*</span></label>
                    <input type="number" class="form-control" id="soLuong" name="soLuong" value="<%= soLuong %>" required>
                </div>
                <div class="mb-3">
                    <label for="moTa" class="form-label">Mô Tả</label>
                    <input type="text" class="form-control" id="moTa" name="moTa" value="<%= moTa %>">
                </div>
                <div class="mb-3">
                    <label for="themAnh" class="form-label">Thêm Ảnh <span class="red">*</span></label>
                    <input type="file" class="form-control" id="themAnh" name="themAnh" required>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-6" style="width: 20%; margin: auto">
                <input class="btn btn-primary form-control" type="submit" value="Thêm Sản Phẩm" name="submit" id="submit">
            </div>
        </div>
    </form>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
