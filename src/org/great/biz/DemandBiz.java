package org.great.biz;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.great.bean.ApplicationBean;
import org.great.bean.BidBean;
import org.great.bean.ContractBean;
import org.great.bean.CounselorBean;
import org.great.bean.DailyBean;
import org.great.bean.CounselorInfoBean;
import org.great.bean.DemandBean;
import org.great.bean.BidBean;
import org.great.bean.DemandBeanX;
import org.great.bean.DemandInfoBean;
import org.great.bean.ParameterBean;
import org.great.bean.UpdateDemandBean;
import org.springframework.web.multipart.MultipartFile;
import org.apache.ibatis.annotations.Param;

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

	// 雇主搜索总页数 9/28加
	public int demandCountEmployer(String name, String userid, String parameterid, String stateid);

	// ajax 分页查询
	public List<Object> queayDemandList(String state, String page, String searchName);

	// 查看详情
	public DemandInfoBean getDemandInfoBean(String demandid);

	// 查找投标记录
	public ArrayList<BidBean> getBidList(String demandid);

	// 我要投标

	// public List<DemandBean> countDemand();
	// public List<DemandBean> countDemand2(String demandTitle);
	public List<DemandBean> countDemand(@Param("demandTitle") String demandTitle);

	/* public List<DemandBean> countDemand2(String demandTitle); */
	public List<DemandBean> demand(String demandTitle, int page);

	public List<DemandBean> findInfo(int demandId);

	public String findFromUserName(int demandId);

	public String findToUserName(int demandId);

	public String findParameterName(int demandId);

	public String findStateName(int demandId);

	public void changeInfo(int demandId2, String demandDetailInformation2, int securityMoney2, int dealMoney2,
			String completeTime2, String auctionTime2, String demandHead2);

	public void changeState(int demandId, int stateId);

	public void changeState2(int demandId, int stateId);

	public void changeState3(int demandId, int stateId);

	public int addBid(String userid, String demandid);

	// 修改
	public int updateDemand(UpdateDemandBean updateDemandBean);

	// ajax 雇主分页查询
	public List<Object> queayDemandEmployerList(String userid, String state, String page, String searchName,
			String parameterid, String stateid);

	public List<String> type();// 顾问类型

	public List<CounselorBean> select(String account);// 查询用户是否申请

	public int applyFor(CounselorBean cb);// 提交申请

	public List<CounselorBean> conditionQuery(int state, int page);// 条件查询

	public int countCounserlor(int state);// 总数

	public int applyForOk(String account);// 审核通过

	public int forbidden(String account);// 禁用

	public int start(String account);// 启用

	public List<ApplicationBean> selectApplyFor(int state, int page, int userId);// 查询申请找顾问的条数

	public int countApplyFor(int userId, int state);// 查询申请找顾问的总条数

	public int applyFprPass(int id);// 确认通过雇主审核--需求表

	public int applyFprPass2(int id);// 确认通过雇主审核 --申请表

	public int applyFprreFuse(int id);// 拒绝通过雇主审核

	public int applyFprreFuse2(int id);// 拒绝通过雇主审核 --申请表

	public String daily(String dailyDate);// 查询当天日报是否提交过

	public int sumbit(String content, int processId);// 提交日报

	public List<DemandBeanX> particulars(int demandId);// 详细信息

	public int selectId(String account);// 查找Id

	public String selectType(int parameterid);// 查询类型

	public List<Integer> serialNum(String account);// 查询顾问所接项目编号

	public List<DailyBean> selectDaily(int parameterId, String state, int page);// 查询详细项目内容

	public int countDaily(int parameterId, String evaluation);// 查询项目日报总数

	public int sEvaluation(int userId, String evaluation, String notation, String time);// 提交评价
	// 找顾问

	public ArrayList<CounselorInfoBean> getCounselorInfoList();

	// 增加找顾问记录
	public int addConsultantRecords(String employerId, String consultantId, String demandId);

	// 服务商查看投标任务
	public ArrayList<DemandInfoBean> getsupplierBidList(String userid);

	// 雇主上传合同
	public int addContrac(HttpServletRequest request, String demandid, MultipartFile file);

	// 服务商获取合同信息
	public ContractBean getContract(String demandid);

	// 修改信息
	public void updateConteact(HttpServletRequest request, String demandid, MultipartFile file);

	// 服务商提交项目
	public void submissionDemand(HttpServletRequest request, String demandid, MultipartFile file);

	// 修改需求信息
	public void updateDemandInfo(HttpServletRequest request, String demandTitle, String demandInformation,
			String parameterId, MultipartFile file, String dealMoney, String securityMoney, String demandid);

	// 服务商ajax分页
	public List<Object> selectDemandFacilitator(String userid, String state, String page, String searchName,
			String parameterid, String stateid);

	// 服务商搜索总页数
	public int demandCountFacilitator(String name, String userid, String parameterid, String stateid);

	// 服务商初始列表
	public ArrayList<DemandInfoBean> getDemandInfoFacilitatorList(String star, String end, String name, String userid,
			String parameterid, String stateid);
}
