package org.great.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.ProductTypeBean;

public interface ProductTypeBiz {
	public List<ProductTypeBean> countProductType(@Param("parameterName")String parameterName);
	public List<ProductTypeBean> productType(String parameterName,int page);
	public void addProductType(String parameterName3);
	public void changeState(int parameterId);
}
