package org.great.biz;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.great.bean.ConditionBean;
import org.great.bean.ProductionBean;
import org.great.bean.SessionBean;
import org.springframework.web.multipart.MultipartFile;

public interface ProductionBiz {

	//发布产品
	public void toIssueProduction(HttpServletRequest request
			,String title,Integer  price,Integer className,String area2,MultipartFile file,int userId,MultipartFile productionFile);

	// 模糊查询作品
  public ConditionBean findProductionList(ConditionBean conditionBean,HttpServletRequest request,String state,Integer  toNumber);


//查询作品信息
	public ProductionBean findProductionDetal(int id);

	
	//生成购买记录,作品归属，插入两张表	
	public void productionPayFinish(HttpServletRequest request,Integer  proId,
			Integer userId,Integer  proUserId,Double price);	
	
	public List<ProductionBean> getProductionList();

	// 作品管理 翻页 
	 public ConditionBean toManageProductionList(ConditionBean conditionBean,HttpServletRequest request,String state,Integer toNumber);

	 //查询作品审核状态
	// public String toFindProductionAuditName(int auditState);
	
	 //编辑作品BIZ
	  public void editProduction(HttpServletRequest request,Integer  proId,String title,Float  price,Integer className,String area2,MultipartFile file,MultipartFile productionFile);
	 
	 //已购买商品 
	  public    ConditionBean     findBuyProduction(ConditionBean conditionBean,HttpServletRequest request,String state,Integer toNumber);

	  
	// 模糊查询作品 通过审核的
	  public ConditionBean findProductionListPass(ConditionBean conditionBean,HttpServletRequest request,String state,Integer toNumber);


	//生成充值记录   插入表	
		public void addMoneyPayFinish(HttpServletRequest request,SessionBean sessionBean);	


}
