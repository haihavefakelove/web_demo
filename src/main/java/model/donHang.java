package model;

import java.sql.Date;
import java.util.Objects;

public class donHang {
    private String maDonHang;
    private khachHang khachHang;
    private String diaChiNhanHang;
    private String hinhThucThanhToan;
    private double tongtien;
    private Date ngayDatHang;
    private Date ngayGiaoHang;
    private TrangThaiDonHang trangThaiDonHang;



    public donHang(String maDonHang, model.khachHang khachHang, String diaChiNhanHang, String hinhThucThanhToan, double tongtien, Date ngayDatHang, Date ngayGiaoHang, TrangThaiDonHang trangThaiDonHang) {
        this.maDonHang = maDonHang;
        this.khachHang = khachHang;
        this.diaChiNhanHang = diaChiNhanHang;
        this.hinhThucThanhToan = hinhThucThanhToan;
        this.tongtien = tongtien;
        this.ngayDatHang = ngayDatHang;
        this.ngayGiaoHang = ngayGiaoHang;
        this.trangThaiDonHang = trangThaiDonHang;
    }


    public donHang() {
    }

    public TrangThaiDonHang getTrangThaiDonHang() {
        return trangThaiDonHang;
    }

    public void setTrangThaiDonHang(TrangThaiDonHang trangThaiDonHang) {
        this.trangThaiDonHang = trangThaiDonHang;
    }

    public String getMaDonHang() {
        return maDonHang;
    }

    public void setMaDonHang(String maDonHang) {
        this.maDonHang = maDonHang;
    }

    public model.khachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(model.khachHang khachHang) {
        this.khachHang = khachHang;
    }

    public String getDiaChiNhanHang() {
        return diaChiNhanHang;
    }

    public void setDiaChiNhanHang(String diaChiNhanHang) {
        this.diaChiNhanHang = diaChiNhanHang;
    }

    public String getHinhThucThanhToan() {
        return hinhThucThanhToan;
    }

    public void setHinhThucThanhToan(String hinhThucThanhToan) {
        this.hinhThucThanhToan = hinhThucThanhToan;
    }

    public double getTongtien() {
        return tongtien;
    }

    public void setTongtien(double tongtien) {
        this.tongtien = tongtien;
    }

    public Date getNgayDatHang() {
        return ngayDatHang;
    }

    public void setNgayDatHang(Date ngayDatHang) {
        this.ngayDatHang = ngayDatHang;
    }

    public Date getNgayGiaoHang() {
        return ngayGiaoHang;
    }

    public void setNgayGiaoHang(Date ngayGiaoHang) {
        this.ngayGiaoHang = ngayGiaoHang;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        donHang donHang = (donHang) o;
        return Objects.equals(getMaDonHang(), donHang.getMaDonHang());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getMaDonHang());
    }
}
