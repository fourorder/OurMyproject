package org.great.biz;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.great.bean.BidBean;
import org.great.bean.DemandBeanX;
import org.great.bean.DemandInfoBean;
import org.great.bean.ParameterBean;
import org.great.bean.UpdateDemandBean;
import org.springframework.web.multipart.MultipartFile;

public interface DemandBiz {
	// 增加
	public int addDemand(HttpServletRequest request, String userid, String demandTitle, String demandInformation,
			String parameterId, MultipartFile file, String dealMoney, String securityMoney);

	// 获取参数列表
	public ArrayList<ParameterBean> getParmater();

	// 获取需求状态 9/27
	public ArrayList<ParameterBean> getParmaterState();

	// 获取需求列表 9/27 22:00
	public ArrayList<DemandBeanX> getDemandList(int page, String name);

	// 获取需求列表 9/27 22：30
	public ArrayList<DemandInfoBean> getDemandInfoList(int page, String name, String userid, String parameterid,
			String stateid);

	// 获取搜索页码
	public int demandCount(String name);
	
	//雇主搜索总页数 9/28加
		public int demandCountEmployer(String name, String userid, String parameterid,String stateid);

	// ajax 分页查询
	public List<Object> queayDemandList(String state, String page, String searchName);

	// 查看详情
	public DemandInfoBean getDemandInfoBean(String demandid);

	// 查找投标记录
	public ArrayList<BidBean> getBidList(String demandid);

	// 我要投标
	public int addBid(String userid, String demandid);
	//修改
	public int updateDemand(UpdateDemandBean updateDemandBean);
	//ajax 雇主分页查询
	public List<Object>queayDemandEmployerList(String userid,String state, String page, String searchName,String parameterid,String stateid);
}
