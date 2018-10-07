package org.great.bean;

public class ProAndUserBean {

	
	
	
	private int proAndUserId;
	private int userId;
	private int productionId;
	private String payTime;
	private String productionEvaluate;
			private int point;			 
	
	
	
	
	
	
	
	public ProAndUserBean() {
		super();
	}
 
 
	public ProAndUserBean(int proAndUserId, int userId, int productionId, String payTime, String productionEvaluate,
			int point) {
		super();
		this.proAndUserId = proAndUserId;
		this.userId = userId;
		this.productionId = productionId;
		this.payTime = payTime;
		this.productionEvaluate = productionEvaluate;
		this.point = point;
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
	 
	 
	
}
