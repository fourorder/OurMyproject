package org.great.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.great.bean.AdvertisingBean;
import org.great.bean.UserBean;
import org.great.bean.UserInfoBean;
import org.great.bean.UserStoryBean;
import org.springframework.stereotype.Repository;

@Repository

public interface UserMapper {
			
public void updateUserInfo(@Param("userId") String userId, @Param("userProfile") String userProfile,
		@Param("userName") String userName, @Param("userIdentity") String userIdentity,
		@Param("userTel") String userTel, @Param("userMail") String userMail, @Param("userHead")String userHead);//修改用户资料
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
public List<UserBean> login(String userAccount,String userPwd);
public void addUser(@Param(value="userAccount")String userAccount ,@Param(value="userPwd")String userPwd ,@Param(value="characterId")Integer characterId ,@Param(value="userName")String userName ,@Param(value="userTel")long userTel ,@Param(value="userIdentity")String userIdentity ,@Param(value="stateId")int stateId);
public List<UserBean> checkAccount(String userAccount);
public List<UserBean> getCredit();//得到低信誉用户
public List<UserBean> userCredit(@Param("end")int end,@Param("start")int start);//分页查询低信誉用户
public UserInfoBean searchCredit(@Param("username")String username);//查询用户信誉
public List<UserBean> updateInfo(String userAccount); //查询修改单个用户信息
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

}
