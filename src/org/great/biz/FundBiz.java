package org.great.biz;

import java.util.List;

import org.great.bean.FundBean;

public interface FundBiz {
	public List<FundBean> getFundList(String page);
	public List<FundBean> getFundList2(String page,int userid);//账户管理（陈毅）
	public List<Object> selectFund(String page,String state);
	public List<Object> selectFund2(String page,String state,int userid);//账户管理（陈毅）
	public int getcountPage();
	public int getcountPage2(int userid);//账户管理(陈毅)
	public String findUserMoney(int userid);//查找账户余额
}
