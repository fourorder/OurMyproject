package org.great.bean;

import org.springframework.stereotype.Component;

@Component
public class CounselorInfoBean {
	//佳诚
	public String counselorId;//id
	public String userAccount;//用户账户
	private String counselorIntroduction;//内容
	private String counselorMoney;//价格
	private String auditState;//审核状态
	private String counselorImg;//证书
	private String serviceType;//服务类型
	private String enableDisableId;//用户状态
	private String userId;
	private UserBean userBean;//雇主信息信息
	public CounselorInfoBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CounselorInfoBean(String counselorId, String userAccount, String counselorIntroduction,
			String counselorMoney, String auditState, String counselorImg, String serviceType, String enableDisableId,
			String userId, UserBean userBean) {
		super();
		this.counselorId = counselorId;
		this.userAccount = userAccount;
		this.counselorIntroduction = counselorIntroduction;
		this.counselorMoney = counselorMoney;
		this.auditState = auditState;
		this.counselorImg = counselorImg;
		this.serviceType = serviceType;
		this.enableDisableId = enableDisableId;
		this.userId = userId;
		this.userBean = userBean;
	}
	public String getCounselorId() {
		return counselorId;
	}
	public void setCounselorId(String counselorId) {
		this.counselorId = counselorId;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getCounselorIntroduction() {
		return counselorIntroduction;
	}
	public void setCounselorIntroduction(String counselorIntroduction) {
		this.counselorIntroduction = counselorIntroduction;
	}
	public String getCounselorMoney() {
		return counselorMoney;
	}
	public void setCounselorMoney(String counselorMoney) {
		this.counselorMoney = counselorMoney;
	}
	public String getAuditState() {
		return auditState;
	}
	public void setAuditState(String auditState) {
		this.auditState = auditState;
	}
	public String getCounselorImg() {
		return counselorImg;
	}
	public void setCounselorImg(String counselorImg) {
		this.counselorImg = counselorImg;
	}
	public String getServiceType() {
		return serviceType;
	}
	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}
	public String getEnableDisableId() {
		return enableDisableId;
	}
	public void setEnableDisableId(String enableDisableId) {
		this.enableDisableId = enableDisableId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public UserBean getUserBean() {
		return userBean;
	}
	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}
	
	
	
}
