package org.great.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.great.bean.ProAndUserBean;

public interface ProAndUserMapper {
	//查询作品交易 时间  评价
		public  ProAndUserBean findPayDetal(Integer  proId);
		
		//更新作品评价
		public void setProductionEvaluate(@Param(value="evaluate")String evaluate,@Param(value="proAndUserId")Integer proAndUserId,@Param(value="point")Integer point);
		
}
