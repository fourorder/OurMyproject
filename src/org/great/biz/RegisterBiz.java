package org.great.biz;

import javax.servlet.http.HttpServletRequest;

public interface RegisterBiz {
	public void register(String userAccount,String userPwd,Integer characterId,String userName,long userTel,String userIdentity,Integer stateId,HttpServletRequest request,String userRegisterTime);
}
