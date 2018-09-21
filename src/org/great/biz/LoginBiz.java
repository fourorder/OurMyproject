package org.great.biz;



import javax.servlet.http.HttpServletRequest;



public interface LoginBiz {
	public int login(String userAccount,String userPwd,HttpServletRequest request);
}
