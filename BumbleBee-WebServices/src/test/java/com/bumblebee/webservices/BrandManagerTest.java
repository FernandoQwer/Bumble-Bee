/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package com.bumblebee.webservices;

import java.util.List;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Before;

/**
 *
 * @author SANDUNI FERNANDO
 */
public class BrandManagerTest {

    private BrandManager brandManager;

    public BrandManagerTest() {
    }

    @Before
    public void setUp() throws Exception {
        brandManager = BrandManager.getInstance();
    }

    @After
    public void tearDown() throws Exception {
        brandManager.conn.close();
    }
    
    @Test
    public void testGetBrands() {
        List<Brand> brands = brandManager.getBrands();
        assertNotNull(brands);
        assertFalse(brands.isEmpty());
    }

}
