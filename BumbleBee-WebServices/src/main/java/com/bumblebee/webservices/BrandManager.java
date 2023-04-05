/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bumblebee.webservices;

import com.google.gson.Gson;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/**
 *
 * @author SANDUNI FERNANDO
 */
public class BrandManager {

    private static BrandManager instance;

    // DB 
    Connection conn = DBUtil.getConnection();

    public static synchronized BrandManager getInstance() {
        if (instance == null) {
            instance = new BrandManager();
        }
        return instance;
    }

    // Get All Categories
    public List<Brand> getBrands() {
        List<Brand> brands = new ArrayList<>();
        try {
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM brands");
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String supplier = resultSet.getString("supplier");
                String imagePath = resultSet.getString("image");

                brands.add(new Brand(id, name, supplier, imagePath));
            }
        } catch (SQLException e) {
        }
        return brands;
    }

    // DELETE Brand
    public boolean deleteBrand(int brandId) {
        try {
            Statement st = conn.createStatement();
            st.executeUpdate("DELETE FROM brands WHERE id =" + brandId);

            return true;
        } catch (SQLException ex) {
        }
        return false;
    }

    // Add New Category
    public boolean addBrand(String json) throws SQLException {
        Brand b = new Gson().fromJson(json, Brand.class);

        String image = b.getImagePath();

        try {
            Statement st = conn.createStatement();
            st.executeUpdate("INSERT INTO brands (name, supplier, image) "
                    + "VALUES ('" + b.getName() + "', '" + b.getSupplier() + "', '" + image + "')");

            return true;
        } catch (SQLException ex) {
        }

        return false;
    }

}
