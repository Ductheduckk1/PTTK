/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HP
 */
public class monan {
    private int id;
    private String name, desciption, price;
    
    public monan(){
        this.id = 0;
        this.name ="";
        this.desciption ="";
        this.price = "";
    }
    public monan(int id, String name, String description, String price){
        this.id = id;
        this.name = name;
        this.desciption = description;
        this.price = price;
    }
    public String getName(){
        return name;
    }
    public int getId(){
        return id;
    }
    public String getDes(){
        return desciption;
    }
    public String getPrice(){
        return price;
    }
}
