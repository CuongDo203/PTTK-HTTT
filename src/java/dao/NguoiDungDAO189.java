package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.NguoiDung189;

public class NguoiDungDAO189 extends DAO189{

    public NguoiDungDAO189() {
        super();
    }
    
    public boolean kiemTraDangNhap(NguoiDung189 nguoiDung) {
        boolean kq = false;
        try {
            String sql = "select * from tblnguoidung189 where taikhoan = ? and matkhau = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nguoiDung.getTaiKhoan());
            ps.setString(2, nguoiDung.getMatKhau());
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                nguoiDung.setId(rs.getInt("ID"));
                nguoiDung.setTen(rs.getString("ten"));
                nguoiDung.setNgaySinh(rs.getDate("ngaysinh"));
                nguoiDung.setDiaChi(rs.getString("diachi"));
                nguoiDung.setDienThoai(rs.getString("dienthoai"));
                nguoiDung.setVaiTro(rs.getString("vaitro"));
                kq = true;
            }
        }
        catch(Exception e) {
            e.printStackTrace();
            kq = false;
        }
        return kq;
    }
    
//    public static void main(String[] args) {
//        NguoiDungDAO189 dao = new NguoiDungDAO189();
//        NguoiDung189 nd = new NguoiDung189();
//        nd.setTaiKhoan("CuongDo");
//        nd.setMatKhau("cuong203");
//        boolean kq = dao.kiemTraDangNhap(nd);
//        System.out.println("kq = "+ kq);
//    }
    
}
