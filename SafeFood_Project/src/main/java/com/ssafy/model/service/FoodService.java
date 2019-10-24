package com.ssafy.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ssafy.model.dto.Eat;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.Member;

public interface FoodService {
	public List<Food> selectAll();
	public Food selectOne(int code);
	public List<Food> searchByName(String name);
	public List<Food> searchByBest();
}
