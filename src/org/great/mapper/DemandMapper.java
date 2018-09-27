package org.great.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.great.bean.BidBean;
import org.great.bean.DemandBean;
import org.great.bean.DemandInfoBean;
import org.great.bean.ParameterBean;
import org.great.bean.QueryBean;
import org.springframework.stereotype.Repository;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

@Repository
public interface DemandMapper {
	// 搜索需求类型
	public ArrayList<ParameterBean> getParameter();

	// 发布需求
	public int addDemand(@Param("demandTitle") String demandTitle, @Param("demandInformation") String demandInformation,
			@Param("parameterId") String parameterId, @Param("userId") String userId,
			@Param("publishTime") String publishTime, @Param("demandHead") String demandHead,
			@Param("dealMoney") String dealMoney, @Param("securityMoney") String securityMoney);

	// 修改需求
	public int updateDemand(DemandBean demandBean);

	// 搜索需求 用标题关键字搜索
	public ArrayList<DemandBean> getDemandList(QueryBean queryBean);

	// 搜索总页数
	public int demandCount(@Param("name") String name);
	// 查看需求详情
	public DemandInfoBean getDemandInfoBean(@Param("demandid") String demandid);
	//查找投标记录
	public ArrayList<BidBean> getBidList(@Param("demandid") String demandid);
	//我要投标
	public int addBid(@Param("userid") String userid,@Param("demandid") String demandid,@Param("bidtime") String bidtime);
}
