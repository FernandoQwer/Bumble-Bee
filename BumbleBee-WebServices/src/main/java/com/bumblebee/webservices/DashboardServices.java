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
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author SANDUNI FERNANDO
 */
@Path("/dashboard")
public class DashboardServices {

    private final OrderManager orderManager = OrderManager.getInstance();    
    private final UserManager userManager = UserManager.getInstance();


    Connection conn = DBUtil.getConnection();

    @GET
    @Path("/data")
    @Produces(MediaType.APPLICATION_JSON)
    public String getDashboardData() throws SQLException {
        double amount = 0.00;
        int productsCount = 0;
        int customersCount = 0;

        Gson gson = new Gson();

        Statement earningsStatement = conn.createStatement();
        ResultSet earningsResultSet = earningsStatement.executeQuery("SELECT SUM(orders.amount) AS amount FROM orders");
        while (earningsResultSet.next()) {
            amount = earningsResultSet.getDouble("amount");
        }

        Statement productsStatement = conn.createStatement();
        ResultSet productsResultSet = productsStatement.executeQuery("SELECT COUNT(id) AS products FROM products WHERE status <> 'deleted'");
        while (productsResultSet.next()) {
            productsCount = productsResultSet.getInt("products");
        }

        Statement customersStatement = conn.createStatement();
        ResultSet customersResultSet = customersStatement.executeQuery("SELECT COUNT(id) AS customers FROM customer");
        while (customersResultSet.next()) {
            customersCount = customersResultSet.getInt("customers");
        }

        return gson.toJson(new Data(amount, productsCount, customersCount));
    }

    @GET
    @Path("/recent-orders")
    @Produces(MediaType.APPLICATION_JSON)
    public String getRecentOrders() {
        Gson gson = new Gson();
        return gson.toJson(orderManager.recentOrders());
    }
    
    @GET
    @Path("/new-customers")
    @Produces(MediaType.APPLICATION_JSON)
    public String getNewUsers() {
        Gson gson = new Gson();
        return gson.toJson(userManager.getNewCustomers());
    }

    private static class Data {

        private final double totalEarnings;
        private final int totalProducts;
        private final int regCustomers;

        public Data(double totalEarnings, int totalProducts, int regCustomers) {
            this.totalEarnings = totalEarnings;
            this.totalProducts = totalProducts;
            this.regCustomers = regCustomers;

        }

        public double getTotalEarnings() {
            return totalEarnings;
        }

        public int getTotalProducts() {
            return totalProducts;
        }

        public int getRegCustomers() {
            return regCustomers;
        }

    }
}
