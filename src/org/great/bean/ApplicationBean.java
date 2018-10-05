package org.great.bean;

public class ApplicationBean {
  
	private String demandTitle;
	private String demandDetailinForMation;
	private String userAccount;
	 private  int demandid;
	private String stateId;
	
	public ApplicationBean() {
		super();
	}
	
	public String getDemandTitle() {
		return demandTitle;
	}
	public void setDemandTitle(String demandTitle) {
		this.demandTitle = demandTitle;
	}
	public String getDemandDetailinForMation() {
		return demandDetailinForMation;
	}
	public void setDemandDetailinForMation(String demandDetailinForMation) {
		this.demandDetailinForMation = demandDetailinForMation;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getStateId() {
		return stateId;
	}
	public void setStateId(String stateId) {
		this.stateId = stateId;
	}

	public int getDemandid() {
		return demandid;
	}

	public void setDemandid(int demandid) {
		this.demandid = demandid;
	}
	
}
