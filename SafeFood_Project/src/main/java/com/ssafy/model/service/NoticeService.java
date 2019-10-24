package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dto.News;
import com.ssafy.model.dto.Notice;

public interface NoticeService {
	public List<Notice> searchAll();
}
