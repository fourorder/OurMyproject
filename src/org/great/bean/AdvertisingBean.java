package org.great.bean;

import org.springframework.stereotype.Component;

@Component
public class AdvertisingBean {
 private int  advertisementId;
 private String advertisementTitle;
 private String advertisementContent;
 private String advertisementPublishTime;
 private String advertisementAddress;
 private String advertisementImage;
 private int advertisementNum;
 
 public AdvertisingBean() {
		super();
	}


public AdvertisingBean(int advertisementId, String advertisementTitle, String advertisementContent,
		String advertisementPublishTime, String advertisementAddress, String advertisementImage, int advertisementNum) {
	super();
	this.advertisementId = advertisementId;
	this.advertisementTitle = advertisementTitle;
	this.advertisementContent = advertisementContent;
	this.advertisementPublishTime = advertisementPublishTime;
	this.advertisementAddress = advertisementAddress;
	this.advertisementImage = advertisementImage;
	this.advertisementNum = advertisementNum;
}


public int getAdvertisementId() {
	return advertisementId;
}


public void setAdvertisementId(int advertisementId) {
	this.advertisementId = advertisementId;
}


public String getAdvertisementTitle() {
	return advertisementTitle;
}
public void setAdvertisementTitle(String advertisementTitle) {
	this.advertisementTitle = advertisementTitle;
}
public String getAdvertisementContent() {
	return advertisementContent;
}
public void setAdvertisementContent(String advertisementContent) {
	this.advertisementContent = advertisementContent;
}
public String getAdvertisementPublishTime() {
	return advertisementPublishTime;
}
public void setAdvertisementPublishTime(String advertisementPublishTime) {
	this.advertisementPublishTime = advertisementPublishTime;
}
public String getAdvertisementAddress() {
	return advertisementAddress;
}
public void setAdvertisementAddress(String advertisementAddress) {
	this.advertisementAddress = advertisementAddress;
}
public String getAdvertisementImage() {
	return advertisementImage;
}
public void setAdvertisementImage(String advertisementImage) {
	this.advertisementImage = advertisementImage;
}
public int getAdvertisementNum() {
	return advertisementNum;
}
public void setAdvertisementNum(int advertisementNum) {
	this.advertisementNum = advertisementNum;
}
 
}
