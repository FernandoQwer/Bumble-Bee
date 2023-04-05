/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bumblebee.webservices;

/**
 *
 * @author SANDUNI FERNANDO
 */
public class OrderItem {
    private int orderItemId;
    private String productName;
    private double price;
    private int qty; 

    public OrderItem(int orderItemId, String productName, double price, int qty) {
        this.orderItemId = orderItemId;
        this.productName = productName;
        this.price = price;
        this.qty = qty;
    }

    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }
       
}
