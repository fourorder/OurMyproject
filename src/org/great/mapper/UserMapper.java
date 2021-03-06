package org.great.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.great.bean.AdvertisingBean;
import org.great.bean.ParameterBean;
import org.great.bean.UserBean;
import org.great.bean.UserInfoBean;
import org.great.bean.UserStoryBean;
import org.springframework.stereotype.Repository;

@Repository

public interface UserMapper {
			
	public void updateUserInfo(@Param("userId") String userId, @Param("userProfile") String userProfile,
			@Param("userName") String userName, @Param("userIdentity") String userIdentity,
			@Param("userTel") String userTel, @Param("userMail") String userMail, @Param("userHead")String userHead,@Param("userAddress")String userAddress);//修改用户资料
public List<UserBean> serachEmployer(@Param("name")String name,
		@Param("end")int end,@Param("start")int start);
public List<UserBean> employerNumber(@Param("name")String name);
public List<UserBean> serachBusiness(@Param("name")String name,
		@Param("end")int end,@Param("start")int start);
public List<UserBean> businessNumber(@Param("name")String name);
public UserBean employer(@Param("userid")String userid);
public UserInfoBean userinfo(@Param("userid")String userid);
public List<UserBean> employers(@Param("name")String name,@Param("page")int page,@Param("state")int state);
public int delEmployers(@Param("account")String account,@Param("num")String num);//删除雇主
public int countEmployers(@Param("name")String name,@Param("state")int state);//雇主总个数
public List<UserBean> employers(@Param("name")String name,@Param("page")int page);
public int delEmployers(@Param("account")String account);//删除雇主
public int countEmployers();//雇主总个数
public List<UserBean> countFacilitator();
public List<UserBean> countFacilitator2();
/*新加代码*/
public List<UserBean> countAdmin();
public List<UserBean> countAdmin2();
public List<UserBean> countAdmin3(String userAccount);
public List<UserBean> countAdmin4(String userAccount);
public List<UserBean> admin(@Param("userAccount")String userAccount,@Param("num")int num);
public void adminChangeState(int userId);
public void adminChangeState2(int userId);
public void adminChangeState3(int userId);
public void addAdmin(@Param("userAccount")String userAccount,@Param("userPwd")String userPwd,@Param("stateId")int stateId,@Param("characterId")int characterId);

public List<UserBean> countFacilitator3(String userName);
public List<UserBean> countFacilitator4(String userName);
public List<UserBean> facilitator(@Param("name")String name,@Param("page")int page);
public List<UserBean> login(String userAccount,String userPwd);
public List<UserBean> getCredit();//得到低信誉用户
public List<UserBean> userCredit(@Param("end")int end,@Param("start")int start);//分页查询低信誉用户
public UserInfoBean searchCredit(@Param("username")String username);//查询用户信誉
public List<UserBean> updateInfo(@Param("userAccount")String userAccount); //查询修改单个用户信息
public int updateUser(UserBean userBean); //修改雇主用户
public List<UserBean> selectAll();//查询总雇主
public int insertStory(UserStoryBean usb);//插入故事
public List<UserStoryBean> selectStory(@Param(value="userAccount")String userAccount);//插入当前雇主是否存在故事
public  int updateStory(UserStoryBean usb);//当前雇主存在故事运行
public List<UserStoryBean> conditionQuery(@Param("title")String title,@Param("page")int page, @Param("state")int state);//条件分页查找
public int countStory(@Param("title")String title,@Param("state")int state);//查询雇主故事的总个数；
public int delStory(@Param("userAccount")String userAccount);//删除雇主故事
public List<UserStoryBean> updateOne(@Param("userAccount")String userAccount); //查询单个故事
public int updateOk(UserStoryBean usb); //确认修改故事

public int forbiddenStory(@Param("account")String account);//禁用故事
public int startStory(@Param("account")String account);//启用故事
/*雇主注册*/
public void addUser(@Param(value="userAccount")String userAccount ,@Param(value="userPwd")String userPwd ,@Param(value="characterId")Integer characterId ,@Param(value="userName")String userName ,@Param(value="userTel")long userTel ,@Param(value="userIdentity")String userIdentity ,@Param(value="stateId")int stateId,@Param(value="userRegisterTime")String userRegisterTime);
/*服务商注册*/
public void addUser2(@Param(value="userAccount")String userAccount ,@Param(value="userPwd")String userPwd ,@Param(value="characterId")Integer characterId ,@Param(value="userName")String userName ,@Param(value="userTel")long userTel ,@Param(value="userIdentity")String userIdentity ,@Param(value="stateId")int stateId,@Param(value="userRegisterTime")String userRegisterTime,@Param(value="businessTypeId")int businessTypeId);
public List<UserBean> checkAccount(String userAccount);
public void changeState(int userId);
public void changeState2(int userId);
public void changeState3(int userId);
public void changeInfo(@Param(value="userId")int userId ,@Param(value="userName")String userName ,@Param(value="userTel")Long userTel ,@Param(value="userAccount")String userAccount ,@Param(value="userSex")String userSex ,@Param(value="userMail")String userMail ,@Param(value="userIdentity")String userIdentity,@Param(value="userCredit")int userCredit,@Param(value="userMoney")int userMoney,@Param(value="userRegisterTime")String userRegisterTime);
public UserBean user(Integer userid);
/*寻找服务商类型*/
public List<ParameterBean> findBusinessType();
public List<UserBean> checkTel(@Param(value="userTel")String userTel);
public void deleteTel(@Param(value="userTel")String userTel);
public void boundTel(@Param(value="userTel")String userTel,@Param(value="userId")String userId);
public List<UserBean> checkUserAccount(@Param(value="userAccount")String userAccount);
public List<UserBean> checkAccountTel(@Param(value="userAccount")String userAccount,@Param(value="userTel")String userTel);
public void changePwd(@Param(value="userAccount")String userAccount);

//更新服务商 信用分

public void updateCreditPoint(@Param(value="creditPoint")double creditPoint,@Param(value="userId")int userId);

public UserBean getUserName(@Param(value="userAccount")String userAccount);


}
