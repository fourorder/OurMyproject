package org.great.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
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
	
	//查询热卖作品
	public List<ProductionBean> getProductionList(); 
	
	//搜索作品
	public List<ProductionBean> selectProduction(@Param("name")String name,
			@Param("end")int end,@Param("start")int start);
	
	//
	public List<ProductionBean> productionNumber(@Param("name")String name);
}
