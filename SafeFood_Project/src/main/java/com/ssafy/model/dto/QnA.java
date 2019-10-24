package com.ssafy.model.dto;

import java.util.List;

public class QnA {
	private List<Question> qlist;
	private List<Answer> alist;
	@Override
	public String toString() {
		return "QnA [qlist=" + qlist + ", alist=" + alist + "]";
	}
	public List<Question> getQlist() {
		return qlist;
	}
	public void setQlist(List<Question> qlist) {
		this.qlist = qlist;
	}
	public List<Answer> getAlist() {
		return alist;
	}
	public void setAlist(List<Answer> alist) {
		this.alist = alist;
	}
}
