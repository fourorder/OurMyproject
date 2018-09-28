package org.great.bean;

public class UserStoryBean {

	private String userStoryTitle;
	private String userStoryContent;
	private String  userStoryTime;
	private String userAccount;
	private int stateId;
	private String  userStoryUrl;
	private String storyImg;
	public UserStoryBean () {
		super();
	}
	

	

	public UserStoryBean(String userStoryTitle, String userStoryContent, String userStoryTime, String userAccount,
			int stateId, String userStoryUrl, String storyImg) {
		super();
		this.userStoryTitle = userStoryTitle;
		this.userStoryContent = userStoryContent;
		this.userStoryTime = userStoryTime;
		this.userAccount = userAccount;
		this.stateId = stateId;
		this.userStoryUrl = userStoryUrl;
		this.storyImg = storyImg;
	}




	public String getUserStoryTitle() {
		return userStoryTitle;
	}
	public void setUserStoryTitle(String userStoryTitle) {
		this.userStoryTitle = userStoryTitle;
	}
	public String getUserStoryContent() {
		return userStoryContent;
	}
	public void setUserStoryContent(String userStoryContent) {
		this.userStoryContent = userStoryContent;
	}
	public String getUserStoryTime() {
		return userStoryTime;
	}
	public void setUserStoryTime(String userStoryTime) {
		this.userStoryTime = userStoryTime;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public int getStateId() {
		return stateId;
	}
	public void setStateId(int stateId) {
		this.stateId = stateId;
	}

	public String getUserStoryUrl() {
		return userStoryUrl;
	}

	public void setUserStoryUrl(String userStoryUrl) {
		this.userStoryUrl = userStoryUrl;
	}


	public String getStoryImg() {
		return storyImg;
	}


	public void setStoryImg(String storyImg) {
		this.storyImg = storyImg;
	}
	
}
