package org.great.handler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.AuthorityBean;
import org.great.bean.BidBean;
import org.great.bean.DailyBean;
import org.great.bean.DemandBean;
import org.great.bean.DemandBeanX;
import org.great.bean.DemandInfoBean;
import org.great.bean.ParameterBean;
import org.great.bean.QueryBean;
import org.great.bean.UpdateDemandBean;
import org.great.bean.UserBean;
import org.great.biz.DemandBiz;
import org.great.mapper.AuthoriyMapper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/demand") // 用户的handler包
public class DemandHandler {
	private int page;// 当前也
	private int countpage;// 总页
	private String searchName;
	private int count;// 总条数

	@Resource
	private DemandBiz demandBizImp;
	@Resource
	private AuthoriyMapper authoriyMapper;

	@Resource
	private UserBean userBean;

	@RequestMapping("/fromDemand.action") // 进入发布页面
	public ModelAndView fromDemand(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsp/releaseRequirements");
		request.setAttribute("parameterBeans", demandBizImp.getParmater());
		// ------------菜单------
		UserBean ub = (UserBean) request.getSession().getAttribute("user");
		ArrayList<AuthorityBean> menuList = new ArrayList<AuthorityBean>();
		menuList = authoriyMapper.findOwnSubclassMenu(ub.getUserId());
		request.setAttribute("menuList", menuList);
		// ---------------------
		return modelAndView;
	}

	@RequestMapping("/addDemand.action") // 提交
	public ModelAndView addDemand(HttpServletRequest request, String userid, String demandTitle,
			String demandInformation, String parameterId, MultipartFile file, String dealMoney, String securityMoney) {
		ModelAndView modelAndView = new ModelAndView();

		demandBizImp.addDemand(request, userid, demandTitle, demandInformation, parameterId, file, dealMoney,
				securityMoney);
		modelAndView.setViewName("redirect:/demand/goDemandControl.action");
		return modelAndView;
	}

	// checkTheDemand .jsp 供应商查看需求
	@RequestMapping("/toDemand.action")
	public ModelAndView toDemand(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsp/checkTheDemand");
		page = 1;
		ArrayList<DemandBeanX> demandBeans = demandBizImp.getDemandList(page, null);
		countpage = demandBizImp.demandCount(null);
		request.setAttribute("demandBeans", demandBeans);
		request.setAttribute("page", page);
		request.setAttribute("countpage", countpage);
		return modelAndView;
	}

	// ajax分页查询
	@RequestMapping("/selectDemand.action") // ajax分页跳转
	@ResponseBody
	public List<Object> selectDemand(String state, String page, String searchName) {

		return demandBizImp.queayDemandList(state, page, searchName);
	}

	// 查看需求详情 demandInfo.jsp
	@RequestMapping("/queryDemand.action")
	public ModelAndView queryDemand(HttpServletRequest request, String demandid) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsp/demandInfo");
		request.setAttribute("demandInfo", demandBizImp.getDemandInfoBean(demandid));

		request.setAttribute("bidList", demandBizImp.getBidList(demandid));
		page = 1;
		ArrayList<DemandBeanX> demandBeans = demandBizImp.getDemandList(page, null);
		countpage = demandBizImp.demandCount(null);
		request.setAttribute("demandBeans", demandBeans);
		return modelAndView;
	}

	// addBid.action
	// ajax我要投标
	@RequestMapping("/addBid.action") // ajax分页跳转
	@ResponseBody
	public List<Object> addBid(HttpServletRequest request, String demandid, String securityMoney) {
		System.out.println(demandid);
		System.out.println("securityMoney=" + securityMoney);
		userBean = (UserBean) request.getSession().getAttribute("user");

		return demandBizImp.addBidAjax(userBean.getUserId() + "", demandid, securityMoney);
	}

	//// 雇主进入个人中心查看已发布需求 demandControl 9/27
	@RequestMapping("/goDemandControl.action")
	public ModelAndView goDemandControl(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsp/demandControl");
		userBean = (UserBean) request.getSession().getAttribute("user");
		page = 1;
		// 获取需求类型表
		request.setAttribute("parameterBeans", demandBizImp.getParmater());
		// 获取需求状态表
		request.setAttribute("stateParmeter", demandBizImp.getParmaterState());
		// 获取需求列表
		request.setAttribute("demandInfo",
				demandBizImp.getDemandInfoList(page, null, userBean.getUserId() + "", "0", "0"));

		count = demandBizImp.demandCountEmployer(null, userBean.getUserId() + "", "0", "0");
		int size = 6;
		int countpage = 0;
		if (count % size != 0) {
			countpage = count / size + 1;
		} else {
			countpage = count / size;
		}
		request.setAttribute("page", page);
		request.setAttribute("countpage", countpage);
		request.setAttribute("count", count);

		// ------------菜单------
		ArrayList<AuthorityBean> menuList = new ArrayList<AuthorityBean>();
		menuList = authoriyMapper.findOwnSubclassMenu(userBean.getUserId());
		request.setAttribute("menuList", menuList);
		// ---------------------

		return modelAndView;
	}

	@RequestMapping("/page.action")
	public ModelAndView test(HttpServletRequest request, String demandTitle, String page, String number) {
		List<DemandBean> demand = demandBizImp.countDemand(demandTitle);
		int countPage = demand.size();
		int totalPages = countPage / 5 + ((countPage % 5) > 0 ? 1 : 0);// 定义总页数
		int num = Integer.parseInt(number);
		if (page.equals("tpage")) {
			num--;
			if (num <= 0) {
				num = 1;
			}
		} else if (page.equals("npage")) {
			num++;
			if (totalPages < num) {
				num = totalPages;
			}

		}

		List<DemandBean> list = new ArrayList<DemandBean>();
		list = demandBizImp.demand(demandTitle, num);

		request.setAttribute("Flist", list);
		request.setAttribute("countPage", totalPages);
		request.setAttribute("num", num);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsp/demandManager");
		return modelAndView;

	}

	@RequestMapping("/selectPage.action")
	@ResponseBody
	public List<Object> selectPage(String demandTitle, String page, String number) {
		if (number == "") {
			number = "1";
		}
		int countPage = 0;
		List<Object> list1 = new ArrayList<>();

		List<DemandBean> demand = demandBizImp.countDemand(demandTitle);
		countPage = demand.size();// 总用户数

		int totalPages = countPage / 5 + ((countPage % 5) > 0 ? 1 : 0);// 定义总页数
		int num = Integer.parseInt(number);
		if (page.equals("tpage")) {
			num--;
			if (num <= 0) {
				num = 1;
			}
		} else if (page.equals("npage")) {
			num++;
			if (totalPages < num) {
				num = totalPages;
			}

		} else if (page.equals("page")) {
			if (num > totalPages) {
				num = totalPages;
			} else if (num < 0) {
				num = 1;
			}
		}

		List<DemandBean> list = new ArrayList<DemandBean>();
		list = demandBizImp.demand(demandTitle, num);
		list1.add(list);
		list1.add(num);
		list1.add(totalPages);
		return list1;

	}

	@RequestMapping("/findById.action")
	@ResponseBody
	public List<Object> test(int demandId) {
		List<Object> list = new ArrayList<>();
		List<DemandBean> list1 = demandBizImp.findInfo(demandId);
		String fromUserName = demandBizImp.findFromUserName(demandId);
		String toUserName = demandBizImp.findToUserName(demandId);
		String parameterName = demandBizImp.findParameterName(demandId);
		String stateName = demandBizImp.findStateName(demandId);
		list.add(fromUserName);
		list.add(toUserName);
		list.add(parameterName);
		list.add(stateName);
		list.add(list1);

		return list;

	}

	@RequestMapping("changeInfo.action")
	public ModelAndView test(HttpServletRequest request) {
		String demandId2 = request.getParameter("demandId2");
		String demandDetailInformation2 = request.getParameter("demandDetailInformation2");
		String securityMoney2 = request.getParameter("securityMoney2");
		String dealMoney2 = request.getParameter("dealMoney2");
		String completeTime2 = request.getParameter("completeTime2");
		String auctionTime2 = request.getParameter("auctionTime2");
	/*	String demandHead2 = request.getParameter("demandHead2");*/
		demandBizImp.changeInfo(Integer.valueOf(demandId2), demandDetailInformation2, Integer.valueOf(securityMoney2),
				Integer.valueOf(dealMoney2), completeTime2, auctionTime2);

		ModelAndView modelAndView = new ModelAndView("redirect:/demand/page.action?page=tpage&number=1");

		return modelAndView;

	}

	@RequestMapping("/changeState.action")
	@ResponseBody
	public List<Object> test(String demandTitle, String demandId, String stateId, String number, String page) {
		int num = Integer.valueOf(number);
		int stateId2 = Integer.valueOf(stateId);
		if (stateId2 == 3) {
			demandBizImp.changeState(Integer.valueOf(demandId), Integer.valueOf(stateId));// 删除
		} else if (stateId2 == 1) {
			demandBizImp.changeState2(Integer.valueOf(demandId), Integer.valueOf(stateId));// 审核通过
		} else if (stateId2 == 2) {
			demandBizImp.changeState3(Integer.valueOf(demandId), Integer.valueOf(stateId));// 违规下架
		}

		if (number == "") {
			number = "1";
		}
		int countPage = 0;
		List<Object> list1 = new ArrayList<>();

		List<DemandBean> demand = demandBizImp.countDemand(demandTitle);
		countPage = demand.size();// 总用户数

		int totalPages = countPage / 5 + ((countPage % 5) > 0 ? 1 : 0);// 定义总页数

		if (page.equals("tpage")) {
			num--;
			if (num <= 0) {
				num = 1;
			}
		} else if (page.equals("npage")) {
			num++;
			if (totalPages < num) {
				num = totalPages;
			}

		} else if (page.equals("page")) {
			if (num > totalPages) {
				num = totalPages;
			} else if (num < 0) {
				num = 1;
			}
		}

		List<DemandBean> list = new ArrayList<DemandBean>();
		list = demandBizImp.demand(demandTitle, num);
		list1.add(list);
		list1.add(num);
		list1.add(totalPages);
		return list1;
	}

	// 雇主进入查看投标详情 bidControl 9/27
	@RequestMapping("/gobidControl.action")
	public ModelAndView gobidControl(HttpServletRequest request, String demandid) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsp/bidControl");
		count = demandBizImp.getBidList(demandid).size();
		request.setAttribute("demandInfo", demandBizImp.getDemandInfoBean(demandid));
		request.setAttribute("bidList", demandBizImp.getBidList(demandid));
		request.setAttribute("count", count);
		// ------------菜单------
		userBean = (UserBean) request.getSession().getAttribute("user");
		ArrayList<AuthorityBean> menuList = new ArrayList<AuthorityBean>();
		menuList = authoriyMapper.findOwnSubclassMenu(userBean.getUserId());
		request.setAttribute("menuList", menuList);
		// ---------------------
		return modelAndView;
	}

	// 确定投标人
	@RequestMapping("/determineBid.action")
	public ModelAndView determineBid(HttpServletRequest request, String userid, String demandid, String securityMoney) {
		ModelAndView modelAndView = new ModelAndView();
		UpdateDemandBean demandBean = new UpdateDemandBean();
		demandBean.setToUserId(userid);
		demandBean.setStateId("10");
		demandBean.setDemandId(demandid);
		demandBizImp.updateDemand(demandBean);
		// 将未投标成功的用户的钱款退回
		demandBizImp.refundBid(userid, demandid, securityMoney);
		modelAndView.setViewName("redirect:/demand/goDemandControl.action");
		return modelAndView;
	}

	// ajax 返回供应商查看
	// ajax分页查询
	@RequestMapping("/selectDemandEmployer.action") // ajax分页跳转
	@ResponseBody
	public List<Object> selectDemandEmployer(String userid, String state, String page, String searchName,
			String parameterid, String stateid) {

		return demandBizImp.queayDemandEmployerList(userid, state, page, searchName, parameterid, stateid);
	}

	// 跳转到找顾问页面
	@RequestMapping("/LookingForConsultant.action")
	public ModelAndView LookingForConsultant(HttpServletRequest request, String demandid) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsp/LookingForConsultant");
		// ------------菜单------
		userBean = (UserBean) request.getSession().getAttribute("user");
		ArrayList<AuthorityBean> menuList = new ArrayList<AuthorityBean>();
		menuList = authoriyMapper.findOwnSubclassMenu(userBean.getUserId());
		request.setAttribute("menuList", menuList);
		// ---------------------
		count = demandBizImp.getCounselorInfoList().size();// 顾问人数
		request.setAttribute("demandInfo", demandBizImp.getDemandInfoBean(demandid));// 产品信息
		request.setAttribute("consList", demandBizImp.getCounselorInfoList());// 顾问列表
		request.setAttribute("count", count);
		return modelAndView;
	}

	// 申请顾问帮助
	@RequestMapping("/applicationConsultant.action")
	public ModelAndView applicationConsultant(HttpServletRequest request, String userid, String demandid) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/demand/goDemandControl.action");
		// add申请 1862
		UpdateDemandBean demandBean = new UpdateDemandBean();
		demandBean.setStateId("1862");
		demandBean.setDemandId(demandid);
		demandBizImp.updateDemand(demandBean);
		userBean = (UserBean) request.getSession().getAttribute("user");
		demandBizImp.addConsultantRecords(userBean.getUserId() + "", userid, demandid);
		return modelAndView;
	}

	// 服务商投标成功后获取的任务 supplierBid
	@RequestMapping("/goSupplierBid.action")
	public ModelAndView goSupplierBid(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		// ------------菜单------
		userBean = (UserBean) request.getSession().getAttribute("user");
		ArrayList<AuthorityBean> menuList = new ArrayList<AuthorityBean>();
		menuList = authoriyMapper.findOwnSubclassMenu(userBean.getUserId());
		request.setAttribute("menuList", menuList);
		// ---------------------
		modelAndView.setViewName("jsp/supplierBid");
		// ArrayList<DemandInfoBean> list =
		// demandBizImp.getsupplierBidList(userBean.getUserId() + "");
		// 获取总条数
		count = demandBizImp.demandCountFacilitator("", userBean.getUserId() + "", "", "");
		// 获取需求类型表
		request.setAttribute("parameterBeans", demandBizImp.getParmater());
		request.setAttribute("count", count);
		request.setAttribute("demandInfo",
				demandBizImp.getDemandInfoFacilitatorList("1", "6", "", userBean.getUserId() + "", "", ""));

		int size = 6;
		int countpage = 0;
		if (count % size != 0) {
			countpage = count / size + 1;
		} else {
			countpage = count / size;
		}
		request.setAttribute("page", "1");
		request.setAttribute("countpage", countpage);

		return modelAndView;
	}

	@RequestMapping("/daily.action") // 查重日报
	public ModelAndView daily(HttpServletRequest request, String userid, String demandid) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String time = df.format(new Date());// new Date()为获取当前系统时间
		String a = demandBizImp.daily(time);
		if (a != null) {

			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("jsp/repetitionPage");
			return modelAndView;
		} else {
			ModelAndView modelAndView = new ModelAndView();
			request.setAttribute("demandid", demandid);
			modelAndView.setViewName("jsp/dailyPage");
			return modelAndView;
		}

	}

	@RequestMapping("/submit.action") // 提交日报
	public ModelAndView submit(HttpServletRequest request, String demandid, String content) {
		int demandId = Integer.parseInt(demandid);
		int a = demandBizImp.sumbit(content, demandId);
		if (a > 0) {

		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsp/dailyPage");
		return modelAndView;
	}

	// 开始投标，进入投标页
	@RequestMapping("/goDemandBid.action")
	public ModelAndView goDemandBid(HttpServletRequest request, String demandid) {
		ModelAndView modelAndView = new ModelAndView();
		// ------------菜单------
		userBean = (UserBean) request.getSession().getAttribute("user");
		ArrayList<AuthorityBean> menuList = new ArrayList<AuthorityBean>();
		menuList = authoriyMapper.findOwnSubclassMenu(userBean.getUserId());
		request.setAttribute("menuList", menuList);
		// ---------------------
		modelAndView.setViewName("jsp/demandBid");
		request.setAttribute("demandInfo", demandBizImp.getDemandInfoBean(demandid));
		return modelAndView;
	}

	// 修改需求信息，加工期，加开始时间，改状态，返回需求列表
	@RequestMapping("/stateDemandBid.action")
	public ModelAndView stateDemandBid(HttpServletRequest request, String completeTime, String demandid,
			String auctionTime) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/demand/goDemandControl.action");
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String publishTime = format.format(date);
		UpdateDemandBean demandBean = new UpdateDemandBean();
		demandBean.setDemandId(demandid);
		demandBean.setStateId("9");
		demandBean.setAuctionTime(auctionTime);
		demandBean.setCompleteTime(completeTime);
		demandBean.setPublishTime(publishTime);
		demandBizImp.updateDemand(demandBean);
		return modelAndView;
	}

	// 雇主上传合同，先进入合同页面 fromContract
	@RequestMapping("/goFromContract.action")
	public ModelAndView goFromContract(HttpServletRequest request, String demandid) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsp/fromContract");
		request.setAttribute("demandInfo", demandBizImp.getDemandInfoBean(demandid));

		// ------------菜单------
		userBean = (UserBean) request.getSession().getAttribute("user");
		ArrayList<AuthorityBean> menuList = new ArrayList<AuthorityBean>();
		menuList = authoriyMapper.findOwnSubclassMenu(userBean.getUserId());
		request.setAttribute("menuList", menuList);
		// ---------------------
		return modelAndView;
	}

	// 雇主提交合同
	@RequestMapping("/addContrac.action")
	public ModelAndView addContrac(HttpServletRequest request, String demandid, MultipartFile file) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/demand/goDemandControl.action");
		demandBizImp.addContrac(request, demandid, file);
		return modelAndView;
	}

	// 服务商进入合同页。下载合同，提交
	@RequestMapping("/goToContract.action")
	public ModelAndView goToContract(HttpServletRequest request, String demandid) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsp/toContract");
		// 获取产品信息
		request.setAttribute("demandInfo", demandBizImp.getDemandInfoBean(demandid));
		// 获取合同信息
		request.setAttribute("contract", demandBizImp.getContract(demandid));
		// ------------菜单------
		UserBean ub = (UserBean) request.getSession().getAttribute("user");
		ArrayList<AuthorityBean> menuList = new ArrayList<AuthorityBean>();
		menuList = authoriyMapper.findOwnSubclassMenu(ub.getUserId());
		request.setAttribute("menuList", menuList);
		// ---------------------
		return modelAndView;
	}

	// 服务商提交合同，提交后改状态，项目开始，
	@RequestMapping("/updateContrac.action")
	public ModelAndView updateContrac(HttpServletRequest request, String demandid, MultipartFile file) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/demand/goSupplierBid.action");
		demandBizImp.updateConteact(request, demandid, file);
		return modelAndView;
	}

	// 服务商返回任务表
	@RequestMapping("/returnContract.action")
	public ModelAndView returnContract(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/demand/goSupplierBid.action");
		return modelAndView;
	}

	// 雇主返回需求表
	@RequestMapping("/returnDemand.action")
	public ModelAndView returnDemand(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/demand/goDemandControl.action");
		return modelAndView;
	}

	// 进入提交项目页面 goSubmissionDemand.jsp
	@RequestMapping("/goSubmissionDemand.action")
	public ModelAndView goSubmissionDemand(HttpServletRequest request, String demandid) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsp/SubmissionDemand");
		// 获取产品信息
		request.setAttribute("demandInfo", demandBizImp.getDemandInfoBean(demandid));
		// ------------菜单------
		userBean = (UserBean) request.getSession().getAttribute("user");
		ArrayList<AuthorityBean> menuList = new ArrayList<AuthorityBean>();
		menuList = authoriyMapper.findOwnSubclassMenu(userBean.getUserId());
		request.setAttribute("menuList", menuList);
		// ---------------------
		return modelAndView;
	}

	// 提交项目
	@RequestMapping("/submissionDemand.action")
	public ModelAndView submissionDemand(HttpServletRequest request, String demandid, MultipartFile file) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/demand/goSupplierBid.action");
		demandBizImp.submissionDemand(request, demandid, file);
		return modelAndView;
	}

	// 雇主查看需求详情
	@RequestMapping("/queryDemandInfo.action")
	public ModelAndView queryDemandInfo(HttpServletRequest request, String demandid) {
		ModelAndView modelAndView = new ModelAndView();
		// ------------菜单------
		userBean = (UserBean) request.getSession().getAttribute("user");
		ArrayList<AuthorityBean> menuList = new ArrayList<AuthorityBean>();
		menuList = authoriyMapper.findOwnSubclassMenu(userBean.getUserId());
		request.setAttribute("menuList", menuList);
		// ---------------------
		// 获取产品信息
		modelAndView.setViewName("jsp/queryDemandInfo");
		request.setAttribute("demandInfo", demandBizImp.getDemandInfoBean(demandid));
		// 获取合同信息
		request.setAttribute("contract", demandBizImp.getContract(demandid));
		// 获取交易信息
		request.setAttribute("demandDeal", demandBizImp.getDemandDealBean(demandid));
		return modelAndView;
	}

	// 删除需求
	@RequestMapping("/delDemand.action")
	public ModelAndView delDemand(HttpServletRequest request, String demandid) {
		ModelAndView modelAndView = new ModelAndView();
		UpdateDemandBean demandBean = new UpdateDemandBean();
		demandBean.setStateId("7");
		demandBean.setDemandId(demandid);
		demandBizImp.updateDemand(demandBean);
		modelAndView.setViewName("redirect:/demand/goDemandControl.action");

		return modelAndView;
	}

	// 需求下线
	@RequestMapping("/demandDownline.action")
	public ModelAndView demandDownline(HttpServletRequest request, String demandid,String dealMoney,String securityMoney) {
		ModelAndView modelAndView = new ModelAndView();
		UpdateDemandBean demandBean = new UpdateDemandBean();
		demandBean.setStateId("1861");
		demandBean.setDemandId(demandid);
		demandBizImp.updateDemand(demandBean);
		modelAndView.setViewName("redirect:/demand/goDemandControl.action");
		userBean = (UserBean) request.getSession().getAttribute("user");
		demandBizImp.downline(userBean.getUserId()+"", demandid, dealMoney,securityMoney);
		return modelAndView;
	}

	// 重新提交需求Reapply
	@RequestMapping("/demandReapply.action")
	public ModelAndView demandReapply(HttpServletRequest request, String demandid) {
		ModelAndView modelAndView = new ModelAndView();
		UpdateDemandBean demandBean = new UpdateDemandBean();
		demandBean.setStateId("21");
		demandBean.setDemandId(demandid);
		demandBizImp.updateDemand(demandBean);
		modelAndView.setViewName("redirect:/demand/goDemandControl.action");

		return modelAndView;
	}

	// 进入修改页面demandInfoEdit.jsp
	@RequestMapping("/demandInfoEdit.action")
	public ModelAndView demandInfoEdit(HttpServletRequest request, String demandid) {
		ModelAndView modelAndView = new ModelAndView();
		// ------------菜单------
		userBean = (UserBean) request.getSession().getAttribute("user");
		ArrayList<AuthorityBean> menuList = new ArrayList<AuthorityBean>();
		menuList = authoriyMapper.findOwnSubclassMenu(userBean.getUserId());
		request.setAttribute("menuList", menuList);
		// ---------------------
		// 获取产品信息
		modelAndView.setViewName("jsp/demandInfoEdit");
		request.setAttribute("demandInfo", demandBizImp.getDemandInfoBean(demandid));
		request.setAttribute("parameterBeans", demandBizImp.getParmater());
		return modelAndView;
	}

	// 修改需求
	@RequestMapping("/updateDemandInfo.action")
	public ModelAndView updateDemandInfo(HttpServletRequest request, String demandTitle, String demandInformation,
			String parameterId, MultipartFile file, String dealMoney, String securityMoney, String demandid) {
		ModelAndView modelAndView = new ModelAndView();
		demandBizImp.updateDemandInfo(request, demandTitle, demandInformation, parameterId, file, dealMoney,
				securityMoney, demandid);
		modelAndView.setViewName("redirect:/demand/goDemandControl.action");
		return modelAndView;
	}

	// 服务商查看需求详情 facilitatorQueryDemandInfo.jsp
	@RequestMapping("/facilitatorQueryDemandInfo.action")
	public ModelAndView facilitatorQueryDemandInfo(HttpServletRequest request, String demandid) {
		ModelAndView modelAndView = new ModelAndView();
		// ------------菜单------
		userBean = (UserBean) request.getSession().getAttribute("user");
		ArrayList<AuthorityBean> menuList = new ArrayList<AuthorityBean>();
		menuList = authoriyMapper.findOwnSubclassMenu(userBean.getUserId());
		request.setAttribute("menuList", menuList);
		// ---------------------
		// 获取产品信息
		modelAndView.setViewName("jsp/facilitatorQueryDemandInfo");
		request.setAttribute("demandInfo", demandBizImp.getDemandInfoBean(demandid));
		// 获取合同信息
		request.setAttribute("contract", demandBizImp.getContract(demandid));
		// 获取交易信息
		request.setAttribute("demandDeal", demandBizImp.getDemandDealBean(demandid));
		return modelAndView;
	}

	// 服务商ajax分页查询
	@RequestMapping("/selectDemandFacilitator.action") // ajax分页跳转
	@ResponseBody
	public List<Object> selectDemandFacilitator(String userid, String state, String page, String searchName,
			String parameterid, String stateid) {

		return demandBizImp.selectDemandFacilitator(userid, state, page, searchName, parameterid, stateid);
	}

	// 申请顾问，改成ajax申请
	@RequestMapping("/applicationConsultantajax.action") // ajax分页跳转
	@ResponseBody
	public int applicationConsultantajax(String employerId, String consultantId, String demandId,
			String counselorMoney) {

		return demandBizImp.applicationConsultantajax(employerId, consultantId, demandId, counselorMoney);

	}

	// 开始投标，改成ajax申请
	// 修改需求信息，加工期，加开始时间，改状态，返回需求列表、
	@RequestMapping("/stateDemandBidajax.action") // ajax分页跳转
	@ResponseBody
	public int stateDemandBidajax(String uesrid, String completeTime, String demandid, String auctionTime,
			String dealMoney) {

		return demandBizImp.stateDemandBidajax(uesrid, completeTime, demandid, auctionTime, dealMoney);
	}

	// 完成交易。改状态，付款等等~complete
	// 服务商查看需求详情 complete.jsp
	@RequestMapping("/complete.action")
	public ModelAndView complete(HttpServletRequest request, String demandid,String toUserId,String dealMoney,String securityMoney) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/demand/queryDemandInfo.action?demandid="+demandid);
		
		demandBizImp.complete(demandid, toUserId, dealMoney, securityMoney);
		
		return modelAndView;
	}
}
