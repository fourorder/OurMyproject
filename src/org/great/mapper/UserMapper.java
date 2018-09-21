package org.great.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Param;
import org.great.bean.UserBean;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
public List<UserBean> serachEmployer(@Param("name")String name,
@Param("end")int end,@Param("start")int start);
public List<UserBean> employerNumber(@Param("name")String name);

public List<UserBean> login(String userAccount,String userPwd);
public void addUser(@Param(value="userAccount")String userAccount ,@Param(value="userPwd")String userPwd ,@Param(value="characterId")Integer characterId ,@Param(value="userName")String userName ,@Param(value="userTel")long userTel ,@Param(value="userIdentity")String userIdentity ,@Param(value="stateId")int stateId);
public List<UserBean> checkAccount(String userAccount);
}
