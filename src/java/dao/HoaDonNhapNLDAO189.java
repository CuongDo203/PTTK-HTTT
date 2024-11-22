package dao;

import model.HoaDonNhapNL189;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class HoaDonNhapNLDAO189 extends DAO189{

    public HoaDonNhapNLDAO189() {
        super();
    }
    
    public HoaDonNhapNL189 luuHoaDon(HoaDonNhapNL189 hd) {
        try {
            con.setAutoCommit(false);
            String sql = "insert into tblhoadonnhapnl189 (thanhtien, ngaytao, tblnhanvien189id, tblnhacungcap189id) "
                    + "values(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setFloat(1, hd.getThanhTien());
            ps.setTimestamp(2, hd.getNgayTao());
            ps.setInt(3, hd.getNhanVien().getId());
            ps.setInt(4, hd.getNhaCungCap().getId());
            int rs = ps.executeUpdate();
            if(rs == 0) {
                con.rollback();
                throw new Exception("Lỗi khi lưu hóa đơn!");
            }
            try(ResultSet generatedKey = ps.getGeneratedKeys()) {
                if (generatedKey.next()) {
                    hd.setId(generatedKey.getInt(1));
                    
                } else {
                    throw new SQLException("Không lấy được ID hóa đơn vừa tạo");
                }
            }
            con.commit();
            return hd;
        }
        catch(Exception e) {
            try{
                con.rollback();
            }
            catch(Exception ee) {
                ee.printStackTrace();
            }
            e.printStackTrace();
            return null;
        }
        
    }
    
}
