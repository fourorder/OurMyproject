package org.great.biz;

import java.util.List;

import javax.annotation.Resource;

import org.great.bean.ProductTypeBean;
import org.great.mapper.ProductTypeMapper;
import org.springframework.stereotype.Service;

@Service
public class ProductTypeBizImp implements ProductTypeBiz {
@Resource
private ProductTypeMapper productTypeMapper;

@Override
public List<ProductTypeBean> countProductType(String parameterName) {
	// TODO Auto-generated method stub
	if (parameterName!=null) {
		parameterName="%"+parameterName+"%";
	}
	return productTypeMapper.countProductType(parameterName);
}

@Override
public List<ProductTypeBean> productType(String parameterName, int page) {
	// TODO Auto-generated method stub
	if (parameterName!=null) {
		parameterName="%"+parameterName+"%";
	}
	return productTypeMapper.productType(parameterName,page);
}

@Override
public void addProductType(String parameterName3) {
	// TODO Auto-generated method stub
	productTypeMapper.addProductType(parameterName3);
}

@Override
public void changeState(int parameterId) {
	// TODO Auto-generated method stub
	System.out.println(parameterId+"imp");
	productTypeMapper.changeState(parameterId);
}
}
