package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Notice;

public interface NoticeRepository {
	public List<Notice> searchAll();
}
