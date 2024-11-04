/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HP
 */
public class nguyenlieu {
    private int id;
    private String name, quantity, nhacungcap;
    
    public nguyenlieu(){
        this.id = 0;
        this.name = "";
        this.quantity = "";
        this.nhacungcap = "";
    }
    
    public nguyenlieu(int id, String name, String quantity, String nhacungcap){
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.nhacungcap = nhacungcap;
    }
    public int getId(){
        return id;
    }
    public String getName(){
        return name;
    }
    public String getQuantity(){
        return quantity;
    }
    public String getNhacungcap(){
        return nhacungcap;
    }
}
