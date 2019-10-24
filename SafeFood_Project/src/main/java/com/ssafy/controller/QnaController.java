package com.ssafy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.Answer;
import com.ssafy.model.dto.QnA;
import com.ssafy.model.dto.Question;
import com.ssafy.model.service.QnaService;

@RestController
public class QnaController {
	@Autowired
	private QnaService qservice;
	
	@RequestMapping("searchQuestionAll")
	public QnA searchQuestionAll(){
		return qservice.searchQuestionAll();
	}
	
	@RequestMapping("searchQuestion")
	public List<Question> searchQuestion(String keyword){
		System.out.println("name " + keyword);
		return qservice.searchQuestion(keyword);
	}
	
	@RequestMapping("searchAnswer")
	public List<Answer> searchAnswer(int num){
		return qservice.searchAnswer(num);
	}
	
	@RequestMapping("insertQuestion")
	public String insertQuestion(@RequestBody Question question) {
		System.out.println(question);
		qservice.insertQuestion(question);
		System.out.println("보내줍시다");
		return "redirect:qna.food";
	}
	
	@RequestMapping("insertAnswer")
	public String insertAnswer(@RequestBody Answer answer) {
		qservice.insertAnswer(answer);
		return "redirect:qna.food";
	}
	
	@RequestMapping("updateQuestion")
	public String updateQuestion(@RequestBody Question question) {
		System.out.println(question+"qwdmioqwdnwqio");
		qservice.updateQuestion(question);
		return "redirect:qna.food";
	}
	
	@RequestMapping("updateAnswer")
	public String updateAnswer(Answer answer) {
		qservice.updateAnswer(answer);
		return "redirect:qna.food";
	}
	
	@RequestMapping("deleteQuestion")
	public String deleteQuestion(int qnum) {
		System.out.println("num : " + qnum);
		qservice.deleteQuestion(qnum);
		return "redirect:qna.food";
	}
	
	@RequestMapping("deleteAnswer")
	public String deleteAnswer(int num) {
		qservice.deleteAnswer(num);
		return "redirect:qna.food";
	}
	
	@RequestMapping("countUp")
	public String countUp(int num) {
		qservice.countUp(num);
		return "redirect:qna.food";
	}
}
