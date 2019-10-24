package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Food;

public interface FoodRepository {
	public Food searchByCode(int code);
	public List<Food> selectAllFood();
	public List<Food> searchByName(String name);
	public List<Food> searchById(String id);
	public List<Food> searchByBest();
}
