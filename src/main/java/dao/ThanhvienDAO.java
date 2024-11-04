/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author HP
 */
import java.sql.CallableStatement;
import java.sql.ResultSet;
import model.Thanhvien;

public class ThanhvienDAO extends DAO {
    public ThanhvienDAO(){
        super();
    }
    public boolean checkLogin(Thanhvien tv){
        boolean kq = false;
        if(tv.getUsername().contains("true")||tv.getUsername().contains("=")||tv.getPassword().contains("true")||tv.getPassword().contains("=")) return false;
        String sql = "{call kiemtraDN(?,?)} ";
        try{
            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1,tv.getUsername());
            cs.setString(2,tv.getPassword());
            ResultSet rs = cs.executeQuery();
            if (rs.next()){
                String s = rs.getString("id");
                String vaitro = s.substring(0, s.length()-4);
                tv.setVaitro(vaitro);
                kq= true;
            }
        } catch(Exception e){
            e.printStackTrace();
            kq = false;
        }
        return kq;
    }
}
