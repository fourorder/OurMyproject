package org.great.bean;

public class SessionBean {

	private long time;
	private int userId;
	private int productionId;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public SessionBean() {
		super();
	}
	 
 
	public SessionBean(long time, int userId, int productionId) {
		super();
		this.time = time;
		this.userId = userId;
		this.productionId = productionId;
	}


	public long getTime() {
		return time;
	}
	public void setTime(long time) {
		this.time = time;
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
	
	
	
	
	
	
	
}
