package org.great.biz;
import java.util.ArrayList;
import java.util.List;
import org.great.bean.UserInfoBean;
import org.great.bean.UserStoryBean;

import javax.annotation.Resource;

import org.great.bean.AdvertisingBean;
import org.great.bean.UserBean;
import org.great.mapper.FundMapper;
import org.great.mapper.UserMapper;
import org.springframework.stereotype.Service;

@Service
public class UserBizImp implements UserBiz{
@Resource
private UserMapper userMapper;
public List<Object> search(String name,String page,String state,int falg){
	List<Object> list=new ArrayList<Object>();
	List<Object> objects=new ArrayList<>();
	int page1=Integer.parseInt(page);
	int count1=0;
	if (falg==1) {
		count1=userMapper.employerNumber("%"+name+"%").size();	
	}else if (falg==2) {
		count1=userMapper.businessNumber("%"+name+"%").size();
	}		
	int countpage1=(int) Math.ceil(((float)count1)/6);
	if(state==null){
		state="";
	}
	if(state.equals("next")&&(page1<(int) Math.ceil(((float)count1)/6))){
		page1++;				
	}else if(state.equals("last")&&(page1>1)){
		page1--; 				
	}else if (state.equals("jump")){
		
	}else if (state.equals("home")) {
		page1=1;
	}else if (state.equals("end")) {
		page1=countpage1;
	}
	int end=page1*6;
	int start=end-5;
	//组装搜索雇主要的信息
	if (falg==1) {
		list.add(userMapper.serachEmployer("%"+name+"%",end,start));//雇主列表	
	}else if (falg==2) {
		list.add(userMapper.serachBusiness("%"+name+"%", end, start));
	}	
	list.add(page1);//当前页数
	list.add(countpage1);//总页数
	list.add(count1);//总条数
	objects.add(list);
	return objects;
}


public List<Object> getAllList(String name){
	List<Object> list=new ArrayList<Object>();
	List<Object> list1=new ArrayList<Object>();
	List<Object> objects=new ArrayList<>();
	int count1=userMapper.employerNumber("%"+name+"%").size();
	int count2=userMapper.businessNumber("%"+name+"%").size();
	int countpage1=(int) Math.ceil(((float)count1)/6);
	int countpage2=(int) Math.ceil(((float)count2)/6);
	list.add(userMapper.serachEmployer("%"+name+"%",6,1));
	list.add(1);
	list.add(countpage1);
	list.add(count1);
	list1.add(userMapper.serachBusiness("%"+name+"%",6,1));
	list1.add(1);
	list1.add(countpage2);
	list1.add(count2);
	objects.add(list);
	objects.add(list1);
	return objects;
}
@Override
public List<UserBean> employers(String name, int page,int state) {
	// TODO Auto-generated method stub
	if (name!=null && !("".equals(name))) {
		name="%"+name+"%";
		System.out.println("imp:"+name);
	}

	return userMapper.employers(name,page,state);
}
@Override
public int delEmployers(String account,String num) {
	// TODO Auto-generated method stub
	return userMapper.delEmployers(account,num);
}
@Override
public int countEmployers(String name,int state) {
	// TODO Auto-generated method stub
	if (name!=null && !("".equals(name))) {
		name="%"+name+"%";
		System.out.println("imp:"+name);
	}
	return userMapper.countEmployers(name,state);

}
public UserBean employer(String userid){
	
	return userMapper.employer(userid);
}
@Override
public UserInfoBean userinfo(String userid) {
	// TODO Auto-generated method stub
	return userMapper.userinfo(userid);
}
@Override
public boolean checkAccount(String userAccount) {
	// TODO Auto-generated method stub
	List<UserBean> userBeans=userMapper.checkAccount(userAccount);
	if(userBeans.size()>0) {
		return true;
	}else {
		return false;
	}
	
}


@Override
public List<UserBean> updateInfo(String userAccount) {
	// TODO Auto-generated method stub
	return userMapper.updateInfo(userAccount);
}


@Override
public int updateUser(UserBean userBean) {
	// TODO Auto-generated method stub
	return userMapper.updateUser(userBean);
}


@Override
public List<UserBean> selectAll() {
	// TODO Auto-generated method stub
	return userMapper.selectAll();
}


@Override
public int insertStory(UserStoryBean usb) {
	// TODO Auto-generated method stub
	return userMapper.insertStory(usb);
}


@Override
public List<UserStoryBean> selectStory(String userAccount) {
	// TODO Auto-generated method stub
	return userMapper.selectStory(userAccount);
}


@Override
public int updateStory(UserStoryBean usb) {
	// TODO Auto-generated method stub
	return userMapper.updateStory(usb);
}


@Override
public List<UserStoryBean> conditionQuery(String title, int page, int state) {
	// TODO Auto-generated method stub
	if (title!=null && !("".equals(title))) {
		title="%"+title+"%";
		System.out.println("imp:"+title);
	}
	return userMapper.conditionQuery(title, page, state);
}


@Override
public int countStory(String title, int state) {
	// TODO Auto-generated method stub
	if (title!=null && !("".equals(title))) {
		title="%"+title+"%";
		System.out.println("imp:"+title);
	}
	return userMapper.countStory(title, state);
}


@Override
public int delStory(String userAccount) {
	// TODO Auto-generated method stub
	return userMapper.delStory(userAccount);
}


@Override
public List<UserStoryBean> updateOne(String userAccount) {
	// TODO Auto-generated method stub
	return userMapper.updateOne(userAccount);
}


@Override
public int updateOk(UserStoryBean usb) {
	// TODO Auto-generated method stub
	return userMapper.updateOk(usb);
}





}
