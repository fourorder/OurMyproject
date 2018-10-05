package org.great.bean;

public class DailyBean {
 
	private int dailyId;
	private String publishDate;
	private String content;
	private int processId;
	private String dailyReview;
	private String postil;
	public DailyBean() {
		super();
	}
	
	public DailyBean(int dailyId, String publishDate, String content, int processId, String dailyReview,
			String postil) {
		super();
		this.dailyId = dailyId;
		this.publishDate = publishDate;
		this.content = content;
		this.processId = processId;
		this.dailyReview = dailyReview;
		this.postil = postil;
	}

	public int getDailyId() {
		return dailyId;
	}
	public void setDailyId(int dailyId) {
		this.dailyId = dailyId;
	}
	
	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getProcessId() {
		return processId;
	}
	public void setProcessId(int processId) {
		this.processId = processId;
	}
	public String getDailyReview() {
		return dailyReview;
	}
	public void setDailyReview(String dailyReview) {
		this.dailyReview = dailyReview;
	}
	public String getPostil() {
		return postil;
	}
	public void setPostil(String postil) {
		this.postil = postil;
	}
	
	
}
