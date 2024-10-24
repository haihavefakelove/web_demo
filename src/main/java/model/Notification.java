package model;

import java.sql.Timestamp;

public class Notification {
    private int id;
    private khachHang ma_khach_hang;
    private donHang ma_don_hang;
    private String message ;
    private EnumNotification status;
    private Timestamp created_at;

    public Notification(khachHang ma_khach_hang, donHang ma_don_hang, String message, EnumNotification status, Timestamp created_at) {
        this.ma_khach_hang = ma_khach_hang;
        this.ma_don_hang = ma_don_hang;
        this.message = message;
        this.status = status;
        this.created_at = created_at;
    }

    public Notification(int id, khachHang ma_khach_hang, donHang ma_don_hang, String message, EnumNotification status, Timestamp created_at) {
        this.id = id;
        this.ma_khach_hang = ma_khach_hang;
        this.ma_don_hang = ma_don_hang;
        this.message = message;
        this.status = status;
        this.created_at = created_at;
    }

    public Notification() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public khachHang getMa_khach_hang() {
        return ma_khach_hang;
    }

    public void setMa_khach_hang(khachHang ma_khach_hang) {
        this.ma_khach_hang = ma_khach_hang;
    }

    public donHang getMa_don_hang() {
        return ma_don_hang;
    }

    public void setMa_don_hang(donHang ma_don_hang) {
        this.ma_don_hang = ma_don_hang;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public EnumNotification getStatus() {
        return status;
    }

    public void setStatus(EnumNotification status) {
        this.status = status;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }
}
