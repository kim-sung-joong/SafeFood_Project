package com.ssafy.model.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.model.dto.Answer;
import com.ssafy.model.dto.QnA;
import com.ssafy.model.dto.Question;

@Repository
public class QnaRepositoryImpl implements QnaRepository {
	
	@Autowired
	private SqlSession session;
	
	private static final String namespace ="mybatis.Mapper.";
	
	@Override
	public void insertQuestion(Question question) {
		System.out.println(question);
		session.insert(namespace+"insertQuestion", question);
	}

	@Override
	public void insertAnswer(Answer answer) {
		session.insert(namespace+"insertAnswer", answer);
	}

	@Override
	public void updateQuestion(Question question) {	
		session.update(namespace+"updateQuestion", question);
	}

	@Override
	public void updateAnswer(Answer answer) {
		session.update(namespace+"updateAnswer", answer);
	}

	@Override
	public void deleteQuestion(int qnum) {
		session.delete(namespace+"deleteQuestion", qnum);
		session.delete(namespace+"deleteContain", qnum);
	}

	@Override
	public void deleteAnswer(int anum) {
		session.delete(namespace+"deleteAnswer", anum);
	}

	@Override
	public QnA searchQuestionAll() {
		List<Question> qlist = session.selectList((namespace) + "searchQuestionAll");
		List<Answer> alist = session.selectList((namespace) + "searchAnswerAll");
		QnA qna = new QnA();
		qna.setQlist(qlist);
		qna.setAlist(alist);
		return qna;
	}

	@Override
	public List<Question> searchQuestion(String qtitle) {
		return session.selectList(namespace+"searchQuestion", qtitle);
	}

	@Override
	public List<Answer> searchAnswer(int qnum) {
		return session.selectList(namespace+"searchAnswer", qnum);
	}

	@Override
	public void countUp(int qnum) {
		session.update(namespace+"countUp", qnum);
	}
}
