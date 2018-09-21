package org.great.biz;

import java.util.List;

import org.great.bean.UserBean;

public interface UserBiz {

	public List<Object> search(String name,String page,String state,int falg);
	public List<Object> getAllList(String name);
	public List<UserBean> employers(String name,int page);//分页模糊查找
	public int delEmployers(String account); //删除雇主
	public int countEmployers();//查询雇主的总个数；

}
