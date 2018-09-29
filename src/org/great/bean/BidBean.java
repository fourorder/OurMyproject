package org.great.bean;

import org.springframework.stereotype.Component;

@Component
public class BidBean {
	private int bidId;
	private int userId;
	private int demandId;
	private String bidTime;
	private DemandBeanX demandBean;
	private UserBean userBean;
	public BidBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BidBean(int bidId, int userId, int demandId, String bidTime, DemandBeanX demandBean, UserBean userBean) {
		super();
		this.bidId = bidId;
		this.userId = userId;
		this.demandId = demandId;
		this.bidTime = bidTime;
		this.demandBean = demandBean;
		this.userBean = userBean;
	}
	public int getBidId() {
		return bidId;
	}
	public void setBidId(int bidId) {
		this.bidId = bidId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getDemandId() {
		return demandId;
	}
	public void setDemandId(int demandId) {
		this.demandId = demandId;
	}
	public String getBidTime() {
		return bidTime;
	}
	public void setBidTime(String bidTime) {
		this.bidTime = bidTime;
	}
	public DemandBeanX getDemandBean() {
		return demandBean;
	}
	public void setDemandBean(DemandBeanX demandBean) {
		this.demandBean = demandBean;
	}
	public UserBean getUserBean() {
		return userBean;
	}
	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}
	
}
