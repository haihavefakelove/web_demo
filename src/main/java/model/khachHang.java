package model;

import com.google.gson.Gson;
import database.khachHangDAO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import static java.lang.System.in;

public class khachHang {
    private String maKhachHang;
    private String tenDangNhap;
    private String matKhau;
    private  String hoVaten;
    private String gioiTinh;
    private String diaChi;
    private String diaChiNhanHang;
    private Date ngaySinh;
    private String soDienThoai;
    private String email;
    private boolean dangKyNhanBangTin;
    private String vaiTro;
    private List<GioHang> gioHangList;

    public khachHang() {
        gioHangList = new ArrayList<GioHang>();
    }

    public khachHang(String maKhachHang, String tenDangNhap, String matKhau, String email, boolean dangKyNhanBangTin, List<GioHang> gioHangList,String vaiTro) {
        this.maKhachHang = maKhachHang;
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.email = email;
        this.dangKyNhanBangTin = dangKyNhanBangTin;
        this.gioHangList = gioHangList;
        this.vaiTro = vaiTro;
    }

    public khachHang(String maKhachHang, String tenDangNhap, String matKhau, String hoVaten, String gioiTinh, Date ngaySinh, String diaChi, String diaChiNhanHang, String soDienThoai, String email, boolean dangKyNhanBangTin, String vaiTro, List<GioHang> lc) {
        this.maKhachHang = maKhachHang;
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.hoVaten = hoVaten;
        this.gioiTinh = gioiTinh;
        this.diaChi = diaChi;
        this.diaChiNhanHang = diaChiNhanHang;
        this.ngaySinh = ngaySinh;
        this.soDienThoai = soDienThoai;
        this.email = email;
        this.dangKyNhanBangTin = dangKyNhanBangTin;
        this.vaiTro = vaiTro;
        this.gioHangList = lc;
    }

    public String getMaKhachHang() {
        return maKhachHang;
    }

    public void setMaKhachHang(String maKhachHang) {
        this.maKhachHang = maKhachHang;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getHoVaten() {
        return hoVaten;
    }

    public void setHoVaten(String hoVaten) {
        this.hoVaten = hoVaten;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getDiaChiNhanHang() {
        return diaChiNhanHang;
    }

    public void setDiaChiNhanHang(String diaChiNhanHang) {
        this.diaChiNhanHang = diaChiNhanHang;
    }


    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isDangKyNhanBangTin() {
        return dangKyNhanBangTin;
    }

    public void setDangKyNhanBangTin(boolean dangKyNhanBangTin) {
        this.dangKyNhanBangTin = dangKyNhanBangTin;
    }

    public String getVaiTro() {
        return vaiTro;
    }

    public void setVaiTro(String vaiTro) {
        this.vaiTro = vaiTro;
    }

    public void deleteCart(int id){
        if (gioHangList!=null){
            for (GioHang g : gioHangList) {
                if (g.id==id){
                    gioHangList.remove(g);
                    Gson gson = new Gson();
                    String lc = gson.toJson(gioHangList);
                    khachHangDAO.updateCart(this.maKhachHang,lc);
                    return;
                }
            }
        }
    }

    public void addCart(int id, int quantity){
        if(gioHangList == null) gioHangList = new ArrayList<>();
        for(GioHang g : gioHangList){
            if(g.id == id){
                g.quantity += quantity;
                Gson gson = new Gson();
                String lc = gson.toJson(gioHangList);
                khachHangDAO.updateCart(this.maKhachHang,lc);
                return;
            }
        }
        gioHangList.add(new GioHang(id,quantity));
        Gson gson = new Gson();
        String lc = gson.toJson(gioHangList);
        khachHangDAO.updateCart(this.maKhachHang,lc);
    }

    public List<GioHang> getGioHangList() {
        return gioHangList;
    }

    public void setGioHangList(List<GioHang> gioHangList) {
        this.gioHangList = gioHangList;
    }

}

