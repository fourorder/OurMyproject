package org.great.bean;

import org.springframework.stereotype.Component;

@Component
public class AdvertisingBean {
 private String advertisementTitle;
 private String advertisementContent;
 private String advertisementPublishTime;
 private String advertisementAddress;
 private String advertisementImage;
 
 public AdvertisingBean() {
		super();
	}
public AdvertisingBean(String advertisementTitle, String advertisementContent, String advertisementPublishTime,
		String advertisementAddress, String advertisementImage) {
	super();
	this.advertisementTitle = advertisementTitle;
	this.advertisementContent = advertisementContent;
	this.advertisementPublishTime = advertisementPublishTime;
	this.advertisementAddress = advertisementAddress;
	this.advertisementImage = advertisementImage;
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
 
}
