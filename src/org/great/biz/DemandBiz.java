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
}
