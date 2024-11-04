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
import java.util.ArrayList;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.nhacungcap;

public class supplierDAO extends DAO {

    public supplierDAO() {
        super();
    }

    public List<String> getDanhsach() {
        List<String> supList = new ArrayList<>();
        String sql = "SELECT id,name FROM nhacungcap ORDER BY name ASC";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String sup = rs.getInt("id") + " " + rs.getString("name");
                supList.add(sup);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return supList;
    }

    public List<String> getListbyday(String dStart, String dEnd) {
        List<String> list = new ArrayList<>();
        String sql = "{call thongketheongay(?,?)}";
        try {
            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1, dStart);
            cs.setString(2, dEnd);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                String res = rs.getInt("id") + " " + rs.getString("name") + " " + rs.getString("so_lan_nhap");
                list.add(res);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<String> getDetails(int supplierId, String startDate, String endDate) {
        List<String> detailsList = new ArrayList<>();
        String sql;

        // Kiểm tra xem startDate và endDate có giá trị hay không
        if (startDate == null || startDate.isEmpty() || endDate == null || endDate.isEmpty()) {
            // Nếu không có ngày bắt đầu và ngày kết thúc, lấy tất cả các hóa đơn của nhà cung cấp
            sql = "SELECT id, ngaynhap FROM hoadonnhaphang WHERE nhacungcap_id = ?";
        } else {
            // Nếu có ngày bắt đầu và ngày kết thúc, lấy hóa đơn trong khoảng thời gian đó
            sql = "SELECT id, ngaynhap FROM hoadonnhaphang WHERE nhacungcap_id = ? AND ngaynhap BETWEEN ? AND ?";
        }

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, supplierId);

            // Nếu có startDate và endDate, set các tham số tương ứng
            if (startDate != null && !startDate.isEmpty() && endDate != null && !endDate.isEmpty()) {
                ps.setString(2, startDate);
                ps.setString(3, endDate);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String detail = rs.getInt("id") + " " + rs.getDate("ngaynhap");
                detailsList.add(detail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return detailsList;
    }

}
