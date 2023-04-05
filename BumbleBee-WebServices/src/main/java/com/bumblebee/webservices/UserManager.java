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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author SANDUNI FERNANDO
 */
public class UserManager {

    private static UserManager instance;

    // DB Connection
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

    // User Login
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

    // Customer Register
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

    // GET Registered Users
    public List<Customer> getRegisteredUsers() {
        List<Customer> customers = new ArrayList<>();
        try {
            String query = "SELECT c.id as customer_id, c.first_name, c.last_name, c.mobile, c.date_of_birth, c.nic, u.email, u.created_at, u.status, u.id AS user_id, SUM(o.amount) AS order_sum, SUM(COALESCE(p.amount, 0)) AS payment_amount FROM customer as c INNER JOIN users AS u ON c.user_id = u.id LEFT JOIN orders AS o ON o.customer_id = c.id LEFT JOIN payments as p ON c.id = p.customer_id WHERE o.status = 'purchased' OR o.status = 'pending' GROUP BY c.id";

            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                // User 
                int userId = resultSet.getInt("user_id");
                String email = resultSet.getString("email");
                String status = resultSet.getString("status");
                Date createdAt = resultSet.getDate("created_at");

                // Customer
                int customerId = resultSet.getInt("customer_id");
                String firstName = resultSet.getString("first_name");
                String lastName = resultSet.getString("last_name");
                Date dob = resultSet.getDate("date_of_birth");
                String nic = resultSet.getString("nic");
                String mobile = resultSet.getString("mobile");

                // Calculate Credit Balance
                double orderSum = resultSet.getDouble("order_sum");
                double paymentAmount = resultSet.getDouble("payment_amount");
                double creditBalance = 15000 - (orderSum - paymentAmount);

                Customer customer = new Customer(customerId, firstName, lastName, dob, nic, mobile, null, null, null, createdAt, creditBalance, userId, email, "protected", "customer", status);
                customers.add(customer);
            }
        } catch (SQLException e) {
        }
        return customers;
    }

    public boolean changeStatus(int userId, String status) {
        try {
            Statement st = conn.createStatement();
            st.executeUpdate("UPDATE users SET status = '" + status + "' WHERE id =" + userId
            );
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    public List<Customer> getNewCustomers() {
        List<Customer> customers = new ArrayList<>();
        try {
            String query = "SELECT c.id as customer_id, c.first_name, c.last_name, c.mobile, u.email, "
                    + "u.created_at FROM customer as c INNER JOIN users AS u ON c.user_id = u.id LIMIT 5";

            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                // User 
                String email = resultSet.getString("email");
                Date createdAt = resultSet.getDate("created_at");

                // Customer
                int customerId = resultSet.getInt("customer_id");
                String firstName = resultSet.getString("first_name");
                String lastName = resultSet.getString("last_name");
                String mobile = resultSet.getString("mobile");


                Customer customer = new Customer(customerId, firstName, lastName, null, null, mobile, null, null, null, createdAt, 0, 0, email, null, null, null);
                customers.add(customer);
            }
        } catch (SQLException e) {
        }
        return customers;
    }
}
