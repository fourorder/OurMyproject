package org.great.bean;

import org.springframework.stereotype.Component;

@Component
public class BusinessBean {
private int businessId;
private String businessName;
public BusinessBean() {
	super();
}
public int getBusinessId() {
	return businessId;
}
public void setBusinessId(int businessId) {
	this.businessId = businessId;
}
public String getBusinessName() {
	return businessName;
}
public void setBusinessName(String businessName) {
	this.businessName = businessName;
}

}
