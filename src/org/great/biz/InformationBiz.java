package org.great.biz;


import java.util.List;

import org.great.bean.InformationBean;

public interface InformationBiz {

	public int setInformation(InformationBean ib);
	public List<InformationBean> getInformation(int parameterId);
	public List<InformationBean> getInforList(int parameterid,int end,int start);
	public List<Object> selectInfo(String page,String state,String parameterid);
	public int getcountPage(int parameterid);
	public List<String> informationType(); //查询咨询类型
	public int selectPid(String paramenter);//查询类型id
	public int countInfor(int state);//查询总条数
	public List<InformationBean> conditionQuery(int state,int page);//条件查找
	public int delInfor(int inforId);//删除资讯
	public int updateInfor(InformationBean ib);//修改
	public List<InformationBean> selectOne(int inforId);//查询修改资讯

}
