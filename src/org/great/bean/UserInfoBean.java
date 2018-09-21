package org.great.bean;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component
public class UserInfoBean {
	private int userId;//用户id
	private String userName;//用户
	private String userPwd;//密码
	private long userTel;//手机
	private String userAccount;//账户
	private String userSex;//性别
	private String userMail;//邮箱
	private long userIdentity;//身份证
	private String userAddress;//地址
	private String userHead;//头像
	private int userCredit;//信用分
	private int userMoney;//余额
	private int stateId;//状态id
	private int characterId;//角色id
	private String userRegisterTime;//注册时间
	private String userProfile;//用户简介
	
	private StateBean stateBean;//用户状态
	private CharacteBean characteBean;//角色
	
	public UserInfoBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserInfoBean(int userId, String userName, String userPwd, long userTel, String userAccount, String userSex,
			String userMail, long userIdentity, String userAddress, String userHead, int userCredit, int userMoney,
			int stateId, int characterId, String userRegisterTime, String userProfile, StateBean stateBean,
			CharacteBean characteBean) {
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
		this.stateBean = stateBean;
		this.characteBean = characteBean;
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

	public long getUserIdentity() {
		return userIdentity;
	}

	public void setUserIdentity(long userIdentity) {
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

	public StateBean getStateBean() {
		return stateBean;
	}

	public void setStateBean(StateBean stateBean) {
		this.stateBean = stateBean;
	}

	public CharacteBean getCharacteBean() {
		return characteBean;
	}

	public void setCharacteBean(CharacteBean characteBean) {
		this.characteBean = characteBean;
	}
	
	
	
	
}
