package database;

import model.sanPham;
import model.tacGia;
import model.theLoai;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class sanPhamDAO implements DAOInterface<sanPham> {

    static sanPhamDAO ins;

    public static sanPhamDAO gI() {
        if (ins == null) ins = new sanPhamDAO();
        return ins;
    }

    @Override
    public ArrayList<sanPham> selectAll() {
        ArrayList<sanPham> ketQua = new ArrayList<>();
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "select * from sanpham";
            PreparedStatement ps = con.prepareStatement(sql);

            System.out.println(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String masanpham = rs.getString("ma_san_pham");
                String tensanpham = rs.getString("ten_san_pham");
                String matacgia = rs.getString("ma_tac_gia");
                int namxuatban = rs.getInt("nam_xuat_ban");
                double giagoc = rs.getDouble("gia_goc");
                double giaban = rs.getDouble("gia_ban");
                int soluong = (int) rs.getDouble("so_luong");
                String matheloai = rs.getString("ma_the_loai");
                String mota = rs.getString("mo_ta");
                String themAnh = rs.getString("them_anh");

                tacGia tacGia = (new tacGiaDAO().selectById(new tacGia(matacgia, "", null, "")));
                theLoai theLoai = (new theLoaiDAO().selectById(new theLoai(matheloai, "")));

                sanPham sp = new sanPham(masanpham, tensanpham, tacGia, namxuatban, giagoc, giaban, soluong, theLoai, mota, themAnh);
                ketQua.add(sp);
            }

            JDBCutil.closeConnection(con);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    public sanPham selectByID(int dcm) {
        sanPham ketqua = null;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "select * from sanpham where ma_san_pham=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, dcm);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String masanpham = rs.getString("ma_san_pham");
                String tensanpham = rs.getString("ten_san_pham");
                String matacgia = rs.getString("ma_tac_gia");
                int namxuatban = rs.getInt("nam_xuat_ban");
                double giagoc = rs.getDouble("gia_goc");
                double giaban = rs.getDouble("gia_ban");
                int soluong = (int) rs.getDouble("so_luong");
                String matheloai = rs.getString("ma_the_loai");
                String mota = rs.getString("mo_ta");
                String themAnh = rs.getString("them_anh");

                tacGia tacGia = (new tacGiaDAO().selectById(new tacGia(matacgia, "", null, "")));
                theLoai theLoai = (new theLoaiDAO().selectById(new theLoai(matheloai, "")));

                ketqua = new sanPham(masanpham, tensanpham, tacGia, namxuatban, giagoc, giaban, soluong, theLoai, mota, themAnh);

                break;
            }
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public sanPham selectById(sanPham t) {
        sanPham ketqua = null;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "select * from sanpham where ma_san_pham=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, t.getMaSanPham());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String masanpham = rs.getString("ma_san_pham");
                String tensanpham = rs.getString("ten_san_pham");
                String matacgia = rs.getString("ma_tac_gia");
                int namxuatban = rs.getInt("nam_xuat_ban");
                double giagoc = rs.getDouble("gia_goc");
                double giaban = rs.getDouble("gia_ban");
                int soluong = (int) rs.getDouble("so_luong");
                String matheloai = rs.getString("ma_the_loai");
                String mota = rs.getString("mo_ta");
                String themAnh = rs.getString("them_anh");

                tacGia tacGia = (new tacGiaDAO().selectById(new tacGia(matacgia, "", null, "")));
                theLoai theLoai = (new theLoaiDAO().selectById(new theLoai(matheloai, "")));

                ketqua = new sanPham(masanpham, tensanpham, tacGia, namxuatban, giagoc, giaban, soluong, theLoai, mota, themAnh);

                break;
            }
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public int insert(sanPham t) {
        int ketqua = 0;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "insert into sanpham (ma_san_pham,ten_san_pham, ma_tac_gia, nam_xuat_ban," +
                    "  gia_goc, gia_ban, so_luong, ma_the_loai, mo_ta,them_anh)" +
                    " values (?,?,?,?,?,?,?,?,?,?) ";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, t.getMaSanPham());
            st.setString(2, t.getTenSanPham());
            st.setString(3, t.getTacGia().getMaTacGia());
            st.setInt(4, t.getNamXuatBan());
            st.setDouble(5, t.getGiaGoc());
            st.setDouble(6, t.getGiaBan());
            st.setInt(7, t.getSoLuong());
            st.setString(8, t.getTheLoai().getMaTheLoai());
            st.setString(9, t.getMoTa());
            st.setString(10, t.getThemAnh());

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
    public int insertAll(ArrayList<sanPham> arr) {
        int dem = 0;
        for (sanPham sanPham : arr) {
            dem += this.insert(sanPham);
        }
        return dem;
    }

    @Override
    public int delete(sanPham t) {
        int ketqua = 0;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "delete from sanpham where ma_san_pham=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaSanPham());


            System.out.println(sql);
            ketqua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketqua + " dòng bị thay đổi!");

            // Bước 5:
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;

    }

    @Override
    public int deleteAll(ArrayList<sanPham> arr) {
        int dem = 0;
        for (sanPham sanPham : arr) {
            dem += this.delete(sanPham);
        }
        return dem;

    }

    @Override
    public int update(sanPham t) {
        int ketqua = 0;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "UPDATE sanpham " + " SET " + "ten_san_pham=?, ma_tac_gia=?, nam_xuat_ban=?, gia_goc=?, "
                    + "gia_ban=?, so_luong=?, ma_the_loai=?, mo_ta=?, them_anh=?" + " WHERE ma_san_pham=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, t.getMaSanPham());
            st.setString(2, t.getTenSanPham());
            st.setString(3, t.getTacGia().getMaTacGia());
            st.setInt(4, t.getNamXuatBan());
            st.setDouble(5, t.getGiaGoc());
            st.setDouble(6, t.getGiaBan());
            st.setInt(7, t.getSoLuong());
            st.setString(8, t.getTheLoai().getMaTheLoai());
            st.setString(9, t.getMoTa());
            st.setString(10, t.getThemAnh());



            System.out.println(sql);
            ketqua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: " + sql);
            System.out.println("Có " + ketqua + " dòng bị thay đổi!");

            // Bước 5:
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketqua;
    }

    public boolean checkMASP(String maSanPham) {
        boolean ketqua = false;
        try {
            Connection con = JDBCutil.getConnection();
            String sql = "select * from sanpham where ma_san_pham=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, maSanPham);

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

    public ArrayList<sanPham> searchByNameAndCategory(String input) {
        ArrayList<sanPham> ketqua = new ArrayList<>();
        try {
            Connection con = JDBCutil.getConnection();
            String sql = "select * from sanpham where ten_san_pham like ? or ma_the_loai like ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, "%" + input + "%");
            ps.setString(2, "%" + input + "%");
            System.out.println(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String masanpham = rs.getString("ma_san_pham");
                String tensanpham = rs.getString("ten_san_pham");
                String matacgia = rs.getString("ma_tac_gia");
                int namxuatban = rs.getInt("nam_xuat_ban");
                double giagoc = rs.getDouble("gia_goc");
                double giaban = rs.getDouble("gia_ban");
                int soluong = (int) rs.getDouble("so_luong");
                String matheloai = rs.getString("ma_the_loai");
                String mota = rs.getString("mo_ta");
                String themAnh = rs.getString("them_anh");
                tacGia tacGia = (new tacGiaDAO().selectById(new tacGia(matacgia, "", null, "")));
                theLoai theLoai = (new theLoaiDAO().selectById(new theLoai(matheloai, "")));
                sanPham sp = new sanPham(masanpham, tensanpham, tacGia, namxuatban, giagoc, giaban, soluong, theLoai, mota, themAnh);
                ketqua.add(sp);
            }
            JDBCutil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ketqua;
    }

    /*    public ArrayList<sanPham> searchByNameAndCategory(String input) {
            ArrayList<sanPham> ketQua = new ArrayList<>();

            try {
                 Connection con = JDBCutil.getConnection();
                String sql = "SELECT * FROM sanpham WHERE ten_san_pham LIKE ? OR ma_the_loai LIKE ?";
                PreparedStatement ps = con.prepareStatement(sql);

                ps.setString(1, "%" + tenSanPham + "%");
                ps.setString(2, "%" + maTheLoai + "%");

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    String masanpham = rs.getString("ma_san_pham");
                    String tensanpham = rs.getString("ten_san_pham");
                    String mota = rs.getString("mo_ta");
                    double gia = rs.getDouble("gia");
                    String hinhanh = rs.getString("hinh_anh");
                    String matheloai = rs.getString("ma_the_loai");

                    // Tạo đối tượng sanPham và thêm vào danh sách kết quả
                    sanPham sp = new sanPham(masanpham, tensanpham, mota, gia, hinhanh, matheloai);
                    ketQua.add(sp);
                }
                JDBCutil.closeConnection(con);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return ketQua;
        }*/
    public ArrayList<sanPham> selectByPage(int start, int pageSize) {
        ArrayList<sanPham> ketQua = new ArrayList<>();
        try {
            Connection con = JDBCutil.getConnection();
            String sql = "select * from sanpham ORDER BY ma_san_pham LIMIT ?,?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, start);
            pr.setInt(2, pageSize);
            ResultSet rs = pr.executeQuery();
            System.out.println(sql);
            while (rs.next()) {
                String masanpham = rs.getString("ma_san_pham");
                String tensanpham = rs.getString("ten_san_pham");
                String matacgia = rs.getString("ma_tac_gia");
                int namxuatban = rs.getInt("nam_xuat_ban");
                double giagoc = rs.getDouble("gia_goc");
                double giaban = rs.getDouble("gia_ban");
                int soluong = (int) rs.getDouble("so_luong");
                String matheloai = rs.getString("ma_the_loai");
                String mota = rs.getString("mo_ta");
                String themAnh = rs.getString("them_anh");

                tacGia tacGia = (new tacGiaDAO().selectById(new tacGia(matacgia, "", null, "")));
                theLoai theLoai = (new theLoaiDAO().selectById(new theLoai(matheloai, "")));

                sanPham sp = new sanPham(masanpham, tensanpham, tacGia, namxuatban, giagoc, giaban, soluong, theLoai, mota, themAnh);
                ketQua.add(sp);
            }
            JDBCutil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    public int getTotalProducts() {
        int total = 0;

        String query = "SELECT COUNT(*) FROM sanpham";
        try (
                Connection conn = JDBCutil.getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                total = rs.getInt(1);
            }
            JDBCutil.closeConnection(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }


    public ArrayList<sanPham> getProductsByQuery(String sql){
        ArrayList<sanPham> ketQua = new ArrayList<>();
        try{
            Connection con = JDBCutil.getConnection();
            PreparedStatement pr = con.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()){
                String masanpham = rs.getString("ma_san_pham");
                String tensanpham = rs.getString("ten_san_pham");
                String matacgia = rs.getString("ma_tac_gia");
                int namxuatban = rs.getInt("nam_xuat_ban");
                double giagoc = rs.getDouble("gia_goc");
                double giaban = rs.getDouble("gia_ban");
                int soluong = (int) rs.getDouble("so_luong");
                String matheloai = rs.getString("ma_the_loai");
                String mota = rs.getString("mo_ta");
                String themAnh = rs.getString("them_anh");

                tacGia tacGia = (new tacGiaDAO().selectById(new tacGia(matacgia, "", null, "")));
                theLoai theLoai = (new theLoaiDAO().selectById(new theLoai(matheloai, "")));

                sanPham sp = new sanPham(masanpham, tensanpham, tacGia, namxuatban, giagoc, giaban, soluong, theLoai, mota, themAnh);
                ketQua.add(sp);
            }
            JDBCutil.closeConnection(con);
        }catch (Exception e){
            e.printStackTrace();
        }
        return ketQua;
    }

    public  ArrayList<sanPham> getNewest(){
        String sql = "select * from sanpham order by nam_xuat_ban desc";
        return getProductsByQuery(sql);
    }
    public ArrayList<sanPham> getBestSeller(){
        String sql = "select * from sanpham Order by so_luong desc";
        return getProductsByQuery(sql);
    }
    public  ArrayList<sanPham> getPriceLowToHigh(){
        String sql = "select * from sanpham Order by gia_ban asc";
        return getProductsByQuery(sql);
    }
    public ArrayList<sanPham> getPriceHighToLow(){
        String sql = "select * from sanpham Order by gia_ban desc";
        return getProductsByQuery(sql);
    }



}
