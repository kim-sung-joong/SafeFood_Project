package com.ssafy.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.Member;
import com.ssafy.model.service.MemberService;

@RestController
public class MemberController {
	@Autowired
	private MemberService mService;
	
	@RequestMapping("login")
	public void login(@RequestBody Member member, HttpServletRequest req) {
//		boolean flag = mService.login(req, member.getId(), member.getPass());
//		if(flag) {
//			return "로그인에 성공했습니다.";
//		} else {
//			return "로그인에 실패했습니다.";
//		}
	}
}
