package com.ssafy.model.dto;

public class Notice {
	private int nnum;
	private String ntitle;
	private String nsummary;
	private String ndate;
	public int getNnum() {
		return nnum;
	}
	public void setNnum(int nnum) {
		this.nnum = nnum;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNsummary() {
		return nsummary;
	}
	public void setNsummary(String nsummary) {
		this.nsummary = nsummary;
	}
	public String getNdate() {
		return ndate;
	}
	public void setNdate(String ndate) {
		this.ndate = ndate;
	}
	@Override
	public String toString() {
		return "Notice [nnum=" + nnum + ", ntitle=" + ntitle + ", nsummary=" + nsummary + ", ndate=" + ndate + "]";
	}
	
}
