/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bumblebee.webservices;

import com.google.gson.Gson;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author SANDUNI FERNANDO
 */
@Path("/category")
public class CategoryServices {

    private final CategoryManager categoryManager = CategoryManager.getInstance();

    @GET
    @Path("/all")
    @Produces(MediaType.APPLICATION_JSON)
    public String getCategories() {
        Gson gson = new Gson();
        return gson.toJson(categoryManager.getCategories());
    }

    // Add New Category
    @POST
    @Path("/add-new-category")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addNewBrand(String json) {
        Gson gson = new Gson();

        if (categoryManager.addCategory(json)) {
            return Response.status(200).entity(
                    gson.toJson("Category Added Successfully!")
            ).build();
        } else {
            return Response.status(501).entity(gson.toJson("Something Went Wrong!")).build();
        }
    }

    // Update Category
    @PUT
    @Path("/update-category")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updateCategory(String json, @QueryParam("id") int categoryId) {
        Gson gson = new Gson();

        if (categoryManager.updateCategory(categoryId, json)) {
            return Response.status(200).entity(
                    gson.toJson("Category Updated Successfully!")
            ).build();
        } else {
            return Response.status(501).entity(gson.toJson("Something Went Wrong!")).build();
        }
    }

    // Delete Category
    @DELETE
    @Path("/delete-category")
    public Response deleteCategory(@QueryParam("id") int categoryId) {
        Gson gson = new Gson();

        if (categoryManager.deleteCategory(categoryId)) {
            return Response.status(200).entity(
                    gson.toJson("Category Deleted Successfully!")
            ).build();
        } else {
            return Response.status(501).entity(gson.toJson("Something Went Wrong!")).build();
        }
    }

}
