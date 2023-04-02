/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bumblebee.webservices;

/**
 *
 * @author SANDUNI FERNANDO
 */
public class Brand {

    private static Brand instance;

    private int id;
    private String name;
    private String supplier;    
    private String imagePath;


    public Brand(int id, String name, String supplier, String imagePath) {
        this.id = id;
        this.name = name;
        this.supplier = supplier;        
        this.imagePath = imagePath;
    }

    public static synchronized Brand getInstance(int id, String name,
            String supplier, String imagePath) {
        if (instance == null) {
            instance = new Brand(id, name, imagePath, supplier);
        }
        return instance;
    }

    public static Brand getInstance() {
        return instance;
    }

    public static void setInstance(Brand instance) {
        Brand.instance = instance;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }
    
    
    
}
