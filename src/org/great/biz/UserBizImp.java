package org.great.biz;



import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.great.bean.UserBean;
import org.great.mapper.FundMapper;
import org.great.mapper.UserMapper;
import org.springframework.stereotype.Service;

@Service
public class UserBizImp implements UserBiz{
@Resource
private UserMapper userMapper;
public List<Object> search(String name){
	List<Object> list=new ArrayList<Object>();
	list.add(userMapper.serachEmployer("%"+name+"%"));
	return list;
}
public UserBean employer(String userid){
	UserBean userBean = new UserBean();
	return userBean;
}

}
