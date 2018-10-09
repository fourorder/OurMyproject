package org.great.bean;

public class LogBean {
	private int logId;
	private int userId;
	private String description; 
	private String methods; 
	private int logType;
	private String requestip; 
	private String exceptionCode; 
	private String exceptionDetal;
	 
	private String params; 
	private String  createby; 
	 private String createDate; 
	 private String  time;
	public int getLogId() {
		return logId;
	}
	public void setLogId(int logId) {
		this.logId = logId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMethods() {
		return methods;
	}
	public void setMethods(String methods) {
		this.methods = methods;
	}
	public int getLogType() {
		return logType;
	}
	public void setLogType(int logType) {
		this.logType = logType;
	}
	public String getRequestip() {
		return requestip;
	}
	public void setRequestip(String requestip) {
		this.requestip = requestip;
	}
	public String getExceptionCode() {
		return exceptionCode;
	}
	public void setExceptionCode(String exceptionCode) {
		this.exceptionCode = exceptionCode;
	}
	public String getExceptionDetal() {
		return exceptionDetal;
	}
	public void setExceptionDetal(String exceptionDetal) {
		this.exceptionDetal = exceptionDetal;
	}
	public String getParams() {
		return params;
	}
	public void setParams(String params) {
		this.params = params;
	}
	public String getCreateby() {
		return createby;
	}
	public void setCreateby(String createby) {
		this.createby = createby;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public LogBean(int logId, int userId, String description, String methods, int logType, String requestip,
			String exceptionCode, String exceptionDetal, String params, String createby, String createDate,
			String time) {
		super();
		this.logId = logId;
		this.userId = userId;
		this.description = description;
		this.methods = methods;
		this.logType = logType;
		this.requestip = requestip;
		this.exceptionCode = exceptionCode;
		this.exceptionDetal = exceptionDetal;
		this.params = params;
		this.createby = createby;
		this.createDate = createDate;
		this.time = time;
	}
	public LogBean() {
		super();
	}
	 
	 
	 
}
