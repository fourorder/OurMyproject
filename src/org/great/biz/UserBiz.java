package org.great.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.great.bean.AdvertisingBean;
import org.great.bean.UserBean;
import org.great.bean.UserInfoBean;
import org.springframework.web.multipart.MultipartFile;

import org.great.bean.UserStoryBean;



public interface UserBiz {


	public List<Object> search(String name,String page,String state,int falg);
	public List<Object> getAllList(String name);
	public UserInfoBean userinfo(@Param("userid")String userid);//个人中心
	public List<UserBean> employers(String name,int page,int state);//分页模糊查找
	public int delEmployers(String account,String num); //删除雇主
	public int countEmployers(String name,int state);//查询雇主的总个数；
	public List<UserBean> updateInfo(String userAccount); //查询单个用户
	public int updateUser(UserBean userBean); //修改雇主用户
	public List<UserBean> selectAll();//查询总雇主
	public int insertStory(UserStoryBean usb);//插入故事
	public  List<UserStoryBean> selectStory(String userAccount);//插入当前雇主是否存在故事
	public  int updateStory(UserStoryBean usb);//当前雇主存在故事运行
	public List<UserStoryBean> conditionQuery(String title,int page,int state);//条件分页查找
	public int countStory(String title,int state);//查询雇主故事的总个数；
	public int delStory(String userAccount);//删除雇主故事
	public List<UserStoryBean> updateOne(String userAccount); //查询单个故事
	public int updateOk(UserStoryBean usb); //确认修改故事
	public List<UserBean> employers(String name,int page);//分页模糊查找
	public List<UserBean> facilitator(String name,int page);

    public int forbiddenStory(String account);//禁用故事
    public int startStory(String account);//启用故事

	public int delEmployers(String account); //删除雇主
	public boolean checkAccount(String userAccount);
	public List<List<Object>> userCredit(String page,String state);
	public UserInfoBean searchCredit(String username);
	//修改用户资料
	public boolean userInfoEdit (HttpServletRequest request,String userId,String userProfile,String userName,String userIdentity,String userTel,String userMail,MultipartFile file,String userAddress);	
	public int countEmployers();//查询雇主的总个数；
	public List<UserBean> countFacilitator();
	public List<UserBean> countFacilitator2();
	public List<UserBean> countFacilitator3(String userName);
	public List<UserBean> countFacilitator4(String userName);
	public void changeState(int userId,int stateId);
	public void changeInfo(@Param("userid")int userid,@Param("userName")String userName, @Param("userTel")Long userTel,@Param("userAccount")String userAccount,@Param("userSex")String userSex,@Param("userMail")String userMail,@Param("userIdentity")String userIdentity,@Param("userCredit")int userCredit,@Param("userMoney")int userMoney,@Param("userRegisterTime")String userRegisterTime);
	public UserBean user(int userid);
}
