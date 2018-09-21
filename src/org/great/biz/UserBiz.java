package org.great.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.UserBean;
import org.great.bean.UserInfoBean;

public interface UserBiz {
	public List<Object> search(String name,String page,String state);
	public UserBean employer(String userid);//雇主详细信息
	public UserInfoBean userinfo(@Param("userid")String userid);//个人中心
}
