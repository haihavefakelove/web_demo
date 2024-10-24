package database;
import model.TrangThaiDonHang;
import model.donHang;
import model.khachHang;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;


public class donHangDAO implements DAOInterface<donHang>{

    @Override
    public ArrayList<donHang> selectAll() {
        ArrayList<donHang> ketqua = new ArrayList<>();
        try {
            Connection con = JDBCutil.getConnection();
            String sql = "select * from donhang";
            PreparedStatement st = con.prepareStatement(sql);

            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()){
                String madonhang= rs.getString("ma_don_hang");
                String makhachhang= rs.getString("ma_khach_hang");
                String diachinhanhang = rs.getString("dia_chi_nhan_hang");
                String hinhthucthanhtoan = rs.getString("hinh_thuc_thanh_toan");
                double sotienconthieu = rs.getDouble("so_tien_con_thieu");
                Date ngaydathang = rs.getDate("ngay_dat_hang");
                Date ngaygiaohang= rs.getDate("ngay_giao_hang");
                String trangThaiString = rs.getString("trang_thai"); // Giả sử có cột trạng thái trong DB
                TrangThaiDonHang trangThai = TrangThaiDonHang.valueOf(trangThaiString);

                khachHang kh1= new khachHang();
                kh1.setMaKhachHang(makhachhang);
                khachHang kh= new khachHangDAO().selectById(kh1);
                donHang dh = new donHang(madonhang,kh,diachinhanhang,hinhthucthanhtoan,sotienconthieu,ngaydathang,ngaygiaohang,trangThai);
                dh.setTrangThaiDonHang(trangThai);
                ketqua.add(dh);
            }
            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public donHang selectById(donHang t) {
        donHang ketqua = null;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "select * from donhang where ma_don_hang=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1,t.getMaDonHang());
            ResultSet rs = st.executeQuery();

            while(rs.next()){
                String madonhang= rs.getString("ma_don_hang");
                String makhachhang= rs.getString("ma_khach_hang");
                String diachinhanhang = rs.getString("dia_chi_nhan_hang");
                String hinhthucthanhtoan = rs.getString("hinh_thuc_thanh_toan");
                double sotienconthieu = rs.getDouble("so_tien_con_thieu");
                Date ngaydathang = rs.getDate("ngay_dat_hang");
                Date ngaygiaohang= rs.getDate("ngay_giao_hang");
                String trangThaiString = rs.getString("trang_thai"); // Giả sử có cột trạng thái trong DB
                TrangThaiDonHang trangThai = TrangThaiDonHang.valueOf(trangThaiString);


                khachHang kh1= new khachHang();
                kh1.setMaKhachHang(makhachhang);
                khachHang kh= new khachHangDAO().selectById(kh1);
                ketqua = new donHang(madonhang,kh,diachinhanhang,hinhthucthanhtoan,sotienconthieu,ngaydathang,ngaygiaohang,trangThai);

                break;

            }
            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketqua;
    }
    public donHang selectByID(int id){
        donHang ketqua = null;
        try{
            Connection con = JDBCutil.getConnection();
            String sql = "select * from donhang where ma_don_hang=?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1,id);
            ResultSet rs = pr.executeQuery();
            while(rs.next()){
                String madonhang= rs.getString("ma_don_hang");
                String makhachhang= rs.getString("ma_khach_hang");
                String diachinhanhang = rs.getString("dia_chi_nhan_hang");
                String hinhthucthanhtoan = rs.getString("hinh_thuc_thanh_toan");
                double sotienconthieu = rs.getDouble("so_tien_con_thieu");
                Date ngaydathang = rs.getDate("ngay_dat_hang");
                Date ngaygiaohang= rs.getDate("ngay_giao_hang");
                String trangThaiString = rs.getString("trang_thai"); // Giả sử có cột trạng thái trong DB
                TrangThaiDonHang trangThai = TrangThaiDonHang.valueOf(trangThaiString);

                khachHang kh1= new khachHang();
                kh1.setMaKhachHang(makhachhang);
                khachHang kh= new khachHangDAO().selectById(kh1);
                ketqua = new donHang(madonhang,kh,diachinhanhang,hinhthucthanhtoan,sotienconthieu,ngaydathang,ngaygiaohang,trangThai);

                break;

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public int insert(donHang t) {
        int ketqua = 0;
        try {
            Connection con = JDBCutil.getConnection();

            String sql = "insert into donhang (ma_don_hang, ma_khach_hang, dia_chi_nhan_hang,hinh_thuc_thanh_toan" +
                    ",so_tien_con_thieu,ngay_dat_hang,ngay_giao_hang,trang_thai) values (?, ?, ?, ?, ?, ?, ?,?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,t.getMaDonHang());
            st.setString(2,t.getKhachHang().getMaKhachHang());
            st.setString(3, t.getDiaChiNhanHang());
            st.setString(4, t.getHinhThucThanhToan());
            st.setDouble(5, t.getTongtien());
            LocalDate ngaydathang= LocalDate.now();
            st.setDate(6,Date.valueOf(ngaydathang));
            LocalDate ngayNhanHang = ngaydathang.plusDays(5);
            st.setDate(7,Date.valueOf(ngayNhanHang));
            st.setString(8,t.getTrangThaiDonHang().name());

            ketqua=st.executeUpdate();
            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public int insertAll(ArrayList<donHang> arr) {
        int dem=0;
        for(donHang t:arr){
            dem+=this.insert(t);
        }
        return dem;
    }

    @Override
    public int delete(donHang t) {
        int ketqua = 0;
        try{
            Connection con = JDBCutil.getConnection();
            String sql = "delete from donhang where ma_don_hang=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1,t.getMaDonHang());
            ketqua= st.executeUpdate();
            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public int deleteAll(ArrayList<donHang> arr) {
        int dem=0;
         for(donHang t:arr){
             dem+=this.delete(t);
         }
         return dem;
    }

    @Override
    public int update(donHang t) {
        int ketqua = 0;
        try {
            Connection con = JDBCutil.getConnection();
            String sql = "UPDATE donhang" + " SET " + "ma_khach_hang=?" + ",dia_chi_nhan_hang=?"
                    + ",hinh_thuc_thanh_toan=?"+ ",so_tien_con_thieu=?" + ",ngay_dat_hang=?"
                    + ",ngay_giao_hang=?" + ",trang_thai=?"+ " WHERE ma_don_hang=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,t.getKhachHang().getMaKhachHang());
            st.setString(2, t.getDiaChiNhanHang());
            st.setString(3, t.getHinhThucThanhToan());
            st.setDouble(4, t.getTongtien());
            st.setDate(5,t.getNgayDatHang());
            st.setDate(6,t.getNgayGiaoHang());
            st.setString(7,t.getTrangThaiDonHang().name());
            st.setString(8,t.getMaDonHang());

            ketqua = st.executeUpdate();
            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketqua;
    }
    public int update_status(String maDonhang , TrangThaiDonHang status) {
        int ketqua = 0;
        try{
            Connection con = JDBCutil.getConnection();
            String sql ="update donhang set trang_thai=? where ma_don_hang=?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1,status.name());
            pr.setString(2,maDonhang);
            ketqua = pr.executeUpdate();
            System.out.println(sql);
            JDBCutil.closeConnection(con);
        }catch (Exception e){
            e.printStackTrace();
        }
        return ketqua;
    }
}
