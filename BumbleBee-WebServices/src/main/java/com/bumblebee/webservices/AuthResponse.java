/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bumblebee.webservices;

/**
 *
 * @author SANDUNI FERNANDO
 */
public class AuthResponse {

    private int userId;
    private String message;
    private String role;
    private int statusCode;

    public AuthResponse(int userId, String message, String role, int statusCode) {
        this.userId = userId;
        this.message = message;
        this.role = role;
        this.statusCode = statusCode;

    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }
    
}
