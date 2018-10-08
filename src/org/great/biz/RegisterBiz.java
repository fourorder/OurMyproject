package org.great.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.great.bean.ParameterBean;

public interface RegisterBiz {
	/*雇主注册*/
	public void register(String userAccount,String userPwd,Integer characterId,String userName,long userTel,String userIdentity,Integer stateId,HttpServletRequest request,String userRegisterTime);
	/*服务商注册*/
	public void register2(String userAccount,String userPwd,Integer characterId,String userName,long userTel,String userIdentity,Integer stateId,HttpServletRequest request,String userRegisterTime,int businessTypeId);
	/*寻找服务商类型*/
	public List<ParameterBean> findBusinessType();
	
}
