package org.great.biz;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.great.bean.FundBean;
import org.great.mapper.FundMapper;
import org.springframework.stereotype.Service;
@Service
public class FundBizImp implements FundBiz{
@Resource
private FundMapper fundMapper;
private String countpage;
public List<FundBean> getFundList(String page){
	int end=5*Integer.parseInt(page);
	int start=end-4;
	return fundMapper.getFundList(end,start);
}
public List<FundBean> getFundList2(String page,int userid){
	int end=5*Integer.parseInt(page);
	int start=end-4;
	return fundMapper.getFundList2(end,start,userid);
}//账户管理(陈毅)
public List<Object> selectFund(String page,String state){//交易记录ajax分页
	List<Object> list=new ArrayList<Object>();	
	int page1=Integer.parseInt(page);
	int count1=fundMapper.getFundNumber().size();	
	int countpage1=(int) Math.ceil(((float)count1)/5);
	countpage=countpage1+"";
	if(state==null){
		state="";
	}
	if(state.equals("next")&&(page1<(int) Math.ceil(((float)count1)/5))){
		page1++;				
	}else if(state.equals("last")&&(page1>1)){
		page1--; 				
	}else if (state.equals("jump")){
		
	}
	int end=5*page1;
	int start=end-4;
	page=page1+"";
	list.add(page);
	list.add(fundMapper.getFundList(end, start));
	list.add(countpage1);
	return list;
}
public List<Object> selectFund2(String page,String state,int userid){
	//交易记录ajax分页(陈毅用)
	List<Object> list=new ArrayList<Object>();	
	int page1=Integer.parseInt(page);
	int count1=fundMapper.getFundNumber2(userid).size();	
	int countpage1=(int) Math.ceil(((float)count1)/5);
	countpage=countpage1+"";
	if(state==null){
		state="";
	}
	if(state.equals("next")&&(page1<(int) Math.ceil(((float)count1)/5))){
		page1++;				
	}else if(state.equals("last")&&(page1>1)){
		page1--; 				
	}else if (state.equals("jump")){
		
	}
	int end=5*page1;
	int start=end-4;
	page=page1+"";
	list.add(page);
	list.add(fundMapper.getFundList2(end, start,userid));
	list.add(countpage1);
	return list;
}
public int getcountPage(){
	
	return (int) Math.ceil(((float)fundMapper.getFundNumber().size())/5);	
}
public int getcountPage2(int userid){
	
	return (int) Math.ceil(((float)fundMapper.getFundNumber2(userid).size())/5);	
}//账户管理(陈毅)
@Override
public String findUserMoney(int userid) {
	// TODO Auto-generated method stub
	return fundMapper.findUserMoney(userid);
}
}
