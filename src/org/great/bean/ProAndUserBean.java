package org.great.bean;

public class ProAndUserBean {

	
	
	
	private int proAndUserId;
	private int userId;
	private int productionId;
	private String payTime;
	private String productionEvaluate;
			private int point;			 
	private int state;//评价状态
	private int proUserId;
	private String userName;
	private String userHead;//头像
	
	
	
	public ProAndUserBean() {
		super();
	}
 
 
	 

	 




	 









	public int getProAndUserId() {
		return proAndUserId;
	}
	public void setProAndUserId(int proAndUserId) {
		this.proAndUserId = proAndUserId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getProductionId() {
		return productionId;
	}
	public void setProductionId(int productionId) {
		this.productionId = productionId;
	}
	public String getPayTime() {
		return payTime;
	}
	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}

	public String getProductionEvaluate() {
		return productionEvaluate;
	}

	public void setProductionEvaluate(String productionEvaluate) {
		this.productionEvaluate = productionEvaluate;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}


	public int getState() {
		return state;
	}


	public void setState(int state) {
		this.state = state;
	}




	public int getProUserId() {
		return proUserId;
	}




	public void setProUserId(int proUserId) {
		this.proUserId = proUserId;
	}








 





	public String getUserName() {
		return userName;
	}









	public void setUserName(String userName) {
		this.userName = userName;
	}



















	public String getUserHead() {
		return userHead;
	}



















	public void setUserHead(String userHead) {
		this.userHead = userHead;
	}



















	public ProAndUserBean(int proAndUserId, int userId, int productionId, String payTime, String productionEvaluate,
			int point, int state, int proUserId, String userName, String userHead) {
		super();
		this.proAndUserId = proAndUserId;
		this.userId = userId;
		this.productionId = productionId;
		this.payTime = payTime;
		this.productionEvaluate = productionEvaluate;
		this.point = point;
		this.state = state;
		this.proUserId = proUserId;
		this.userName = userName;
		this.userHead = userHead;
	}
	 
	 
	
}
