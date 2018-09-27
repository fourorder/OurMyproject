package org.great.biz;


import java.util.List;

import org.great.bean.InformationBean;

public interface InformationBiz {
	public int setInformation(InformationBean ib);
	public List<InformationBean> getInformation(int parameterId);
	public List<InformationBean> getInforList(int parameterid,int end,int start);
	public List<Object> selectInfo(String page,String state,String parameterid);
	public int getcountPage(int parameterid);
}
