package com.ssafy.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.Food;
import com.ssafy.model.repository.FoodRepository;

@Service
public class FoodServiceImpl implements FoodService {
	@Autowired
	private FoodRepository foodRepo;
	
	// 로그 찍을 객체
	static final Logger logger = LoggerFactory.getLogger(FoodServiceImpl.class); // import org.slf4j.Logger;

	@Override
	public List<Food> selectAll() {
		System.out.println("나는 Service");
		logger.debug("selectAll 호출");
		return foodRepo.selectAllFood();
	}

	@Override
	public Food selectOne(int code) {
		logger.debug("selectOne 호출");
		return foodRepo.searchByCode(code);
	}
	
	@Override
	public List<Food> searchByName(String name) {
		logger.debug("selectByName 호출");
		return foodRepo.searchByName(name);
	}
	
	@Override
	public List<Food> searchByBest() {
		logger.debug("searchByBest 호출");
		return foodRepo.searchByBest();
	}
}
// 작성 완료후 구현한 레파지토리 객체와 서비스객체를 컨테이너에 빈으로 등록하기 (컨트롤러에 작업)