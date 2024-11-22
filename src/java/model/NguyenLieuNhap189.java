package model;

import java.util.Objects;

public class NguyenLieuNhap189 {
    
    private int id;
    private int soLuong;
    private float gia;
    private NguyenLieu189 nguyenLieu;
    private HoaDonNhapNL189 hoaDon;

    public NguyenLieuNhap189() {
    }

    public NguyenLieuNhap189(int id, int soLuong, float gia, NguyenLieu189 nguyenLieu, HoaDonNhapNL189 hoaDon) {
        this.id = id;
        this.soLuong = soLuong;
        this.gia = gia;
        this.nguyenLieu = nguyenLieu;
        this.hoaDon = hoaDon;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public float getGia() {
        return gia;
    }

    public void setGia(float gia) {
        this.gia = gia;
    }

    public NguyenLieu189 getNguyenLieu() {
        return nguyenLieu;
    }

    public void setNguyenLieu(NguyenLieu189 nguyenLieu) {
        this.nguyenLieu = nguyenLieu;
    }

    public HoaDonNhapNL189 getHoaDon() {
        return hoaDon;
    }

    public void setHoaDon(HoaDonNhapNL189 hoaDon) {
        this.hoaDon = hoaDon;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true; 
        if (obj == null || getClass() != obj.getClass()) return false; 
        NguyenLieuNhap189 other = (NguyenLieuNhap189) obj;
        return id == other.id; 
    }

    @Override
    public int hashCode() {
        return Objects.hash(id); 
    }
    
}
