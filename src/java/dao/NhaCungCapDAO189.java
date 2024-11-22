package dao;

import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.NhaCungCap189;

public class NhaCungCapDAO189 extends DAO189{

    public NhaCungCapDAO189() {
        super();
    }
    
    public List<NhaCungCap189> getDsNhaCungCap() {
        List<NhaCungCap189> dsNcc = null;
        try {
            String sql = "select * from tblnhacungcap189";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                if(dsNcc==null) dsNcc = new ArrayList<>();
                NhaCungCap189 ncc = new NhaCungCap189(rs.getInt("id"), 
                                    rs.getString("ten"), 
                                    rs.getString("diachi"), 
                                    rs.getString("sodienthoai"));
                dsNcc.add(ncc);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return dsNcc;
    }
    
    public List<NhaCungCap189> timNccTheoTen(String ten) {
        List<NhaCungCap189> dsNcc = null;
        try {
            String sql = "select * from tblnhacungcap189 where ten like ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%"+ten+"%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                if(dsNcc==null) dsNcc = new ArrayList<>();
                NhaCungCap189 ncc = new NhaCungCap189(rs.getInt("id"), 
                                    rs.getString("ten"), 
                                    rs.getString("diachi"), 
                                    rs.getString("sodienthoai"));
                dsNcc.add(ncc);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return dsNcc;
    }
    
    public boolean themNcc(NhaCungCap189 ncc) {
        boolean kq = false;
        try {
            con.setAutoCommit(false);
            String sqlCheckSdt = "select * from tblnhacungcap189 where sodienthoai = ?";
            PreparedStatement ps1 = con.prepareStatement(sqlCheckSdt);
            ps1.setString(1, ncc.getSoDienThoai());
            ResultSet rs1 = ps1.executeQuery();
            if(rs1.next()) {
                return false;
            }
            String sqlThem = "insert into tblnhacungcap189(ten, diachi, sodienthoai) values (?,?,?)";
            PreparedStatement ps2 = con.prepareStatement(sqlThem);
            ps2.setString(1, ncc.getTen());
            ps2.setString(2, ncc.getDiaChi());
            ps2.setString(3, ncc.getSoDienThoai());
            int rs2 = ps2.executeUpdate();
            if(rs2 > 0) {
                con.commit();
                kq = true;
            }
        }
        catch(Exception e) {
            try {
                con.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        }
        finally {
            try {
                con.setAutoCommit(true);
            } catch (Exception e) {
                kq = false;
                e.printStackTrace();
            }
        }
        return kq;
    }
    
}
