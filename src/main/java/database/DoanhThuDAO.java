package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.Period;

public class DoanhThuDAO {
    public double getrevenueDate(Date date){
        double revenue = 0;
        try{
            Connection con= JDBCutil.getConnection();
            String sql = "select sum(so_tien_con_thieu) from donhang where date(ngay_dat_hang)=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setDate(1, date);
            ResultSet rs=ps.executeQuery();
            if (rs.next()){
                revenue = rs.getDouble(1);
            }
            JDBCutil.closeConnection(con);
        }catch (Exception e){
            e.printStackTrace();
        }
        return revenue;
    }
    public double getrevenueMonth(int month, int year){
        double revenue = 0;
        try{
            Connection con =JDBCutil.getConnection();
            String sql = "SELECT SUM(so_tien_con_thieu) FROM donhang WHERE MONTH(ngay_dat_hang) = ? AND YEAR(ngay_dat_hang) = ?";

            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, month);
            pr.setInt(2, year);
            ResultSet rs = pr.executeQuery();
            if (rs.next()){
                revenue = rs.getDouble(1);
            }
            JDBCutil.closeConnection(con);
        }catch (Exception e){
            e.printStackTrace();
        }
        return revenue;
    }
    public double getrevenueQuarter(int quy , int nam ){
        double revenue = 0;
        try{
            Connection con = JDBCutil.getConnection();
            String sql = "SELECT SUM(so_tien_con_thieu) FROM donhang WHERE (MONTH(ngay_dat_hang) BETWEEN ? AND ?) AND YEAR(ngay_dat_hang) = ?";

            PreparedStatement pr = con.prepareStatement(sql);

            int startMonth = (quy - 1) * 3 + 1;
            int endMonth = quy * 3;

            pr.setInt(1, startMonth);
            pr.setInt(2, endMonth);
            pr.setInt(3, nam);
            ResultSet rs = pr.executeQuery();
            if (rs.next()){
                revenue = rs.getDouble(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return revenue;
    }
    public double getrevenueYear(int year){
        double revenue = 0;
        try{
            Connection con =JDBCutil.getConnection();
            String sql ="select sum(so_tien_con_thieu) from donhang where year(ngay_dat_hang)=?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setInt(1, year);
            ResultSet rs = pr.executeQuery();
            if (rs.next()){
                revenue = rs.getDouble(1);

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return revenue;
    }
}
