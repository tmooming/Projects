package com.tmooming.tmall.service;

import com.tmooming.tmall.dao.CategoryDAO;
import com.tmooming.tmall.pojo.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Classname: CategoryService
 * @description: TODO
 * @author: tmooming
 * @create: 2019/5/7 20:42
 **/
@Service
public class CategoryService {
    @Autowired
    CategoryDAO categoryDAO;
    public List<Category> list(){
        Sort sort=new Sort(Sort.Direction.DESC,"id");
        return categoryDAO.findAll(sort);
    }
}
