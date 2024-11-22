package dao;

import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.NguyenLieu189;

public class NguyenLieuDAO189 extends DAO189{

    public NguyenLieuDAO189() {
        super();
    }
    
    public List<NguyenLieu189> getDsNguyenLieu() {
        List<NguyenLieu189> dsNL = null;
        try{
            String sql = "select * from tblnguyenlieu189";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                if(dsNL == null) dsNL = new ArrayList<>();
                NguyenLieu189 nl = new NguyenLieu189(
                        rs.getInt("id"), 
                        rs.getString("ten"),
                      rs.getString("donvi"), 
                      rs.getFloat("dongia"));
                dsNL.add(nl);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return dsNL;
    }
    
    public List<NguyenLieu189> timNLTheoTen(String ten) {
        List<NguyenLieu189> dsNL = null;
        try{
            String sql = "select * from tblnguyenlieu189 where ten like ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%"+ten+"%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                if(dsNL == null) dsNL = new ArrayList<>();
                NguyenLieu189 nl = new NguyenLieu189(
                        rs.getInt("id"), 
                        rs.getString("ten"),
                      rs.getString("donvi"), 
                      rs.getFloat("dongia"));
                dsNL.add(nl);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return dsNL;
    }
    
    public boolean themNl(NguyenLieu189 nl) {
        boolean kq = false;
        try {
            String sql = "insert into tblnguyenlieu189 (ten, donvi, dongia) values (?,?,?)";
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nl.getTen());
            ps.setString(2, nl.getDonVi());
            ps.setFloat(3, nl.getDonGia());
            int rs = ps.executeUpdate();
            if(rs > 0) {
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
