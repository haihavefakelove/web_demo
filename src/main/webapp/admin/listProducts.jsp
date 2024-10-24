<%@ page import="java.util.ArrayList" %>
<%@ page import="model.sanPham" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 21/09/2024
  Time: 12:04 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sach san pham</title>
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
    <script src="/javascript/main.js"></script>
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>
<% String url= request.getScheme() + "://" + request.getServerName() + ":" +request.getServerPort()+ request.getContextPath();%>
<%     String baoLoi = request.getAttribute("baoLoi") +"";
    baoLoi=(baoLoi.equals("null")) ? "" : baoLoi;
    String cl = request.getAttribute("cl") +"";
    if(!cl.equals("green")) cl = "red";
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
    th{
        text-align: center;
    }
</style>
<div class="wrapper">
    <jsp:include page="../header.jsp"></jsp:include>
    <div class="container pt-5">
        <div class="text-center" style="padding-top: 50px">
            <h1>DANH SACH SAN PHAM</h1>
        </div>
        <div style="color: <%=cl%>" id="baoLoi">
            <%=baoLoi%>
        </div>
        <table class="table table-hover table-bordered" style="border: 1px">
            <thead>
            <tr>
                <th>STT</th>
                <th>Ma san pham</th>
                <th>Ten san pham</th>
                <th>Gia nhap</th>
                <th>Gia ban</th>
                <th>So luong</th>
                <th>Mo ta</th>
                <th colspan="2">#</th>

            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<sanPham> sanPhams=(ArrayList<sanPham>) request.getAttribute("listSp");
                if(sanPhams == null || sanPhams.size()==0) return;
                int index=1;
                for (sanPham sp : sanPhams){
            %>
            <tr>
                <td><%=index++%></td>
                <td><%=sp.getMaSanPham()%></td>
                <td><%=sp.getTenSanPham()%></td>
                <td><%=sp.getGiaBan()%></td>
                <td><%=sp.getSoLuong()%></td>
                <td><%=sp.getMoTa()%></td>

                <td>Sửa</td>
                <td><a href="<%=url%>/admin-servlet?active=xoa-san-pham&id=<%=sp.getMaSanPham()%>" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');">Xóa</a></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
<footer>
    <%@include file="../footer.jsp"%>
</footer>
</body>
</html>
