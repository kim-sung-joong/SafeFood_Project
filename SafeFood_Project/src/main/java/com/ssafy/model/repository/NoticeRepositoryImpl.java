package com.ssafy.model.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Notice;

@Repository
public class NoticeRepositoryImpl implements NoticeRepository {
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "mybatis.Mapper.";
	
	@Override
	public List<Notice> searchAll() {
		return session.selectList(namespace + "searchNoticeAll");
	}
}
