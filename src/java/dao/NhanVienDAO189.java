package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class NhanVienDAO189 extends DAO189{

    public NhanVienDAO189() {
        super();
    }
    
    public String getViTri(int id) {
        String vt = null;
        try {
            String sql = "select * from tblnhanvien189 where tblNguoiDung189ID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                vt = rs.getString("vitri");
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return vt;
    }
    
}
