<%@ page import="model.khachHang" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 08/08/2024
  Time: 11:52 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sign out</title>
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
    <script src="javascript/main.js"></script>
    <link rel="stylesheet" href="../css/font/fontawesome-free-6.4.0-web/css/all.min.css">
    <link rel="stylesheet" href="css/main.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 500px;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: auto;
        }

        h1 {
            font-size: 2rem;
            color: #495057;
            margin-bottom: 30px;
            padding-top: 20px;
            font-weight: bold;
        }

        .mb-3 label {
            font-weight: bold;
            color: #495057;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        span {
            display: block;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .text-center {
            text-align: center;
        }

        html, body {
            height: 100%;
            margin: 0;
        }

        .wrapper {
            min-height: 80%;
            display: flex;
            flex-direction: column;
        }

        th {
            text-align: center;
        }

        footer {
            background-color: #f1f1f1;
            padding: 30px;
            text-align: center;
            margin: 0;
        }


    </style>
</head>
<div>
    <div class="wrapper">
        <jsp:include page="../header.jsp"></jsp:include>
        <%
            Object object = session.getAttribute("khachHang");
            khachHang khachHang = null;
            if (object != null)
                khachHang = (khachHang) object;
            if (khachHang == null) {

        %>
        <h1>bạn chưa đăng nhập . Vui lòng trở lại <a href="index.jsp">trang chủ</a></h1>
        <%
        } else {
            String baoLoi = request.getAttribute("baoLoi") + "";
            if (baoLoi.equals("null")) {
                baoLoi = "";
            }
        %>
        <%
            String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + request.getContextPath();
        %>
        <div class="container pt-5" style="padding-top: 50px; margin-top: 50px">
            <div class="text-center">
                <h1>ĐỔI MẬT KHẨU</h1>
            </div>
            <span style="color: red">
        <%=baoLoi%>
    </span>
            <form action="<%=url%>/khach-hang" method="POST">
                <input type="hidden" name="hanhDong" value="changePassword">

                <div class="mb-3">
                    <label for="matKhauHienTai" class="form-label">Mật khẩu hiện tại</label>
                    <input type="password" class="form-control" id="matKhauHienTai" name="matKhauHienTai">
                </div>
                <div class="mb-3">
                    <label for="matKhauMoi" class="form-label">Mật khẩu mới</label>
                    <input type="password" class="form-control" id="matKhauMoi" name="matKhauMoi">
                </div>
                <div class="mb-3">
                    <label for="matKhauMoiNhapLai" class="form-label">Nhập lại mật khẩu mới</label>
                    <input type="password" class="form-control" id="matKhauMoiNhapLai" name="matKhauMoiNhapLai">
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Lưu mật khẩu</button>
                </div>
            </form>
        </div>

        <%
            }
        %>
        <%
            String redirect = (String) request.getAttribute("redirect");
            if (redirect != null) {
        %>
        <script>
            redirectToHome();
        </script>
        <%
            }
        %>
        <footer style="margin-top: 20px; height:200px">
            <%@include file="../footer.jsp" %>
        </footer>
    </div>
</div>
</body>
</html>
