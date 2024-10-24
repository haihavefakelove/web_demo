<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 20/08/2024
  Time: 11:28 CH
  To change this template use File | Settings | File Templates.
--%>
<link rel="stylesheet" href="./css/font/fontawesome-free-6.4.0-web/css/all.min.css">
<link rel="stylesheet" href="../css/main.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
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
<!-- Footer -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <!-- About Us -->
            <div class="col-md-4 mb-4">
                <h5>Về Chúng Tôi</h5>
                <p>Books Store - Nơi mang đến cho bạn những cuốn sách hay nhất với giá tốt nhất.</p>
            </div>

            <!-- Quick Links -->
            <div class="col-md-4 mb-4">
                <h5>Liên Kết Nhanh</h5>
                <ul>
                    <li><a href="#">Trang Chủ</a></li>
                    <li><a href="#">Sản Phẩm</a></li>
                    <li><a href="#">Tin Tức</a></li>
                    <li><a href="#">Liên Hệ</a></li>
                </ul>
            </div>

            <!-- Contact Info -->
            <div class="col-md-4 mb-4">
                <h5>Thông Tin Liên Hệ</h5>
                <ul>
                    <li><i class="fas fa-map-marker-alt"></i> 123 Đường ABC, Quận XYZ, TP.HCM</li>
                    <li><i class="fas fa-phone"></i> +84 123 456 789</li>
                    <li><i class="fas fa-envelope"></i> contact@bookstore.com</li>
                </ul>

                <!-- Social Icons -->
                <div class="social-icons mt-3">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin"></i></a>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Bottom -->
    <div class="footer-bottom text-center">
        <div class="container">
            <p class="mb-0">&copy; 2024 Books Store. All rights reserved.</p>
        </div>
    </div>
</footer>