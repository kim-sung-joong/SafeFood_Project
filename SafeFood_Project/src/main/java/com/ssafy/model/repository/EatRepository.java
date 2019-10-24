package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Calory;
import com.ssafy.model.dto.Eat;
import com.ssafy.model.dto.Food;

public interface EatRepository {
	public void updateEat(Eat eat);
	public List<Food> selectEat(String id);
	public List<Food> recommand(String id);
	public List<Food> recommandLimitThree();
	public List<Food> oneday(String id);
	public Calory oneCalory(String id);
	public List<Food> threeday(String id);
	public Calory threeCalory(String id);
	public List<Food> weekday(String id);
	public Calory weekCalory(String id);
	public Calory totalCalory(String id);
}
