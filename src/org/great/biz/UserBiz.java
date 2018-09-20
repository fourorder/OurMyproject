package org.great.biz;

import java.util.List;

import org.great.bean.UserBean;

public interface UserBiz {
	public List<Object> search(String name);
	public UserBean employer(String userid);//雇主详细信息
}
