package org.great.biz;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.great.bean.ConditionBean;
import org.great.bean.ProductionBean;
import org.springframework.web.multipart.MultipartFile;

public interface ProductionBiz {

	//发布产品
	public void toIssueProduction(HttpServletRequest request
			,String title,Integer  price,Integer className,String area2,MultipartFile file,int userId,MultipartFile productionFile);

  public ConditionBean findProductionList(ConditionBean conditionBean,HttpServletRequest request,String state);


//查询作品信息
	public ProductionBean findProductionDetal(int id);
//生成购买记录,作品归属，插入两张表
	
	public void productionPayFinish(HttpServletRequest request,Integer  proId,
			Integer userId,Integer  proUserId,Double price);	
	
	public List<ProductionBean> getProductionList();

}
