package database;

import model.theLoai;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class theLoaiDAO implements DAOInterface<theLoai>{

    @Override
    public ArrayList<theLoai> selectAll() {
        ArrayList<theLoai> ketQua = new ArrayList();
        try{
            //b1 tạo kết nối đến cơ sở dữ liệu
            Connection con = JDBCutil.getConnection();

            //b2 tạo ra đối tượng statement
            String sql = "select * from theLoai";
            PreparedStatement ps = con.prepareStatement(sql);

            //b3 thực thi câu lệnh sql
            System.out.println(sql);
            ResultSet rs = ps.executeQuery();

            //b4 duyệt qua sql
            while (rs.next()){
                String maTheLoai = rs.getString("ma_the_loai");
                String theLoai = rs.getString("the_loai");

                theLoai tl = new theLoai(maTheLoai,theLoai);
                ketQua.add(tl);
            }
            //b5 ket thuc
            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }

        return ketQua;
    }

    @Override
    public theLoai selectById(theLoai t) {
        theLoai ketqua = null;
        try{
            Connection con= JDBCutil.getConnection();

            String sql = "select * from theloai where ma_the_loai=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1,t.getMaTheLoai());

            System.out.println(sql);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                String maTheLoai= rs.getString("ma_the_loai");
                String theLoai= rs.getString("the_loai");

                ketqua = new theLoai(maTheLoai,theLoai);
                break;
            }
            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public int insert(theLoai t) {
        int ketqua=0;
        try{
            Connection con = JDBCutil.getConnection();

            String sql = "insert into theloai (ma_the_loai,the_loai) values (?,?)";
            PreparedStatement ps= con.prepareStatement(sql);
            ps.setString(1,t.getMaTheLoai());
            ps.setString(2,t.getTheLoai());

            ketqua = ps.executeUpdate();

            System.out.println("bạn đã thực thi : "+ sql);
            System.out.println("có "+ketqua +" dòng bị thay đổi");

            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public int insertAll(ArrayList<theLoai> arr) {
        int dem=0;
        for (theLoai theLoai : arr){
            dem+=this.insert(theLoai);
        }
        return dem;
    }

    @Override
    public int delete(theLoai t) {
        int ketqua=0;
        try{
            Connection con = JDBCutil.getConnection();

            String sql = "delete from theloai where ma_the_loai=?";
            PreparedStatement ps= con.prepareStatement(sql);

            ps.setString(1,t.getMaTheLoai());

            System.out.println(sql);
            ketqua = ps.executeUpdate();


            System.out.println("bạn đã thực thi : "+ sql);
            System.out.println("có "+ketqua +" dòng bị thay đổi");

            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketqua;
    }

    @Override
    public int deleteAll(ArrayList<theLoai> arr) {
        int dem=0;
        for (theLoai theLoai : arr){
            dem+=this.delete(theLoai);
        }
        return dem;
    }

    @Override
    public int update(theLoai t) {
        int ketQua=0;
        try{
            Connection con = JDBCutil.getConnection();

            String sql= "update theloai set the_loai=? where ma_the_loai=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1,t.getTheLoai());
            ps.setString(2, t.getMaTheLoai());

            System.out.println(sql);
            ketQua = ps.executeUpdate();


            System.out.println("bạn đã thực thi : "+ sql);
            System.out.println("có "+ketQua +" dòng bị thay đổi");

            JDBCutil.closeConnection(con);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ketQua;
    }
}
