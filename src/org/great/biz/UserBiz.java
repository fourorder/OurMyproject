package org.great.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.great.bean.UserBean;
import org.great.bean.UserInfoBean;
import org.springframework.web.multipart.MultipartFile;


public interface UserBiz {


	public List<Object> search(String name,String page,String state,int falg);
	public List<Object> getAllList(String name);
	public UserInfoBean userinfo(@Param("userid")String userid);//个人中心
	public List<UserBean> employers(String name,int page);//分页模糊查找
	public int delEmployers(String account); //删除雇主
	public int countEmployers();//查询雇主的总个数；
	public boolean checkAccount(String userAccount);
	//修改用户资料
	public boolean userInfoEdit (HttpServletRequest request,String userId,String userProfile,String userName,String userIdentity,String userTel,String userMail,MultipartFile file);
}
