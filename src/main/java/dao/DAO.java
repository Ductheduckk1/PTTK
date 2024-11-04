package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
    public static Connection con;

    public DAO() {
        if (con == null) {
            String dbUrl = "jdbc:mysql://localhost:3306/pttk";
            String dbClass = "com.mysql.cj.jdbc.Driver"; 
            try {
                Class.forName(dbClass);
                con = DriverManager.getConnection(dbUrl, "root", "duc19112003");
               
            } catch ( SQLException e) {
                e.printStackTrace();
               
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
    }

    
}
