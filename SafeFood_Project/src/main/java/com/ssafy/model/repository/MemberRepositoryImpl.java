package com.ssafy.model.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.*;


@Repository
public class MemberRepositoryImpl implements MemberRepository {
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "mybatis.Mapper."; // .까지 문자열로 준비
	
	
	public boolean addMember(Member member) {
		try {
			session.insert(namespace + "addMember", member);
		} catch(Exception e) {
			return false;
		}
		return true;
	}
	
	public List<Member> selectAllMember() {
		return session.selectList(namespace+"selectAll");
	}
	
	public Member searchByEmail(String email) {
		return session.selectOne(namespace+"searchByEmail", email);
	}
	
	public Member searchById(String id) {
		return session.selectOne(namespace+"searchById", id);
	}
	
	public int deleteMember(Member member) {
		return session.delete(namespace+"deleteMember",member);
	}
	
	public Member login(String id, String pass) {
		Member member = new Member();
		member.setId(id);
		member.setPass(pass);
		Member temp = session.selectOne(namespace+"login", member);
		// 비밀번호가 서로 같은지 확인
		return temp;
	}
	
	public Member updateMember(Member member) {
		session.update(namespace+"updateMember", member);
		return session.selectOne(namespace+"memberInfo", member.getId());
	}
	
	public String findPass(String id) {
		return session.selectOne(namespace+"findPass", id);
	}
}
