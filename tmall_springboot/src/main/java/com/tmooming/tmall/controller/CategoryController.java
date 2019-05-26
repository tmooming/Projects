package com.tmooming.tmall.controller;

import com.tmooming.tmall.pojo.Category;
import com.tmooming.tmall.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Classname: CategoryController
 * @description: TODO
 * @author: tmooming
 * @create: 2019/5/7 20:47
 **/
@RestController
public class CategoryController {
    @Autowired
    CategoryService categoryService;
    @GetMapping("/categories")
    public List<Category> list() throws Exception{
        return categoryService.list();
    }
}
