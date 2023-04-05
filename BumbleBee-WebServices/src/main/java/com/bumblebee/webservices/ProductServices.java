/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bumblebee.webservices;

import com.google.gson.Gson;
import java.sql.SQLException;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.PATCH;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author SANDUNI FERNANDO
 */

@Path("/product")
public class ProductServices {
    private final ProductManager productManager = ProductManager.getInstance();
    
    @GET
    @Path("/all")
    @Produces(MediaType.APPLICATION_JSON)
    public String getProducts() {
        Gson gson = new Gson();
        return gson.toJson(productManager.getProducts());
    }
    
    @POST
    @Path("/add-new-product")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addNewProduct(String json){
         Gson gson = new Gson();

        if (productManager.addNewProduct(json)) {
            return Response.status(200).entity(
                    gson.toJson("Product Added Successfully!")
            ).build();
        } else {
            return Response.status(501).entity(gson.toJson("Something Went Wrong!")).build();
        }
    }
    
    @GET
    @Path("/inventory")
    @Produces(MediaType.APPLICATION_JSON)
    public String inventoryData() {
        Gson gson = new Gson();
        return gson.toJson(productManager.inventory());
    }
    
     // Update Inventory
    @PATCH
    @Path("/update/qty")
    @Produces(MediaType.APPLICATION_JSON)
    public Response updateStatus(@QueryParam("product") int productId, @QueryParam("qty") int newQty) {
        Gson gson = new Gson();

        if (productManager.updateQty(productId, newQty)) {
            return Response.status(200).entity(
                    gson.toJson("Qty Updated Successfully!")
            ).build();
        } else {
            return Response.status(501).entity(gson.toJson("Something Went Wrong!")).build();
        }
    }
    
    @PATCH
    @Path("/delete")
    @Produces(MediaType.APPLICATION_JSON)
    public Response deleteProduct(@QueryParam("product") int productId) {
        Gson gson = new Gson();

        if (productManager.deleteProduct(productId)) {
            return Response.status(200).entity(
                    gson.toJson("Product Deleted Successfully!")
            ).build();
        } else {
            return Response.status(501).entity(gson.toJson("Something Went Wrong!")).build();
        }
    }
}
