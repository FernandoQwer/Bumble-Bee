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
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author SANDUNI FERNANDO
 */
public class UserManager {

    private static UserManager instance;

    // DB 
    Connection conn = DBUtil.getConnection();

    public static synchronized UserManager getInstance() {
        if (instance == null) {
            instance = new UserManager();
        }
        return instance;
    }

    public static void setInstance(UserManager instance) {
        UserManager.instance = instance;
    }

    
    public AuthResponse login(String json) {
        int userId = 0;
        String message = "Something Went Wrong!";
        String userRole = "";
        int statusCode = 501;

        User u = new Gson().fromJson(json, User.class);

        PasswordHash hp = new PasswordHash();
        String newPassword = hp.convertToMD5(u.getPassword());

        try {
            Statement st = conn.createStatement();
            ResultSet result = st.executeQuery("SELECT * FROM users WHERE email = '" + u.getEmail() + "'");

            while (result.next()) {
                int id = result.getInt("id");
                String email = "Protected";
                String password = result.getString("password");
                String role = result.getString("role");
                String status = result.getString("status");

                User user = new User(id, email, password, role, status);

                boolean passwordValidation = user.getPassword().equals(newPassword);
                boolean userActiveValidation = user.getStatus().equals("active");

                if (!passwordValidation) {
                    message = "invalid password";
                    statusCode = 401;
                }

                if (!userActiveValidation) {
                    message = "blocked";
                    statusCode = 401;
                }

                if (userActiveValidation && passwordValidation) {
                    userId = id;
                    message = "success";
                    userRole = user.getRole();
                    statusCode = 200;
                }
            }

        } catch (SQLException ex) {
        }

        AuthResponse response = new AuthResponse(userId, message, userRole, statusCode);

        return response;
    }

    public AuthResponse customerRegister(String json) {
        int userId = 0;
        String message = "Something Went Wrong!";
        String userRole = "";
        int statusCode = 501;

        Customer c = new Gson().fromJson(json, Customer.class);

        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
        String outputDateString = outputFormat.format(c.getDob());

        PasswordHash hp = new PasswordHash();
        String newPassword = hp.convertToMD5(c.getPassword());

        try {
            String insertUserQuery = "INSERT INTO users (email, password, role, status) VALUES ('" + c.getEmail() + "', '" + newPassword + "', 'customer', 'active')";

            String getUserID = "SELECT id FROM users WHERE email = '" + c.getEmail() + "'";

            String addNewCustomer = "INSERT INTO customer (first_name, last_name, date_of_birth, nic, mobile)"
                    + "VALUES ( '" + c.getFirstName() + "', '" + c.getLastName()
                    + "', '" + outputDateString + "', '" + c.getNic() + "', '" + c.getMobile() + "')";

            String newAddress = "INSERT INTO address(address_line_one, address_line_two, city) VALUES ('" + c.getAddressLineOne() + "','" + c.getAddressLineTwo() + "','" + c.getCity() + "')";

            // Create New User
            Statement st = conn.createStatement();
            st.executeUpdate(insertUserQuery);

            ResultSet result = st.executeQuery(getUserID);
            while (result.next()) {
                userId = result.getInt("id");
            }

            st.executeUpdate(addNewCustomer);
            st.executeUpdate(newAddress);

            message = "success";
            userRole = "customer";
            statusCode = 200;

        } catch (SQLException ex) {
        }

        AuthResponse response = new AuthResponse(userId, message, userRole, statusCode);
        return response;
    }

}
