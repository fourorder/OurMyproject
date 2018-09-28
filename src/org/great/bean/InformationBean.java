package org.great.bean;

public class InformationBean {
    private int informationId;
	private String informationTitle;
	private String informationContent;
	private String informationPublishTime;
	private String informationAddress;
	private int parameterId;
	private String informationImg;
	private int stateId;
	public InformationBean() {
		super();
	}
	
	



  



public InformationBean(int informationId, String informationTitle, String informationContent,
			String informationPublishTime, String informationAddress, int parameterId, String informationImg,
			int stateId) {
		super();
		this.informationId = informationId;
		this.informationTitle = informationTitle;
		this.informationContent = informationContent;
		this.informationPublishTime = informationPublishTime;
		this.informationAddress = informationAddress;
		this.parameterId = parameterId;
		this.informationImg = informationImg;
		this.stateId = stateId;
	}









public int getInformationId() {
	return informationId;
}





public void setInformationId(int informationId) {
	this.informationId = informationId;
}





public String getInformationTitle() {
		return informationTitle;
	}
	public void setInformationTitle(String informationTitle) {
		this.informationTitle = informationTitle;
	}
	public String getInformationContent() {
		return informationContent;
	}
	public void setInformationContent(String informationContent) {
		this.informationContent = informationContent;
	}
	public String getInformationPublishTime() {
		return informationPublishTime;
	}
	public void setInformationPublishTime(String informationPublishTime) {
		this.informationPublishTime = informationPublishTime;
	}
	public String getInformationAddress() {
		return informationAddress;
	}
	public void setInformationAddress(String informationAddress) {
		this.informationAddress = informationAddress;
	}
	public int getParameterId() {
		return parameterId;
	}





	public void setParameterId(int parameterId) {
		this.parameterId = parameterId;
	}





	public String getInformationImg() {
		return informationImg;
	}


	public void setInformationImg(String informationImg) {
		this.informationImg = informationImg;
	}





	public int getStateId() {
		return stateId;
	}





	public void setStateId(int stateId) {
		this.stateId = stateId;
	}
	
}
