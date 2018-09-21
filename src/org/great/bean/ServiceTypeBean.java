package org.great.bean;

public class ServiceTypeBean {
	private int parameterId;//服务类型
	private String parameterName;
	public ServiceTypeBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ServiceTypeBean(int parameterId, String parameterName) {
		super();
		this.parameterId = parameterId;
		this.parameterName = parameterName;
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
	
}
