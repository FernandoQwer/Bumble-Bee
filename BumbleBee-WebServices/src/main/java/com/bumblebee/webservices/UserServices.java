/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bumblebee.webservices;

import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
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

//        return gson.toJson(userManager.customerRegister(json));
    }
    
    
    @POST
    @Path("/test")
    @Consumes(MediaType.APPLICATION_JSON)
    public String test(String json) {
        return json;
    }
}
