package com.ssafy.model.service;
import java.util.List;

import com.ssafy.model.dto.Answer;
import com.ssafy.model.dto.QnA;
import com.ssafy.model.dto.Question;

public interface QnaService {
	public void insertQuestion(Question question);
	public void insertAnswer(Answer answer);
	public void updateQuestion(Question question);
	public void updateAnswer(Answer answer);
	public void deleteQuestion(int qnum);
	public void deleteAnswer(int anum);
	public QnA searchQuestionAll();
	public List<Question> searchQuestion(String qtitle);
	public List<Answer> searchAnswer(int qnum);
	public void countUp(int qnum);
}
