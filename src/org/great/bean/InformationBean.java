package org.great.bean;

public class InformationBean {

	private String informationTitle;
	private String informationContent;
	private String informationPublishTime;
	private String informationAddress;
	
	public InformationBean() {
		super();
	}
	
	public InformationBean(String informationTitle, String informationContent, String informationPublishTime,
			String informationAddress) {
		super();
		this.informationTitle = informationTitle;
		this.informationContent = informationContent;
		this.informationPublishTime = informationPublishTime;
		this.informationAddress = informationAddress;
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
	
}
