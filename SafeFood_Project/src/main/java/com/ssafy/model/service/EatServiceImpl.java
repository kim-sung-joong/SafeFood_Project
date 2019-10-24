package com.ssafy.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.Calory;
import com.ssafy.model.dto.Eat;
import com.ssafy.model.dto.Food;
import com.ssafy.model.repository.EatRepository;
@Service
public class EatServiceImpl implements EatService{
	
	@Autowired
	private EatRepository eatRepo;
	static final Logger logger = LoggerFactory.getLogger(EatServiceImpl.class); // import org.slf4j.Logger;
	
	@Override
	public void updateEat(HttpServletRequest req, int code) {
		logger.debug("updateEat 호출");
		HttpSession session = req.getSession(true);
		Eat eat = new Eat();
		eat.setId((String)session.getAttribute("id"));
		eat.setCode(code);
		eatRepo.updateEat(eat);
	}

	@Override
	public List<Food> selectEat(HttpServletRequest req) {
		logger.debug("selectEat 호출");
		HttpSession session = req.getSession(true);
		String id = (String)session.getAttribute("id");
		return eatRepo.selectEat(id);
	}
	
	@Override
	public List<Food> recommand(HttpServletRequest req){
		logger.debug("recommand 호출");
		HttpSession session = req.getSession(true);
		// 정렬된 상품의 정보를 가져와야지
		List<Food> list = new ArrayList<>();
		if(session.getAttribute("id").equals("")) {	// 로그인 되어 있지 않은 상태 
			list = eatRepo.recommandLimitThree();	// 애초에 여기서 3개만
		} else {	// 로그인 되어 있는 상태
			String id = (String)session.getAttribute("id");
			// 알러지를 찾아와야 되고
			// 내가 먹은 음식의 코드를 찾아와야 대
			System.out.println("id : " + id);
			List<Food> temp = eatRepo.recommand(id);
			System.out.println("id : " + id);
			String allergy = (String)session.getAttribute("allergy");
			String[] st = allergy.split(",");
			for (Food f : temp) {
				if(list.size() >= 3) break;
				boolean flag = false;
				for (int i = 0; i < st.length; i++) {
					if(f.getMaterial().contains(st[i])) {
						flag = false;
						break;
					} else {
						flag = true;
					}
				}
				if(flag) {
					list.add(f);
				}
			}
		}
		return list;
	}

	@Override
	public List<Food> oneday(HttpServletRequest req) {
		logger.debug("oneday 호출");
		HttpSession session = req.getSession(true);
		return eatRepo.oneday((String)session.getAttribute("id"));
	}
	
	@Override
	public Calory oneCalory(HttpServletRequest req) {
		logger.debug("oneCalory 호출");
		HttpSession session = req.getSession(true);
		return eatRepo.oneCalory((String)session.getAttribute("id"));
	}
	
	@Override
	public List<Food> threeday(HttpServletRequest req) {
		logger.debug("threeday 호출");
		HttpSession session = req.getSession(true);
		return eatRepo.threeday((String)session.getAttribute("id"));
	}

	@Override
	public List<Food> weekday(HttpServletRequest req) {
		logger.debug("weekday 호출");
		HttpSession session = req.getSession(true);
		return eatRepo.weekday((String)session.getAttribute("id"));
	}
	
	@Override
	public Calory threeCalory(HttpServletRequest req) {
		logger.debug("threeCalory 호출");
		HttpSession session = req.getSession(true);
		return eatRepo.threeCalory((String)session.getAttribute("id"));
	}
	
	@Override
	public Calory weekCalory(HttpServletRequest req) {
		logger.debug("weekCalory 호출");
		HttpSession session = req.getSession(true);
		return eatRepo.weekCalory((String)session.getAttribute("id"));
	}
	
	@Override
	public Calory totalCalory(HttpServletRequest req) {
		logger.debug("totalCalory 호출");
		HttpSession session = req.getSession(true);
		return eatRepo.totalCalory((String)session.getAttribute("id"));
	}
}
