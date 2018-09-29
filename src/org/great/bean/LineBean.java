package org.great.bean;

import org.springframework.stereotype.Component;

@Component
public class LineBean {
private int lineId;
private String lineAddress;
private String lineName;
private int lineState;
private String parameterName;
public String getParameterName() {
	return parameterName;
}
public void setParameterName(String parameterName) {
	this.parameterName = parameterName;
}
public int getLineId() {
	return lineId;
}
public void setLineId(int lineId) {
	this.lineId = lineId;
}
public String getLineAddress() {
	return lineAddress;
}
public void setLineAddress(String lineAddress) {
	this.lineAddress = lineAddress;
}
public String getLineName() {
	return lineName;
}
public void setLineName(String lineName) {
	this.lineName = lineName;
}
public int getLineState() {
	return lineState;
}
public void setLineState(int lineState) {
	this.lineState = lineState;
}
public LineBean() {
	super();
	// TODO Auto-generated constructor stub
}

}
