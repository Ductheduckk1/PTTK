/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HP
 */
public class hoadonnhaphang {
    private int id;
    private String ngaynhap;
    private String name, nhacungcap, quantity, nhanvienkho;
    
    public hoadonnhaphang(){
        this.id = 0;
        this.ngaynhap = "";
        this.name = "";
        this.nhacungcap = "";
        this.quantity = "";
        this.nhanvienkho = "";
    }
    public hoadonnhaphang(int id, String ngaynhap, String name, String nhacungcap, String quantity, String nhanvienkho){
        this.id = id;
        this.ngaynhap = ngaynhap;
        this.name = name;
        this.nhacungcap = nhacungcap;
        this.quantity = quantity;
        this.nhanvienkho = nhanvienkho;
    }
    public int getId(){
        return id;
    }
    public String getNgaynhap(){
        return ngaynhap;
    }
    public String getName(){
        return name;
    }
    public String getNhacungcap(){
        return nhacungcap;
    }
    public String getQuantity(){
        return quantity;
    }
    public String getNhanvienkho(){
        return nhanvienkho;
    }
}
