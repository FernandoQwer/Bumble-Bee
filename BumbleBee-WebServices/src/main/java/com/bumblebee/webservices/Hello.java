/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bumblebee.webservices;

import com.google.gson.Gson;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author SANDUNI FERNANDO
 */
@Path("/hello")
public class Hello {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String sayHello() {
        
        Gson gson = new Gson();
        return gson.toJson("Hello");
    }

}
