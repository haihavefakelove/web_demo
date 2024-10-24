package database;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import model.GioHang;
import model.khachHang;

import java.lang.reflect.Type;
import java.sql.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class khachHangDAO implements DAOInterface<khachHang> {
    @Override
    public ArrayList<khachHang> selectAll() {
        ArrayList<khachHang> ketqua = new ArrayList();
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "select * from khachhang";
            PreparedStatement st = con.prepareStatement(sql);

            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String maKhacHang = rs.getString("ma_khach_hang");
                String tenDangNhap = rs.getString("ten_dang_nhap");
                String matKhau = rs.getString("mat_khau");
                String hoVaTen = rs.getString("ho_va_ten");
                String gioiTinh = rs.getString("gioi_tinh");
                String diaChi = rs.getString("dia_chi");
                String diaChiNhanHang = rs.getString("dia_chi_nhan_hang");
                Date ngaySinh = rs.getDate("ngay_sinh");
                String soDienThoai = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                boolean dangKyNhanBangTin = rs.getBoolean("dang_ky_nhan_ban_tin");
                String vaiTro = rs.getString("vai_tro");
                String lc = rs.getString("gio_hang");
                List<GioHang> lcs = new ArrayList<>();
                if(lc != null && !lc.isEmpty()){
                    Gson gson = new Gson();
                    Type listType = new TypeToken<List<GioHang>>(){}.getType();
                    lcs = gson.fromJson(lc,listType);
                }

                khachHang kh= new  khachHang(maKhacHang,tenDangNhap,matKhau,hoVaTen,gioiTinh,ngaySinh,diaChi,diaChiNhanHang,soDienThoai,email,dangKyNhanBangTin,vaiTro,lcs);
                ketqua.add(kh);
            }
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public khachHang selectById(khachHang t) {
        khachHang ketqua = null;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "select * from khachhang where ma_khach_hang = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaKhachHang());

            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String maKhacHang = rs.getString("ma_khach_hang");
                String tenDangNhap = rs.getString("ten_dang_nhap");
                String matKhau = rs.getString("mat_khau");
                String hoVaTen = rs.getString("ho_va_ten");
                String gioiTinh = rs.getString("gioi_tinh");
                String diaChi = rs.getString("dia_chi");
                String diaChiNhanHang = rs.getString("dia_chi_nhan_hang");
                Date ngaySinh = rs.getDate("ngay_sinh");
                String soDienThoai = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                boolean dangKyNhanBangTin = rs.getBoolean("dang_ky_nhan_ban_tin");
                String vaiTro= rs.getString("vai_tro");
                String lc = rs.getString("gio_hang");
                // load thông tin giỏ hàng
                List<GioHang> lcs = new ArrayList<>();
                if(lc != null && !lc.isEmpty()){
                    Gson gson = new Gson();
                    Type listType = new TypeToken<List<GioHang>>(){}.getType();
                    lcs = gson.fromJson(lc,listType);
                }

                ketqua= new  khachHang(maKhacHang,tenDangNhap,matKhau,hoVaTen,gioiTinh,ngaySinh,diaChi,diaChiNhanHang,soDienThoai,email,dangKyNhanBangTin,vaiTro,lcs);
                break;
            }
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;
    }
    @Override
    public int insert(khachHang t) {
        int ketqua = 0;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "insert into khachhang (ma_khach_hang,ten_dang_nhap,mat_khau," +
                    "email,dang_ky_nhan_ban_tin,vai_tro) values(?,?,?,?,?,?)";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, t.getMaKhachHang());
            st.setString(2, t.getTenDangNhap());
            st.setString(3, t.getMatKhau());
            st.setString(4, t.getEmail());
            st.setBoolean(5, t.isDangKyNhanBangTin());
            st.setString(6, t.getVaiTro());

            ketqua = st.executeUpdate();

            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketqua + " dòng bị thay đổi!");

            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;
    }

    /*@Override
    public int insert(khachHang t) {
        int ketqua = 0;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "insert into khachhang (ma_khach_hang,ten_dang_nhap,mat_khau,ho_va_ten,gioi_tinh,ngay_sinh,dia_chi," +
                    "dia_chi_nhan_hang,dia_chi_mua_hang,so_dien_thoai,email,dang_ky_nhan_ban_tin,vai_tro) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, t.getMaKhachHang());
            st.setString(2, t.getTenDangNhap());
            st.setString(3, t.getMatKhau());
            st.setString(4, t.getHoVaten());
            st.setString(5, t.getGioiTinh());
            st.setDate(6, t.getNgaySinh());
            st.setString(7, t.getDiaChi());
            st.setString(8, t.getDiaChiNhanHang());
            st.setString(9, t.getDiaChiMuaHang());
            st.setString(10, t.getSoDienThoai());
            st.setString(11, t.getEmail());
            st.setBoolean(12, t.isDangKyNhanBangTin());
            st.setString(13, t.getVaiTro());

            ketqua = st.executeUpdate();

            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketqua + " dòng bị thay đổi!");

            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;
    }*/

    @Override
    public int insertAll(ArrayList<khachHang> list) {
        int dem = 0;
        for (khachHang kh : list) {
            dem += insert(kh);
        }
        return dem;
    }

    @Override
    public int delete(khachHang t) {
        int ketqua = 0;

        try {
            Connection con = JDBCutil.getConnection();

            String sql = "delete from khachhang where ma_khach_hang = ?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, t.getMaKhachHang());

            System.out.println(sql);
            ketqua = st.executeUpdate();

            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketqua + " dòng bị thay đổi!");

            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public int deleteAll(ArrayList<khachHang> list) {
        int dem = 0;
        for (khachHang kh : list) {
            dem += this.delete(kh);
        }
        return dem;
    }
    public static void updateCart(String mkh,String lc){
        try{
            Connection con = JDBCutil.getConnection();
            String cmd = "UPDATE khachhang set gio_hang = ? " + "where ma_khach_hang = ?";
            PreparedStatement st = con.prepareStatement(cmd);
            st.setString(1,lc);
            st.setString(2,mkh);
            st.executeUpdate();

            JDBCutil.closeConnection(con);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    @Override
    public int update(khachHang t) {
        int ketqua = 0;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "UPDATE khachhang " + " SET " + " ten_dang_nhap=?" + ", mat_khau=?" + ", ho_va_ten=?" + ", gioi_tinh=?" +
                    ", ngay_sinh=?" + ", dia_chi=?" + ", dia_chi_nhan_hang=?" + ", so_dien_thoai=?"
                    + ", email=?" + ", dang_ky_nhan_ban_tin=?"+",vai_tro=?" + " WHERE ma_khach_hang=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, t.getTenDangNhap());
            st.setString(2, t.getMatKhau());
            st.setString(3, t.getHoVaten());
            st.setString(4, t.getGioiTinh());
            st.setDate(5, t.getNgaySinh());
            st.setString(6, t.getDiaChi());
            st.setString(7, t.getDiaChiNhanHang());
            st.setString(8, t.getSoDienThoai());
            st.setString(9, t.getEmail());
            st.setBoolean(10, t.isDangKyNhanBangTin());
            st.setString(11,t.getVaiTro());
            st.setString(12, t.getMaKhachHang());

            ketqua = st.executeUpdate();

            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketqua + " dòng bị thay đổi!");
            JDBCutil.closeConnection(con);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;

    }

    public boolean kiemTraTenDangNhap(String tenDangNhap) {
        boolean ketqua = false;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "select * from khachhang where ten_dang_nhap = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, tenDangNhap);

            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                return true;
            }
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;
    }

    public khachHang selectByIdAndPassword(khachHang t){
        khachHang ketqua = null;
        try{
            Connection con = JDBCutil.getConnection();

            String sql = "select * from khachhang where ten_dang_nhap = ? and mat_khau = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getTenDangNhap() );
            st.setString(2, t.getMatKhau());

            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            while(rs.next()) {
                String maKhacHang = rs.getString("ma_khach_hang");
                String tenDangNhap = rs.getString("ten_dang_nhap");
                String matKhau = rs.getString("mat_khau");
                String hoVaTen = rs.getString("ho_va_ten");
                String gioiTinh = rs.getString("gioi_tinh");
                Date ngaySinh = rs.getDate("ngay_sinh");
                String diaChi = rs.getString("dia_chi");
                String diaChiNhanHang = rs.getString("dia_chi_nhan_hang");
                String soDienThoai = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                boolean dangKyNhanBangTin = rs.getBoolean("dang_ky_nhan_ban_tin");
                String vaiTro = rs.getString("vai_tro");
                String lc = rs.getString("gio_hang");
                List<GioHang> lcs = new ArrayList<>();
                if(lc != null && !lc.isEmpty()){
                    Gson gson = new Gson();
                    Type listType = new TypeToken<List<GioHang>>(){}.getType();
                    lcs = gson.fromJson(lc,listType);
                }

                ketqua= new  khachHang(maKhacHang,tenDangNhap,matKhau,hoVaTen,gioiTinh,ngaySinh,diaChi,diaChiNhanHang,soDienThoai,email,dangKyNhanBangTin,vaiTro,lcs);
                break;
            }
            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketqua;
    }
    public boolean changePassword(khachHang t) {
        int ketQua = 0;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCutil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "UPDATE khachhang " + " SET "  + " mat_khau=?" + " WHERE ma_khach_hang=?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,t.getMatKhau());
            st.setString(2, t.getMaKhachHang());
            // Bước 3: thực thi câu lệnh SQL
            ketQua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketQua + " dòng bị thay đổi!");

            // Bước 5:
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua>0;
    }
    public int FixInfor(khachHang t) {
        int ketqua = 0;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "UPDATE khachhang " + " SET " + "ho_va_ten=?" + ", gioi_tinh=?" +
                    ", ngay_sinh=?" + ", dia_chi=?" + ", dia_chi_nhan_hang=?" + ", so_dien_thoai=?"
                    + ", email=?" + ", dang_ky_nhan_ban_tin=?" + " WHERE ma_khach_hang=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, t.getHoVaten());
            st.setString(2, t.getGioiTinh());
            st.setDate(3, t.getNgaySinh());
            st.setString(4, t.getDiaChi());
            st.setString(5, t.getDiaChiNhanHang());
            st.setString(6, t.getSoDienThoai());
            st.setString(7, t.getEmail());
            st.setBoolean(8, t.isDangKyNhanBangTin());
            st.setString(9, t.getMaKhachHang());

            ketqua = st.executeUpdate();

            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketqua + " dòng bị thay đổi!");
            JDBCutil.closeConnection(con);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;

    }
    public int UpdateInfor(khachHang t) {
        int ketqua = 0;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "UPDATE khachhang " + " SET " + "ho_va_ten=?" + ", gioi_tinh=?" +
                    ", ngay_sinh=?" + ", dia_chi=?" + ", dia_chi_nhan_hang=?" + ", so_dien_thoai=?"
                     + " WHERE ma_khach_hang=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, t.getHoVaten());
            st.setString(2, t.getGioiTinh());
            st.setDate(3, t.getNgaySinh());
            st.setString(4, t.getDiaChi());
            st.setString(5, t.getDiaChiNhanHang());
            st.setString(6, t.getSoDienThoai());
            st.setString(7, t.getMaKhachHang());

            ketqua = st.executeUpdate();

            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketqua + " dòng bị thay đổi!");
            JDBCutil.closeConnection(con);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;

    }
}
