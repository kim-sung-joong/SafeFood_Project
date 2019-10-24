package com.ssafy.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ssafy.model.dto.Calory;
import com.ssafy.model.dto.Eat;
import com.ssafy.model.dto.Food;

public interface EatService {

	void updateEat(HttpServletRequest req, int code);

	List<Food> selectEat(HttpServletRequest req);

	public List<Food> recommand(HttpServletRequest req);
	
	public List<Food> oneday(HttpServletRequest req);
	public Calory oneCalory(HttpServletRequest req);
	public List<Food> threeday(HttpServletRequest req);
	public Calory threeCalory(HttpServletRequest req);
	public Calory weekCalory(HttpServletRequest req);
	public List<Food> weekday(HttpServletRequest req);
	public Calory totalCalory(HttpServletRequest req);
}
