package com.tmooming.tmall.dao;
 
import org.springframework.data.jpa.repository.JpaRepository;

import com.tmooming.tmall.pojo.Category;

public interface CategoryDAO extends JpaRepository<Category,Integer>{

}
