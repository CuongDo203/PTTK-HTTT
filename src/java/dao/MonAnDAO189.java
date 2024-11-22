package dao;

import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.MonAn189;

public class MonAnDAO189 extends DAO189{

    public MonAnDAO189() {
        super();
    }
    
    public List<MonAn189> getDsMonAnTheoTen(String ten) {
        List<MonAn189> dsMon = null;
        try {
            String sql = "select * from tblmonan189 where ten like ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%"+ten+"%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                if(dsMon==null) dsMon = new ArrayList<>();
                MonAn189 mon = new MonAn189(
                        rs.getInt("id"), 
                        rs.getString("ten"), 
                        null, rs.getFloat("dongia"));
                dsMon.add(mon);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return dsMon;
    }
    
    public MonAn189 getTtMonAn(int id) {
        MonAn189 monAn = null;
        try {
            String sql = "select * from tblmonan189 where id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                if(monAn == null) monAn = new MonAn189();
                monAn.setId(id);
                monAn.setTen(rs.getString("ten"));
                monAn.setDonGia(rs.getFloat("dongia"));
                monAn.setMoTa(rs.getString("mota"));
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return monAn;
    }
}
