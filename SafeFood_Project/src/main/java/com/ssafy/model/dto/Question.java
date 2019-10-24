package com.ssafy.model.dto;

public class Question {
	private String qtitle, qsummary , qid , qtime;
	private int qnum, qcount;
	
	
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQsummary() {
		return qsummary;
	}
	public void setQsummary(String qsummary) {
		this.qsummary = qsummary;
	}
	public String getQid() {
		return qid;
	}
	public void setQid(String qid) {
		this.qid = qid;
	}
	public String getQtime() {
		return qtime;
	}
	public void setQtime(String qtime) {
		this.qtime = qtime;
	}
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public int getQcount() {
		return qcount;
	}
	public void setQcount(int qcount) {
		this.qcount = qcount;
	}
	
	@Override
	public String toString() {
		return "Question [qtitle=" + qtitle + ", qsummary=" + qsummary + ", qid=" + qid + ", qtime=" + qtime + ", qnum="
				+ qnum + ", qcount=" + qcount + "]";
	}
}
