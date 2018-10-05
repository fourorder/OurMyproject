package org.great.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.CounselorBean;
import org.great.bean.DemandBean;
import org.great.bean.DemandBeanX;
import org.springframework.stereotype.Repository;

@Repository
public interface CounselorMapper {
	 public List<String>   type();//顾问类型
	 public List<CounselorBean>  select(@Param("account")String account);//查询用户是否申请
	 public int applyFor(CounselorBean cb);//提交申请
	 public List<CounselorBean> conditionQuery(@Param("state")int state,@Param("page")int page);//条件查询
	 public int countCounserlor(@Param("state")int state);//总数
	 public int applyForOk(@Param("account")String account);//审核通过
	  public int forbidden(@Param("account")String account);//禁用
	     public int start(@Param("account")String account);//启用
	     public List<DemandBeanX> selectApplyFor(@Param("state")int state,@Param("page")int page);//查询申请找顾问的条数
	     public int countApplyFor(int userId);//查询申请找顾问的总条数
}
