/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author win
 */
public class KhachHang189 extends NguoiDung189{

    private String maTheThanhVien;
    
    public KhachHang189() {
        super();
    }

    public KhachHang189(int id, String taiKhoan, String ten, Date ngaySinh, String diaChi, String dienThoai, String vaiTro) {
        super(id, taiKhoan, ten, ngaySinh, diaChi, dienThoai, vaiTro);
    }
    
    public KhachHang189(String maTheThanhVien, int id, String taiKhoan, String matKhau, String ten, Date ngaySinh, String diaChi, String dienThoai, String vaiTro) {
        super(id, taiKhoan, matKhau, ten, ngaySinh, diaChi, dienThoai, vaiTro);
        this.maTheThanhVien = maTheThanhVien;
    }

    public String getMaTheThanhVien() {
        return maTheThanhVien;
    }

    public void setMaTheThanhVien(String maTheThanhVien) {
        this.maTheThanhVien = maTheThanhVien;
    }
    
}
