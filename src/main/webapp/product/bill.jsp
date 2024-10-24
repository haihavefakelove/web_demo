<%@ page import="model.khachHang" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.GioHang" %>
<%@ page import="database.sanPhamDAO" %>
<%@ page import="model.sanPham" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 07/10/2024
  Time: 4:51 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bill</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/main.css">
    <style>
        body {
            background-color: #f5f5f5;
        }

        .shopee-header {
            background-color: #ee4d2d;
        }

        .btn-outline-secondary {
            border-color: #ee4d2d;
            color: #ee4d2d;
        }

        .btn-outline-secondary:hover {
            background-color: #ee4d2d;
            color: white;
        }
    </style>
</head>
<body>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
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
<header class="shopee-header text-white py-2">
    <div class="container">
        <div class="row align-items-center">
            <div class="col">
                <h1 class="h6 mb-0">Shopee | Thanh Toán</h1>
            </div>
        </div>
    </div>
</header>

<main class="container my-3">
    <div class="card mb-3">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-2">
                <h5 class="card-title mb-0">
                    <i class="fas fa-map-marker-alt text-danger"></i> Địa Chỉ Nhận Hàng
                </h5>
                <button class="btn btn-outline-secondary btn-sm">Thay Đổi</button>
            </div>
            <p class="card-text mb-1">Điện thoại <%=khachhang.getSoDienThoai()%>
            </p>
            <p class="card-text"><%=khachhang.getDiaChi()%>
            </p>
        </div>
    </div>
    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title">Sản phẩm</h5>
            <div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-2">
                <div>
                    <span class="badge bg-danger me-2">Sách Shopee</span>
                    <span class="badge bg-primary">Chính hãng</span>
                </div>
                <small class="text-muted">7 ngày trả hàng</small>
            </div>
            <%
                if (request.getAttribute("gioHangList") != null) {
                    List<GioHang> gioHangList = (List<GioHang>) request.getAttribute("gioHangList");
                    for (GioHang gioHang : gioHangList) {
                        sanPham sp = sanPhamDAO.gI().selectByID(gioHang.id);
            %>
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <h6 class="mb-1">Sách - <%=sp.getTenSanPham()%>
                    </h6>
                    <small class="text-muted">Thể loại: <%=sp.getTheLoai().getTheLoai()%>
                    </small>
                </div>
                <div class="text-end">
                    <p class="mb-0"><%=sp.getGiaBan()%>
                    </p>
                    <small class="text-muted">x<%=gioHang.quantity%>
                    </small>
                </div>
            </div>
            <%
                }
            %>
            <%}%>
        </div>
    </div>

    <%
        if (request.getAttribute("totalAmount") != null) {
            String totalMount = (String) request.getAttribute("totalAmount");
    %>
    <div class="card">
        <div class="card-body p-3">
            <div class="row g-0">
                <div class="col-md-6 pe-3 border-end">
                    <div class="mb-3">
                        <label for="message" class="form-label text-muted mb-2">Lời nhắn:</label>
                        <input type="text" class="form-control" id="message" placeholder="Lưu ý cho Người bán...">
                    </div>
                </div>
                <div class="col-md-6 ps-3">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <span>Đơn vị vận chuyển: <strong>Nhanh</strong></span>
                        <div>
                            <a href="#" class="text-primary me-3">Thay Đổi</a>
                            <span class="text-danger">₫43.900</span>
                        </div>
                    </div>
                    <div class="mb-2">
                        <small class="text-muted">
                            <i class="fas fa-truck text-primary me-1"></i>
                            Đảm bảo nhận hàng từ 11 Tháng 10 - 12 Tháng 10
                        </small>
                    </div>
                    <div class="mb-3">
                        <small class="text-muted">
                            Nhận Voucher trị giá ₫15.000 nếu đơn hàng được giao đến bạn sau ngày 12 Tháng 10 2024
                            <i class="fas fa-question-circle ms-1"></i>
                        </small>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                            <span class="text-primary">
                                Được đồng kiểm
                                <i class="fas fa-question-circle text-muted ms-1"></i>
                            </span>
                        <span class="text-danger">
                                    Tổng số tiền:<%=totalMount%>
                                    <strong></strong>
                            </span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card mb-3">
        <div class="card-body">
            <h6 class="card-title text-muted mb-3">Shopee Xu</h6>
            <div class="d-flex justify-content-between align-items-center text-muted">
                <span>Không thể sử dụng Xu</span>
                <span>[?]</span>
            </div>
        </div>
    </div>

    <div class="card mb-3">
        <div class="card-body">
            <h6 class="card-title mb-3">Phương thức thanh toán</h6>
            <div class="mb-2">
                <button type="button" class="btn btn-outline-secondary btn-sm"
                        onclick="selectPaymentMethod('Thanh toán khi nhận hàng')">
                    Thanh toán khi nhận hàng
                </button>
                <button type="button" class="btn btn-outline-secondary btn-sm"
                        onclick="selectPaymentMethod('Chuyển khoản ngân hàng')">
                    Chuyển khoản ngân hàng
                </button>
            </div>
        </div>
    </div>


    <div class="card mb-3">
        <div class="card-body">
            <div class="d-flex justify-content-between mb-2">
                <span>Tổng tiền hàng</span>
                <%--tien hang--%>
                <span><%=totalMount%></span>
            </div>
            <div class="d-flex justify-content-between mb-2">
                <span>Phí vận chuyển</span>
                <%--van chuyen--%>
                <span></span>
            </div>
            <div class="d-flex justify-content-between fw-bold">
                <span>Tổng thanh toán:</span>
                <span class="text-danger"><%=totalMount%></span>
            </div>
            <form action="<%=url%>/bill?click=create_bill" method="POST" class="d-flex justify-content-between align-items-center mb-3"
                  style="background-color: white; padding-top: 20px;">
                <small class="text-muted">Nhấn "Đặt hàng" đồng nghĩa với việc bạn đồng ý tuân theo Điều khoản
                    Shopee</small>

                <!-- Thêm các input -->
                <input type="hidden" name="phuongThucThanhToan" id="phuongThucThanhToan" value="Thanh toán khi nhận hàng">
                <input type="hidden" name="totalAmount" value="<%= totalMount %>">

                <button type="submit" class="btn btn-danger">Đặt hàng</button>
            </form>
        </div>
    </div>
    <%}%>
</main>
<script>
    function selectPaymentMethod(method) {
        document.getElementById('phuongThucThanhToan').value = method;
        const buttons = document.querySelectorAll('.btn-outline-secondary');
        buttons.forEach(button => {
            button.classList.remove('active');
        })
        event.target.classList.add('active');
    }
</script>
</body>
<%}%>

</html>
