package org.great.bean;

public class ChatBean {

	private int chatId;
	private int toUserId;
	private String chatContent;
	private String chatTime;
	private int userId;
	private int receiveFlag;
	public ChatBean() {
		super();
	}
	public int getChatId() {
		return chatId;
	}
	public void setChatId(int chatId) {
		this.chatId = chatId;
	}
	public int getToUserId() {
		return toUserId;
	}
	public void setToUserId(int toUserId) {
		this.toUserId = toUserId;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getChatTime() {
		return chatTime;
	}
	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getReceiveFlag() {
		return receiveFlag;
	}
	public void setReceiveFlag(int receiveFlag) {
		this.receiveFlag = receiveFlag;
	}
	
	
}
