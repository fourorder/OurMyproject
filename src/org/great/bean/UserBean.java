package org.great.bean;

public class UserBean {
public int userId;
public String userName;
public String userPwd;
public long userTel;
public String userAccount;
public String userSex;
public String userMail;
public String userIdentity;
public String userAddress;
public String userHead;
public int userCredit;
public int userMoney;
public int stateId;
public int characterId;
public String userRegisterTime;
public UserBean() {
	super();
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
}