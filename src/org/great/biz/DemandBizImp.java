package org.great.biz;

import java.io.File;
import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.ApplicationBean;
import org.great.bean.BidBean;
import org.great.bean.ContractBean;
import org.great.bean.CounselorBean;
import org.great.bean.DailyBean;
import org.great.bean.CounselorInfoBean;
import org.great.bean.DemandBean;
import org.great.bean.DemandBeanX;
import org.great.bean.DemandInfoBean;
import org.great.bean.ParameterBean;
import org.great.bean.QueryBean;
import org.great.bean.UpdateDemandBean;
import org.great.mapper.DemandMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class DemandBizImp implements DemandBiz {
	@Resource
	private DemandMapper demandMapper;
	private int star;
	private int end;
	@Resource
	private QueryBean queryBean;

	@Override
	public int addDemand(HttpServletRequest request, String userId, String demandTitle, String demandInformation,
			String parameterId, MultipartFile file, String dealMoney, String securityMoney) {
		String demandHead = upLoadFile(request, file);
		System.out.println("demandHead="+demandHead);
		if(demandHead == null || demandHead == ""){
			demandHead="noimg.gif";
		}
		return demandMapper.addDemand(demandTitle, demandInformation, parameterId, userId, demandHead, dealMoney,
				securityMoney);
	}

	public String upLoadFile(HttpServletRequest request, MultipartFile file) {

		String path = request.getServletContext().getRealPath("/images/");

		String filename = file.getOriginalFilename();

		File filepath = new File(path, filename);

		if (!filepath.getParentFile().exists()) {
			filepath.getParentFile().mkdirs();
		}
		String uploadDocName = "";
		if (filename != null && filename != "") {
			uploadDocName = System.currentTimeMillis() + "@" + filename;
			try {
				file.transferTo(new File(path + File.separator + uploadDocName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return uploadDocName;
	}

	@Override
	public ArrayList<ParameterBean> getParmater() {
		// 获取参数
		return demandMapper.getParameter();
	}

	@Override
	public ArrayList<DemandBeanX> getDemandList(int page, String name) {

		end = page * 8;
		star = end - 7;

		queryBean = new QueryBean(name, star, end);
		return demandMapper.getDemandList(queryBean);
	}

	@Override
	public int demandCount(String name) {

		int count = demandMapper.demandCount(name);
		int size = 8;
		int countpage = 0;
		if (count % size != 0) {
			countpage = count / size + 1;
		} else {
			countpage = count / size;
		}

		return countpage;
	}

	@Override
	public List<Object> queayDemandList(String state, String page, String searchName) {
		// ajax
		
		List<Object> list = new ArrayList<Object>();
		int getPage = Integer.parseInt(page);

		int count = demandMapper.demandCount(searchName);

		int countPage = (int) Math.ceil(((float) count) / 8);

		if (state == null) {
			state = "";
		}

		if (state.equals("next") && getPage < countPage) {
			getPage++;
		} else if (state.equals("last") && getPage > 1) {
			getPage--;
		} else if (state.equals("jump")) {

		} else if (state.equals("query")) {
			getPage = 1;
		}

		end = getPage * 8;
		star = end - 7;
		queryBean = new QueryBean(searchName, star, end);
		
		list.add(getPage);
		list.add(countPage);
		list.add(demandMapper.getDemandList(queryBean));

		return list;
	}

	@Override
	public DemandInfoBean getDemandInfoBean(String demandid) {
		// TODO Auto-generated method stub
		return demandMapper.getDemandInfoBean(demandid);
	}

	@Override
	public ArrayList<BidBean> getBidList(String demandid) {
		// TODO Auto-generated method stub
		return demandMapper.getBidList(demandid);
	}

	@Override
	public int addBid(String userid, String demandid) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);

		return demandMapper.addBid(userid, demandid, time);
	}

	@Override
	public List<DemandBean> countDemand(String demandTitle) {
		// TODO Auto-generated method stub
		if (demandTitle != null) {
			demandTitle = "%" + demandTitle + "%";
		}
		return demandMapper.countDemand(demandTitle);
	}

	@Override
	public List<DemandBean> demand(String demandTitle, int page) {
		// TODO Auto-generated method stub
		if (demandTitle != null) {
			demandTitle = "%" + demandTitle + "%";
		}
		return demandMapper.demand(demandTitle, page);
	}

	/*
	 * @Override public List<DemandBean> countDemand2(String demandTitle) { //
	 * TODO Auto-generated method stub demandTitle="%"+demandTitle+"%"; return
	 * demandMapper.countDemand2(demandTitle); }
	 */
	@Override
	public List<DemandBean> findInfo(int demandId) {
		// TODO Auto-generated method stub
		return demandMapper.findInfo(demandId);
	}

	@Override
	public String findFromUserName(int demandId) {
		// TODO Auto-generated method stub
		return demandMapper.findFromUserName(demandId);
	}

	@Override
	public String findToUserName(int demandId) {
		// TODO Auto-generated method stub
		return demandMapper.findToUserName(demandId);
	}

	@Override
	public String findParameterName(int demandId) {
		// TODO Auto-generated method stub
		return demandMapper.findParameterName(demandId);
	}

	@Override
	public String findStateName(int demandId) {
		// TODO Auto-generated method stub
		return demandMapper.findStateName(demandId);
	}

	@Override
	public void changeInfo(int demandId2, String demandDetailInformation2, int securityMoney2, int dealMoney2,
			String completeTime2, String auctionTime2, String demandHead2) {
		demandMapper.changeInfo(demandId2, demandDetailInformation2, securityMoney2, dealMoney2, completeTime2,
				auctionTime2, demandHead2);

		// TODO Auto-generated method stub

	}

	@Override
	public void changeState(int demandId, int stateId) {
		demandMapper.changeState(demandId);
		// TODO Auto-generated method stub

	}

	@Override
	public void changeState2(int demandId, int stateId) {
		demandMapper.changeState2(demandId);
		// TODO Auto-generated method stub

	}

	@Override
	public void changeState3(int demandId, int stateId) {
		demandMapper.changeState3(demandId);
		// TODO Auto-generated method stub

	}

	@Override
	public ArrayList<ParameterBean> getParmaterState() {
		// 需求状态列表
		return demandMapper.getParameterState();
	}

	@Override
	public ArrayList<DemandInfoBean> getDemandInfoList(int page, String name, String userid, String parameterid,
			String stateid) {
		// 9/27 新版搜索 显示6条数据
		end = page * 6;
		star = end - 5;

		return demandMapper.getDemandInfoList(star + "", end + "", name, userid, parameterid, stateid);
	}

	@Override
	public int updateDemand(UpdateDemandBean updateDemandBean) {
		// TODO Auto-generated method stub
		return demandMapper.updateDemand(updateDemandBean);
	}

	@Override
	public int demandCountEmployer(String name, String userid, String parameterid, String stateid) {
		// 雇主搜索总页数 9/28加
		return demandMapper.demandCountEmployer(name, userid, parameterid, stateid);
	}

	@Override
	public List<Object> queayDemandEmployerList(String userid, String state, String page, String searchName,
			String parameterid, String stateid) {
		// 雇主ajax
		List<Object> list = new ArrayList<Object>();

		int getPage = Integer.parseInt(page);

		int count = demandMapper.demandCountEmployer(searchName, userid, parameterid, stateid);

		int countPage = (int) Math.ceil(((float) count) / 6);

		if (state == null) {
			state = "";
		}

		if (state.equals("next") && getPage < countPage) {
			getPage++;
		} else if (state.equals("last") && getPage > 1) {
			getPage--;
		} else if (state.equals("jump")) {

		} else if (state.equals("query")) {
			getPage = 1;
		}

		end = getPage * 6;
		star = end - 5;
		list.add(getPage);
		list.add(countPage);
		list.add(count);
		list.add(demandMapper.getDemandInfoList(star + "", end + "", searchName, userid, parameterid, stateid));
		return list;
	}

	@Override
	public List<String> type() {
		// TODO Auto-generated method stub
		return demandMapper.type();
	}

	@Override
	public List<CounselorBean> select(String account) {
		// TODO Auto-generated method stub
		return demandMapper.select(account);
	}

	@Override
	public int applyFor(CounselorBean cb) {
		// TODO Auto-generated method stub
		return demandMapper.applyFor(cb);
	}

	@Override
	public List<CounselorBean> conditionQuery(int state, int page) {
		// TODO Auto-generated method stub
		return demandMapper.conditionQuery(state, page);
	}

	@Override
	public int countCounserlor(int state) {
		// TODO Auto-generated method stub
		return demandMapper.countCounserlor(state);
	}

	@Override
	public int applyForOk(String account) {
		// TODO Auto-generated method stub
		return demandMapper.applyForOk(account);
	}

	@Override
	public int forbidden(String account) {
		// TODO Auto-generated method stub
		return demandMapper.forbidden(account);
	}

	@Override
	public int start(String account) {
		// TODO Auto-generated method stub
		return demandMapper.start(account);
	}

	@Override
	public List<ApplicationBean> selectApplyFor(int state, int page, int userId) {
		// TODO Auto-generated method stub
		return demandMapper.selectApplyFor(state, page, userId);
	}

	@Override
	public int countApplyFor(int userId, int state) {
		// TODO Auto-generated method stub
		return demandMapper.countApplyFor(userId, state);
	}

	@Override
	public int applyFprPass(int id) {
		// TODO Auto-generated method stub
		return demandMapper.applyFprPass(id);
	}

	@Override
	public int applyFprreFuse(int id) {
		// TODO Auto-generated method stub
		return demandMapper.applyFprreFuse(id);
	}

	@Override
	public int applyFprPass2(int id) {
		// TODO Auto-generated method stub
		return demandMapper.applyFprPass2(id);
	}

	@Override
	public int applyFprreFuse2(int id) {
		// TODO Auto-generated method stub
		return demandMapper.applyFprreFuse2(id);
	}

	@Override
	public String daily(String dailyDate) {
		// TODO Auto-generated method stub
		if (dailyDate != null) {
			dailyDate = "%" + dailyDate + "%";
		}
		return demandMapper.daily(dailyDate);
	}

	@Override
	public int sumbit(String content, int processId) {
		// TODO Auto-generated method stub
		System.out.println("content=" + content + "processId=" + processId);
		return demandMapper.sumbit(content, processId);
	}

	@Override
	public List<DemandBeanX> particulars(int demandId) {
		// TODO Auto-generated method stub
		return demandMapper.particulars(demandId);
	}

	@Override
	public String selectType(int parameterid) {
		// TODO Auto-generated method stub
		return demandMapper.selectType(parameterid);
	}

	@Override
	public List<Integer> serialNum(String account) {
		// TODO Auto-generated method stub
		return demandMapper.serialNum(account);
	}

	@Override
	public int countDaily(int parameterId, String evaluation) {
		// TODO Auto-generated method stub
		if (evaluation != null && "" != evaluation) {
			evaluation = "%" + evaluation + "%";
		}
		return demandMapper.countDaily(parameterId, evaluation);
	}

	@Override
	public List<DailyBean> selectDaily(int parameterId, String state, int page) {
		// TODO Auto-generated method stub
		if (state != null && "" != state) {
			state = "%" + state + "%";
		}
		return demandMapper.selectDaily(parameterId, state, page);
	}

	@Override
	public int selectId(String account) {
		// TODO Auto-generated method stub
		return demandMapper.selectId(account);
	}

	
	@Override
	public ArrayList<CounselorInfoBean> getCounselorInfoList() {
		// TODO Auto-generated method stub
		return demandMapper.getCounselorInfoList();
	}

	@Override
	public int addConsultantRecords(String employerId, String consultantId, String demandId) {
		// TODO Auto-generated method stub
		return demandMapper.addCons(employerId, consultantId, demandId, "902");
	}

	@Override
	public ArrayList<DemandInfoBean> getsupplierBidList(String userid) {
		// TODO Auto-generated method stub
		return demandMapper.getsupplierBidList(userid);
	}

	@Override
	public int addContrac(HttpServletRequest request, String demandid, MultipartFile file) {
		String demandHead = upLoadFile(request, file);

		DemandInfoBean bean = demandMapper.getDemandInfoBean(demandid);
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String fromtime = format.format(date);
		// 合同表插入数据
		demandMapper.addContrac(demandid, bean.getFromUserBean().getUserId() + "", fromtime,
				bean.getToUserBean().getUserId() + "", demandHead);
		// 改需求表状态
		UpdateDemandBean updateDemandBean = new UpdateDemandBean();
		updateDemandBean.setStateId("2061");
		updateDemandBean.setDemandId(demandid);
		demandMapper.updateDemand(updateDemandBean);
		// 插入
		demandMapper.addDemandDeal(demandid, bean.getCompleteTime(), "2082");
		return 0;
	}

	@Override
	public ContractBean getContract(String demandid) {
		// TODO Auto-generated method stub
		return demandMapper.getContract(demandid);
	}

	@Override
	public void updateConteact(HttpServletRequest request, String demandid, MultipartFile file) {
		// 改合同状态
		String contractPath = upLoadFile(request, file);
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String totime = format.format(date);
		demandMapper.updateContract(totime, contractPath, "2042", demandid);
		// 改需求表状态
		UpdateDemandBean updateDemandBean = new UpdateDemandBean();
		updateDemandBean.setStateId("1863");
		updateDemandBean.setDemandId(demandid);
		demandMapper.updateDemand(updateDemandBean);
		//修改任务表状态
		demandMapper.updateDemandDeal(demandid, "2083", totime);
	}

	@Override
	public void submissionDemand(HttpServletRequest request, String demandid, MultipartFile file) {
		//文件路径
		String filePath = upLoadFile(request, file);
		// 改需求表状态
				UpdateDemandBean updateDemandBean = new UpdateDemandBean();
				updateDemandBean.setFilePath(filePath);
				updateDemandBean.setDemandId(demandid);
				updateDemandBean.setStateId("2272");
				demandMapper.updateDemand(updateDemandBean);
				//修改任务表状态
				demandMapper.updateDemandDeal(demandid,"2084",null);
	}

	@Override
	public void updateDemandInfo(HttpServletRequest request, String demandTitle, String demandInformation,
			String parameterId, MultipartFile file, String dealMoney, String securityMoney,String demandid) {
		String demandHead = upLoadFile(request, file);
		UpdateDemandBean updateDemandBean = new UpdateDemandBean();
		updateDemandBean.setDemandId(demandid);
		updateDemandBean.setDemandTitle(demandTitle);
		updateDemandBean.setDemandDetaIlinformation(demandInformation);
		updateDemandBean.setParameterId(parameterId);
		updateDemandBean.setDealMoney(dealMoney);
		updateDemandBean.setSecurityMoney(securityMoney);
		updateDemandBean.setDemandHead(demandHead);
		demandMapper.updateDemand(updateDemandBean);
		
	}

	@Override
	public List<Object> selectDemandFacilitator(String userid, String state, String page, String searchName,
			String parameterid, String stateid) {
		// 服务商ajax
				List<Object> list = new ArrayList<Object>();

				int getPage = Integer.parseInt(page);

				int count = demandMapper.demandCountFacilitator(searchName, userid, parameterid, stateid);

				int countPage = (int) Math.ceil(((float) count) / 6);

				if (state == null) {
					state = "";
				}

				if (state.equals("next") && getPage < countPage) {
					getPage++;
				} else if (state.equals("last") && getPage > 1) {
					getPage--;
				} else if (state.equals("jump")) {

				} else if (state.equals("query")) {
					getPage = 1;
				}
				
				end = getPage * 6;
				star = end - 5;
				list.add(getPage);
				list.add(countPage);
				list.add(count);
				list.add(demandMapper.getDemandInfoFacilitatorList(star + "", end + "", searchName, userid, parameterid, stateid));
				return list;
		
	}

	@Override
	public int demandCountFacilitator(String name, String userid, String parameterid, String stateid) {
		// TODO Auto-generated method stub
		return demandMapper.demandCountFacilitator(name, userid, parameterid, stateid);
	}

	@Override
	public ArrayList<DemandInfoBean> getDemandInfoFacilitatorList(String star, String end, String name, String userid,
			String parameterid, String stateid) {
		// TODO Auto-generated method stub
		return demandMapper.getDemandInfoFacilitatorList(star, end, name, userid, parameterid, stateid);
	}

	@Override
	public String detailsState(int demandid) {
		// TODO Auto-generated method stub
		
		return demandMapper.detailsState(demandid);
	}

	@Override
	public int sEvaluation(int dailyId, String notation, String radio) {
		// TODO Auto-generated method stub
		return demandMapper.sEvaluation(dailyId, notation, radio);
	}

	@Override
	public int projectEvaluation(int demandId, String content) {
		// TODO Auto-generated method stub
		return demandMapper.projectEvaluation(demandId, content);
	}
}
