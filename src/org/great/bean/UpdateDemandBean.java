package org.great.bean;

import org.springframework.stereotype.Component;

@Component
public class UpdateDemandBean {
	private String demandId;//需求id
	private String demandTitle;//需求标题
	private String demandDetaIlinformation;//需求信息
	private String parameterId;//需求类型
	private String fromUserId;//雇主id
	private String toUserId;//供应商id
	private String publishTime;//发布时间
	private String securityMoney;//押金
	private String dealMoney;//佣金
	private String completeTime;//完成时间
	private String auctionTime;//拍卖时间
	private String stateId;//拍卖状态
	private String demandHead;//需求头像
	private String adviserId;//顾问id
	private String filePath;//文件下载路径
	public UpdateDemandBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UpdateDemandBean(String demandId, String demandTitle, String demandDetaIlinformation, String parameterId,
			String fromUserId, String toUserId, String publishTime, String securityMoney, String dealMoney,
			String completeTime, String auctionTime, String stateId, String demandHead, String adviserId,
			String filePath) {
		super();
		this.demandId = demandId;
		this.demandTitle = demandTitle;
		this.demandDetaIlinformation = demandDetaIlinformation;
		this.parameterId = parameterId;
		this.fromUserId = fromUserId;
		this.toUserId = toUserId;
		this.publishTime = publishTime;
		this.securityMoney = securityMoney;
		this.dealMoney = dealMoney;
		this.completeTime = completeTime;
		this.auctionTime = auctionTime;
		this.stateId = stateId;
		this.demandHead = demandHead;
		this.adviserId = adviserId;
		this.filePath = filePath;
	}
	public String getDemandId() {
		return demandId;
	}
	public void setDemandId(String demandId) {
		this.demandId = demandId;
	}
	public String getDemandTitle() {
		return demandTitle;
	}
	public void setDemandTitle(String demandTitle) {
		this.demandTitle = demandTitle;
	}
	public String getDemandDetaIlinformation() {
		return demandDetaIlinformation;
	}
	public void setDemandDetaIlinformation(String demandDetaIlinformation) {
		this.demandDetaIlinformation = demandDetaIlinformation;
	}
	public String getParameterId() {
		return parameterId;
	}
	public void setParameterId(String parameterId) {
		this.parameterId = parameterId;
	}
	public String getFromUserId() {
		return fromUserId;
	}
	public void setFromUserId(String fromUserId) {
		this.fromUserId = fromUserId;
	}
	public String getToUserId() {
		return toUserId;
	}
	public void setToUserId(String toUserId) {
		this.toUserId = toUserId;
	}
	public String getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}
	public String getSecurityMoney() {
		return securityMoney;
	}
	public void setSecurityMoney(String securityMoney) {
		this.securityMoney = securityMoney;
	}
	public String getDealMoney() {
		return dealMoney;
	}
	public void setDealMoney(String dealMoney) {
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
	public String getStateId() {
		return stateId;
	}
	public void setStateId(String stateId) {
		this.stateId = stateId;
	}
	public String getDemandHead() {
		return demandHead;
	}
	public void setDemandHead(String demandHead) {
		this.demandHead = demandHead;
	}
	public String getAdviserId() {
		return adviserId;
	}
	public void setAdviserId(String adviserId) {
		this.adviserId = adviserId;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	
	
}
