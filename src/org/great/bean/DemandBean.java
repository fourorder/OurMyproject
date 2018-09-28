package org.great.bean;

import org.springframework.stereotype.Component;

@Component
public class DemandBean {
   private int demandId;
   private String demandTitle;
   private String demandDetailInformation;
   private int parameterId;
   private int fromUserId;
   private int toUserId;
   private String publishTime;
   private int securityMoney;
   private int dealMoney;
   private String completeTime;
   private String auctionTime;
   private int stateId;
   private String demandHead;
   private String parameterName;
   private String userName;
   private String userName2;
public String getUserName2() {
	return userName2;
}
public void setUserName2(String userName2) {
	this.userName2 = userName2;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getParameterName() {
	return parameterName;
}
public void setParameterName(String parameterName) {
	this.parameterName = parameterName;
}
public int getDemandId() {
	return demandId;
}
public void setDemandId(int demandId) {
	this.demandId = demandId;
}
public String getDemandTitle() {
	return demandTitle;
}
public void setDemandTitle(String demandTitle) {
	this.demandTitle = demandTitle;
}
public String getDemandDetailInformation() {
	return demandDetailInformation;
}
public void setDemandDetailInformation(String demandDetailInformation) {
	this.demandDetailInformation = demandDetailInformation;
}
public int getParameterId() {
	return parameterId;
}
public void setParameterId(int parameterId) {
	this.parameterId = parameterId;
}
public int getFromUserId() {
	return fromUserId;
}
public void setFromUserId(int fromUserId) {
	this.fromUserId = fromUserId;
}
public int getToUserId() {
	return toUserId;
}
public void setToUserId(int toUserId) {
	this.toUserId = toUserId;
}
public String getPublishTime() {
	return publishTime;
}
public void setPublishTime(String publishTime) {
	this.publishTime = publishTime;
}
public int getSecurityMoney() {
	return securityMoney;
}
public void setSecurityMoney(int securityMoney) {
	this.securityMoney = securityMoney;
}
public int getDealMoney() {
	return dealMoney;
}
public void setDealMoney(int dealMoney) {
	this.dealMoney = dealMoney;
}
public String getCompleteTime() {
	return completeTime;
}
public void setCompleteTime(String completeTime) {
	this.completeTime = completeTime;
}
public String getAuctionTime() {
	return auctionTime;
}
public void setAuctionTime(String auctionTime) {
	this.auctionTime = auctionTime;
}
public int getStateId() {
	return stateId;
}
public void setStateId(int stateId) {
	this.stateId = stateId;
}
public String getDemandHead() {
	return demandHead;
}
public void setDemandHead(String demandHead) {
	this.demandHead = demandHead;
}
public DemandBean() {
	super();
	// TODO Auto-generated constructor stub
}
   
   
   
}
