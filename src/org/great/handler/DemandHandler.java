package org.great.handler;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.BidBean;
import org.great.bean.DemandBeanX;
import org.great.bean.DemandInfoBean;
import org.great.bean.ParameterBean;
import org.great.bean.QueryBean;
import org.great.bean.UpdateDemandBean;
import org.great.bean.UserBean;
import org.great.biz.DemandBiz;
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
	private int  count;//总条数
	@Resource
	private DemandBiz demandBizImp;
	@Resource
	private UserBean userBean;
	@RequestMapping("/fromDemand.action") // 进入发布页面
	public ModelAndView fromDemand(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsp/releaseRequirements");
		ArrayList<ParameterBean> parameterBeans = new ArrayList<>();
		parameterBeans = demandBizImp.getParmater();
		request.setAttribute("parameterBeans", parameterBeans);
		return modelAndView;
	}

	@RequestMapping("/addDemand.action") // 提交
	public ModelAndView addDemand(HttpServletRequest request, String userid, String demandTitle,
			String demandInformation, String parameterId, MultipartFile file, String dealMoney, String securityMoney) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/user/returnHome.action");
		demandBizImp.addDemand(request, userid, demandTitle, demandInformation, parameterId, file, dealMoney,
				securityMoney);

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
		
		return modelAndView;
	}

	// addBid.action
	// ajax我要投标
	@RequestMapping("/addBid.action") // ajax分页跳转
	@ResponseBody
	public ArrayList<BidBean> addBid(HttpServletRequest request, String demandid) {

		userBean = (UserBean) request.getSession().getAttribute("user");

		demandBizImp.addBid(userBean.getUserId() + "", demandid);
		return demandBizImp.getBidList(demandid);
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
		
		request.setAttribute("page", page);
		
		count = demandBizImp.demandCountEmployer(null, userBean.getUserId() + "", "0", "0");
		int size = 6;
		int countpage = 0;
		if (count % size != 0) {
			countpage = count / size + 1;
		} else {
			countpage = count / size;
		}
		
		request.setAttribute("countpage", countpage);
		request.setAttribute("count", count);
		
		return modelAndView;
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
		return modelAndView;
	}
	//确定投标人
	@RequestMapping("/determineBid.action")
	public ModelAndView determineBid(HttpServletRequest request, String userid,String demandid) {
		ModelAndView modelAndView = new ModelAndView();
		UpdateDemandBean demandBean = new UpdateDemandBean();
		demandBean.setToUserId(userid);
		demandBean.setStateId("10");
		demandBean.setDemandId(demandid);
		demandBizImp.updateDemand(demandBean);
		modelAndView.setViewName("redirect:/demand/goDemandControl.action");
		return modelAndView;
	}
	//ajax 返回供应商查看
	// ajax分页查询
		@RequestMapping("/selectDemandEmployer.action") // ajax分页跳转
		@ResponseBody
		public List<Object> selectDemandEmployer(String userid,String state, String page, String searchName,String parameterid,String stateid ) {
			
			return demandBizImp.queayDemandEmployerList(userid, state, page, searchName, parameterid, stateid);
		}
}
