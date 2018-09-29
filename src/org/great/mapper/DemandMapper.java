package org.great.mapper;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.BidBean;
import org.great.bean.DemandBean;
import org.great.bean.DemandBeanX;
import org.great.bean.DemandInfoBean;
import org.great.bean.ParameterBean;
import org.great.bean.QueryBean;
import org.great.bean.UpdateDemandBean;
import org.springframework.stereotype.Repository;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

@Repository
public interface DemandMapper {
	// 搜索需求类型
	public ArrayList<ParameterBean> getParameter();

	// 搜索需求状态 9/27
	public ArrayList<ParameterBean> getParameterState();

	// 发布需求
	public int addDemand(@Param("demandTitle") String demandTitle, @Param("demandInformation") String demandInformation,
			@Param("parameterId") String parameterId, @Param("userId") String userId,
			@Param("publishTime") String publishTime, @Param("demandHead") String demandHead,
			@Param("dealMoney") String dealMoney, @Param("securityMoney") String securityMoney);

	// 修改需求
	public int updateDemand(UpdateDemandBean updateDemandBean);

	// 搜索需求 用标题关键字搜索
	public ArrayList<DemandBeanX> getDemandList(QueryBean queryBean);

	// 搜索总页数
	public int demandCount(@Param("name") String name);
	
	//雇主搜索总页数 9/28加
	public int demandCountEmployer(@Param("name") String name, @Param("userid") String userid, @Param("parameterid") String parameterid,
			@Param("stateid") String stateid);
	
	// 查看需求详情
	public DemandInfoBean getDemandInfoBean(@Param("demandid") String demandid);

	// 查找投标记录
	public ArrayList<BidBean> getBidList(@Param("demandid") String demandid);

	//我要投标
	public List<DemandBean> countDemand(@Param(value="demandTitle")String demandTitle);
	public List<DemandBean> demand(@Param("demandTitle")String demandTitle,@Param("page")int page);
	public List<DemandBean> findInfo(int demandId);
	public String findFromUserName(int demandId);
	public String findToUserName(int demandId);
	public String findParameterName(int demandId);
	public String findStateName(int demandId);
	public void changeInfo(@Param("demandId2")int demandId2,@Param("demandDetailInformation2") String demandDetailInformation2,@Param("securityMoney2") int securityMoney2,@Param("dealMoney2") int dealMoney2,
			@Param("completeTime2")String completeTime2, @Param("auctionTime2")String auctionTime2,@Param("demandHead2") String demandHead2);
	public void changeState(int demandId);
	public void changeState2(int demandId);
	public void changeState3(int demandId);
	// 我要投标
	public int addBid(@Param("userid") String userid, @Param("demandid") String demandid,
			@Param("bidtime") String bidtime);

		// 搜索需求 雇主这边 9/27 新写方法
	public ArrayList<DemandInfoBean> getDemandInfoList(@Param("star") String star, @Param("end") String end,
			@Param("name") String name, @Param("userid") String userid, @Param("parameterid") String parameterid,
			@Param("stateid") String stateid);
}
