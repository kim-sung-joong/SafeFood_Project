package com.ssafy.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.Answer;
import com.ssafy.model.dto.QnA;
import com.ssafy.model.dto.Question;
import com.ssafy.model.repository.QnaRepository;

@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaRepository qnaRepo;
	
	static final Logger logger = LoggerFactory.getLogger(QnaServiceImpl.class);
	
	@Override
	public void insertQuestion(Question question) {
		logger.debug("insertQuestion 호출");
		System.out.println(question);
		qnaRepo.insertQuestion(question);
	}

	@Override
	public void insertAnswer(Answer answer) {
		logger.debug("insertAnswer 호출");
		qnaRepo.insertAnswer(answer);
	}

	@Override
	public void updateQuestion(Question question) {
		logger.debug("updateQuestion 호출");
		qnaRepo.updateQuestion(question);
	}

	@Override
	public void updateAnswer(Answer answer) {
		logger.debug("updateAnswer 호출");
		qnaRepo.updateAnswer(answer);
	}

	@Override
	public void deleteQuestion(int qnum) {
		logger.debug("deleteQuestion 호출");
		qnaRepo.deleteQuestion(qnum);
	}

	@Override
	public void deleteAnswer(int anum) {
		logger.debug("deleteAnswer 호출");
		qnaRepo.deleteAnswer(anum);
	}

	@Override
	public QnA searchQuestionAll() {
		logger.debug("searchQuestionAll 호출");
		return qnaRepo.searchQuestionAll();
	}

	@Override
	public List<Question> searchQuestion(String qtitle) {
		logger.debug("searchQuestion 호출");
		List<Question> list = qnaRepo.searchQuestion(qtitle);
		return list;
	}

	@Override
	public List<Answer> searchAnswer(int qnum) {
		logger.debug("searchAnswer 호출");
		List<Answer> list = qnaRepo.searchAnswer(qnum);
		return list;
	}

	@Override
	public void countUp(int qnum) {
		logger.debug("countUp 호출");
		qnaRepo.countUp(qnum);
	}

}
