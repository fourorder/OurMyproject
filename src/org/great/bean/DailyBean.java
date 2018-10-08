package org.great.bean;

public class DailyBean {
 
	private int daiId;
	private String publishDate;
	private String daiContent;
	private int processId;
	private String dailyReview;
	private String postil;
	public DailyBean() {
		super();
	}
	
	public DailyBean(int daiId, String publishDate, String daiContent, int processId, String dailyReview,
			String postil) {
		super();
		this.daiId = daiId;
		this.publishDate = publishDate;
		this.daiContent = daiContent;
		this.processId = processId;
		this.dailyReview = dailyReview;
		this.postil = postil;
	}

	
	
	public int getDaiId() {
		return daiId;
	}

	public void setDaiId(int daiId) {
		this.daiId = daiId;
	}

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	
	public String getDaiContent() {
		return daiContent;
	}

	public void setDaiContent(String daiContent) {
		this.daiContent = daiContent;
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
