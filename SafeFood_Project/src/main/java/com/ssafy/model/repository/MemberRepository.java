package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Member;

public interface MemberRepository {
	
	public boolean addMember(Member member);
	public List<Member> selectAllMember();
	public Member searchByEmail(String email);
	public int deleteMember(Member member);
	public Member login(String id, String pass);
	public Member updateMember(Member member);
	public String findPass(String id); 
	public Member searchById(String id);
}
