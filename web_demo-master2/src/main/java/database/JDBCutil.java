package database;

import com.mysql.cj.jdbc.Driver;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCutil {
    public static Connection getConnection() throws SQLException {
        Connection con = null;
        try{
            //đăng ký mysql driver với managerDriver
            DriverManager.registerDriver(new Driver());
            //các thông số
            String url = "jdbc:mysql://localhost:3306/myweb";
            String user = "root";
            String password = "";

            // tạo kết nối
            con = DriverManager.getConnection(url, user, password);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return con;
    }
    public static void closeConnection(Connection c) {
        try {
            if(c!=null) {
                c.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void printInfor(Connection con) {
        try{
            if (con != null) {
                DatabaseMetaData mtdt = con.getMetaData();
                System.out.println(mtdt.getDatabaseProductName());
                System.out.println(mtdt.getDatabaseProductVersion());
            }
        }catch (SQLException e){
            e.getStackTrace();
        }
    }


}
