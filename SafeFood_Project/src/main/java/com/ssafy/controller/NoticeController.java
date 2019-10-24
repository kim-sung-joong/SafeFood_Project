package com.ssafy.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.News;
import com.ssafy.model.dto.Notice;
import com.ssafy.model.service.NoticeService;

@RestController
public class NoticeController {
	@Autowired
	private NoticeService nservice;
	
	@RequestMapping("noticeList")
	public List<Notice> searchAll() {
		return nservice.searchAll();
	}
	
	@RequestMapping(value="news", produces="application/text;charset=utf8")
	public String news() {
		System.out.println("==== 검색 API 호출====");
		String clientId = "LetgKMkQdKNO6b6Cvv7D";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "nJ64gQ8fg1";// 애플리케이션 클라이언트 시크릿값";
		try {
			String text = URLEncoder.encode("건강한 음식", "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/news.json?query=" + text + "&start=1&display=12";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			// response 수신
			int responseCode = con.getResponseCode();
			System.out.println("responseCode=" + responseCode);
			if (responseCode == 200) {
				BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
				String inputLine;
				StringBuffer response = new StringBuffer();
				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}
				in.close();
				System.out.println(response.toString());
				return response.toString();
			} else {
				System.out.println("API 호출 에러 발생 : 에러코드=" + responseCode);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
