package org.great.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.DemandTypeBean;
import org.great.bean.ServiceProviderTypeBean;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceProviderTypeMapper {
	public List<ServiceProviderTypeBean> countServiceProviderType(@Param(value="parameterName")String parameterName);
	public List<ServiceProviderTypeBean> serviceProviderType(@Param("parameterName")String parameterName,@Param("page")int page);
	public void addServiceProviderType(@Param("parameterName3")String parameterName3);
	public void changeState(@Param("parameterId")int parameterId);
}
