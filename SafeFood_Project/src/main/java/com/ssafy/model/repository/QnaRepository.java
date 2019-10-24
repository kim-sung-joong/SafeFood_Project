package com.ssafy.model.repository;

import java.util.List;

import com.ssafy.model.dto.Answer;
import com.ssafy.model.dto.QnA;
import com.ssafy.model.dto.Question;

public interface QnaRepository {
	public void insertQuestion(Question question);
	public void insertAnswer(Answer answer);
	public void updateQuestion (Question question);
	public void updateAnswer (Answer answer);
	public void deleteQuestion (int qnum); 
	public void deleteAnswer (int anum);
	public QnA searchQuestionAll();
	public List<Question> searchQuestion(String qtitle);
	public List<Answer> searchAnswer(int qnum);
	public void countUp(int qnum);
}

