/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bumblebee.webservices;

import com.google.gson.Gson;
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
@Path("/user")
public class UserServices {

    private final UserManager userManager = UserManager.getInstance();

    @POST
    @Path("/login")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response login(String json) {
        Gson gson = new Gson();
        AuthResponse auth = userManager.login(json);

        return Response.status(auth.getStatusCode()).entity(
                gson.toJson(auth)
        ).build();
    }

    @POST
    @Path("/customer-register")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response customerRegister(String json) {
        Gson gson = new Gson();
        AuthResponse auth = userManager.customerRegister(json);

        return Response.status(auth.getStatusCode()).entity(
                gson.toJson(auth)
        ).build();

    }

    @GET
    @Path("/registered-customers")
    @Produces(MediaType.APPLICATION_JSON)
    public String getRegisteredUsers() {
        Gson gson = new Gson();
        return gson.toJson(userManager.getRegisteredUsers());
    }

    // Update User Status
    @PATCH
    @Path("/change-status")
    @Produces(MediaType.APPLICATION_JSON)
    public Response updateStatus(@QueryParam("user") int userId, @QueryParam("status") String status) {
        Gson gson = new Gson();

        if (userManager.changeStatus(userId, status)) {
            return Response.status(200).entity(
                    gson.toJson("Status Updated Successfully!")
            ).build();
        } else {
            return Response.status(501).entity(gson.toJson("Something Went Wrong!")).build();
        }
    }

}
