package org.great.biz;

import java.util.List;


import org.apache.ibatis.annotations.Param;
import org.great.bean.UserBean;
import org.great.bean.UserInfoBean;


public interface UserBiz {


	public List<Object> search(String name,String page,String state,int falg);
	public List<Object> getAllList(String name);
	public UserInfoBean userinfo(@Param("userid")String userid);//个人中心
	public List<UserBean> employers(String name,int page);//分页模糊查找
	public List<UserBean> facilitator(String name,int page);

	public int delEmployers(String account); //删除雇主
	public int countEmployers();//查询雇主的总个数；
	public List<UserBean> countFacilitator();
	public List<UserBean> countFacilitator2();
	public List<UserBean> countFacilitator3(String userName);
	public List<UserBean> countFacilitator4(String userName);
	public boolean checkAccount(String userAccount);
	public void changeState(int userId,int stateId);
	public void changeInfo(@Param("userid")int userid,@Param("userName")String userName, @Param("userTel")Long userTel,@Param("userAccount")String userAccount,@Param("userSex")String userSex,@Param("userMail")String userMail,@Param("userIdentity")String userIdentity,@Param("userCredit")int userCredit,@Param("userMoney")int userMoney,@Param("userRegisterTime")String userRegisterTime);

}
