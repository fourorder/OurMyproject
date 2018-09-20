package org.great.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.UserBean;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
public List<UserBean> serachEmployer(@Param("name")String name);
public UserBean employer(@Param("userid")String userid);
}
