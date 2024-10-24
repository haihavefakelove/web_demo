<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 14/10/2024
  Time: 12:16 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doanh thu</title>
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
<body>
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
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<jsp:include page="../header.jsp"></jsp:include>
<div class="wrapper">
    <div class="container mt-5" style="padding-top: 50px">
        <h1 class="mb-4 text-center">Doanh Thu</h1>

        <form action="<%=url%>/admin-servlet" method="POST">
            <input type="hidden" name="active" value="Revenue">
            <div class="form-group">
                <label for="revenueType">Chọn loại doanh thu:</label>
                <select class="form-control" name="revenueType" id="revenueType" onchange="toggleInputs()">
                    <option value="daily">Theo Ngày</option>
                    <option value="monthly">Theo Tháng</option>
                    <option value="quarterly">Theo Quý</option>
                    <option value="yearly">Theo Năm</option>
                </select>
            </div>

            <div id="dailyInput" class="form-group">
                <label for="date">Chọn ngày:</label>
                <input type="date" class="form-control" name="date" id="date">
            </div>

            <div id="monthlyInput" class="form-group" style="display: none;">
                <label for="month">Chọn tháng:</label>
                <input type="month" class="form-control" name="month" id="month">
            </div>

            <div id="quarterlyInput" class="form-group" style="display: none;">
                <label for="quarter">Chọn quý:</label>
                <select class="form-control" name="quarter" id="quarter">
                    <option value="1">Quý 1</option>
                    <option value="2">Quý 2</option>
                    <option value="3">Quý 3</option>
                    <option value="4">Quý 4</option>
                </select>
                <label for="yearQuarter">Chọn năm:</label>
                <input type="number" class="form-control" name="yearQuarter" id="yearQuarter" min="2000" max="2100">
            </div>

            <div id="yearlyInput" class="form-group" style="display: none;">
                <label for="year">Chọn năm:</label>
                <input type="number" class="form-control" name="year" id="year" min="2000" max="2100">
            </div>

            <button type="submit" class="btn btn-primary btn-block">Xem Doanh Thu</button>
        </form>

        <% if (request.getAttribute("revenue") != null) { %>
        <div class="alert alert-success mt-4" role="alert">
            <h4 class="alert-heading">Tổng doanh thu
                <%=
                request.getAttribute("revenueType").equals("daily") ? "ngày" :
                        request.getAttribute("revenueType").equals("monthly") ? "thang" :
                                request.getAttribute("revenueType").equals("quarterly") ? "quy" : "nam"
                %>:</h4>
            <p><%= request.getAttribute("revenue") %>
            </p>
        </div>
        <% } %>
    </div>
</div>
<script>
    function toggleInputs() {
        var revenueType = document.getElementById("revenueType").value;
        document.getElementById("dailyInput").style.display = revenueType === "daily" ? "block" : "none";
        document.getElementById("monthlyInput").style.display = revenueType === "monthly" ? "block" : "none";
        document.getElementById("quarterlyInput").style.display = revenueType === "quarterly" ? "block" : "none";
        document.getElementById("yearlyInput").style.display = revenueType === "yearly" ? "block" : "none";
    }
</script>
<footer>
    <%@include file="../footer.jsp" %>
</footer>
</body>
</html>
