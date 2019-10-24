package com.ssafy.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.model.dto.Calory;
import com.ssafy.model.dto.Eat;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.Member;
import com.ssafy.model.repository.FoodRepositoryImpl;
import com.ssafy.model.service.EatService;
import com.ssafy.model.service.FoodService;
import com.ssafy.model.service.MemberService;
import com.ssafy.model.service.NoticeService;

@Controller
public class MainController {
	
	@Autowired
	private FoodService Foodservice;
	@Autowired
	private MemberService Memberservice;
	@Autowired
	private EatService eatservice;
	@Autowired
	private NoticeService nservice;
	
	@RequestMapping("start.food")
	public String start(HttpServletRequest req) {
		Memberservice.start(req);
		return "redirect:main.food";
	}
	
	@RequestMapping("main.food")	// 메인페이지
	public String main() {
		return "index";
	}
	
	@RequestMapping("addMember.food")	// 회원추가
	public String addMember(Model model , Member member) {
		boolean flag = Memberservice.add(member);
		if(flag) {
			model.addAttribute("msg", "회원가입이 성공하였습니다.");
		} else {
			model.addAttribute("msg", "이미 존재하는 아이디입니다.");
		}
		return "Result";
	}
	
	@RequestMapping("deleteMember.food")	// 회원삭제
	public String deleteMember(Model model, Member member, HttpServletRequest req) {
		Memberservice.delete(member.getId(), member.getPass(), req);
		model.addAttribute("msg", "회원정보가 삭제되었습니다.");
		return "Result";
	}
	
	@RequestMapping("login.food")	// 로그인
	public String login(Model model, HttpServletRequest req, String id, String pass) {
		if(Memberservice.login(req, id, pass)) {
			model.addAttribute("msg", "로그인이 성공하였습니다.");
		} else {
			model.addAttribute("msg", "로그인이 실패하였습니다.");
		}
		return "Result";
	}
	@RequestMapping("logout.food")	// 로그아웃
	public String logout(Model model, HttpServletRequest req) {
		Memberservice.logout(req);
		model.addAttribute("msg", "로그아웃되었습니다.");
		return "Result";
	}
	@RequestMapping("findpass.food")	// 비번찾기
	public String findpass(Model model, String id) {
		String pass = Memberservice.findPass(id);
		if(pass == null) {
			model.addAttribute("msg", "해당하는 아이디가 없습니다.");
		} else {
			model.addAttribute("msg", "비밀번호는 '" + pass + "' 입니다.");
		}
		return "Result";
	}
	@RequestMapping("updateMember.food")	// 회원정보 수정
	public String updateMember(HttpServletRequest req, Model model, Member member) {
		Memberservice.updateMember(req, member);
		model.addAttribute("msg", "회원정보가 수정되었습니다.");
		return "Result";
	}
	
	
	@RequestMapping("foodSelectAll.food")	// 푸드리스트
	public String foodSelectAll(Model model) {
		System.out.println("Controller에 들어옴");
		List<Food> list = Foodservice.selectAll();
		System.out.println("에러가 왜나냐" + list);
		model.addAttribute("list", list);
		return "FoodInfo";
	}
	@RequestMapping("searchFood.food")	// 푸드리스트 검색
	public String searchFood(Model model, String name) {
		System.out.println("name : " + name);
		List<Food> list = Foodservice.searchByName(name);
		model.addAttribute("list", list);
		return "FoodInfo";
	}
	
	@RequestMapping("userAddEat.food")	// 회원이 먹을거 추가
	public String userAddEat(HttpServletRequest req, int code) {
		eatservice.updateEat(req, code);
		return "redirect:foodSelectAll.food";
	}
	
	@RequestMapping("viewEat.food")	// 회원이 추가한거 보여주기
	public String viewEat(Model model, HttpServletRequest req) {
		List<Food> list = eatservice.selectEat(req);
		model.addAttribute("list", list);
		model.addAttribute("totalCalory", eatservice.totalCalory(req));
		if(list.size() > 0) {
			return "EatView";
		} else {
			model.addAttribute("msg", "섭취한 식품이 없습니다");
			return "Result";
		}
	}
	
	@RequestMapping("qna.food")
	public String qna() {
		return "qna";
	}
	
	@RequestMapping("notice.food")
	public String notice() {
		return "notice";
	}
	
	@RequestMapping("recommand.food")
	public String recommand(Model model, HttpServletRequest req) {
		List<Food> list = eatservice.recommand(req);
		model.addAttribute("list", list);
		return "Recommand";
	}

	@RequestMapping("bestfood.food")
	public String bestfood(Model model, HttpServletRequest req) {
		List<Food> list = Foodservice.searchByBest();
		model.addAttribute("list", list);
		return "BestFood";
	}
	
	@RequestMapping("test")
	public String test() {
		return "nav";
	}
	
	@RequestMapping("Oneday.food")
	public String oneday(Model model, HttpServletRequest req) {
		List<Food> list = eatservice.oneday(req);
		model.addAttribute("list", list);
		model.addAttribute("totalCalory", eatservice.oneCalory(req));
		model.addAttribute("day", "하루");
		return "EatView";
	}

	@RequestMapping("Threeday.food")
	public String threeday(Model model, HttpServletRequest req) {
		List<Food> list = eatservice.threeday(req);
		model.addAttribute("list", list);
		model.addAttribute("totalCalory", eatservice.threeCalory(req));
		model.addAttribute("day", "3일");
		return "EatView";
	}
	
	@RequestMapping("Week.food")
	public String weekday(Model model, HttpServletRequest req) {
		List<Food> list = eatservice.weekday(req);
		model.addAttribute("list", list);
		model.addAttribute("totalCalory", eatservice.weekCalory(req));
		model.addAttribute("day", "일주일");
		return "EatView";
	}
	
	@RequestMapping("news.food")
	public String news(Model model) {
		return "news";
	}
}