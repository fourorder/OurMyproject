package org.great.bean;

public class CounselorBean {

	private String userAccount;
	private String counselorIntroduction;
	private int counselorMoney;
	private int auditState;
	public CounselorBean () {
		super();
	}
	
	

	public CounselorBean(String userAccount, String counselorIntroduction, int counselorMoney, int auditState) {
		super();
		this.userAccount = userAccount;
		this.counselorIntroduction = counselorIntroduction;
		this.counselorMoney = counselorMoney;
		this.auditState = auditState;
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
	
}
