/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bumblebee.webservices;

import com.google.gson.Gson;
import javax.ws.rs.GET;
import javax.ws.rs.PATCH;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author SANDUNI FERNANDO
 */
@Path("/order")
public class OrderServices {

    private final OrderManager orderManager = OrderManager.getInstance();

    // Get All Orders
    @GET
    @Path("/all")
    @Produces(MediaType.APPLICATION_JSON)
    public String getOrders() {
        Gson gson = new Gson();
        return gson.toJson(orderManager.getOrders());
    }

    // Cancel Order
    @PATCH
    @Path("/update-status")
    @Produces(MediaType.APPLICATION_JSON)
    public Response cancelOrder(@QueryParam("id") int orderId) {
        Gson gson = new Gson();

        if (orderManager.cancelOrder(orderId)) {
            return Response.status(200).entity(
                    gson.toJson("Order Canceled Successfully!")
            ).build();
        } else {
            return Response.status(501).entity(gson.toJson("Something Went Wrong!")).build();
        }
    }
    
    // Get Sales
    @GET
    @Path("/sales")
    @Produces(MediaType.APPLICATION_JSON)
    public String getSales() {
        Gson gson = new Gson();
        return gson.toJson(orderManager.getSales());
    }
    
}
