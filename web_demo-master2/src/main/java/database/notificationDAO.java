package database;

import model.EnumNotification;
import model.Notification;
import model.donHang;
import model.khachHang;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

public class notificationDAO{
    public int addNotify(Notification t){
        int ketqua=0;
        try{
            Connection con = JDBCutil.getConnection();
            String sql = "insert into notifications(ma_khach_hang,ma_don_hang,message,status) values(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,t.getMa_khach_hang().getMaKhachHang());
            ps.setString(2,t.getMa_don_hang().getMaDonHang());
            ps.setString(3,t.getMessage());
            ps.setString(4,t.getStatus().getValue());
            ketqua = ps.executeUpdate();
            System.out.println("SQL: " + sql);

            JDBCutil.closeConnection(con);
        }catch (Exception e){
            e.printStackTrace();
        }
        return ketqua;
    }
    public int updateNotify(int id, EnumNotification status){
        int ketqua=0;
        try{
            Connection con = JDBCutil.getConnection();
            String sql = "update notifications set status=? where id=?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1,status.getValue());
            pr.setInt(2,id);
            ketqua = pr.executeUpdate();
            JDBCutil.closeConnection(con);
        }catch (Exception e){
            e.printStackTrace();
        }
        return ketqua;
    }
    public ArrayList<Notification> getNotify(String makhachHang){
        ArrayList<Notification> ketqua= new ArrayList<>();
        try{
            Connection con= JDBCutil.getConnection();
            String sql = "select * from notifications where ma_khach_hang=?";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1,makhachHang);
            ResultSet rs = pr.executeQuery();
            while(rs.next()){
                int ID = rs.getInt("id");
                String ma_khach_hang = rs.getString("ma_khach_hang");
                String ma_don_hang = rs.getString("ma_don_hang");
                String message = rs.getString("message");
                String status = rs.getString("status");
                EnumNotification enumNotification = EnumNotification.valueOf(status);
                Timestamp timestamp = rs.getTimestamp("created_at");
                khachHang kh1= new khachHang();
                kh1.setMaKhachHang(ma_khach_hang);
                khachHang kh= new khachHangDAO().selectById(kh1);
                donHang dh1 = new donHang();
                dh1.setMaDonHang(ma_don_hang);
                donHang dh= new donHangDAO().selectById(dh1);
                Notification notification = new Notification(ID,kh,dh,message,enumNotification,timestamp);
                ketqua.add(notification);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return ketqua;
    }
}
