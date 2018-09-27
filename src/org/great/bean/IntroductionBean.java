package org.great.bean;

import org.springframework.stereotype.Component;

@Component
public class IntroductionBean {
private int inductionId;
private String content;
private int upFlag;

public IntroductionBean() {
	super();
}
public int getInductionId() {
	return inductionId;
}
public void setInductionId(int inductionId) {
	this.inductionId = inductionId;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public int getUpFlag() {
	return upFlag;
}
public void setUpFlag(int upFlag) {
	this.upFlag = upFlag;
}

}
