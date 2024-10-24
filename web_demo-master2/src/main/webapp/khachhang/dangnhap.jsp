<%@ page import="jakarta.servlet.http.Cookie" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 04/08/2024
  Time: 10:39 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign-in</title>
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
    <link rel="stylesheet" href="../css/font/fontawesome-free-6.4.0-web/css/all.min.css">
    <style>
        .red {
            color: red;
        }
    </style>

<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
    //Get Cookie
    Cookie ck[] = request.getCookies();
    String u = "";
    String pas ="";
    if(ck != null){
        for(Cookie c : ck){
            if(c.getName().equals("username")){
                u = c.getValue();
            }else if(c.getName().equals("password")){
                pas = c.getValue();
            }
        }
    }

%>
</head>
<body>
<main class="form-signin w-25 m-auto">
    <form class="text-center" action="<%=url%>/khach-hang" method="POST">
        <input type="hidden" name="hanhDong" value="sign-in">
        <img class="mb-3" src="<%=url %>/img/logo.png"
             alt="" width="100" style="padding-top: 30px" >
        <h1 class="h3 mb-3 fw-normal">ĐĂNG NHẬP</h1>
        <%
            String baoLoi = request.getAttribute("baoLoi") + "";
            if (baoLoi.equals("null")) {
                baoLoi = "";
            }
        %>
        <div class="text-center"><span class="red"><%=baoLoi %></span>

        </div>
        <div class="form-floating">
            <input type="text" class="form-control" id="tenDangNhap" value="<%=u%>"
                   placeholder="Tên đăng nhập" name="tenDangNhap"> <label for="tenDangNhap">Tên đăng nhập</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="matKhau" value="<%=pas%>"
                   placeholder="Mật khẩu" name="matKhau"> <label for="matKhau">Mật khẩu</label>
        </div>

        <div class="checkbox mb-3">
            <label> <input id ="remember-me" name ="remember-me" type="checkbox" value="remember-me">
                Ghi nhớ tài khoản này
            </label>
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Đăng nhập</button>
        <a href="register.jsp">Đăng ký tài khoản mới</a>
        <p class="mt-5 mb-3 text-muted">&copy; 2017–2025</p>
    </form>
</main>
</body>
</html>
