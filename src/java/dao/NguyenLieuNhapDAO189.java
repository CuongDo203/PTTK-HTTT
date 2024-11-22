package dao;

import java.util.List;
import java.sql.PreparedStatement;
import model.NguyenLieuNhap189;

public class NguyenLieuNhapDAO189 extends DAO189 {

    public NguyenLieuNhapDAO189() {
        super();
    }

    public boolean luuDsNguyenLieu(List<NguyenLieuNhap189> dsnl) {
        if (dsnl == null || dsnl.isEmpty()) {
            return false;
        }
        boolean kq = false;
        try {
            String sql = "insert into tblnguyenlieunhap189 (soluong, gia, tblnguyenlieu189id, tblhoadonnhapnl189id) "
                    + "values (?,?,?,?)";
            con.setAutoCommit(false);
            for (NguyenLieuNhap189 nl : dsnl) {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, nl.getSoLuong());
                ps.setFloat(2, nl.getGia());
                ps.setInt(3, nl.getNguyenLieu().getId());
                ps.setInt(4, nl.getHoaDon().getId());
                ps.executeUpdate();
            }
            con.commit();
            kq = true;
        } catch (Exception e) {
            try {
                con.rollback();
            } catch (Exception ee) {
                kq = false;
                ee.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                this.con.setAutoCommit(true);
            } catch (Exception e) {
                kq = false;
                e.printStackTrace();
            }
        }

        return kq;
    }

}
