package model;

import java.math.BigDecimal;
import java.sql.Date;

public class DoanhThu {
    private  int id;
    private Date ngay;
    private int thang;
    private int quy;
    private int nam;
    private BigDecimal tongDoanhThu;

    public DoanhThu(int id, Date ngay, int thang, int quy, int nam, BigDecimal tongDoanhThu) {
        this.id = id;
        this.ngay = ngay;
        this.thang = thang;
        this.quy = quy;
        this.nam = nam;
        this.tongDoanhThu = tongDoanhThu;
    }

    public DoanhThu() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNgay() {
        return ngay;
    }

    public void setNgay(Date ngay) {
        this.ngay = ngay;
    }

    public int getThang() {
        return thang;
    }

    public void setThang(int thang) {
        this.thang = thang;
    }

    public int getQuy() {
        return quy;
    }

    public void setQuy(int quy) {
        this.quy = quy;
    }

    public int getNam() {
        return nam;
    }

    public void setNam(int nam) {
        this.nam = nam;
    }

    public BigDecimal getTongDoanhThu() {
        return tongDoanhThu;
    }

    public void setTongDoanhThu(BigDecimal tongDoanhThu) {
        this.tongDoanhThu = tongDoanhThu;
    }
}
