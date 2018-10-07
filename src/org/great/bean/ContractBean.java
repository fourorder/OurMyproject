package org.great.bean;

import org.springframework.stereotype.Component;

@Component
public class ContractBean {
	private String demandId;//需求id
	private String fromUserId;//雇主id
	private String fromTime;//雇主签署
	private String toUserId;//服务商id
	private String toTime;//服务商签署时间
	private String contractPath;//合同路径
	private String stateId;//合同状态id
	private ParameterBean parameterBean;//合同状态
	public ContractBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ContractBean(String demandId, String fromUserId, String fromTime, String toUserId, String toTime,
			String contractPath, String stateId, ParameterBean parameterBean) {
		super();
		this.demandId = demandId;
		this.fromUserId = fromUserId;
		this.fromTime = fromTime;
		this.toUserId = toUserId;
		this.toTime = toTime;
		this.contractPath = contractPath;
		this.stateId = stateId;
		this.parameterBean = parameterBean;
	}
	public String getDemandId() {
		return demandId;
	}
	public void setDemandId(String demandId) {
		this.demandId = demandId;
	}
	public String getFromUserId() {
		return fromUserId;
	}
	public void setFromUserId(String fromUserId) {
		this.fromUserId = fromUserId;
	}
	public String getFromTime() {
		return fromTime;
	}
	public void setFromTime(String fromTime) {
		this.fromTime = fromTime;
	}
	public String getToUserId() {
		return toUserId;
	}
	public void setToUserId(String toUserId) {
		this.toUserId = toUserId;
	}
	public String getToTime() {
		return toTime;
	}
	public void setToTime(String toTime) {
		this.toTime = toTime;
	}
	public String getContractPath() {
		return contractPath;
	}
	public void setContractPath(String contractPath) {
		this.contractPath = contractPath;
	}
	public String getStateId() {
		return stateId;
	}
	public void setStateId(String stateId) {
		this.stateId = stateId;
	}
	public ParameterBean getParameterBean() {
		return parameterBean;
	}
	public void setParameterBean(ParameterBean parameterBean) {
		this.parameterBean = parameterBean;
	}
	
}
