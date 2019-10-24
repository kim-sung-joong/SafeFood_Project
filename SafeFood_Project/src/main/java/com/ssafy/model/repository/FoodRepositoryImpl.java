package com.ssafy.model.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.*;

@Repository
public class FoodRepositoryImpl implements FoodRepository {
	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "mybatis.Mapper."; // .까지 문자열로 준비
	
	public Food searchByCode(int code) {
		return session.selectOne(namespace+"searchByCode", code);
	}
	
	public List<Food> selectAllFood() {
		System.out.println("나는 DAO");
		return session.selectList(namespace+"selectAll");
	}

	public List<Food> searchByName(String name) {
		return session.selectList(namespace+"selectByName", name);
	}

	public List<Food> searchById(String id) {
		return session.selectList(namespace+"searchById");
	}

	public List<Food> searchByBest() {
		return session.selectList(namespace+"searchByBest");
	}
}
