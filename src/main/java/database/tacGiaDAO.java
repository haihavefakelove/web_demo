package database;

import model.tacGia;

import java.sql.*;
import java.util.ArrayList;

public class tacGiaDAO implements DAOInterface<tacGia> {

    @Override
    public ArrayList<tacGia> selectAll() {
        ArrayList<tacGia> ketQua = new ArrayList<tacGia>();
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCutil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "SELECT * FROM tacgia";
            PreparedStatement st = con.prepareStatement(sql);

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            while (rs.next()) {
                String maTacGia = rs.getString("ma_tac_gia");
                String hoVaTen = rs.getString("ten_tac_gia");
                Date ngaySinh = rs.getDate("ngay_sinh");
                String tieuSu = rs.getString("tieu_su");

                tacGia tg = new tacGia(maTacGia, hoVaTen, ngaySinh, tieuSu);
                ketQua.add(tg);
            }

            // Bước 5:
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    @Override
    public tacGia selectById(tacGia t) {
        tacGia ketQua = null;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCutil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "SELECT * FROM tacgia WHERE ma_tac_gia=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaTacGia());

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            while (rs.next()) {
                String maTacGia = rs.getString("ma_tac_gia");
                String hoVaTen = rs.getString("ten_tac_gia");
                Date ngaySinh = rs.getDate("ngay_sinh");
                String tieuSu = rs.getString("tieu_su");

                ketQua = new tacGia(maTacGia, hoVaTen, ngaySinh, tieuSu);
                break;
            }
            // Bước 5:
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    @Override
    public int insert(tacGia t) {
        int ketQua = 0;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCutil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "INSERT INTO tacgia (ma_tac_gia, ten_tac_gia, ngay_sinh, tieu_su) "+
                    " VALUES (?,?,?,?)";

            PreparedStatement st = con.prepareStatement(sql );
            st.setString(1, t.getMaTacGia());
            st.setString(2, t.getHoVaTen());
            st.setDate(3, t.getNgaySinh());
            st.setString(4, t.getTieuSu());

            // Bước 3: thực thi câu lệnh SQL
            ketQua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: "+ sql);
            System.out.println("Có "+ ketQua+" dòng bị thay đổi!");

            // Bước 5:
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;

    }

    @Override
    public int insertAll(ArrayList<tacGia> arr) {
        int dem = 0;
        for (tacGia tacGia : arr) {
            dem += this.insert(tacGia);
        }
        return dem;
    }

    @Override
    public int delete(tacGia tacGia) {
        int ketQua= 0;
        try{
            // b1 tạo đối tượng liên kết csdl
            Connection con = JDBCutil.getConnection();
            //b2 tạo ra đối tượng statement
            String sql = "DELETE FROM tacgia WHERE ma_tac_gia=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, tacGia.getMaTacGia());

            //b3 thực thi câu lệnh
            System.out.println(sql);
            ketQua=st.executeUpdate();

            //bước 4 thực thi
            System.out.println("Bạn đã thực thi: "+ sql);
            System.out.println("Có "+ ketQua+" dòng bị thay đổi!");
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    @Override
    public int deleteAll(ArrayList<tacGia> arr) {
        int dem = 0;
        for (tacGia tacGia : arr) {
            dem += this.delete(tacGia);
        }
        return dem;
    }

    @Override
    public int update(tacGia t) {
        int ketQua = 0;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBCutil.getConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "UPDATE tacgia "+
                    " SET " +
                    " ten_tac_gia=?"+
                    ", ngay_sinh=?"+
                    ", tieu_su=?"+
                    " WHERE ma_tac_gia=?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getHoVaTen());
            st.setDate(2, t.getNgaySinh());
            st.setString(3, t.getTieuSu());
            st.setString(4, t.getMaTacGia());
            // Bước 3: thực thi câu lệnh SQL

            System.out.println(sql);
            ketQua = st.executeUpdate();

            // Bước 4:
            System.out.println("Bạn đã thực thi: "+ sql);
            System.out.println("Có "+ ketQua+" dòng bị thay đổi!");

            // Bước 5:
            JDBCutil.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;

    }
    public boolean checkMTG (String maTacGia) {
        boolean ketQua = false;
        try{
            Connection con = JDBCutil.getConnection();
            String sql = "select * from tacgia where ma_tac_gia=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, maTacGia);
            System.out.println(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                return true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return ketQua;
    }
}
