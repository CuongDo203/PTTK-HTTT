package model;

import java.util.Objects;

public class NhaCungCap189 {
    
    private int id;
    private String ten;
    private String diaChi;
    private String soDienThoai;

    public NhaCungCap189() {
    }

    public NhaCungCap189(int id, String ten, String diaChi, String soDienThoai) {
        this.id = id;
        this.ten = ten;
        this.diaChi = diaChi;
        this.soDienThoai = soDienThoai;
    }

    public NhaCungCap189(String ten, String diaChi, String soDienThoai) {
        this.ten = ten;
        this.diaChi = diaChi;
        this.soDienThoai = soDienThoai;
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

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }
    
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true; 
        if (obj == null || getClass() != obj.getClass()) return false; 
        NhaCungCap189 other = (NhaCungCap189) obj;
        return id == other.id; 
    }

    @Override
    public int hashCode() {
        return Objects.hash(id); 
    }
}
