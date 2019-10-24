package com.ssafy.model.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.News;
import com.ssafy.model.dto.Notice;
import com.ssafy.model.repository.NoticeRepository;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeRepository noticeRepo;
	static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Override
	public List<Notice> searchAll() {
		logger.debug("(Notice)searchAll 호출");
		return noticeRepo.searchAll();
	}

}
