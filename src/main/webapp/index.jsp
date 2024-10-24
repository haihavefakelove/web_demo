<%@ page import="model.khachHang" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="org.example.controller.KhachHangServlets" %>
<%@ page import="model.sanPham" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books store</title>
    <link rel="stylesheet" href="./css/font/fontawesome-free-6.4.0-web/css/all.min.css">
    <link rel="stylesheet" href="css/main.css">
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
    <link rel="icon" href="img/z5941963793233_d9c1a1edf38363c24a1825489d9e5930.jpg" type="image/jpg">

    <style>
        .card {
            border: none;
            box-shadow: 0 2px 8px var(--shadow-color);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 20px;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        /* Pagination styles */
        .pagination {
            margin: 0;
        }

        .page-link {
            color: #000;
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 8px 16px;
        }

        .page-item.active .page-link {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #000;
        }

        .page-link:hover {
            color: #000;
            background-color: #e9ecef;
            border-color: #dee2e6;
        }

        .page-item.disabled .page-link {
            color: #6c757d;
            pointer-events: none;
            background-color: #fff;
            border-color: #dee2e6;
        }

        /* Footer styles */
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

    <%
        Cookie ck[] = request.getCookies();
        String u = "";
        String pas = "";
        if (ck != null) {
            for (Cookie c : ck) {
                if (c.getName().equals("username")) {
                    u = c.getValue();
                } else if (c.getName().equals("password")) {
                    pas = c.getValue();
                }
            }
            KhachHangServlets.gI().sign_in(u, pas, session);
        }
    %>
    <%
        String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath();
    %>
    <script>
        window.onload = function () {
            const urlParams = new URLSearchParams(window.location.search);
            if (!urlParams.has('active') || urlParams.get('active') !== 'danh-sach-san-pham2') {
                window.location.href = "<%=url%>/admin-servlet?active=danh-sach-san-pham2";
            }
        };
    </script>
</head>
<body>

<%--header--%>
<jsp:include page="header.jsp"/>

<!-- page content-->
<div class="container-fluid background-container">
    <div class="row">
        <jsp:include page="left.jsp"></jsp:include>

        <div class="col-lg-10 bg-warning">
            <!--slider -->
            <div id="carouselExample" class="carousel slide">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="img/Thiết%20kế%20chưa%20có%20tên%20(1).png" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="img/Thiết%20kế%20chưa%20có%20tên%20(2).png" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="img/Thiết%20kế%20chưa%20có%20tên.png" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>

            <!-- product-->
            <div class="row">
                <% ArrayList<sanPham> sanPhams = (ArrayList<sanPham>) request.getAttribute("listSp");
                    Integer currentPage = (Integer) request.getAttribute("current");
                    Integer totalPages = (Integer) request.getAttribute("totalPages");
                    if (sanPhams != null && !sanPhams.isEmpty()) {
                        for (sanPham sp : sanPhams) {
                %>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="<%=url%>/products-information?hd=prd_information&id=<%= sp.getMaSanPham() %>">
                            <img class="card-img-top" src="<%=url%>/anhSanPham/<%=sp.getThemAnh() %>"
                                 alt="<%=sp.getTenSanPham() %>">
                        </a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="<%=url%>/products-information?hd=prd_information&id=<%=sp.getMaSanPham() %>">
                                    <%=sp.getTenSanPham() %>
                                </a>
                            </h4>
                            <h5>Giá bán: <%=sp.getGiaBan()%></h5>
                            <p class="card-text"><%=sp.getMoTa()%></p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">&#9733;&#9733;&#9733;&#9733;&#9734;</small>
                        </div>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <div class="col-12">
                    <p>Không có sản phẩm nào.</p>
                </div>
                <%
                    }
                %>
            </div>

            <nav aria-label="Page navigation" class="d-flex justify-content-center mt-4 mb-4">
                <ul class="pagination">
                    <!-- Previous button -->
                    <li class="page-item <%= (currentPage <= 1) ? "disabled" : "" %>">
                        <a class="page-link" href="<%=url%>/admin-servlet?active=danh-sach-san-pham2&page=<%= currentPage - 1 %>"
                           aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>

                    <%
                        int startPage = Math.max(1, currentPage - 2);
                        int endPage = Math.min(totalPages, startPage + 4);

                        if (endPage - startPage < 4) {
                            startPage = Math.max(1, endPage - 4);
                        }

                        for (int i = startPage; i <= endPage; i++) {
                    %>
                    <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                        <a class="page-link" href="<%=url%>/admin-servlet?active=danh-sach-san-pham2&page=<%= i %>">
                            <%= i %>
                        </a>
                    </li>
                    <% } %>

                    <!-- Next button -->
                    <li class="page-item <%= (currentPage >= totalPages) ? "disabled" : "" %>">
                        <a class="page-link" href="<%=url%>/admin-servlet?active=danh-sach-san-pham2&page=<%= currentPage + 1 %>"
                           aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>