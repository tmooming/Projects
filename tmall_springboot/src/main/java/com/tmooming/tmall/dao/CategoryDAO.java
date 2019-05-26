package com.tmooming.tmall.dao;

import com.tmooming.tmall.pojo.Category;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Classname: CategoryDAO
 * @description: TODO
 * @author: tmooming
 * @create: 2019/5/7 20:40
 **/
public interface CategoryDAO extends JpaRepository<Category,Integer> {
}
