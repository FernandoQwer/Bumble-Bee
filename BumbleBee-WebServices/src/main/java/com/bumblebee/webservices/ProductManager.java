/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bumblebee.webservices;

import com.google.gson.Gson;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author SANDUNI FERNANDO
 */
public class ProductManager {

    private static ProductManager instance;

    // DB 
    Connection conn = DBUtil.getConnection();

    public static synchronized ProductManager getInstance() {
        if (instance == null) {
            instance = new ProductManager();
        }
        return instance;
    }

    // Get All Products
    public List<Product> getProducts() {
        List<Product> products = new ArrayList<>();
        try {
            String query = "SELECT p.id, p.name, p.description, p.price, p.quantity, "
                    + "p.status, p.image_path, b.name as brand, c.category FROM products as p "
                    + "INNER JOIN categories as c ON p.category_id = c.id "
                    + "INNER JOIN brands as b ON p.brand_id = b.id WHERE p.status <> 'deleted'";

            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int qty = resultSet.getInt("quantity");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                String imagePath = resultSet.getString("image_path");
                String status = resultSet.getString("status");
                String category = resultSet.getString("category");
                String brand = resultSet.getString("brand");

                products.add(new Product(id, name, description, price, qty, 0,
                        status, brand, category, imagePath, null, null));
            }
        } catch (SQLException e) {
        }
        return products;
    }

    // Add New Product
    public boolean addNewProduct(String json) {
        Product p = new Gson().fromJson(json, Product.class);

        String productName = p.getName();
        String description = p.getDescription();
        double price = p.getPrice();
        int qty = p.getQty();
        int categoryId = Integer.parseInt(p.getCategory());
        int brandId = Integer.parseInt(p.getBrand());
        String image = p.getImagePath();

        try {
            Statement st = conn.createStatement();
            
            st.executeUpdate("INSERT INTO products(name, description, price, quantity, brand_id, category_id, image_path) "
                    + "VALUES ('" + productName + "','" + description + "', " + price + ", " + qty + ", " + brandId + "," + categoryId + ",'" + image + "')");
            return true;
        } catch (SQLException ex) {
        }

        return false;
    }

    // Inventory
    public List<Product> inventory() {
        List<Product> products = new ArrayList<>();

        String query = "SELECT p.id AS product_id, p.name AS product_name, p.status AS product_status, "
                + "b.name AS brand, p.quantity AS qty, SUM(COALESCE(oi.qty, 0)) AS sale_qty,  p.created_at, "
                + "p.updated_at FROM products AS p INNER JOIN brands AS b ON p.brand_id = b.id "
                + "INNER JOIN order_items AS oi ON oi.product_id = p.id "
                + "INNER JOIN orders AS o ON oi.order_id = o.id "
                + "WHERE o.status <> 'canceled' GROUP BY p.id";

        try {
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                int productId = resultSet.getInt("product_id");
                String productName = resultSet.getString("product_name");
                String brand = resultSet.getString("brand");
                int qty = resultSet.getInt("qty");
                int saleQty = resultSet.getInt("sale_qty");
                Date createdAt = resultSet.getDate("created_at");
                Date updatedAt = resultSet.getDate("updated_at");
                String status = resultSet.getString("product_status");

                products.add(new Product(productId, productName, null, 0.00, qty, saleQty,
                        status, brand, null, null, createdAt, updatedAt));
            }
        } catch (SQLException e) {
        }

        return products;
    }

    // Inventory Update
    public boolean updateQty(int productId, int newQty) {
        try {
            Statement st = conn.createStatement();
            st.executeUpdate("UPDATE products SET quantity =" + newQty + " WHERE id =" + productId
            );
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    // Product Delete
    public boolean deleteProduct(int productId) {
        try {
            Statement st = conn.createStatement();
            st.executeUpdate("UPDATE products SET status ='deleted' WHERE id =" + productId);
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

}
