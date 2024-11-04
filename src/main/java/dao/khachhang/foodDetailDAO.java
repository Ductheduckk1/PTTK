/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.khachhang;

/**
 *
 * @author HP
 */

import dao.DAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import model.monan;

public class foodDetailDAO extends DAO {
    public foodDetailDAO(){
        super();
    }
    public Map<String, String> getFoodDetails(int id) throws SQLException {
        Map<String, String> foodDetails = new HashMap<>();
        String sql = "SELECT id, name, description, price FROM monan WHERE id = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    foodDetails.put("id", String.valueOf(rs.getInt("id")));
                    foodDetails.put("name", rs.getString("name"));
                    foodDetails.put("description", rs.getString("description"));
                    foodDetails.put("price", String.valueOf(rs.getInt("price")));
                    
                }
            }
        }

        return foodDetails;
    }
}
