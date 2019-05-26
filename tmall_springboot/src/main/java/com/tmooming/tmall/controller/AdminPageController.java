package com.tmooming.tmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @Classname: AdminPageController
 * @description: TODO
 * @author: tmooming
 * @create: 2019/5/7 20:44
 **/
@Controller
public class AdminPageController {
    @GetMapping(value = "/admin")
    public String admin(){
        return "redirect:admin_category_list";
    }
    @GetMapping(value = "/admin_category_list")
    public String listCategory(){
        return "admin/listCategory";
    }
}
