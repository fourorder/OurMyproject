package org.great.biz;

import java.util.List;

import org.great.bean.CounselorBean;

public interface CounselorBiz {
    public List<String>   type();//顾问类型
	public List<CounselorBean>  select(String account);//查询用户是否申请
     public int applyFor(CounselorBean cb);//提交申请
     public List<CounselorBean> conditionQuery(int state,int page);//条件查询
     public int countCounserlor(int state);//总数
     public int applyForOk(String account);//审核通过
     public int forbidden(String account);//禁用
     public int start(String account);//启用
    
}
