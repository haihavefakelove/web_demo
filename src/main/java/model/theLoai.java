package model;

public class theLoai {
    private String maTheLoai;
    private String theLoai;

    public theLoai(String maTheLoai, String theLoai) {
        this.maTheLoai = maTheLoai;
        this.theLoai = theLoai;
    }

    public theLoai() {
    }

    public String getMaTheLoai() {
        return maTheLoai;
    }

    public void setMaTheLoai(String maTheLoai) {
        this.maTheLoai = maTheLoai;
    }

    public String getTheLoai() {
        return theLoai;
    }

    public void setTheLoai(String theLoai) {
        this.theLoai = theLoai;
    }
}
