package model;

import java.util.Date;
import java.util.Objects;

public class NhanVien189 extends NguoiDung189{
    
    private String viTri;

    public NhanVien189(String viTri) {
        this.viTri = viTri;
    }

    public NhanVien189(String viTri, int id, String taiKhoan, String matKhau, String ten, Date ngaySinh, String diaChi, String dienThoai, String vaiTro) {
        super(id, taiKhoan, matKhau, ten, ngaySinh, diaChi, dienThoai, vaiTro);
        this.viTri = viTri;
    }

    public NhanVien189(String vt ,int id, String taiKhoan, String ten, Date ngaySinh, String diaChi, String dienThoai, String vaiTro) {
        super(id, taiKhoan, ten, ngaySinh, diaChi, dienThoai, vaiTro);
        this.viTri = vt;
    }

    public NhanVien189() {
        super();
    }

    public String getViTri() {
        return viTri;
    }

    public void setViTri(String viTri) {
        this.viTri = viTri;
    }
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true; 
        if (obj == null || getClass() != obj.getClass()) return false; 
        NhanVien189 other = (NhanVien189) obj;
        return getId() == other.getId(); 
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId()); 
    }
}
