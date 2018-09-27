package org.great.mapper;

import java.util.ArrayList;

import org.great.bean.ConditionBean;
import org.great.bean.ProductionBean;
import org.springframework.stereotype.Repository;
@Repository
public interface ProductionMapper {

	//添加作品
	public void addProduction(ProductionBean productionBean);
	
	//作品列表 分页 
	public ArrayList<ProductionBean> findProductionList( ConditionBean conditionBean);
	
	//作品 总数
	public ArrayList<ProductionBean> findAllProductionList( ConditionBean conditionBean);
	
	//查询作品信息
	public ProductionBean findProductionDetal(int id);
	
	
	
}
