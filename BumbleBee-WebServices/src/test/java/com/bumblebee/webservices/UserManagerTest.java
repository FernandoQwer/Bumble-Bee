/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package com.bumblebee.webservices;

import java.lang.reflect.Field;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Before;

/**
 *
 * @author SANDUNI FERNANDO
 */
public class UserManagerTest {

    private UserManager userManager;

    public UserManagerTest() {
    }

    @Before
    public void setUp() throws Exception {
        userManager = UserManager.getInstance();
    }

    @After
    public void tearDown() throws Exception {
        userManager.conn.close();
        UserManager.setInstance(null);
    }

    @Test
    public void testLogin() {
        String json = "{\"email\":\"admin@bumblebee.lk\",\"password\":\"password\"}";
        AuthResponse response = userManager.login(json);
        assertEquals(1, response.getUserId());
        assertEquals("success", response.getMessage());
        assertEquals("admin", response.getRole());
        assertEquals(200, response.getStatusCode());
    }

    @Test
    public void testPassword() {
        String json = "{\"email\":\"admin@bumblebee.lk\",\"password\":\"passwer\"}";
        AuthResponse response = userManager.login(json);
        assertEquals("invalid password", response.getMessage());
        assertEquals(401, response.getStatusCode());
    }

    @Test
    public void testRegister() {
        // Update Test Data Before Run The Test Case
        String json = "{\"email\":\"sampleuser12@gmail.com\",\"password\":\"password\",\"firstName\":\"Test\",\"lastName\":\"User\",\"dob\":\"2000-01-18\",\"mobile\":\"0771234567\",\"nic\":\"98000000V\",\"addressLineOne\":\"23/A\",\"addressLineTwo\":\"D S Jayasinghe Mawatha\",\"city\":\"Nugegoda\"}";
        AuthResponse response = userManager.customerRegister(json);
        assertEquals("success", response.getMessage());
        assertEquals(200, response.getStatusCode());
    }
}
