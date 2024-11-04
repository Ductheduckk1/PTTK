/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HP
 */
public class hoadonbanhang {
    private int id;
    private String ngaythanhtoan, khachhang, nhanvienbanhang,monan, giathanh;
    
    public hoadonbanhang(){
        this.id= 0;
        this.ngaythanhtoan = "";
        this.khachhang ="";
        this.nhanvienbanhang = "";
        this.monan ="";
        this.giathanh = "";
    }
    public hoadonbanhang(int id, String ngaythanhtoan, String khachhang, String nhanvienbanhang, String monan, String giathanh){
        this.id = id;
        this.ngaythanhtoan = ngaythanhtoan;
        this.khachhang = khachhang;
        this.nhanvienbanhang = nhanvienbanhang;
        this.monan = monan;
        this.giathanh = giathanh;
    }
}
