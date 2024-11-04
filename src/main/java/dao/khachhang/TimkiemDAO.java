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
import java.util.ArrayList;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.monan;

public class TimkiemDAO extends DAO {

    public TimkiemDAO() {
        super();
    }

    public List<String> getDanhsach(String keyword) throws SQLException {
        List<String> foodList = new ArrayList<>();
        String sql = "SELECT id, name FROM pttk.monan";

        // Nếu có từ khóa, thêm điều kiện WHERE
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += " WHERE name LIKE ?";
        }
        
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            // Nếu có từ khóa, gán giá trị cho tham số
            if (keyword != null && !keyword.trim().isEmpty()) {
                ps.setString(1, keyword + "%");
            }
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String food = rs.getInt("id") + " " + rs.getString("name");
                    foodList.add(food);
                }
            }
        }

        return foodList;
    }
}
