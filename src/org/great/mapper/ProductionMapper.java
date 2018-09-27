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
	
	//增加 完成作品购买 生成记录
	
	public void productionPayFinish( @Param(value="proId")Integer proId,@Param(value="userId")Integer userId);
	//增加 购买记录
	public void addTradRecord(@Param(value="userId")Integer userId,@Param(value="price")double price,@Param(value="proUserId")Integer proUserId,@Param(value="businessId")Integer businessId );
		
	//查询账户余额 
	public double findUserMoney(int userId);
		
	//设置新的账户余额
	public void setNewUserMoney(@Param(value="userId")int userId,@Param(value="userMoney")Double userMoney);	
	
	
	//查询热卖作品
	public List<ProductionBean> getProductionList(); 
	
	//搜索作品
	public List<ProductionBean> selectProduction(@Param("name")String name,
			@Param("end")int end,@Param("start")int start);
	
	//
	public List<ProductionBean> productionNumber(@Param("name")String name);
}
