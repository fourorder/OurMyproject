
package org.great.bean;

import org.springframework.stereotype.Component;

@Component
public class UserStoryBean {

	private int userStoryId;
	private String userStoryTitle;
	private String userStoryContent;
	private String userStoryTime;
	private String userAccount;
	private int stateId;
	private String userStoryUrl;
	public UserStoryBean() {
		
	}
	public int getUserStoryId() {
		return userStoryId;
	}
	public void setUserStoryId(int userStoryId) {
		this.userStoryId = userStoryId;
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
	
}


