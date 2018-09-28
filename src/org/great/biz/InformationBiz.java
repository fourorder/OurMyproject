package org.great.biz;


import java.util.List;

import org.great.bean.InformationBean;

public interface InformationBiz {
	public List<String> informationType(); //查询咨询类型
	public int selectPid(String paramenter);//查询类型id
	public int setInformation(InformationBean ib);//插入资讯
	public int countInfor(int state);//查询总条数
	public List<InformationBean> conditionQuery(int state,int page);//条件查找
	public int delInfor(int inforId);//删除资讯
	public int updateInfor(InformationBean ib);//修改
	public List<InformationBean> selectOne(int inforId);//查询修改资讯
}
