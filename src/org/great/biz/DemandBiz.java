package org.great.biz;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.great.bean.BidBean;
import org.great.bean.DemandBean;
import org.great.bean.DemandInfoBean;
import org.great.bean.ParameterBean;
import org.springframework.web.multipart.MultipartFile;
import org.apache.ibatis.annotations.Param;
public interface DemandBiz {

	// 增加
	public int addDemand(HttpServletRequest request, String userid, String demandTitle, String demandInformation,
			String parameterId, MultipartFile file, String dealMoney, String securityMoney);

	// 获取参数列表
	public ArrayList<ParameterBean> getParmater();

	// 获取需求列表
	public ArrayList<DemandBean> getDemandList(int page, String name);

	// 获取搜索页码
	public int demandCount(String name);

	// ajax 分页查询
	public List<Object> queayDemandList(String state, String page, String searchName);

	// 查看详情
	public DemandInfoBean getDemandInfoBean(String demandid);

	// 查找投标记录
	public ArrayList<BidBean> getBidList(String demandid);

	// 我要投标
	public int addBid(String userid,String demandid);
//	public List<DemandBean> countDemand();
//	public List<DemandBean> countDemand2(String demandTitle);
	public List<DemandBean> countDemand(@Param("demandTitle")String demandTitle);
		/*public List<DemandBean> countDemand2(String demandTitle);*/
	public List<DemandBean> demand(String demandTitle,int page);
	public List<DemandBean> findInfo(int demandId);
	public String findFromUserName(int demandId);
	public String findToUserName(int demandId);
	public String findParameterName(int demandId);
	public String findStateName(int demandId);
	public void changeInfo(int demandId2,String demandDetailInformation2,int securityMoney2,int dealMoney2,String completeTime2,String auctionTime2,String demandHead2);
	public void changeState(int demandId,int stateId);
	public void changeState2(int demandId,int stateId);
	public void changeState3(int demandId,int stateId);

}
