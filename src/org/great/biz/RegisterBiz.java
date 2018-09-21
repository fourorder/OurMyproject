package org.great.biz;

import javax.servlet.http.HttpServletRequest;

public interface RegisterBiz {
	public void register(String userAccount,String userPwd,int characterId,String userName,long userTel,String userIdentity,int stateId,HttpServletRequest request);
}
