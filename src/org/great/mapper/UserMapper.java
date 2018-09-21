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
public UserBean employer(@Param("userid")String userid);
public UserInfoBean userinfo(@Param("userid")String userid);
}
