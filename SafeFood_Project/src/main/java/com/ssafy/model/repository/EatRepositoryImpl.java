package com.ssafy.model.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Calory;
import com.ssafy.model.dto.Eat;
import com.ssafy.model.dto.Food;

@Repository
public class EatRepositoryImpl implements EatRepository {
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "mybatis.Mapper."; // .까지 문자열로 준비


	public void updateEat(Eat eat) {
		session.insert(namespace+"insertEat", eat);
	}

	public List<Food> selectEat(String id) {
		return session.selectList(namespace + "selectEat", id);
		// 코드랑 카운트를 가져가야된다
	}

	@Override
	public List<Food> recommand(String id) {
		System.out.println(id);
		return session.selectList(namespace + "recommand", id);
	}

	@Override
	public List<Food> recommandLimitThree() {
		return session.selectList(namespace + "recommandLimitThree");
	}

	@Override
	public List<Food> oneday(String id) {
		return session.selectList(namespace + "oneday", id);
	}
	
	@Override
	public Calory oneCalory(String id) {
		return session.selectOne(namespace + "onedayCalory", id);
	}

	@Override
	public List<Food> threeday(String id) {
		return session.selectList(namespace + "threeday", id);
	}

	@Override
	public List<Food> weekday(String id) {
		return session.selectList(namespace + "weekday", id);
	}

	@Override
	public Calory threeCalory(String id) {
		return session.selectOne(namespace + "threedayCalory", id);
	}
	
	@Override
	public Calory weekCalory(String id) {
		return session.selectOne(namespace + "weekCalory", id);
	}

	@Override
	public Calory totalCalory(String id) {
		return session.selectOne(namespace + "totalCalory", id);
	}
}
