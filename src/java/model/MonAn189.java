package model;

public class MonAn189 {
    private int id;
    private String ten;
    private String moTa;
    private float donGia;

    public MonAn189() {
    }

    public MonAn189(int id, String ten, String moTa, float donGia) {
        this.id = id;
        this.ten = ten;
        this.moTa = moTa;
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

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public float getDonGia() {
        return donGia;
    }

    public void setDonGia(float donGia) {
        this.donGia = donGia;
    }
    
}
