package com.ssafy.model.dto;

public class Eat {
	
	private String id;
	private int code;
	private int count;
	private String time;
	
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "Eat [id=" + id + ", code=" + code + ", count=" + count + ", time=" + time + "]";
	}
}
