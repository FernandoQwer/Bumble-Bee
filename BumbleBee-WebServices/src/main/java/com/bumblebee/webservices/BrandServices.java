/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bumblebee.webservices;

import com.google.gson.Gson;
import java.sql.SQLException;
import javax.ws.rs.Consumes;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
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
@Path("/brands")
public class BrandServices {

    private final BrandManager brandManager = BrandManager.getInstance();

    @GET
    @Path("/all")
    @Produces(MediaType.APPLICATION_JSON)
    public String getBrands() {
        Gson gson = new Gson();
        return gson.toJson(brandManager.getBrands());
    }

    @POST
    @Path("/add-new-brand")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addNewBrand(String json) throws SQLException {
         Gson gson = new Gson();

        if (brandManager.addBrand(json)) {
            return Response.status(200).entity(
                    gson.toJson("Brand Added Successfully!")
            ).build();
        } else {
            return Response.status(501).entity(gson.toJson("Something Went Wrong!")).build();
        }
    }

    // Delete Category
    @DELETE
    @Path("/delete-brand")
    public Response deleteBrand(@QueryParam("id") int brandId) {
        Gson gson = new Gson();

        if (brandManager.deleteBrand(brandId)) {
            return Response.status(200).entity(
                    gson.toJson("Brand Deleted Successfully!")
            ).build();
        } else {
            return Response.status(501).entity(gson.toJson("Something Went Wrong!")).build();
        }
    }
}
