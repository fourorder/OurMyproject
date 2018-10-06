package org.great.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.FundBean;
import org.springframework.stereotype.Repository;
@Repository
public interface FundMapper {
public List<FundBean> getFundList(@Param("end")int end,@Param("start")int start);
public List<FundBean> getFundNumber();	
public List<FundBean> getFundList2(@Param("end")int end,@Param("start")int start,@Param("userid")int userid);//账户管理(陈毅)
public List<FundBean> getFundNumber2(@Param("userid")int userid);//账户管理(陈毅)	
public String findUserMoney(@Param("userid")int userid);//查找账户余额
}
