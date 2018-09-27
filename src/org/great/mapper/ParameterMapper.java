package org.great.mapper;

import java.util.ArrayList;

import org.great.bean.ParameterBean;
import org.springframework.stereotype.Repository;
@Repository
public interface ParameterMapper {

	
	//找作品的分类  发布作品时候选择分类
	public ArrayList<ParameterBean> findProductionClass();
	
	//查找平台的抽成比例 id=285
	public String findCommission();
}
