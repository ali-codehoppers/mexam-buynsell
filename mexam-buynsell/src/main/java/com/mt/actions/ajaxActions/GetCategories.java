/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.mt.hibernate.entities.Category;
import com.mt.services.CategoryService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

public class GetCategories extends ActionSupport
{
    private List<Category> categorys;
    private CategoryService categoryService;
    private String jsonString="";    

    public void setCategoryService(CategoryService categoryService)
    {
        this.categoryService = categoryService;
    }

    @Override
    public String execute() throws Exception
    {
        categorys = categoryService.getAll();
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(categorys);
        return SUCCESS;
    }

    public String getJsonString()
    {
        return jsonString;
    }
}
