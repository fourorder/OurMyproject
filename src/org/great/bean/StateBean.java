package org.great.bean;

public class StateBean {
	private int stateId;//状态id
	private String stateName;//状态名
	public StateBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StateBean(int stateId, String stateName) {
		super();
		this.stateId = stateId;
		this.stateName = stateName;
	}
	public int getStateId() {
		return stateId;
	}
	public void setStateId(int stateId) {
		this.stateId = stateId;
	}
	public String getStateName() {
		return stateName;
	}
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	
}
