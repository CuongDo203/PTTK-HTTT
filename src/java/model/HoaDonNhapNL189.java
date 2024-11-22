package model;

import java.sql.Timestamp;
import java.util.List;

public class HoaDonNhapNL189 {
    
    private int id;
    private Timestamp ngayTao;
    private float thanhTien;
    private NhanVien189 nhanVien;
    private NhaCungCap189 nhaCungCap;
    private List<NguyenLieuNhap189> dsNguyenLieuNhap;

    public HoaDonNhapNL189() {
    }

    public HoaDonNhapNL189(int id, Timestamp ngayTao, float thanhTien, NhanVien189 nhanVien, NhaCungCap189 nhaCungCap, List<NguyenLieuNhap189> dsNguyenLieuNhap) {
        this.id = id;
        this.ngayTao = ngayTao;
        this.thanhTien = thanhTien;
        this.nhanVien = nhanVien;
        this.nhaCungCap = nhaCungCap;
        this.dsNguyenLieuNhap = dsNguyenLieuNhap;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Timestamp ngayTao) {
        this.ngayTao = ngayTao;
    }

    public float getThanhTien() {
        return thanhTien;
    }

    public void setThanhTien(float thanhTien) {
        this.thanhTien = thanhTien;
    }

    public NhanVien189 getNhanVien() {
        return nhanVien;
    }

    public void setNhanVien(NhanVien189 nhanVien) {
        this.nhanVien = nhanVien;
    }

    public NhaCungCap189 getNhaCungCap() {
        return nhaCungCap;
    }

    public void setNhaCungCap(NhaCungCap189 nhaCungCap) {
        this.nhaCungCap = nhaCungCap;
    }

    public List<NguyenLieuNhap189> getDsNguyenLieuNhap() {
        return dsNguyenLieuNhap;
    }

    public void setDsNguyenLieuNhap(List<NguyenLieuNhap189> dsNguyenLieuNhap) {
        this.dsNguyenLieuNhap = dsNguyenLieuNhap;
    }
    
}
