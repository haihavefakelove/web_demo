package model;

import java.sql.Date;
import java.util.Objects;

public class tacGia {
    private String maTacGia;
    private String hoVaTen;
    private Date ngaySinh;
    private String tieuSu;

    public tacGia(String maTacGia, String hoVaTen, Date ngaySinh, String tieuSu) {
        this.maTacGia = maTacGia;
        this.hoVaTen = hoVaTen;
        this.ngaySinh = ngaySinh;
        this.tieuSu = tieuSu;
    }

    public tacGia() {
    }

    public String getMaTacGia() {
        return maTacGia;
    }

    public void setMaTacGia(String maTacGia) {
        this.maTacGia = maTacGia;
    }

    public String getHoVaTen() {
        return hoVaTen;
    }

    public void setHoVaTen(String hoVaTen) {
        this.hoVaTen = hoVaTen;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getTieuSu() {
        return tieuSu;
    }

    public void setTieuSu(String tieuSu) {
        this.tieuSu = tieuSu;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        tacGia tacGia = (tacGia) o;
        return Objects.equals(getMaTacGia(), tacGia.getMaTacGia());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getMaTacGia());
    }
}

