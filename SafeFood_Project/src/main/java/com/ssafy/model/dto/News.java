package com.ssafy.model.dto;

public class News {
	private String title;
	private String description;
	private String pubDate;
	private String link;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	@Override
	public String toString() {
		return "News [title=" + title + ", description=" + description + ", pubDate=" + pubDate + ", link=" + link
				+ "]";
	}
	
}
