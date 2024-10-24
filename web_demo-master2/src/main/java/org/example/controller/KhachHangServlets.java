package org.example.controller;

import database.donHangDAO;
import database.khachHangDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import maHoa.maHoa;
import model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet(name = "KhachHangServlets", value = "/khach-hang")

public class KhachHangServlets extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String hanhDong = req.getParameter("hanhDong")+"";
        if (hanhDong.equals("sign-in")) {
            sign_in(req, resp);
        } else if (hanhDong.equals("sign-out")) {
            sign_out(req, resp);
        } else if (hanhDong.equals("sign-up")) {
            sign_up(req, resp);
        } else if (hanhDong.equals("changePassword")) {
            changePassword(req, resp);
        } /*else if (hanhDong.equals("changeInformation")) {
            changeInformation(req, resp);
        }*/else if ("mybill".equals(hanhDong)){
            mybill(req, resp);
        } else if ("deleteBill".equals(hanhDong)) {
            delete_bill(req, resp);
        } else if ("update".equals(hanhDong)) {
            updateInformation(req, resp);
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
    public static KhachHangServlets ins;
    public static KhachHangServlets gI(){
        if(ins == null) ins = new KhachHangServlets();
        return ins;
    }
//dangki
    private void sign_up(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        String tenDangNhap = req.getParameter("tenDangNhap");
        String matKhau = req.getParameter("matKhau");
        String matKhauNhapLai = req.getParameter("matKhauNhapLai");
       /* String hoVaTen = req.getParameter("hoVaTen");
        String gioiTinh = req.getParameter("gioiTinh");
        String ngaySinh = req.getParameter("ngaySinh");
        String diaChiKhachHang = req.getParameter("diaChiKhachHang");
        String diaChiMuaHang = req.getParameter("diaChiMuaHang");
        String diaChiNhanHang = req.getParameter("diaChiNhanHang");
        String dienThoai = req.getParameter("dienThoai");*/
        String email = req.getParameter("email");
        String dongYDieuKhoan = req.getParameter("dongYDieuKhoan");
        String dongYNhanMail = req.getParameter("dongYNhanMail");

        req.setAttribute("tenDangNhap", tenDangNhap);
/*        req.setAttribute("hoVaTen", hoVaTen);
        req.setAttribute("gioiTinh", gioiTinh);
        req.setAttribute("ngaySinh", ngaySinh);
        req.setAttribute("diaChiKhachHang", diaChiKhachHang);
        req.setAttribute("diaChiMuaHang", diaChiMuaHang);
        req.setAttribute("diaChiNhanHang", diaChiNhanHang);
        req.setAttribute("dienThoai", dienThoai);*/
        req.setAttribute("email", email);
        req.setAttribute("dongYDieuKhoan", dongYDieuKhoan);
        req.setAttribute("dongYNhanMail", dongYNhanMail);

        String url = "";
        String baoLoi = "";
        khachHangDAO khachHangDAO = new khachHangDAO();
        if (tenDangNhap == null || tenDangNhap.trim().isEmpty()) {
            baoLoi += "Tên đăng nhập không được để trống. ";
        } else if (khachHangDAO.kiemTraTenDangNhap(tenDangNhap)) {
            baoLoi += "Tên đăng nhập đã tồn tại, vui lòng thử lại! ";
        }

        if (matKhau == null || !matKhau.equals(matKhauNhapLai)) {
            baoLoi += "Mật khẩu không khớp. ";
        } else {
            matKhau = maHoa.toSHA(matKhau);
        }


        if (baoLoi.length() > 0) {
            url = "/khachhang/register.jsp";
        } else {
            Random rd = new Random();
            String maKhachHang = rd.nextInt(1000) + "";
            String vaiTro = "khachhang";
            List<GioHang> lcs = new ArrayList<>();
            khachHang kh = new khachHang(maKhachHang, tenDangNhap, matKhau, email, dongYNhanMail != null, lcs,vaiTro);
            khachHangDAO.insert(kh);
            url = "/success.jsp";
        }

        req.setAttribute("baoLoi", baoLoi);
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(req, resp);

    }

    private void sign_out(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.invalidate();
//        String url = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()
//                + req.getContextPath();
        Cookie ck[] = req.getCookies();
        if(ck != null){
            for(Cookie c : ck){
                if(c.getName().equals("username")){
                    c.setMaxAge(0);
                    resp.addCookie(c);
                }else if(c.getName().equals("password")){
                   c.setMaxAge(0);
                    resp.addCookie(c);
                }
            }
        }
        resp.sendRedirect("index.jsp");
    }
    public void sign_in(String u,String p,HttpSession session){
        khachHang kh = new khachHang();
        kh.setTenDangNhap(u);
        p = maHoa.toSHA(p);
        kh.setMatKhau(p);
        khachHangDAO dao = new khachHangDAO();
        khachHang khachHang = dao.selectByIdAndPassword(kh);

        String url = "";
        if (khachHang != null) {
            session.setAttribute("khachHang", khachHang);
            url = "/index.jsp";
        }

    }
//dangnhap
    public void sign_in(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tenDangNhap = req.getParameter("tenDangNhap");
        String matKhau = req.getParameter("matKhau");
        String rmbMe = req.getParameter("remember-me");
        if(rmbMe != null){
            // Lưu Cookie
            resp.setContentType("text/html");
            PrintWriter out = resp.getWriter();

            Cookie ckU = new Cookie("username",tenDangNhap);
            Cookie ckP = new Cookie("password",matKhau);

            ckU.setMaxAge(60 * 60 * 24 * 30);//set theo giây, đây là lưu 1 tháng
            ckP.setMaxAge(60 * 60 * 24 * 30);

            resp.addCookie(ckU);
            resp.addCookie(ckP);

            //************
        }
        matKhau = maHoa.toSHA(matKhau);

        khachHang kh = new khachHang();
        kh.setTenDangNhap(tenDangNhap);
        kh.setMatKhau(matKhau);
        khachHangDAO dao = new khachHangDAO();
        khachHang khachHang = dao.selectByIdAndPassword(kh);

        String url = "";
        if (khachHang != null) {

            HttpSession session = req.getSession();
            session.setAttribute("khachHang", khachHang);
            url = "/index.jsp";
        } else {
            req.setAttribute("baoLoi", "tên đăng nhập hoặc mật khẩu không chính xác!");
            url = "/khachhang/dangnhap.jsp";
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(req, resp);
    }

    private void changePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String matKhauHienTai = req.getParameter("matKhauHienTai");
        String matKhauMoi = req.getParameter("matKhauMoi");
        String matKhauMoiNhapLai = req.getParameter("matKhauMoiNhapLai");

        String matKhauHienTai_Sha1 = maHoa.toSHA(matKhauHienTai);

        String baoLoi = "";
        String url = "/khachhang/changePassword.jsp";

        // Kiem tra mat khau cu co giong hay khong
        HttpSession session = req.getSession();
        Object obj = session.getAttribute("khachHang");
        khachHang khachHang = null;
        if (obj != null)
            khachHang = (khachHang) obj;
        if (khachHang == null) {
            baoLoi = "Bạn chưa đăng nhập vào hệ thống!";
        } else {
            // Neu khach hang da dang nhap
            if (!matKhauHienTai_Sha1.equals(khachHang.getMatKhau())) {
                baoLoi = "Mật khẩu hiện tại không chính xác!";
            } else {
                if (!matKhauMoi.equals(matKhauMoiNhapLai)) {
                    baoLoi = "Mật khẩu nhập lại không khớp!";
                } else {
                    String matKhauMoi_Sha1 = maHoa.toSHA(matKhauMoi);
                    khachHang.setMatKhau(matKhauMoi_Sha1);
                    khachHangDAO khd = new khachHangDAO();
                    if (khd.changePassword(khachHang)) {
                        baoLoi = "Mật khẩu đã thay đổi thành công. sẽ quay trở lại trang chủ sau 3s";
                        session.setAttribute("khachHang", khachHang);
                        req.setAttribute("redirect", "index.jsp");
                    } else {
                        baoLoi = "Quá trình thay đổi mật khẩu không thành công!";
                    }
                }
            }
        }

        req.setAttribute("baoLoi", baoLoi);
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(req, resp);
    }

    /*private void changeInformation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String hoVaTen = req.getParameter("hoVaTen");
        String gioiTinh = req.getParameter("gioiTinh");
        String ngaySinh = req.getParameter("ngaySinh");
        String diaChiKhachHang = req.getParameter("diaChiKhachHang");
        String diaChiNhanHang = req.getParameter("diaChiNhanHang");
        String dienThoai = req.getParameter("dienThoai");
        String email = req.getParameter("email");
        String dongYNhanMail = req.getParameter("dongYNhanMail");

        req.setAttribute("hoVaTen", hoVaTen);
        req.setAttribute("gioiTinh", gioiTinh);
        req.setAttribute("ngaySinh", ngaySinh);
        req.setAttribute("diaChiKhachHang", diaChiKhachHang);
        req.setAttribute("diaChiNhanHang", diaChiNhanHang);
        req.setAttribute("dienThoai", dienThoai);
        req.setAttribute("email", email);
        req.setAttribute("dongYNhanMail", dongYNhanMail);

        String url = "";
        String baoLoi = "";

        khachHangDAO khachHangDAO = new khachHangDAO();
        req.setAttribute("baoLoi", baoLoi);

        if (baoLoi.length() > 0) {
            url = "/khachhang/register.jsp";
        } else {
            Object object = req.getSession().getAttribute("khachHang");
            khachHang khachHang = null;
            if (object != null) {
                khachHang = (khachHang) object;
                if (khachHang != null) {
                    String maKhachHang = khachHang.getMaKhachHang();
                    List<GioHang> lcs  = new ArrayList<>();
                    khachHang kh = new khachHang(maKhachHang, "", "", hoVaTen, gioiTinh, Date.valueOf(ngaySinh), diaChiKhachHang, diaChiNhanHang, dienThoai, email, dongYNhanMail != null, "",lcs);
                    khachHangDAO.FixInfor(kh);
                    khachHang kh2 = khachHangDAO.selectById(kh);
                    req.getSession().setAttribute("khachHang", kh2);
                    url = "/success.jsp";
                }
            }
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(req, resp);
    }*/
    public void mybill(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        khachHang khachHang = (khachHang) session.getAttribute("khachHang");
        if (khachHang != null) {
            donHangDAO donHangDao = new donHangDAO();
            ArrayList<donHang> list = donHangDao.selectAll();
            req.setAttribute("list", list);
            RequestDispatcher rd = req.getRequestDispatcher("/khachhang/myBill.jsp");
            rd.forward(req, resp);
        }
    }
    public void delete_bill(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        khachHang khachHang = (khachHang) session.getAttribute("khachHang");
        if (khachHang != null) {
            String id = req.getParameter("id");
            donHangDAO donHangDao = new donHangDAO();
            donHang donHang = new donHang();
            donHang.setMaDonHang(id);
            String url = "/khachhang/myBill.jsp";
            StringBuilder baoLoi= new StringBuilder();

            int result = donHangDao.delete(donHang);
            if (result >= 1) {
                baoLoi.append("Huy thanh cong");
                req.setAttribute("cl", "green");
            }else {
                baoLoi.append("Xoa khong thanh cong");
                req.setAttribute("cl", "red");
            }
            ArrayList<donHang> list = donHangDao.selectAll();
            req.setAttribute("list", list);
            req.setAttribute("baoLoi", baoLoi.toString());
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(req, resp);
        }
    }
    public void updateInformation (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        khachHang kh = (khachHang) session.getAttribute("khachHang");
        String hoVaTen = req.getParameter("hoVaTen");
        String gioiTinh = req.getParameter("gioiTinh");
        String ngaySinh = req.getParameter("ngaySinh");
        String diaChiKhachHang = req.getParameter("diaChiKhachHang");
        String diaChiNhanHang = req.getParameter("diaChiNhanHang");
        String dienThoai = req.getParameter("dienThoai");
        String dongYNhanMail = req.getParameter("dongYNhanMail");

        req.setAttribute("hoVaTen", hoVaTen);
        req.setAttribute("gioiTinh", gioiTinh);
        req.setAttribute("ngaySinh", ngaySinh);
        req.setAttribute("diaChiKhachHang", diaChiKhachHang);
        req.setAttribute("diaChiNhanHang", diaChiNhanHang);
        req.setAttribute("dienThoai", dienThoai);
        khachHangDAO khachHangDAO= new khachHangDAO();
        StringBuilder baoLoi=new StringBuilder();
        String url = "/khachhang/updateInformation.jsp";
        if (kh != null) {
            String makhachhang= kh.getMaKhachHang();
            List<GioHang> lcs  = new ArrayList<>();
            khachHang khachHang= new khachHang(makhachhang,"","",hoVaTen,gioiTinh,Date.valueOf(ngaySinh),diaChiKhachHang,diaChiNhanHang,dienThoai,"",dongYNhanMail!=null,"",lcs);
            khachHangDAO.FixInfor(khachHang);
            khachHang kh2 = khachHangDAO.selectById(kh);
            req.getSession().setAttribute("khachHang", kh2);
            baoLoi.append("cap nhat thong tin thanh cong !");
            req.setAttribute("cl", "green");
        }
        req.setAttribute("baoLoi", baoLoi.toString());
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(req, resp);
    }

}
