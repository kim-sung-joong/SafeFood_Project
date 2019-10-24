package com.ssafy.model.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.Member;
import com.ssafy.model.repository.MemberRepository;
@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberRepository memberRepo;
	static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class); // import org.slf4j.Logger;
	
	@Override
	public void start(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		session.setAttribute("id", "");
		session.setAttribute("name", "");
		session.setAttribute("address", "");
		session.setAttribute("phone", "");
		session.setAttribute("allergy", "");
	}
	
	@Override
	public boolean login(HttpServletRequest req, String id, String pass) {
		logger.debug("login 호출");
		HttpSession session = req.getSession(true);
		Member temp = memberRepo.login(id, pass);
		if(temp != null) {
			session.setAttribute("id", temp.getId());
			session.setAttribute("name", temp.getName());
			session.setAttribute("address", temp.getAddress());
			session.setAttribute("phone", temp.getPhone());
			session.setAttribute("allergy", temp.getAllergy());
			return true;
		} else {
			session.setAttribute("id", "");
			return false;
		}
	}

	@Override
	public String findPass(String id) {
		logger.debug("findPass 호출");
		String pass = memberRepo.findPass(id);
		return pass;
	}

	@Override
	public void updateMember(HttpServletRequest req, Member member) {
		logger.debug("updateMember 호출");
		Member temp = memberRepo.updateMember(member);
		HttpSession session = req.getSession(true);
		session.setAttribute("id", temp.getId());
		session.setAttribute("name", temp.getName());
		session.setAttribute("address", temp.getAddress());
		session.setAttribute("phone", temp.getPhone());
		session.setAttribute("allergy", temp.getAllergy());
	}

	@Override
	public boolean add(Member newMember) {
		logger.debug("addMember 호출");
		String aller = newMember.getAllergy();
		if(aller.contains("대두")) {
			aller += ",콩";
		}
		if(aller.contains("우유")) {
			aller += ",원유";
		}
		if(aller.contains("소고기")) {
			aller += ",비프";
		}
		if(aller.contains("돼지고기")) {
			aller += ",돈육";
		}
		newMember.setAllergy(aller);
		return memberRepo.addMember(newMember);
		
	}

	@Override
	public void delete(String id, String pass, HttpServletRequest req) {
		logger.debug("deleteMember 호출");
		Member member = new Member();
		member.setId(id);
		member.setPass(pass);
		memberRepo.deleteMember(member);
		HttpSession session = req.getSession(true);
		session.setAttribute("id", "");
		session.setAttribute("name", "");
		session.setAttribute("address", "");
		session.setAttribute("phone", "");
		session.setAttribute("allergy", "");
	}

	@Override
	public void logout(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		session.setAttribute("id", "");
		session.setAttribute("name", "");
		session.setAttribute("address", "");
		session.setAttribute("phone", "");
		session.setAttribute("allergy", "");
	}

}
