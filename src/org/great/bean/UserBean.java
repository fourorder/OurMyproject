package org.great.bean;

import org.springframework.stereotype.Component;

@Component
public class UserBean {

public int userId;//用户id
public String userName;//用户
public String userPwd;//密码
public long userTel;//手机
public String userAccount;//账户
public String userSex;//性别
public String userMail;//邮箱
public String userIdentity;//身份证
public String userAddress;//地址
public String userHead;//头像
public int userCredit;//信用分
public int userMoney;//余额
public int stateId;//状态id
public int characterId;//角色id
public String userRegisterTime;//注册时间
public String userProfile;//用户简介
public String characterName;
public String stateName;
public int count;
public String parameterName;//服务商名字

public String getParameterName() {
	return parameterName;
}

public void setParameterName(String parameterName) {
	this.parameterName = parameterName;
}

public String getStateName() {
	return stateName;
}

public void setStateName(String stateName) {
	this.stateName = stateName;
}

public String getCharacterName() {
	return characterName;
}

public void setCharacterName(String characterName) {
	this.characterName = characterName;
}

public UserBean() {
	super();
}

public UserBean(int userId, String userName, String userPwd, long userTel, String userAccount, String userSex,
		String userMail, String userIdentity, String userAddress, String userHead, int userCredit, int userMoney,
		int stateId, int characterId, String userRegisterTime, String userProfile, String characterName,
		String stateName) {
	super();
	this.userId = userId;
	this.userName = userName;
	this.userPwd = userPwd;
	this.userTel = userTel;
	this.userAccount = userAccount;
	this.userSex = userSex;
	this.userMail = userMail;
	this.userIdentity = userIdentity;
	this.userAddress = userAddress;
	this.userHead = userHead;
	this.userCredit = userCredit;
	this.userMoney = userMoney;
	this.stateId = stateId;
	this.characterId = characterId;
	this.userRegisterTime = userRegisterTime;
	this.userProfile = userProfile;
	this.characterName = characterName;
	this.stateName = stateName;
}

public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getUserPwd() {
	return userPwd;
}
public void setUserPwd(String userPwd) {
	this.userPwd = userPwd;
}
public long getUserTel() {
	return userTel;
}
public void setUserTel(long userTel) {
	this.userTel = userTel;
}
public String getUserAccount() {
	return userAccount;
}
public void setUserAccount(String userAccount) {
	this.userAccount = userAccount;
}
public String getUserSex() {
	return userSex;
}
public void setUserSex(String userSex) {
	this.userSex = userSex;
}
public String getUserMail() {
	return userMail;
}
public void setUserMail(String userMail) {
	this.userMail = userMail;
}
public String getUserIdentity() {
	return userIdentity;
}
public void setUserIdentity(String userIdentity) {
	this.userIdentity = userIdentity;
}
public String getUserAddress() {
	return userAddress;
}
public void setUserAddress(String userAddress) {
	this.userAddress = userAddress;
}
public String getUserHead() {
	return userHead;
}
public void setUserHead(String userHead) {
	this.userHead = userHead;
}
public int getUserCredit() {
	return userCredit;
}
public void setUserCredit(int userCredit) {
	this.userCredit = userCredit;
}
public int getUserMoney() {
	return userMoney;
}
public void setUserMoney(int userMoney) {
	this.userMoney = userMoney;
}
public int getStateId() {
	return stateId;
}
public void setStateId(int stateId) {
	this.stateId = stateId;
}
public int getCharacterId() {
	return characterId;
}
public void setCharacterId(int characterId) {
	this.characterId = characterId;
}
public String getUserRegisterTime() {
	return userRegisterTime;
}
public void setUserRegisterTime(String userRegisterTime) {
	this.userRegisterTime = userRegisterTime;
}

public String getUserProfile() {
	return userProfile;
}
public void setUserProfile(String userProfile) {
	this.userProfile = userProfile;
}


public UserBean(String userAccount, String userPwd, int stateId, int characterId) {
	super();
	this.userAccount = userAccount;
	this.userPwd = userPwd;
	this.stateId = stateId;
	this.characterId = characterId;

}
public UserBean(String userAccount,String userPwd) {
	this.userAccount = userAccount;
	this.userPwd = userPwd;
}

public int getCount() {
	return count;
}

public void setCount(int count) {
	this.count = count;
}

}