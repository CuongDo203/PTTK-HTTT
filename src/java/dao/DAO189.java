package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO189 {

    public static Connection con;

    public DAO189() {
        if (con == null) {
            String dbUrl = "jdbc:mysql://localhost:3306/qlnh?autoReconnect=true&useSSL=false";
            String dbClass = "com.mysql.cj.jdbc.Driver";
            try {
                Class.forName(dbClass);
                con = DriverManager.getConnection(dbUrl, "root","cuongngocdo203");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
}
