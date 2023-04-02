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
import java.util.List;

/**
 *
 * @author SANDUNI FERNANDO
 */
public class CategoryManager {
    private static CategoryManager instance;
    
    // DB 
    Connection conn = DBUtil.getConnection();

    public static synchronized CategoryManager getInstance() {
        if (instance == null) {
            instance = new CategoryManager();
        }
        return instance;
    }

    // Get All Categories
    public List<Category> getCategories() {
        List<Category> categories = new ArrayList<>();
        try {
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM categories");
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String category = resultSet.getString("category");
                categories.add(new Category(id, category));
            }
        } catch (SQLException e) {
        }
        return categories;
    }

    
    // Add New Category
    public boolean addCategory(String json) {
        Category c = new Gson().fromJson(json, Category.class);
        
        try {
            Statement st = conn.createStatement();
            st.executeUpdate("INSERT INTO categories (category) "
                    + "VALUES ('" + c.getCategory() + "')");

            return true;
        } catch (SQLException ex) {
        }

        return false;
    }

    // Update Category
    public boolean updateCategory(int categoryId, String json) {
        Category c = new Gson().fromJson(json, Category.class);
        
        try {
            Statement st = conn.createStatement();
            st.executeUpdate("UPDATE categories SET category = '" + c.getCategory() + "' WHERE id =" + categoryId);

            return true;
        } catch (SQLException ex) {
        }
        return false;
    }
    
    // Delete Category
    public boolean deleteCategory(int categoryId){
        try {
            Statement st = conn.createStatement();
            st.executeUpdate("DELETE FROM categories WHERE id =" + categoryId);

            return true;
        } catch (SQLException ex) {
        }
        
        return false;
    }
}
