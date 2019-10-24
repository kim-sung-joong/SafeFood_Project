package com.ssafy.model.dto;

public class Answer {
	private int qnum , anum;
	private String asummary , atime , aid;
	
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public int getAnum() {
		return anum;
	}
	public void setAnum(int anum) {
		this.anum = anum;
	}
	public String getAsummary() {
		return asummary;
	}
	public void setAsummary(String asummary) {
		this.asummary = asummary;
	}
	public String getAtime() {
		return atime;
	}
	public void setAtime(String atime) {
		this.atime = atime;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	
	
	@Override
	public String toString() {
		return "Answer [qnum=" + qnum + ", anum=" + anum + ", asummary=" + asummary + ", atime=" + atime + ", aid="
				+ aid + "]";
	}
}
