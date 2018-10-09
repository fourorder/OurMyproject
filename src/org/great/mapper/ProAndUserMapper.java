package org.great.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.great.bean.ProAndUserBean;

public interface ProAndUserMapper {
	//查询作品交易 时间  评价
		public  ProAndUserBean findPayDetal(@Param(value="proId")Integer  proId,@Param(value="userId")Integer userId);
		
		//更新作品评价
		public void setProductionEvaluate(@Param(value="evaluate")String evaluate,@Param(value="proAndUserId")Integer proAndUserId,@Param(value="point")Integer point);
		
		//查询该Bean
		public  ProAndUserBean findProAndUserDetal(Integer  proAndUserId);
		
		//查询该作品的所有评分
		public ArrayList<Integer> findProUserPoint(int proAndUserId);
		
		 //查询是否购买过
		
		public ArrayList<ProAndUserBean> findHasBeenBuy(@Param(value="buyUserId")int buyUserId,@Param(value="proId")int proId);
}
