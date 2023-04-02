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
public class CategoryManagerTest {

    private CategoryManager categoryManager;

    public CategoryManagerTest() {
    }

    @Before
    public void setUp() throws Exception {
        categoryManager = CategoryManager.getInstance();
    }

    @After
    public void tearDown() throws Exception {
        categoryManager.conn.close();
    }

    @Test
    public void testGetCategories() {
        List<Category> categories = categoryManager.getCategories();
        assertNotNull(categories);
        assertFalse(categories.isEmpty());
    }
    
     @Test
    public void testAddCategory() {
        String json = "{\"category\":\"Test Category\"}";
        boolean success = categoryManager.addCategory(json);
        assertTrue(success);
    }

    @Test
    public void testUpdateCategory() {
        String json = "{\"category\":\"Test Category 2\"}";
        boolean success = categoryManager.updateCategory(1, json);
        assertTrue(success);
    }

    @Test
    public void testDeleteCategory() {
        boolean success = categoryManager.deleteCategory(1);
        assertTrue(success);
    }

}
