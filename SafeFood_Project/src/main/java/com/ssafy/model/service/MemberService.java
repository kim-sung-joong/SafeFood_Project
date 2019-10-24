package com.ssafy.model.service;

import javax.servlet.http.HttpServletRequest;

import com.ssafy.model.dto.*;

public interface MemberService
{
	public void start(HttpServletRequest req);
	boolean add(Member newMember);
	void delete(String id, String pass, HttpServletRequest req);
	boolean login(HttpServletRequest req, String email, String password);
	void logout(HttpServletRequest req);
	String findPass(String id);
	void updateMember(HttpServletRequest req, Member member);
}
