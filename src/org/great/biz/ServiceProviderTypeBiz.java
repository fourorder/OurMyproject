package org.great.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.ServiceProviderTypeBean;

public interface ServiceProviderTypeBiz {
	public List<ServiceProviderTypeBean> countServiceProviderType(@Param("parameterName")String parameterName);
	public List<ServiceProviderTypeBean> serviceProviderType(String parameterName,int page);
	public void addServiceProviderType(String parameterName3);
	public void changeState(int parameterId);
}
