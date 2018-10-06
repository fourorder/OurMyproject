package org.great.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.ProductTypeBean;
import org.great.bean.ServiceProviderTypeBean;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductTypeMapper {
	public List<ProductTypeBean> countProductType(@Param(value="parameterName")String parameterName);
	public List<ProductTypeBean> productType(@Param("parameterName")String parameterName,@Param("page")int page);
	public void addProductType(@Param("parameterName3")String parameterName3);
	public void changeState(@Param("parameterId")int parameterId);
}
