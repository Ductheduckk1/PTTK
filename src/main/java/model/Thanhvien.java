/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HP
 */
public class Thanhvien {
    private String id;
    private String username, password, birthday, phonenum, address, email, vaitro;
    public Thanhvien(){
        this.id = "";
        this.username = "";
        this.password = "";
        this.birthday = "";
        this.phonenum = "";
        this.address = "";
        this.email = "";
        this.vaitro = "";
    }
    public Thanhvien(String id, String username, String password, String birthday, String phonenum, String address, String email, String vaitro){
        this.id= id;
        this.username = username;
        this.password = password;
        this.birthday = birthday;
        this.phonenum = phonenum;
        this.address = address;
        this.email = email;
        this.vaitro = vaitro;
    }
    public void setUsername(String username){
        this.username = username;
    }
    public void setPassword(String password){
        this.password = password;
    }
    public String getId(){
        return id;
    }
    public String getUsername(){
        return username;
    }
    public String getPassword(){
        return password;
    }
    public void setVaitro(String vaitro){
        this.vaitro = vaitro;
    }
    public String getVaitro(){
        return vaitro;
    }
}
