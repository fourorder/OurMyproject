package org.great.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.great.bean.UserBean;
import org.great.bean.UserInfoBean;
import org.springframework.stereotype.Repository;
@Repository
public interface UserMapper {
public List<UserBean> serachEmployer(@Param("name")String name,
		@Param("end")int end,@Param("start")int start);
public List<UserBean> employerNumber(@Param("name")String name);

public List<UserBean> serachBusiness(@Param("name")String name,
		@Param("end")int end,@Param("start")int start);
public List<UserBean> businessNumber(@Param("name")String name);
public UserBean employer(@Param("userid")String userid);
public UserInfoBean userinfo(@Param("userid")String userid);
public List<UserBean> employers(@Param("name")String name,@Param("page")int page);
public int delEmployers(@Param("account")String account);//删除雇主
public int countEmployers();//雇主总个数
public List<UserBean> login(String userAccount,String userPwd);
public void addUser(@Param(value="userAccount")String userAccount ,@Param(value="userPwd")String userPwd ,@Param(value="characterId")Integer characterId ,@Param(value="userName")String userName ,@Param(value="userTel")long userTel ,@Param(value="userIdentity")String userIdentity ,@Param(value="stateId")int stateId);
public List<UserBean> checkAccount(String userAccount);
public List<UserBean> getCredit();//得到低信誉用户
public List<UserBean> userCredit(@Param("end")int end,@Param("start")int start);//分页查询低信誉用户
public UserInfoBean searchCredit(@Param("username")String username);//查询用户信誉

}
