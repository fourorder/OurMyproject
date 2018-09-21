package org.great.bean;

import org.springframework.stereotype.Component;

@Component
public class ParameterBean {
private int parameterId;
	private String parameterName;
	private int pId;
	
	
	
	
	
	
	
	
	
	
	public ParameterBean() {
		super();
	}
	public ParameterBean(int parameterId, String parameterName, int pId) {
		super();
		this.parameterId = parameterId;
		this.parameterName = parameterName;
		this.pId = pId;
	}
	public int getParameterId() {
		return parameterId;
	}
	public void setParameterId(int parameterId) {
		this.parameterId = parameterId;
	}
	public String getParameterName() {
		return parameterName;
	}
	public void setParameterName(String parameterName) {
		this.parameterName = parameterName;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	
	
	
	
	
}
