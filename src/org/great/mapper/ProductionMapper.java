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
	
	public void productionPayFinish( @Param(value="proId")Integer proId,@Param(value="userId")Integer userId,@Param(value="proUserId")Integer proUserId);
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
	
	//查找服务商作品  翻页   进入服务商 作品管理中心
	public ArrayList<ProductionBean> toManageProductionList(ConditionBean conditionBean);
	
	//查找服务商作品  全部，计算页数   进入服务商 作品管理中心
		public ArrayList<ProductionBean> toManageAllProductionList(ConditionBean conditionBean);
		
	//查询作品购买次数
		public int  findProductionBuyCount(int id);
		
		//更次作品的购买次数
		public void setProductionBuyCount(@Param("proId")int proId,@Param("buyCount")int buyCount);

		 //查询作品审核状态
		  public String toFindProductionAuditName(int auditState);

		  	//编辑作品 更新语句
			public void editProduction(ProductionBean productionBean);

			//删除作品 id
			public void delProduction(int proId);
			
			//查找分类  
			public String findClassName(int classId);
			
			//下架作品
			public void adminToIllegalProduction(int proId);
			
			//通过审核
			
			public void adminToPsaaProduction(int proId);
			
			//已购买的作品   id 翻页
			public ArrayList<ProductionBean> findBuyProduction(ConditionBean conditionBean);
			
			//已购买的作品   id  所以的
			public ArrayList<ProductionBean> findAllBuyProduction(ConditionBean conditionBean);

			//作品列表 分页 
			public ArrayList<ProductionBean> findProductionListPass( ConditionBean conditionBean);
			
			//作品 总数
			public ArrayList<ProductionBean> findAllProductionListPass( ConditionBean conditionBean);
			
     
			



}
