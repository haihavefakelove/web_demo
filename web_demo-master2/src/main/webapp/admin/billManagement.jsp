<%@ page import="model.donHang" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.TrangThaiDonHang" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 12/10/2024
  Time: 9:55 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bill management</title>
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
</head>
<% String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();%>

<body>
<% String baoLoi = request.getAttribute("baoLoi") + "";
    baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;
    String cl = request.getAttribute("cl") + "";
    if (!cl.equals("green")) cl = "red";
%>
<style>
    html, body {
        height: 100%;
        margin: 0;
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
</style>
<div class="wrapper">
    <jsp:include page="../header.jsp"></jsp:include>
    <div class="container pt-5">
        <div class="text-center" style="padding-top: 50px">
            <h1>Don hang cua toi</h1>
        </div>
        <div style="color: <%=cl%>" id="baoLoi">
            <%=baoLoi%>
        </div>
        <table class="table table-hover table-bordered" style="border: 1px">
            <thead>
            <tr>
                <th>STT</th>
                <th>Mã Đơn Hàng</th>
                <th>Khách Hàng</th>
                <th>Ngày Đặt</th>
                <th>Địa Chỉ Giao Hàng</th>
                <th>Tổng Tiền</th>
                <th>Trạng Thái</th>
                <th>Chi Tiết</th>
                <th>Thao Tác</th>

            </tr>
            </thead>
            <tbody>
            <%
                    ArrayList<donHang> donHangs = (ArrayList<donHang>) request.getAttribute("listDonHang");
                if (donHangs == null || donHangs.size() == 0) return;
                int index = 1;
                for (donHang dh : donHangs) {
            %>
            <tr>
                <td><%=index++%>
                </td>
                <td><%=dh.getMaDonHang()%></td>
                <td><%=dh.getKhachHang().getHoVaten()%>
                </td>
                <td><%=dh.getNgayDatHang()%>
                </td>
                <td><%=dh.getDiaChiNhanHang()%>
                </td>
                <td><%=dh.getTongtien()%>
                </td>
                <td><%=dh.getTrangThaiDonHang()%>
                </td>
                <td><a href="#" class="btn btn-danger">xem chi tiet</a></td>
                <td>
                    <%
                    if (dh.getTrangThaiDonHang().equals(TrangThaiDonHang.DANG_CHO)){
                    %>
                    <a href="<%=url%>/admin-servlet?active=bill_status&madonhang=<%=dh.getMaDonHang()%>&status=DA_XAC_NHAN" class="btn btn-danger"
                       onclick="return confirm('Bạn có chắc chắn muốn xac nhan đơn hàng này?');">xac nhan</a>
                    <a href="<%=url%>/admin-servlet?active=bill_status&madonhang=<%=dh.getMaDonHang()%>&status=TU_CHOI" class="btn btn-danger"
                       onclick="return confirm('Bạn có chắc chắn muốn tu choi đơn hàng này?');">Tu choi</a></td>
                <%}else {%>
                <%
                String trangThaiText = dh.getTrangThaiDonHang().equals(TrangThaiDonHang.DA_XAC_NHAN) ? "Đã Xác Nhận" : "Từ Chối";
                %>
                <span class="badge bg-secondary text-white"><%= trangThaiText %></span>
                <%}%>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</body>
</html>
