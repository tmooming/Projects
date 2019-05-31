package com.tmooming.tmall.service;

import java.util.List;
import java.util.Optional;

import com.tmooming.tmall.util.Page4Navigator;
import com.tmooming.tmall.dao.CategoryDAO;
import com.tmooming.tmall.pojo.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
	@Autowired
	CategoryDAO categoryDAO;


	public Page4Navigator<Category> list(int start, int size, int navigatePages) {
		Sort sort = new Sort(Sort.Direction.DESC, "id");
		Pageable pageable = PageRequest.of(start,size,sort);
		Page pageFromJPA =categoryDAO.findAll(pageable);

		return new Page4Navigator<>(pageFromJPA,navigatePages);
	}
	public List<Category> list() {
    	Sort sort = new Sort(Sort.Direction.DESC, "id");
		return categoryDAO.findAll(sort);
	}

	public void add(Category bean) {
		categoryDAO.save(bean);
	}

	public void delete(int id) {
		Category category=new Category();
		category.setId(id);
		categoryDAO.delete(category);
	}

	public Optional<Category> get(int id) {
		Category category=new Category();
		category.setId(id);
		Example<Category> example=Example.of(category);
		Optional<Category> c= categoryDAO.findOne(example);
		return c;
	}
	public void update(Category bean) {
		categoryDAO.save(bean);
	}
}
