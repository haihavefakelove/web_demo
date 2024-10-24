<%@ page import="model.sanPham" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/font/fontawesome-free-6.4.0-web/css/all.min.css">
    <link rel="stylesheet" href="../css/main.css">
</head>

<body>
<jsp:include page="../header.jsp"></jsp:include>
<% sanPham sanpham = (sanPham) request.getAttribute("sanPham"); %>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>

<%
    String baoLoi = request.getAttribute("baoLoi") +"";
    baoLoi=(baoLoi.equals("null")) ? "" : baoLoi;
    String cl = request.getAttribute("cl") +"";
    if(!cl.equals("green")) cl = "red";
%>
<div class="container mt-5" style="padding-top: 50px; background-color: #f5f6f7">
    <div style="color: <%=cl%>" id="baoLoi">
        <%=baoLoi%>
    </div>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Sách</a></li>
            <li class="breadcrumb-item active" aria-current="page">Thông tin sách</li>
        </ol>
    </nav>

    <div class="row">
        <div class="col-md-5">
            <div class="card">
                <img src="<%=url%>/anhSanPham/<%=sanpham.getThemAnh()%>" class="card-img-top"
                     alt="<%=sanpham.getTenSanPham()%>">
            </div>
        </div>

        <div class="col-md-7">
            <h2 class="fw-bold"><%=sanpham.getTenSanPham()%>
            </h2>
            <p class="text-muted">Tác giả: <%=sanpham.getTacGia().getHoVaTen()%>
            </p>
            <p class="text-muted">Thể loại: <%=sanpham.getTheLoai().getTheLoai()%>
            </p>

            <h4 class="text-danger">Giá: <%=sanpham.getGiaBan()%>
            </h4>
            <p>
                <span class="badge bg-success">4.5/5</span> (200 lượt đánh giá)
            </p>

            <p>Còn lại: <%=sanpham.getSoLuong()%>
            </p>

            <div class="d-flex mb-3">
                <form action="<%=url%>/products-information?hd=cart-product&id=<%=sanpham.getMaSanPham()%>" method="post">
                    <label for="quantity">Số lượng:</label>
                    <input type="number" name="quantity" id="quantity" value="1" min="1" max="10" style="width: 100px;" />
                    <button type="submit" class="btn btn-outline-danger flex-fill me-2" style="padding-right: 95px">Thêm Vào Giỏ Hàng</button>
                </form>
                <button type="button" class="btn btn-danger flex-fill" style="height: 38px">Mua Ngay</button>
            </div>
        </div>
    </div>
<div class="row mt-5">
    <div class="col-md-12">
        <h4>Mô tả sách</h4>
        <p>
            <%=sanpham.getMoTa()%>
        </p>
    </div>
</div>

<div class="row mt-5">
    <div class="col-md-12">
        <h4>Đánh giá từ người dùng</h4>
    </div>
</div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>

