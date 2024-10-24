<%@ page import="java.util.ArrayList" %>
<%@ page import="model.sanPham" %>
<%@ page import="model.khachHang" %>
<%@ page import="org.example.controller.Products_information" %>
<%@ page import="database.sanPhamDAO" %>
<%@ page import="model.GioHang" %><%--
      Created by IntelliJ IDEA.
      User: Acer
      Date: 28/09/2024
      Time: 11:23 CH
      To change this template use File | Settings | File Templates.
    --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gio hang</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/font/fontawesome-free-6.4.0-web/css/all.min.css">
    <link rel="stylesheet" href="/css/main.css">


    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .row.bg-light {
            border-bottom: 1px solid #dee2e6;
        }

        .product-checkbox {
            margin-right: 10px;
        }

        .btn-link {
            color: #007bff;
            text-decoration: none;
        }

        .btn-link:hover {
            text-decoration: underline;
        }

        .quantity-input {
            border: 1px solid #ced4da;
            border-radius: 4px;
            padding: 5px;
        }

        .text-danger {
            font-weight: bold;
        }

        .deal-soc, .mb-3 {
            border-radius: 8px;
        }

        .deal-soc {
            background-color: #fce4ec;
            border: 1px solid #f48fb1;
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        footer {
            padding: 10px 0;
            text-align: center;
        }

    </style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
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

<div class="container mt-4" style="padding-top: 80px">
    <div class="row bg-light p-2 mb-3">
        <div class="col"><input type="checkbox"> Sản Phẩm</div>
        <div class="col text-center">Đơn Giá</div>
        <div class="col text-center">Số Lượng</div>
        <div class="col text-center">Số Tiền</div>
        <div class="col text-center">Thao Tác</div>
    </div>


    <%
        if (khachhang.getGioHangList() != null && !khachhang.getGioHangList().isEmpty()) {
            for (int i = 0; i < khachhang.getGioHangList().size(); i++) {
                sanPham sp = sanPhamDAO.gI().selectByID(khachhang.getGioHangList().get(i).id);
    %>
    <div class="row mb-3 align-items-center">
        <div class="col">

            <%--  const productCheckboxes = document.querySelectorAll('.product-checkbox');--%>
            <input type="checkbox" class="product-checkbox" name="selectedProducts<%=i%>" value="<%=sp.getMaSanPham()%>"
                   data_price="<%=sp.getGiaBan()*khachhang.getGioHangList().get(i).quantity%>" data_id="<%=khachhang.getGioHangList().get(i).id%>">
            <img src="<%=url%>/anhSanPham/<%=sp.getThemAnh()%>" alt="<%=sp.getTenSanPham()%>" width="50" height="50"
                 class="mx-2">
        </div>
        <div class="col text-center"><s>₫<%=sp.getGiaGoc()%>
        </s> : ₫<%=sp.getGiaBan()%>
        </div>
        <%--so tien ban va giam gia--%>
        <div class="col text-center">
            <form action="<%=url%>/products-information?hd=update-cart" method="post" class="d-flex justify-content-center align-items-center">
                <input type="hidden" name="productId" value="<%=sp.getMaSanPham() %>">
                <button type="submit" name="action" value="decrease" class="btn btn-sm btn-outline-secondary">-</button>
                <input type="text" name="quantity" value="<%= khachhang.getGioHangList().get(i).quantity %>"
                       class="quantity-input mx-1" readonly>
                <button type="submit" name="action" value="increase" class="btn btn-sm btn-outline-secondary">+</button>
            </form>
        </div>

        <div class="col text-center text-danger"><%=sp.getGiaBan() * khachhang.getGioHangList().get(i).quantity%>
        </div>
        <%--so tien--%>
        <div class="col text-center">
            <form action="<%=url%>/products-information?hd=delete" method="post">
                <input type="hidden" name="Id" value="<%=sp.getMaSanPham() %>">
                <button type="submit" name="delete" value="xoa" class="btn btn-sm btn-outline-danger"><a>xóa</a>
                </button>
                <button type="submit" class="btn btn-sm btn-outline-secondary ms-2">Tìm sản phẩm tương tự</button>
            </form>
        </div>
    </div>
    <%
        }
    } else {
    %>
    <p> khong co san pham </p>
    <%}%>
    <div class="deal-soc mb-3">
        <span class="badge bg-danger">Deal Sốc</span> Mua kèm deal độc quyền <a href="#">Thêm ></a>
    </div>

    <div class="mb-3">
        <span class="badge bg-warning text-dark">Shopee Voucher</span>
        <a href="#" class="ms-2">Chọn hoặc nhập mã</a>
    </div>
    <form action="<%=url%>/bill?click=bill_prd" method="post">
        <div class="row align-items-center">
            <div class="col">
                <input type="checkbox" id="selectAll"> Chọn Tất Cả (1)
                <button class="btn btn-link">Xóa</button>
                <button class="btn btn-link">Bỏ sản phẩm không hoạt động</button>
                <button class="btn btn-link">Lưu vào mục Đã thích</button>
            </div>
            <div class="col text-end">
                <%-- const totalAmountElement = document.getElementById('totalAmount');--%>
                Tổng thanh toán : <span class="text-danger fw-bold" id="totalAmount">đ </span>
                <input type="hidden" name="totalAmount" id="totalAmountInput"> <!-- Thêm input ẩn cho tổng tiền -->
                <input type="hidden" name="listSP" id="lstSP">
                    <%--mua hàng --%>
                <button type="submit" class="btn btn-danger ms-3">Mua Hàng</button>
            </div>
        </div>
    </form>
</div>
<%}%>
<%@include file="../footer.jsp" %>
<script>

    document.addEventListener('DOMContentLoaded', function () {
        const productCheckboxes = document.querySelectorAll('.product-checkbox');
        const totalAmountElement = document.getElementById('totalAmount');
        var tt =document.getElementById("totalAmountInput");
        var lst = document.getElementById("lstSP");

        function calculateTotal() {

            let total = 0.0;
            var ls = ""
            productCheckboxes.forEach(checkbox => {
                if (checkbox.checked) {
                    var price = parseFloat(checkbox.getAttribute('data_price'));
                    var id =  checkbox.getAttribute('data_id');
                    if (!isNaN(price)) {
                        //m dùng `ổ dong nay no d in ra duoc gia tri bien th ngu
                        console.log(`Checkbox checked, price: ` + price);
                        total += price;
                        ls = ls + id + " ";
                    } else {
                        console.error("Invalid price value:", checkbox.getAttribute('data_price'));
                    }
                }
            });
            console.log(`Total calculated: ` + total);
            //dun ' hoac "
            lst.value = ls;
            totalAmountElement.textContent = total > 0 ? (total) : "";
            tt.value =  totalAmountElement.textContent

        }

// nó k in gias trij
        productCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', () => {

                console.log('Checkbox state changed');
                calculateTotal();
            });
        });
        const selectAllCheckbox = document.getElementById('selectAll');
        selectAllCheckbox.addEventListener('change', function () {
            const isChecked = selectAllCheckbox.checked;
            productCheckboxes.forEach(checkbox => {
                checkbox.checked = isChecked;
            });
            calculateTotal();
        });
    });
</script>

</body>
</html>
