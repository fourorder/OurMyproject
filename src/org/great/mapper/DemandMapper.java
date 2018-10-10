package org.great.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import org.great.bean.ApplicationBean;

import org.great.bean.BidBean;
import org.great.bean.ContractBean;
import org.great.bean.CounselorBean;
import org.great.bean.DailyBean;

import org.great.bean.CounselorInfoBean;

import org.great.bean.DemandBean;
import org.great.bean.DemandBeanX;
import org.great.bean.DemandDealBean;
import org.great.bean.DemandInfoBean;
import org.great.bean.ParameterBean;
import org.great.bean.QueryBean;
import org.great.bean.UpdateDemandBean;
import org.great.bean.UserBean;
import org.springframework.stereotype.Repository;

@Repository
public interface DemandMapper {
	// 搜索需求类型
	public ArrayList<ParameterBean> getParameter();

	// 搜索需求状态 9/27
	public ArrayList<ParameterBean> getParameterState();

	// 发布需求
	public int addDemand(@Param("demandTitle") String demandTitle, @Param("demandInformation") String demandInformation,
			@Param("parameterId") String parameterId, @Param("userId") String userId,
			@Param("demandHead") String demandHead, @Param("dealMoney") String dealMoney,
			@Param("securityMoney") String securityMoney);

	// 修改需求
	public int updateDemand(UpdateDemandBean updateDemandBean);

	// 搜索需求 用标题关键字搜索
	public ArrayList<DemandBeanX> getDemandList(QueryBean queryBean);

	// 搜索总页数
	public int demandCount(@Param("name") String name);

	// 雇主搜索总页数 9/28加
	public int demandCountEmployer(@Param("name") String name, @Param("userid") String userid,
			@Param("parameterid") String parameterid, @Param("stateid") String stateid);

	// 查看需求详情
	public DemandInfoBean getDemandInfoBean(@Param("demandid") String demandid);

	// 查找投标记录
	public ArrayList<BidBean> getBidList(@Param("demandid") String demandid);

	// 我要投标
	public List<DemandBean> countDemand(@Param(value = "demandTitle") String demandTitle);

	public List<DemandBean> demand(@Param("demandTitle") String demandTitle, @Param("page") int page);

	public List<DemandBean> findInfo(int demandId);

	public String findFromUserName(int demandId);

	public String findToUserName(int demandId);

	public String findParameterName(int demandId);

	public String findStateName(int demandId);

	public void changeInfo(@Param("demandId2") int demandId2,
			@Param("demandDetailInformation2") String demandDetailInformation2,
			@Param("securityMoney2") int securityMoney2, @Param("dealMoney2") int dealMoney2,
			@Param("completeTime2") String completeTime2, @Param("auctionTime2") String auctionTime2,
			@Param("demandHead2") String demandHead2);

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

	public List<String> type();// 顾问类型

	public List<CounselorBean> select(@Param("account") String account);// 查询用户是否申请

	public int applyFor(CounselorBean cb);// 提交申请

	public List<CounselorBean> conditionQuery(@Param("state") int state, @Param("page") int page);// 条件查询

	public int countCounserlor(@Param("state") int state);// 总数

	public int applyForOk(@Param("account") String account);// 审核通过

	public int forbidden(@Param("account") String account);// 禁用

	public int start(@Param("account") String account);// 启用

	public List<ApplicationBean> selectApplyFor(@Param("state") int state, @Param("page") int page,
			@Param("userId") int userId);// 查询申请找顾问的条数

	public int countApplyFor(@Param("userId") int userId, @Param("state") int state);// 查询申请找顾问的总条数

	public int applyFprPass(@Param("id") int id);// 确认通过雇主审核

	public int applyFprreFuse(@Param("id") int id);// 拒绝通过雇主审核

	public int applyFprPass2(@Param("id") int id);// 确认通过雇主审核 --申请表

	public int applyFprreFuse2(@Param("id") int id);// 拒绝通过雇主审核 --申请表

	public String daily(@Param("dailyDate") String dailyDate);// 查询当天日报是否提交过

	public int sumbit(@Param("content") String content, @Param("processId") int processId);// 提交日报

	public List<DemandBeanX> particulars(@Param("demandId") int demandId);// 详细信息

	public String selectType(@Param("parameterid") int parameterid);// 查询类型

	public List<Integer> serialNum(@Param("account") String account);// 查询顾问所接项目编号

	public List<DailyBean> selectDaily(@Param("parameterId") int parameterId,
			@Param("page") int page);// 查询详细项目内容

	public int countDaily(@Param("parameterId") int parameterId);// 查询项目日报总数

	public String detailsState(@Param("demandid")int demandid);// 查询详细项目状态
	
	public int selectId(@Param("account") String account);// 查找Id
	
	public int failure(@Param("demandid")int demandid);// 项目失败
	
	public int pass(@Param("demandid")int demandid);// 项目成功
	
	public int failure1(@Param("demandid")int demandid);// 项目失败
	
	public String selectEvaluate(@Param("demandid")int demandid);// 查评价
	
	public int selectTime(@Param("demandid")int demandid);// 查询项目时间
	
	public  List<DemandBeanX> countAccomplish(@Param("adviserid")int adviserid,@Param("state")int state,@Param("page")int page);// 查询所接项目
	
	public int countNumber(@Param("adviserid")int adviserid,@Param("state")int state);// 查询所接项目总数
	
	public int projectEvaluation(@Param("demandId")int demandId,@Param("content")String content);// 项目评价

	public int sEvaluation(@Param("dailyId") int dailyId,@Param("notation")String notation,@Param("radio")String radio);// 提交评价
	// 获取所有顾问列表

	public ArrayList<CounselorInfoBean> getCounselorInfoList();

	// 增加找顾问记录
	public int addCons(@Param("employerId") String employerId, @Param("consultantId") String consultantId,
			@Param("demandId") String demandId, @Param("stateId") String stateId);

	// 获取供应商投标列表
	public ArrayList<DemandInfoBean> getsupplierBidList(@Param("userid") String userid);

	// 增加合同记录
	public int addContrac(@Param("demandid") String demandid, @Param("fromuserid") String fromuserid,
			@Param("fromtime") String fromtime, @Param("touserid") String touserid,
			@Param("contractpath") String contractpath);

	// 交易任务表加数据 #{demandId},#{projectSchedule},#{startTime},#{auditState}
	public int addDemandDeal(@Param("demandId") String demandId, @Param("projectSchedule") String projectSchedule,
			@Param("auditState") String auditState);

	// 获取合同信息
	public ContractBean getContract(@Param("demandid") String demandid);

	// 修改合同
	public int updateContract(@Param("toTime") String toTime, @Param("contractPath") String contractPath,
			@Param("stateId") String stateId, @Param("demandId") String demandId);

	// 修改任务状态
	public int updateDemandDeal(@Param("demandId") String demandId, @Param("auditState") String auditState,
			@Param("startTime") String startTime);

	// 服务商总页数 10/7
	public int demandCountFacilitator(@Param("name") String name, @Param("userid") String userid,
			@Param("parameterid") String parameterid, @Param("stateid") String stateid);

	// 服务商任务列表 getDemandInfoFacilitatorList
	public ArrayList<DemandInfoBean> getDemandInfoFacilitatorList(@Param("star") String star, @Param("end") String end,
			@Param("name") String name, @Param("userid") String userid, @Param("parameterid") String parameterid,
			@Param("stateid") String stateid);

	// 获取用户余额
	public double getUserMoney(@Param("userId") String userId);

	// 更新用户金额
	public int updateUserMoney(@Param("userId") String userId, @Param("userMoney") String userMoney);

	// 插入交易记录
	public int addFund(@Param("userId") String userId, @Param("businessId") String businessId,
			@Param("toUserId") String toUserId, @Param("dealMoney") String dealMoney);
	//查看用户是否已经投标
	public BidBean getBidBean(@Param("userId") String userId,@Param("demandId") String demandId);
	
	//投标退款
	public ArrayList<BidBean> refundBid(@Param("userId") String userId,@Param("demandId") String demandId);
	
	//交易结果，评价和状态用来判断付款
	public DemandDealBean getDemandDealBean(@Param("demandId") String demandId);
	//获取顾问信息
	public CounselorInfoBean getCounselorInfoXX (@Param("userid") String userid);
}
