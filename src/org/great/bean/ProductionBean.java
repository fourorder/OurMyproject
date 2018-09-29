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
   private double  productionMoney;
   private String productionPublishTime;
   private String productionFile;
   private String productionImage;
private String productionDetal;
private int buyCount;
   private int auditState   ;
   private String auditName;
   private String className;
   
   
   
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

/*public ProductionBean(int productionId, String productionName, int parameterId, int userId, int classId, int stateId,
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
}*/

 

public int getAuditState() {
	return auditState;
}

public ProductionBean(int productionId, String productionName, int parameterId, int userId, int classId, int stateId,
		double productionMoney, String productionPublishTime, String productionFile, String productionImage,
		String productionDetal, int buyCount, int auditState, String auditName) {
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
	this.buyCount = buyCount;
	this.auditState = auditState;
	this.auditName = auditName;
}

public String getAuditName() {
	return auditName;
}

public void setAuditName(String auditName) {
	this.auditName = auditName;
}

public void setAuditState(int auditState) {
	this.auditState = auditState;
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

public double getProductionMoney() {
	return productionMoney;
}
public void setProductionMoney(double productionMoney) {
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

public int getBuyCount() {
	return buyCount;
}

public void setBuyCount(int buyCount) {
	this.buyCount = buyCount;
}

public String getClassName() {
	return className;
}

public void setClassName(String className) {
	this.className = className;
}

public ProductionBean(int productionId, String productionName, int parameterId, int userId, int classId, int stateId,
		double productionMoney, String productionPublishTime, String productionFile, String productionImage,
		String productionDetal, int buyCount, int auditState, String auditName, String className) {
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
	this.buyCount = buyCount;
	this.auditState = auditState;
	this.auditName = auditName;
	this.className = className;
}
	 
  
	
	
}
