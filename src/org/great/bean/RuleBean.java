package org.great.bean;

import org.springframework.stereotype.Component;

@Component
public class RuleBean {
	private int introductionId;
	private String content;
	private int upflag;
	
public int getIntroductionId() {
		return introductionId;
	}
	public void setIntroductionId(int introductionId) {
		this.introductionId = introductionId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getUpflag() {
		return upflag;
	}
	public void setUpflag(int upflag) {
		this.upflag = upflag;
	}
private int ruleId;
private String ruleName;
private int dealMoney;
private String completeTime;
private String auctionTime;
private int securityMoney;
private int stateId;
private String parameterName;
public int getStateId() {
	return stateId;
}
public void setStateId(int stateId) {
	this.stateId = stateId;
}
public String getParameterName() {
	return parameterName;
}
public void setParameterName(String parameterName) {
	this.parameterName = parameterName;
}
public int getRuleId() {
	return ruleId;
}
public void setRuleId(int ruleId) {
	this.ruleId = ruleId;
}
public String getRuleName() {
	return ruleName;
}
public void setRuleName(String ruleName) {
	this.ruleName = ruleName;
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
public int getSecurityMoney() {
	return securityMoney;
}
public void setSecurityMoney(int securityMoney) {
	this.securityMoney = securityMoney;
}
public RuleBean() {
	super();
	// TODO Auto-generated constructor stub
}

}
