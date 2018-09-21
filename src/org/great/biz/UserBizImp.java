package org.great.biz;



import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.great.bean.UserBean;
import org.great.bean.UserInfoBean;
import org.great.mapper.FundMapper;
import org.great.mapper.UserMapper;
import org.springframework.stereotype.Service;

@Service
public class UserBizImp implements UserBiz{
@Resource
private UserMapper userMapper;
public List<Object> search(String name,String page,String state){
	List<Object> list=new ArrayList<Object>();
	List<Object> objects=new ArrayList<>();
	int page1=Integer.parseInt(page);
	int count1=userMapper.employerNumber("%"+name+"%").size();	
	int countpage1=(int) Math.ceil(((float)count1)/5);
//	String countpage=countpage1+"";
	if(state==null){
		state="";
	}
	if(state.equals("next")&&(page1<(int) Math.ceil(((float)count1)/5))){
		page1++;				
	}else if(state.equals("last")&&(page1>1)){
		page1--; 				
	}else if (state.equals("jump")){
		
	}
	int end=page1*5;
	int start=end-4;
	//组装搜索雇主要的信息
	list.add(userMapper.serachEmployer("%"+name+"%",end,start));
	list.add(page1);
	list.add(countpage1);
	list.add(count1);
	objects.add(list);
	return objects;
}
public UserBean employer(String userid){
	
	return userMapper.employer(userid);
}
@Override
public UserInfoBean userinfo(String userid) {
	// TODO Auto-generated method stub
	return userMapper.userinfo(userid);
}

}
