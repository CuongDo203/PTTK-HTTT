package model;

import java.util.Date;

/**
 *
 * @author win
 */
public class NguoiDung189 {
    
    private int id;
    private String taiKhoan;
    private String matKhau;
    private String ten;
    private Date ngaySinh;
    private String diaChi;
    private String dienThoai;
    private String vaiTro;

    public NguoiDung189() {
    }

    public NguoiDung189(int id, String taiKhoan, String matKhau, String ten, Date ngaySinh, String diaChi, String dienThoai, String vaiTro) {
        this.id = id;
        this.taiKhoan = taiKhoan;
        this.matKhau = matKhau;
        this.ten = ten;
        this.ngaySinh = ngaySinh;
        this.diaChi = diaChi;
        this.dienThoai = dienThoai;
        this.vaiTro = vaiTro;
    }

    public NguoiDung189(int id, String taiKhoan, String ten, Date ngaySinh, String diaChi, String dienThoai, String vaiTro) {
        this.id = id;
        this.taiKhoan = taiKhoan;
        this.ten = ten;
        this.ngaySinh = ngaySinh;
        this.diaChi = diaChi;
        this.dienThoai = dienThoai;
        this.vaiTro = vaiTro;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTaiKhoan() {
        return taiKhoan;
    }

    public void setTaiKhoan(String taiKhoan) {
        this.taiKhoan = taiKhoan;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getDienThoai() {
        return dienThoai;
    }

    public void setDienThoai(String dienThoai) {
        this.dienThoai = dienThoai;
    }

    public String getVaiTro() {
        return vaiTro;
    }

    public void setVaiTro(String vaiTro) {
        this.vaiTro = vaiTro;
    }
    
}
