/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bumblebee.webservices;

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
public class OrderManager {

    private static OrderManager instance;

    // DB 
    Connection conn = DBUtil.getConnection();

    public static synchronized OrderManager getInstance() {
        if (instance == null) {
            instance = new OrderManager();
        }
        return instance;
    }

    // Get All Categories
    public List<Order> getOrders() {
        List<Order> orders = new ArrayList<>();
        try {
            String orderQuery = "SELECT o.id, o.amount, o.status, o.created_at, "
                    + "c.first_name, c.last_name, c.mobile, u.email FROM orders AS o "
                    + "INNER JOIN customer AS c ON o.customer_id = c.id "
                    + "INNER JOIN users AS u ON c.user_id = u.id ORDER BY o.id DESC";

            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(orderQuery);
            while (resultSet.next()) {
                int orderId = resultSet.getInt("id");
                double amount = resultSet.getDouble("amount");
                String orderStatus = resultSet.getString("status");
                Date orderDate = resultSet.getDate("created_at");
                String customerName = resultSet.getString("first_name") + " " + resultSet.getString("last_name");
                String email = resultSet.getString("email");
                String mobile = resultSet.getString("mobile");

                List<OrderItem> orderItems = new ArrayList<>();

                String orderItemsQuery = "SELECT oi.id, oi.qty, oi.price, p.name FROM order_items AS oi "
                        + "INNER JOIN products AS p ON oi.product_id = p.id WHERE oi.order_id=" + orderId;

                Statement statementTwo = conn.createStatement();
                ResultSet resultSetTwo = statementTwo.executeQuery(orderItemsQuery);

                while (resultSetTwo.next()) {
                    int itemId = resultSetTwo.getInt("id");
                    String itemName = resultSetTwo.getString("name");
                    double itemPrice = resultSetTwo.getDouble("price");
                    int quantity = resultSetTwo.getInt("qty");
                    orderItems.add(new OrderItem(itemId, itemName, itemPrice, quantity));
                }

                orders.add(new Order(orderId, amount, orderStatus, orderDate, customerName, email, mobile, orderItems));
            }

        } catch (SQLException e) {
        }
        return orders;
    }

    // Cancel Orders
    public boolean cancelOrder(int orderId) {
        try {
            Statement st = conn.createStatement();
            st.executeUpdate("UPDATE orders SET status = 'canceled' WHERE id =" + orderId);

            return true;
        } catch (SQLException e) {
        }

        return false;
    }

    // Recent Orders
    public List<Order> recentOrders() {
        List<Order> orders = new ArrayList<>();
        try {
            String orderQuery = "SELECT o.id, o.amount, o.status, o.created_at, "
                    + "c.first_name, c.last_name, c.mobile, u.email FROM orders AS o "
                    + "INNER JOIN customer AS c ON o.customer_id = c.id "
                    + "INNER JOIN users AS u ON c.user_id = u.id ORDER BY o.id DESC LIMIT 5";

            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(orderQuery);
            while (resultSet.next()) {
                int orderId = resultSet.getInt("id");
                double amount = resultSet.getDouble("amount");
                String orderStatus = resultSet.getString("status");
                Date orderDate = resultSet.getDate("created_at");
                String customerName = resultSet.getString("first_name") + " " + resultSet.getString("last_name");
                String mobile = resultSet.getString("mobile");

                List<OrderItem> orderItems = new ArrayList<>();

                orders.add(new Order(orderId, amount, orderStatus, orderDate, customerName, "protected", mobile, orderItems));
            }

        } catch (SQLException e) {
        }
        return orders;
    }

    // Sales
    public List<Order> getSales() {
        List<Order> orders = new ArrayList<>();
        try {
            String orderQuery = "SELECT o.id, o.amount, o.status, o.created_at, "
                    + "c.first_name, c.last_name FROM orders AS o "
                    + "INNER JOIN customer AS c ON o.customer_id = c.id "
                    + "INNER JOIN users AS u ON c.user_id = u.id ORDER BY o.id DESC";

            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(orderQuery);
            while (resultSet.next()) {
                int orderId = resultSet.getInt("id");
                double amount = resultSet.getDouble("amount");
                String orderStatus = resultSet.getString("status");
                Date orderDate = resultSet.getDate("created_at");
                String customerName = resultSet.getString("first_name") + " " + resultSet.getString("last_name");

                List<OrderItem> orderItems = new ArrayList<>();

                String orderItemsQuery = "SELECT oi.id, oi.qty, oi.price, p.name FROM order_items AS oi "
                        + "INNER JOIN products AS p ON oi.product_id = p.id WHERE oi.order_id=" + orderId;

                Statement statementTwo = conn.createStatement();
                ResultSet resultSetTwo = statementTwo.executeQuery(orderItemsQuery);

                while (resultSetTwo.next()) {
                    int itemId = resultSetTwo.getInt("id");
                    String itemName = resultSetTwo.getString("name");
                    double itemPrice = resultSetTwo.getDouble("price");
                    int quantity = resultSetTwo.getInt("qty");
                    orderItems.add(new OrderItem(itemId, itemName, itemPrice, quantity));
                }

                orders.add(new Order(orderId, amount, orderStatus, orderDate, customerName, null, null, orderItems));
            }

        } catch (SQLException e) {
        }
        return orders;
    }
}
