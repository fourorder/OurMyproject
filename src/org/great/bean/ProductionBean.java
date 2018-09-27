package org.great.bean;

import org.springframework.stereotype.Component;

@Component
public class ProductionBean {

	
	private int productionId;
	private String productionName;
	private int parameterId;
	private int userId;
   private int classId;
   private int stateId;
   private int  productionMoney;
   private String productionPublishTime;
   private String productionFile;
   private String productionImage;
   private String productionDetal;
   
   
   
   
   
   
   public ProductionBean() {
	super();
}
 
public ProductionBean(int productionId, String productionName, int parameterId, int userId, int classId,
		int productionMoney, String productionPublishTime, String productionFile, String productionImage) {
	super();
	this.productionId = productionId;
	this.productionName = productionName;
	this.parameterId = parameterId;
	this.userId = userId;
	this.classId = classId;
	this.productionMoney = productionMoney;
	this.productionPublishTime = productionPublishTime;
	this.productionFile = productionFile;
	this.productionImage = productionImage;
}

public ProductionBean(int productionId, String productionName, int parameterId, int userId, int classId, int stateId,
		int productionMoney, String productionPublishTime, String productionFile, String productionImage,
		String productionDetal) {
	super();
	this.productionId = productionId;
	this.productionName = productionName;
	this.parameterId = parameterId;
	this.userId = userId;
	this.classId = classId;
	this.stateId = stateId;
	this.productionMoney = productionMoney;
	this.productionPublishTime = productionPublishTime;
	this.productionFile = productionFile;
	this.productionImage = productionImage;
	this.productionDetal = productionDetal;
}

public ProductionBean(int productionId, String productionName, int parameterId, int userId, int classId, int stateId,
		int productionMoney, String productionPublishTime, String productionFile, String productionImage) {
	super();
	this.productionId = productionId;
	this.productionName = productionName;
	this.parameterId = parameterId;
	this.userId = userId;
	this.classId = classId;
	this.stateId = stateId;
	this.productionMoney = productionMoney;
	this.productionPublishTime = productionPublishTime;
	this.productionFile = productionFile;
	this.productionImage = productionImage;
}

public int getProductionId() {
	return productionId;
}
public void setProductionId(int productionId) {
	this.productionId = productionId;
}
public String getProductionName() {
	return productionName;
}
public void setProductionName(String productionName) {
	this.productionName = productionName;
}
public int getParameterId() {
	return parameterId;
}
public void setParameterId(int parameterId) {
	this.parameterId = parameterId;
}
public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}
 
public int getClassId() {
	return classId;
}

public void setClassId(int classId) {
	this.classId = classId;
}

public int getProductionMoney() {
	return productionMoney;
}
public void setProductionMoney(int productionMoney) {
	this.productionMoney = productionMoney;
}
public String getProductionPublishTime() {
	return productionPublishTime;
}
public void setProductionPublishTime(String productionPublishTime) {
	this.productionPublishTime = productionPublishTime;
}
 
public String getProductionFile() {
	return productionFile;
}

public void setProductionFile(String productionFile) {
	this.productionFile = productionFile;
}

public String getProductionImage() {
	return productionImage;
}
public void setProductionImage(String productionImage) {
	this.productionImage = productionImage;
}

public int getStateId() {
	return stateId;
}

public void setStateId(int stateId) {
	this.stateId = stateId;
}

public String getProductionDetal() {
	return productionDetal;
}

public void setProductionDetal(String productionDetal) {
	this.productionDetal = productionDetal;
}
	 
  
	
	
}
