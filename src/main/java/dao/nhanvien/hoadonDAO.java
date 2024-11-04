/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.nhanvien;

/**
 *
 * @author HP
 */
import dao.DAO;
import java.util.HashMap;
import java.util.Map;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.text.SimpleDateFormat;
import model.hoadonnhaphang;

public class hoadonDAO extends DAO {

    public hoadonDAO() {
        super();
    }

    public Map<String, String> getDetails(int id) {
        Map<String, String> details = new HashMap<>();
        String sql = "select h.id, h.ngaynhap, h.name, h.quantity,h.tongtien, s.name as s_name, tv.name as tv_name\n"
                + "from hoadonnhaphang h \n"
                + "join thanhvien tv on h.thanhvien_id= tv.id\n"
                + "join nhacungcap s on s.id= h.nhacungcap_id\n"
                + "where h.id = ?;";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                details.put("id", String.valueOf(rs.getInt("id")));
                Date sqlDate = rs.getDate("ngaynhap");
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                details.put("date",dateFormat.format(sqlDate));
                details.put("name",rs.getString("name"));
                details.put("quantity",rs.getString("quantity"));
                details.put("tongtien",rs.getString("tongtien"));
                details.put("s_name", rs.getString("s_name"));
                details.put("tv_name", rs.getString("tv_name"));
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return details;
    }
}
