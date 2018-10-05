package org.great.bean;

public class CounselorBean {
  
	private String userAccount;
	private String counselorIntroduction;
	private int counselorMoney;
	private int auditState;
	private String counselorImg;
	private String serviceType;
	private int enableDisableId;
	  private int userId;
	public CounselorBean () {
		super();
	}

	

	


	public CounselorBean(String userAccount, String counselorIntroduction, int counselorMoney, int auditState,
			String counselorImg, String serviceType, int enableDisableId, int userId) {
		super();
		this.userAccount = userAccount;
		this.counselorIntroduction = counselorIntroduction;
		this.counselorMoney = counselorMoney;
		this.auditState = auditState;
		this.counselorImg = counselorImg;
		this.serviceType = serviceType;
		this.enableDisableId = enableDisableId;
		this.userId = userId;
	}






	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	

	public int getAuditState() {
		return auditState;
	}



	public void setAuditState(int auditState) {
		this.auditState = auditState;
	}



	public String getCounselorIntroduction() {
		return counselorIntroduction;
	}

	public void setCounselorIntroduction(String counselorIntroduction) {
		this.counselorIntroduction = counselorIntroduction;
	}

	public int getCounselorMoney() {
		return counselorMoney;
	}

	public void setCounselorMoney(int counselorMoney) {
		this.counselorMoney = counselorMoney;
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

	public int getEnableDisableId() {
		return enableDisableId;
	}

	public void setEnableDisableId(int enableDisableId) {
		this.enableDisableId = enableDisableId;
	}

	
}
