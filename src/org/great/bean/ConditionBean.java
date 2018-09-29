package org.great.bean;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

 
public class ConditionBean {// 条件bean

	private Integer currentPage;// 当前页
	private float totalPages;// 总页数
	private float recordCum;// 总数据条数
	private float eachPageCum = 8;// 每页显示的数据条数
	// ---------------条件查询后台心理咨询师信息
	private String conditionName;
	private String conditionUable;
	private String conditionIdentify;
	private String conditionFile;

	// 查询所以领域
	private String allField;
	private int fieldId;
	private String fieldName;

	//查询时间条件 
	private String timeStart;
	private String timeEnd;
	
	private int userName;
	private int psyName;
	
	private String uName;
	private String pName;
	
	// 表名
	private String tableName;
	
	 
	 private ArrayList<ProductionBean> proList;


	 


	 



	public ConditionBean() {
		super();
	}
	public ConditionBean(String fieldName) {
		super();
		this.fieldName = fieldName;
	}





	public ConditionBean(Integer currentPage, float totalPages, float recordCum, float eachPageCum, String conditionName,
			String conditionUable, String conditionIdentify, String conditionFile, String allField, int fieldId,
			String fieldName, String timeStart, String timeEnd, int userName, int psyName, String uName, String pName,
			String tableName, ArrayList<ProductionBean> proList) {
		super();
		this.currentPage = currentPage;
		this.totalPages = totalPages;
		this.recordCum = recordCum;
		this.eachPageCum = eachPageCum;
		this.conditionName = conditionName;
		this.conditionUable = conditionUable;
		this.conditionIdentify = conditionIdentify;
		this.conditionFile = conditionFile;
		this.allField = allField;
		this.fieldId = fieldId;
		this.fieldName = fieldName;
		this.timeStart = timeStart;
		this.timeEnd = timeEnd;
		this.userName = userName;
		this.psyName = psyName;
		this.uName = uName;
		this.pName = pName;
		this.tableName = tableName;
		this.proList = proList;
	}
	public ArrayList<ProductionBean> getProList() {
		return proList;
	}
	public void setProList(ArrayList<ProductionBean> proList) {
		this.proList = proList;
	}
	public ConditionBean(String conditionUable, String timeStart, String timeEnd) {
		super();
		this.conditionUable = conditionUable;
		this.timeStart = timeStart;
		this.timeEnd = timeEnd;
	}



	public ConditionBean(Integer currentPage, float eachPageCum, String conditionUable, String timeStart,
			String timeEnd) {
		super();
		this.currentPage = currentPage;
		this.eachPageCum = eachPageCum;
		this.conditionUable = conditionUable;
		this.timeStart = timeStart;
		this.timeEnd = timeEnd;
	}



	public ConditionBean(String timeStart, String timeEnd) {
		super();
		this.timeStart = timeStart;
		this.timeEnd = timeEnd;
	}



	public ConditionBean(Integer currentPage, float totalPages, float recordCum, float eachPageCum, String conditionName,
			String conditionUable, String conditionIdentify, String conditionFile, String allField, int fieldId,
			String fieldName, String timeStart, String timeEnd) {
		super();
		this.currentPage = currentPage;
		this.totalPages = totalPages;
		this.recordCum = recordCum;
		this.eachPageCum = eachPageCum;
		this.conditionName = conditionName;
		this.conditionUable = conditionUable;
		this.conditionIdentify = conditionIdentify;
		this.conditionFile = conditionFile;
		this.allField = allField;
		this.fieldId = fieldId;
		this.fieldName = fieldName;
		this.timeStart = timeStart;
		this.timeEnd = timeEnd;
	}



	 



	public ConditionBean(int currentPage, int eachPageCum) {
		super();
		this.currentPage = currentPage;
		this.eachPageCum = eachPageCum;
	}

	// 分页查询 条件 当前页 总页数 总数据数量 每页显示几条数据
	public ConditionBean(int currentPage, int totalPages, int recordCum, int eachPageCum) {
		super();
		this.currentPage = currentPage;
		this.totalPages = totalPages;
		this.recordCum = recordCum;
		this.eachPageCum = eachPageCum;
	}

	public ConditionBean(String conditionName, String conditionUable, String conditionIdentify, String conditionFile) {
		super();
		this.conditionName = conditionName;
		this.conditionUable = conditionUable;
		this.conditionIdentify = conditionIdentify;
		this.conditionFile = conditionFile;
	}

	public ConditionBean(Integer currentPage, float totalPages, float recordCum, float eachPageCum, String conditionName,
			String conditionUable, String conditionIdentify, String conditionFile, String allField, int fieldId,
			String fieldName, String timeStart, String timeEnd, int userName, int psyName) {
		super();
		this.currentPage = currentPage;
		this.totalPages = totalPages;
		this.recordCum = recordCum;
		this.eachPageCum = eachPageCum;
		this.conditionName = conditionName;
		this.conditionUable = conditionUable;
		this.conditionIdentify = conditionIdentify;
		this.conditionFile = conditionFile;
		this.allField = allField;
		this.fieldId = fieldId;
		this.fieldName = fieldName;
		this.timeStart = timeStart;
		this.timeEnd = timeEnd;
		this.userName = userName;
		this.psyName = psyName;
	}



	public ConditionBean(Integer currentPage, float totalPages, float recordCum, float eachPageCum, String conditionName,
			String conditionUable, String conditionIdentify, String conditionFile) {
		super();
		this.currentPage = currentPage;
		this.totalPages = totalPages;
		this.recordCum = recordCum;
		this.eachPageCum = eachPageCum;
		this.conditionName = conditionName;
		this.conditionUable = conditionUable;
		this.conditionIdentify = conditionIdentify;
		this.conditionFile = conditionFile;
	}

	

	public ConditionBean(Integer currentPage, float totalPages, float recordCum, float eachPageCum, String conditionName,
			String conditionUable, String conditionIdentify, String conditionFile, String allField) {
		super();
		this.currentPage = currentPage;
		this.totalPages = totalPages;
		this.recordCum = recordCum;
		this.eachPageCum = eachPageCum;
		this.conditionName = conditionName;
		this.conditionUable = conditionUable;
		this.conditionIdentify = conditionIdentify;
		this.conditionFile = conditionFile;
		allField = allField;
	}

	public ConditionBean(int fieldId, String fieldName) {
		super();
		this.fieldId = fieldId;
		this.fieldName = fieldName;
	}

	public ConditionBean(Integer currentPage, float totalPages, float recordCum, float eachPageCum, String conditionName,
			String conditionUable, String conditionIdentify, String conditionFile, String allField, int fieldId,
			String fieldName) {
		super();
		this.currentPage = currentPage;
		this.totalPages = totalPages;
		this.recordCum = recordCum;
		this.eachPageCum = eachPageCum;
		this.conditionName = conditionName;
		this.conditionUable = conditionUable;
		this.conditionIdentify = conditionIdentify;
		this.conditionFile = conditionFile;
		allField = allField;
		this.fieldId = fieldId;
		this.fieldName = fieldName;
	}

	public ConditionBean(Integer currentPage, float totalPages, float recordCum, float eachPageCum, String conditionName,
			String conditionUable, String conditionIdentify, String conditionFile, String allField, int fieldId,
			String fieldName, String timeStart, String timeEnd, int userName, int psyName, String uName, String pName,
			String tableName) {
		super();
		this.currentPage = currentPage;
		this.totalPages = totalPages;
		this.recordCum = recordCum;
		this.eachPageCum = eachPageCum;
		this.conditionName = conditionName;
		this.conditionUable = conditionUable;
		this.conditionIdentify = conditionIdentify;
		this.conditionFile = conditionFile;
		this.allField = allField;
		this.fieldId = fieldId;
		this.fieldName = fieldName;
		this.timeStart = timeStart;
		this.timeEnd = timeEnd;
		this.userName = userName;
		this.psyName = psyName;
		this.uName = uName;
		this.pName = pName;
		this.tableName = tableName;
	}



	public String getuName() {
		return uName;
	}



	public void setuName(String uName) {
		this.uName = uName;
	}



	public String getpName() {
		return pName;
	}



	public void setpName(String pName) {
		this.pName = pName;
	}



	public int getFieldId() {
		return fieldId;
	}

	public void setFieldId(int fieldId) {
		this.fieldId = fieldId;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public float getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public float getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(float totalPages) {
		this.totalPages = totalPages;
	}

	public float getRecordCum() {
		return recordCum;
	}

	public void setRecordCum(float recordCum) {
		this.recordCum = recordCum;
	}

	public float getEachPageCum() {
		return eachPageCum;
	}

	public void setEachPageCum(float eachPageCum) {
		this.eachPageCum = eachPageCum;
	}

	public String getConditionName() {
		return conditionName;
	}

	public void setConditionName(String conditionName) {
		this.conditionName = conditionName;
	}

	public String getConditionUable() {
		return conditionUable;
	}

	public void setConditionUable(String conditionUable) {
		this.conditionUable = conditionUable;
	}

	public String getConditionIdentify() {
		return conditionIdentify;
	}

	public void setConditionIdentify(String conditionIdentify) {
		this.conditionIdentify = conditionIdentify;
	}

	public String getConditionFile() {
		return conditionFile;
	}

	public void setConditionFile(String conditionFile) {
		this.conditionFile = conditionFile;
	}

	public String getAllField() {
		return allField;
	}

	public void setAllField(String allField) {
		this.allField = allField;
	}



	public String getTimeStart() {
		return timeStart;
	}



	public void setTimeStart(String timeStart) {
		this.timeStart = timeStart;
	}



	public String getTimeEnd() {
		return timeEnd;
	}



	public void setTimeEnd(String timeEnd) {
		this.timeEnd = timeEnd;
	}



	public int getUserName() {
		return userName;
	}



	public void setUserName(int userName) {
		this.userName = userName;
	}



	public int getPsyName() {
		return psyName;
	}



	public void setPsyName(int psyName) {
		this.psyName = psyName;
	}



	public String getTableName() {
		return tableName;
	}



	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	 
}
