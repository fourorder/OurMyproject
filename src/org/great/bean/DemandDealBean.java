package org.great.bean;

import org.springframework.stereotype.Component;

@Component
public class DemandDealBean {
	private String dealId;
	private String demandId;
	private String projectSchedule;
	private String startTime;
	private int auditState;
	private String consultanteValuation;
	public DemandDealBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DemandDealBean(String dealId, String demandId, String projectSchedule, String startTime, int auditState,
			String consultanteValuation) {
		super();
		this.dealId = dealId;
		this.demandId = demandId;
		this.projectSchedule = projectSchedule;
		this.startTime = startTime;
		this.auditState = auditState;
		this.consultanteValuation = consultanteValuation;
	}
	public String getDealId() {
		return dealId;
	}
	public void setDealId(String dealId) {
		this.dealId = dealId;
	}
	public String getDemandId() {
		return demandId;
	}
	public void setDemandId(String demandId) {
		this.demandId = demandId;
	}
	public String getProjectSchedule() {
		return projectSchedule;
	}
	public void setProjectSchedule(String projectSchedule) {
		this.projectSchedule = projectSchedule;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public int getAuditState() {
		return auditState;
	}
	public void setAuditState(int auditState) {
		this.auditState = auditState;
	}
	public String getConsultanteValuation() {
		return consultanteValuation;
	}
	public void setConsultanteValuation(String consultanteValuation) {
		this.consultanteValuation = consultanteValuation;
	}
	
	
}
