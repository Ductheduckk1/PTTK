/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HP
 */
public class nhacungcap {
    private int id;
    private String name, address, phonenum, email;
    
    public nhacungcap(){
        this.id = 0;
        this.name = "";
        this.address = "";
        this.phonenum ="";
        this.email = "";
    }
    public nhacungcap(int id, String name, String address, String phonenum, String email){
        this.id = id;
        this.name = name;
        this.address = address;
        this.phonenum = phonenum;
        this.email = email;
    }
    public int getId(){
        return id;
    }
    public String getName(){
        return name;
    }
}
