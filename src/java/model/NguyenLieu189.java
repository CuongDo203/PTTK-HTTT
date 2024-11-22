package model;

import java.util.Objects;

public class NguyenLieu189 {
    
    private int id;
    private String ten;
    private String donVi;
    private float donGia;

    public NguyenLieu189() {
    }

    public NguyenLieu189(int id, String ten, String donVi, float donGia) {
        this.id = id;
        this.ten = ten;
        this.donVi = donVi;
        this.donGia = donGia;
    }

    public NguyenLieu189(String ten, String donVi, float donGia) {
        this.ten = ten;
        this.donVi = donVi;
        this.donGia = donGia;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getDonVi() {
        return donVi;
    }

    public void setDonVi(String donVi) {
        this.donVi = donVi;
    }

    public float getDonGia() {
        return donGia;
    }

    public void setDonGia(float donGia) {
        this.donGia = donGia;
    }
    
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true; 
        if (obj == null || getClass() != obj.getClass()) return false; 
        NguyenLieu189 other = (NguyenLieu189) obj;
        return id == other.id; 
    }

    @Override
    public int hashCode() {
        return Objects.hash(id); 
    }
}
