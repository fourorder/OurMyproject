package org.great.handler;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.AuthorityBean;
import org.great.bean.ConditionBean;
import org.great.bean.ParameterBean;
import org.great.bean.ProAndUserBean;
import org.great.bean.ProductionBean;
import org.great.bean.SessionBean;
import org.great.bean.UserBean;
import org.great.biz.ProductionBiz;

import org.great.mapper.AuthoriyMapper;
import org.great.mapper.ParameterMapper;
import org.great.mapper.ProAndUserMapper;
import org.great.mapper.ProductionMapper;
import org.great.mapper.SessionMapper;
import org.great.mapper.UserMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.config.AlipayConfig;

@Controller
@RequestMapping("/production")
public class ProductionHandler {
	@Resource
	private ParameterMapper parameterMapper;
	@Resource
	private ProductionMapper productionMapper;
	@Resource
	private AuthoriyMapper authoriyMapper;
	@Resource
	private ProductionBiz productionBizImp;
	@Resource
	private SessionMapper sessionMapper;
	@Resource
	private UserMapper userMapper;
	@Resource
	private ProAndUserMapper proAndUserMapper;
	
	

	@RequestMapping("/toProduction.action")
	public ModelAndView toProduction(HttpServletRequest request, String conditionName, String fieldName,Integer currentPage) {
		ArrayList<ProductionBean> list = new ArrayList<ProductionBean>();

		ConditionBean conditionBean = new ConditionBean();
		System.out.println("模糊查询或者进入所有作品，当前的页数="+currentPage);
		conditionBean.setCurrentPage(1);
		// 检查条件参参数是否为空
	 
		checkParameter(request, conditionBean, conditionName, fieldName);

		list = productionBizImp.findProductionList(conditionBean, request, null,null).getProList();

		request.setAttribute("list", list);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/productionAllList");

		return mav;
	}

	@RequestMapping("/toManageProduction.action")
	public ModelAndView toManageProduction(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/issueProduction");
		// System.out.println("管理");
		ArrayList<ParameterBean> list = new ArrayList<ParameterBean>();
		list = parameterMapper.findProductionClass();
		request.setAttribute("list", list);

		
//		//------------菜单------
//		UserBean userBean=(UserBean) request.getSession().getAttribute("user");
//		ArrayList<AuthorityBean> menuList=new ArrayList<AuthorityBean>();
//		menuList=authoriyMapper.findOwnSubclassMenu(userBean.getUserId());
//		request.setAttribute("menuList", menuList);
//		//---------------------


		// ------------菜单------
		UserBean userBean = (UserBean) request.getSession().getAttribute("user");
		Menu(request, userBean);
		// ---------------------
		return mav;
	}

	@RequestMapping("/toIssueProduction.action")
	public ModelAndView toIssueProduction(HttpServletRequest request, String title, Integer price, Integer className,
			String area2, MultipartFile file, MultipartFile productionFile) {

		UserBean userBean = (UserBean) request.getSession().getAttribute("user");// 从session取出userbean对象
		productionBizImp.toIssueProduction(request, title, price, className, area2, file, userBean.getUserId(),
				productionFile);

		return new ModelAndView("redirect:/production/productionToManage.action?currentPage=1");
	}

	@RequestMapping("/AddPages.action")
	@ResponseBody
	public ConditionBean AddPages(HttpServletRequest request, Integer currentPage, Integer totalPages,
			String conditionName, String fieldName, String state,Integer  toNumber) {
System.out.println("翻页===="+toNumber+"===="+state);
		ConditionBean conditionBean = new ConditionBean();
		conditionBean.setCurrentPage(currentPage);

		conditionBean.setTotalPages(totalPages);
		// 检查条件参参数是否为空
		checkParameter(request, conditionBean, conditionName, fieldName);

		// System.out.println(conditionBean.getConditionName()+"---->"+conditionBean.getFieldName());
		ArrayList<ProductionBean> list = new ArrayList<ProductionBean>();

		list = productionBizImp.findProductionList(conditionBean, request, state,toNumber).getProList();
System.out.println("list的长度++++="+list.size());
		request.setAttribute("list", list);

		conditionBean.setProList(list);
		return conditionBean;
	}

	@RequestMapping("/ManageAddPages.action")
	@ResponseBody
	public ConditionBean ManageAddPages(HttpServletRequest request, Integer currentPage, Integer totalPages,
			String conditionName, String fieldName, String state,Integer toNumber) {
	// System.out.println("下一页"+currentPage+"总页数"+totalPages);
		// System.out.println("条件"+conditionName+fieldName);
		UserBean userBean = (UserBean) request.getSession().getAttribute("user");// 从session取出userbean对象

		ConditionBean conditionBean = new ConditionBean();
		conditionBean.setCurrentPage(currentPage);

		conditionBean.setTotalPages(totalPages);
		// 检查条件参参数是否为空
		checkParameter(request, conditionBean, conditionName, fieldName);
		 
		//System.out.println("当前的服务商id=" + userBean.getUserId());
		conditionBean.setUserName(userBean.getUserId());
		// System.out.println(conditionBean.getConditionName()+"---->"+conditionBean.getFieldName());
		ArrayList<ProductionBean> list = new ArrayList<ProductionBean>();
		list = productionBizImp.toManageProductionList(conditionBean, request, state, toNumber).getProList();
		// list=productionBizImp.findProductionList(conditionBean,request,state).getProList();
//System.out.println("list的长度="+list.size());
		request.setAttribute("list", list);

		conditionBean.setProList(list);
		return conditionBean;
	}

	@RequestMapping("/toProductionDetal.action")
	public ModelAndView toProductionDetal(HttpServletRequest request, Integer proId) {

		ProductionBean productionBean = new ProductionBean();
		productionBean = productionBizImp.findProductionDetal(proId);
UserBean userBean=new UserBean();
userBean=userMapper.user(productionBean.getUserId());
productionBean.setUserName(userBean.getUserName());
request.setAttribute("userBean", userBean);
		request.setAttribute("productionBean", productionBean);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/productionDetal");

		return mav;
	}

	@RequestMapping("/ProductionPay.action")
	public ModelAndView toProductionPay(HttpServletRequest request, Integer proId) {
		long time = System.currentTimeMillis();
		
		
		System.out.println("商品支付页面=" + proId);
		ProductionBean productionBean = new ProductionBean();
		productionBean = productionBizImp.findProductionDetal(proId);
		System.out.println("作品名字=" + productionBean.getProductionName());
		request.setAttribute("productionBean", productionBean);

		request.setAttribute("WIDout_trade_no", time);
		request.setAttribute("WIDtotal_amount", productionBean.getProductionMoney());
		request.setAttribute("WIDbody", productionBean.getProductionName());
		request.setAttribute("WIDsubject", productionBean.getProductionId());
		request.setAttribute("proId", productionBean.getProductionId());
		request.setAttribute("userId", productionBean.getUserId());
		request.setAttribute("proUserId", productionBean.getUserId());
		request.setAttribute("price", productionBean.getProductionMoney());
		ServletContext application = request.getSession().getServletContext();
		application.setAttribute("buyProductionId", productionBean.getProductionId());

		// session丢失 session数据存数据库

	
		UserBean userBean = (UserBean) request.getSession().getAttribute("user");
		System.out.println("购买者，存数据库Session表，id=" + userBean.getUserId());
		productionBean.getProductionId();

		SessionBean sessionBean = new SessionBean();
		sessionBean.setTime(time);
		sessionBean.setUserId(userBean.getUserId());
		sessionBean.setProductionId(productionBean.getProductionId());
		sessionMapper.setSession(sessionBean);
		request.setAttribute("time", time);

		request.getSession().setAttribute("time", time);

		// String notify_url =
		// "http://127.0.0.1:8080/Myproject/production/productionPayFinish.action?time="+time;
		AlipayConfig.notify_url = "http://127.0.0.1:8080/Myproject/production/productionPayFinish.action?time=" + time;
		// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
		// public static String return_url =
		// "http://127.0.0.1:8080/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";
		// String return_url =
		// "http://127.0.0.1:8080/Myproject/production/productionPayFinish.action?time="+time;
		AlipayConfig.return_url = "http://127.0.0.1:8080/Myproject/production/productionPayFinish.action?time=" + time;
		// --------------

		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/alipay.trade.page.pay");

		return new ModelAndView("redirect:/production/productionPayFinish.action?time="+time);

	}

	@RequestMapping("/productionPayFinish.action")
	public ModelAndView productionPayFinish(HttpServletRequest request, Integer proId, Integer userId,
			Integer proUserId, Double price, Long time) throws UnsupportedEncodingException, AlipayApiException {
		ServletContext application = request.getSession().getServletContext();

		System.out.println("接收到的time=" + time);
		SessionBean sessionBean = new SessionBean();
		sessionBean = sessionMapper.findSession(time);
		UserBean userBean = userMapper.user(sessionBean.getUserId());
		request.getSession().setAttribute("user", userBean);
		Integer proId3 = sessionBean.getProductionId();
		userId = sessionBean.getUserId();

		ProductionBean productionBean = new ProductionBean();
		productionBean = productionBizImp.findProductionDetal(proId3);
		price = productionBean.getProductionMoney();
		proUserId = productionBean.getUserId();

		System.out.println("完成支付，作品归属记录,购买人ID=" + userId + "---作品ID>" + proId3);

		System.out.println("生成交易记录，作品的作者ID=" + proUserId + "作品的价格，交易金额平台抽成10%=" + price);
		productionBizImp.productionPayFinish(request, proId3, userId, proUserId, price);
		return new ModelAndView("redirect:/production/findBuyProduction.action?currentPage=1");

		// return null;
	}

	@RequestMapping("/productionToManage.action")
	public ModelAndView productionToManage(HttpServletRequest request, String conditionName, String fieldName,Integer currentPage) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/ProductionManage");

		ArrayList<ProductionBean> list = new ArrayList<ProductionBean>();

		ConditionBean conditionBean = new ConditionBean();
		System.out.println("进入作品中心，当前的页数="+currentPage);
		conditionBean.setCurrentPage(currentPage);
		// 检查条件参参数是否为空
		checkParameter(request, conditionBean, conditionName, fieldName);

		UserBean userBean = (UserBean) request.getSession().getAttribute("user");
		System.out.println("当前的服务商id=" + userBean.getUserId());
		conditionBean.setUserName(userBean.getUserId());

		list = productionBizImp.toManageProductionList(conditionBean, request, null,null).getProList();

		request.setAttribute("list", list);

		
		
//		//------------菜单------
//		ArrayList<AuthorityBean> menuList=new ArrayList<AuthorityBean>();
//		menuList=authoriyMapper.findOwnSubclassMenu(userBean.getUserId());
//		request.setAttribute("menuList", menuList);
//		//---------------------
		
		
		


		// ------------菜单------
		Menu(request, userBean);
		// ---------------------

		return mav;
	}

	@RequestMapping("/toEditProduction.action")
	public ModelAndView toEditProduction(HttpServletRequest request, Integer proId) {
		// System.out.println("进入编辑作品的handler，编辑作品的id="+proId);

		ProductionBean productionBean = new ProductionBean();
		productionBean = productionBizImp.findProductionDetal(proId);
		request.setAttribute("production", productionBean);

		ArrayList<ParameterBean> list = new ArrayList<ParameterBean>();
		list = parameterMapper.findProductionClass();
		request.setAttribute("list", list);
		UserBean userBean = (UserBean) request.getSession().getAttribute("user");
		Menu(request, userBean);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/toEditProduction");

		return mav;
	}

	@RequestMapping("/editProduction.action")
	public ModelAndView editProduction(HttpServletRequest request, String title, Float price, Integer className,
			String area2, MultipartFile file, MultipartFile productionFile, Integer proId) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/productionAllList");

		System.out.println("要编辑的作品ID=" + proId);

		productionBizImp.editProduction(request, proId, title, price, className, area2, file, productionFile);

		return new ModelAndView("redirect:/production/productionToManage.action?currentPage=1");
	}

	@RequestMapping("/toDelProduction.action")
	public ModelAndView toDelProduction(HttpServletRequest request, Integer proId) {

		System.out.println("要删除的作品ID=" + proId);

		productionMapper.delProduction(proId);
		return new ModelAndView("redirect:/production/productionToManage.action?currentPage=1");
	}

	@RequestMapping("/toAdminProductionManage.action")
	public ModelAndView toAdminProductionManage(HttpServletRequest request, String conditionName, String fieldName,Integer currentPage) {
		ArrayList<ProductionBean> list = new ArrayList<ProductionBean>();

		ConditionBean conditionBean = new ConditionBean();
		System.out.println("进入管理员作品管理，当前的页数="+currentPage);
		conditionBean.setCurrentPage(currentPage);
		//  System.out.println("handler 条件="+conditionName+"-->"+fieldName);
		// 检查条件参参数是否为空
		checkParameter(request, conditionBean, conditionName, fieldName);
//System.out.println("搜索，或者进入作品管理");
		list = productionBizImp.findProductionList(conditionBean, request, null,null).getProList();
		// list=productionMapper.findProductionList(conditionBean);
		request.setAttribute("list", list);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/adminProductionManager");

		// ----------------菜单-------

		// ----------------------

		return mav;
	}

	@RequestMapping("/adminProductionDetal.action")
	public ModelAndView adminProductionDetal(HttpServletRequest request, Integer proId) {

		ProductionBean productionBean = new ProductionBean();
		productionBean = productionBizImp.findProductionDetal(proId);
		UserBean userBean=new UserBean();
		userBean=userMapper.user(productionBean.getUserId());
		productionBean.setUserName(userBean.getUserName());
		request.setAttribute("productionBean", productionBean);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/adminManageProductionDetal");

		return mav;
	}

	@RequestMapping("/adminToDelProduction.action")
	@ResponseBody
	public ConditionBean adminToDelProduction(HttpServletRequest request, Integer delProId, String conditionName,
			String fieldName, Integer currentPage) {

		System.out.println("要删除的作品ID=" + delProId);

		productionMapper.delProduction(delProId);

		ArrayList<ProductionBean> list = new ArrayList<ProductionBean>();

		ConditionBean conditionBean = new ConditionBean();
		conditionBean.setCurrentPage(currentPage);
		// System.out.println("handler 条件="+conditionName+"-->"+fieldName);
		// 检查条件参参数是否为空
		checkParameter(request, conditionBean, conditionName, fieldName);

		list = productionBizImp.findProductionList(conditionBean, request, null,null).getProList();
		// list=productionMapper.findProductionList(conditionBean);
		request.setAttribute("list", list);
		conditionBean.setProList(list);

		return conditionBean;
	}

	@RequestMapping("/adminToIllegalProduction.action")
	@ResponseBody
	public ConditionBean adminToIllegalProduction(HttpServletRequest request, Integer delProId, String conditionName,
			String fieldName, Integer currentPage) {

		//System.out.println("要下架的作品ID=" + delProId);

		productionMapper.adminToIllegalProduction(delProId);

		ArrayList<ProductionBean> list = new ArrayList<ProductionBean>();

		ConditionBean conditionBean = new ConditionBean();
		conditionBean.setCurrentPage(currentPage);
		// System.out.println("handler 条件="+conditionName+"-->"+fieldName);
		// 检查条件参参数是否为空
		checkParameter(request, conditionBean, conditionName, fieldName);

		list = productionBizImp.findProductionList(conditionBean, request, null,null).getProList();
		// list=productionMapper.findProductionList(conditionBean);
		request.setAttribute("list", list);
		conditionBean.setProList(list);

		return conditionBean;
	}

	@RequestMapping("/adminToPsaaProduction.action")
	@ResponseBody
	public ConditionBean adminToPsaaProduction(HttpServletRequest request, Integer delProId, String conditionName,
			String fieldName, Integer currentPage) {

		System.out.println("通过审核的作品ID=" + delProId);

		productionMapper.adminToPsaaProduction(delProId);

		ArrayList<ProductionBean> list = new ArrayList<ProductionBean>();

		ConditionBean conditionBean = new ConditionBean();
		conditionBean.setCurrentPage(currentPage);
		// System.out.println("handler 条件="+conditionName+"-->"+fieldName);
		// 检查条件参参数是否为空
		checkParameter(request, conditionBean, conditionName, fieldName);

		list = productionBizImp.findProductionList(conditionBean, request, null,null).getProList();

		request.setAttribute("list", list);
		conditionBean.setProList(list);

		return conditionBean;
	}

	@RequestMapping("/toProductionManage.action")
	public ModelAndView toProductionManage(HttpServletRequest request, String conditionName, String fieldName, Integer currentPage) {
		System.out.println("进入作品中心的搜索，当前页="+currentPage);
		ArrayList<ProductionBean> list = new ArrayList<ProductionBean>();

		ConditionBean conditionBean = new ConditionBean();
		conditionBean.setCurrentPage(currentPage);
		 	// 检查条件参参数是否为空
		checkParameter(request, conditionBean, conditionName, fieldName);

		list = productionBizImp.findProductionList(conditionBean, request, null,null).getProList();
		// list=productionMapper.findProductionList(conditionBean);
		request.setAttribute("list", list);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/ProductionManage");
		//System.out.println("进入作品中心的搜索");
		return mav;
	}

	@RequestMapping("/findBuyProduction.action")
	public ModelAndView findBuyProduction(HttpServletRequest request, String conditionName, String fieldName, Integer currentPage) {
		ArrayList<ProductionBean> list = new ArrayList<ProductionBean>();

		ConditionBean conditionBean = new ConditionBean();
		conditionBean.setCurrentPage(currentPage);
		// System.out.println("handler 条件="+conditionName+"-->"+fieldName);
		// 检查条件参参数是否为空
		checkParameter(request, conditionBean, conditionName, fieldName);

		UserBean userBean = (UserBean) request.getSession().getAttribute("user");
		// System.out.println("当前的服务商id="+userBean.getUserId());
		conditionBean.setUserName(userBean.getUserId());
		list = productionBizImp.findBuyProduction(conditionBean, request, null,null).getProList();
		// list=productionBizImp.findProductionList(conditionBean,request,null).getProList();
		// list=productionMapper.findProductionList(conditionBean);
		request.setAttribute("list", list);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/buyProduction2");

		
		
		//----------------菜单-------
		//------------菜单------
		ArrayList<AuthorityBean> menuList=new ArrayList<AuthorityBean>();
		menuList=authoriyMapper.findOwnSubclassMenu(userBean.getUserId());
		request.setAttribute("menuList", menuList);
	//---------------------
		
		
		//----------------------
		
		
		


		// ------------菜单------
		Menu(request, userBean);
		// ---------------------

		return mav;
	}

	@RequestMapping("/buyProductionAddPages.action")
	@ResponseBody
	public ConditionBean buyProductionAddPages(HttpServletRequest request, Integer currentPage, Integer totalPages,
			String conditionName, String fieldName, String state) {
System.out.println("已购买作品翻页");
		ConditionBean conditionBean = new ConditionBean();
		conditionBean.setCurrentPage(currentPage);
		// conditionBean.setCurrentPage(currentPage);
		conditionBean.setTotalPages(totalPages);
		// 检查条件参参数是否为空
		checkParameter(request, conditionBean, conditionName, fieldName);
		// System.out.println(conditionBean.getConditionName()+"---->"+conditionBean.getFieldName());
		ArrayList<ProductionBean> list = new ArrayList<ProductionBean>();
		UserBean userBean = (UserBean) request.getSession().getAttribute("user");

		conditionBean.setUserName(userBean.getUserId());

		list = productionBizImp.findBuyProduction(conditionBean, request, state,currentPage).getProList();

		request.setAttribute("list", list);

		conditionBean.setProList(list);
		return conditionBean;
	}

	
	
	/**
	 * 
	 * @author :Darren
	 * @date: 2018年10月1日 下午10:50:56 
	 * @Description:  通过审核的产品  商城
	 * @param request
	 * @param conditionName
	 * @param fieldName
	 * @return
	 */
	@RequestMapping("/toProductionPass.action")
	//@Log(operationType="作品handler",operationName="进入商城列表")
	public ModelAndView toProductionPass(HttpServletRequest request, String conditionName, String fieldName,Integer currentPage) {
		ArrayList<ProductionBean> list = new ArrayList<ProductionBean>();

		ConditionBean conditionBean = new ConditionBean();
		System.out.println("当前的页数="+currentPage);
		conditionBean.setCurrentPage(currentPage);
		// 检查条件参参数是否为空
	 
		checkParameter(request, conditionBean, conditionName, fieldName);

		list = productionBizImp.findProductionListPass(conditionBean, request, null,null).getProList();

		request.setAttribute("list", list);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/productionAllList");

		return mav;
	}
	
	/**
	 * 
	 * @author :Darren
	 * @date: 2018年10月1日 下午10:55:01 
	 * @Description: 翻页 通过审核的作品
	 * @param request
	 * @param currentPage
	 * @param totalPages
	 * @param conditionName
	 * @param fieldName
	 * @param state
	 * @return
	 */
	@RequestMapping("/AddPagesPass.action")
	@ResponseBody
	public ConditionBean AddPagesPass(HttpServletRequest request, Integer currentPage, Integer totalPages,
			String conditionName, String fieldName, String state,Integer toNumber) {

		ConditionBean conditionBean = new ConditionBean();
		conditionBean.setCurrentPage(currentPage);

		conditionBean.setTotalPages(totalPages);
		// 检查条件参参数是否为空
		checkParameter(request, conditionBean, conditionName, fieldName);

		// System.out.println(conditionBean.getConditionName()+"---->"+conditionBean.getFieldName());
		ArrayList<ProductionBean> list = new ArrayList<ProductionBean>();

		list = productionBizImp.findProductionListPass(conditionBean, request, state, toNumber).getProList();

		request.setAttribute("list", list);

		conditionBean.setProList(list);
		return conditionBean;
	}
	
	
	
	/**
	 * 
	 * @author :Darren
	 * @date: 2018年10月1日 下午4:14:11
	 * @Description://检查条件参参数是否为空
	 */
	public void checkParameter(HttpServletRequest request, ConditionBean conditionBean, String conditionName,
			String fieldName) {
	//	System.out.println("查找条件="+conditionBean.getConditionName()+"条件2"+conditionBean.getFieldName());
	//	System.out.println("输入查找条件="+conditionName+"条件2"+fieldName);
		if (conditionName != null && conditionName != "") {
			conditionBean.setConditionName("%" + conditionName + "%");
			request.setAttribute("conditionName", conditionName);
		}
		if (fieldName != null && fieldName != "") {

			conditionBean.setFieldName("%" + fieldName + "%");
			request.setAttribute("fieldName", fieldName);
		}
	//	System.out.println("2查找条件="+conditionBean.getConditionName()+"条件2"+conditionBean.getFieldName());
	}

	/**
	 * 
	 * @author :Darren
	 * @date: 2018年10月1日 下午4:25:57
	 * @Description: 加载页面菜单
	 */
	public void Menu(HttpServletRequest request, UserBean userBean) {
		ArrayList<AuthorityBean> menuList = new ArrayList<AuthorityBean>();
		menuList = authoriyMapper.findOwnSubclassMenu(userBean.getUserId());
		request.setAttribute("menuList", menuList);

	}
	
	
	
	
	@RequestMapping("/productionEvaluate.action")
	public ModelAndView productionEvaluate(HttpServletRequest request, Integer proId) {

		ProductionBean productionBean = new ProductionBean();
		productionBean = productionBizImp.findProductionDetal(proId);
		
		//ArrayList<ProAndUserBean> proAndUserList = new ArrayList<ProAndUserBean>();		 
		ProAndUserBean proAndUserBean=new ProAndUserBean();
		UserBean userBean = (UserBean) request.getSession().getAttribute("user");
		 proAndUserBean=proAndUserMapper.findPayDetal(proId,userBean.getUserId());
	//	System.out.println(proAndUserBean.getProAndUserId()+"该作品的评价="+proAndUserBean.getProductionEvaluate());
		 UserBean userBean2=new UserBean();
			userBean2=userMapper.user(productionBean.getUserId());
			productionBean.setUserName(userBean2.getUserName());
		 
		 request.setAttribute("proAndUserList", proAndUserBean);
		request.setAttribute("productionBean", productionBean);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/productionEvaluate");
		// ------------菜单------
		 
				Menu(request, userBean);
				// ---------------------
		return mav;
	}
	@RequestMapping("/submitProductionEvaluate.action")
	public ModelAndView submitProductionEvaluate(HttpServletRequest request, Integer point,Integer proAndUserId,String evaluate) {

		
		
	 if(point!=null ) {
		 System.out.println(point+"新的评价，购买记录id="+proAndUserId+"==-->"+evaluate);
			proAndUserMapper.setProductionEvaluate(evaluate, proAndUserId, point);
			ProAndUserBean proAndUserBean=new ProAndUserBean();
			proAndUserBean=	proAndUserMapper.findProAndUserDetal(proAndUserId);
			 ArrayList<Integer> list=new  ArrayList<Integer>();
			 list=proAndUserMapper.findProUserPoint(proAndUserId);
			int allPoint=0;
			 for(int i=0;i<list.size();i++) {
				 allPoint+=list.get(i);
				 
				 
			 }
			 double creditPoint=allPoint/(list.size());
			 userMapper.updateCreditPoint(creditPoint, proAndUserBean.getProUserId());
	 }
		
	 

		return new ModelAndView("redirect:/production/findBuyProduction.action?currentPage=1");
	}
	@RequestMapping("/addMoney.action")
	public ModelAndView addMoney(HttpServletRequest request, Integer point,Integer proAndUserId,String evaluate) {
		UserBean userBean = (UserBean) request.getSession().getAttribute("user");
		System.out.println("进入充值handler，跳转充值网页");
		// ------------菜单------
		userBean = (UserBean) request.getSession().getAttribute("user");
		ArrayList<AuthorityBean> menuList = new ArrayList<AuthorityBean>();
		menuList = authoriyMapper.findOwnSubclassMenu(userBean.getUserId());
		request.setAttribute("menuList", menuList);
		// ---------------------	
		request.setAttribute("user", userBean);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/addMoney");

		return mav;
	}
	
	
	@RequestMapping("/finshAddMoney.action")
	public ModelAndView finshAddMoney(HttpServletRequest request, Integer point,Integer proAndUserId,String evaluate,Float money) {
		UserBean userBean = (UserBean) request.getSession().getAttribute("user");
		System.out.println(money+"进入充值handler，跳转支付宝网页");
	
		request.setAttribute("user", userBean);
		
		//---------------
long time = System.currentTimeMillis();
		
		
		//System.out.println("商品支付页面=" + proId);
		//ProductionBean productionBean = new ProductionBean();
		//productionBean = productionBizImp.findProductionDetal(proId);
	//	System.out.println("作品名字=" + productionBean.getProductionName());
	//	request.setAttribute("productionBean", productionBean);

		request.setAttribute("WIDout_trade_no", time);
		request.setAttribute("WIDtotal_amount", money);
		request.setAttribute("WIDbody", "充值");
		request.setAttribute("WIDsubject", userBean.getUserId());
		/*request.setAttribute("proId", productionBean.getProductionId());
		request.setAttribute("userId", productionBean.getUserId());
		request.setAttribute("proUserId", productionBean.getUserId());
		request.setAttribute("price", productionBean.getProductionMoney());*/
	//	ServletContext application = request.getSession().getServletContext();
//		application.setAttribute("buyProductionId", productionBean.getProductionId());

		// session丢失 session数据存数据库

	
		 
		System.out.println("充值者，存数据库Session表，id=" + userBean.getUserId());
		//productionBean.getProductionId();

		SessionBean sessionBean = new SessionBean();
		sessionBean.setTime(time);
		sessionBean.setUserId(userBean.getUserId());
		sessionBean.setAddMoney(money);
	//	sessionBean.setProductionId(productionBean.getProductionId());
		sessionMapper.setSessionUser(sessionBean);
		request.setAttribute("time", time);

		request.getSession().setAttribute("time", time);

 
		AlipayConfig.notify_url = "http://127.0.0.1:8080/Myproject/production/addMoneyPayFinish.action?time=" + time;
		// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
		 
		AlipayConfig.return_url = "http://127.0.0.1:8080/Myproject/production/addMoneyPayFinish.action?time=" + time;
		// --------------

		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/alipay.trade.page.pay");

		
		//----------------
		
		
	//	ModelAndView mav = new ModelAndView();
//		mav.setViewName("jsp/addMoney");

		return mav;
	}
	
	

	@RequestMapping("/addMoneyPayFinish.action")
	public ModelAndView addMoneyPayFinish(HttpServletRequest request, 
			 Long time) throws UnsupportedEncodingException, AlipayApiException {
		ServletContext application = request.getSession().getServletContext();

		System.out.println("接收到的time=" + time);
		SessionBean sessionBean = new SessionBean();
		sessionBean = sessionMapper.findSession(time);
		UserBean userBean = userMapper.user(sessionBean.getUserId());
		request.getSession().setAttribute("user", userBean);
		//Integer proId3 = sessionBean.getProductionId();
		//userId = sessionBean.getUserId();

	//	ProductionBean productionBean = new ProductionBean();
	//	productionBean = productionBizImp.findProductionDetal(proId3);
	//	price = productionBean.getProductionMoney();
	//	proUserId = productionBean.getUserId();

	//	System.out.println("完成支付，作品归属记录,购买人ID=" + userId + "---作品ID>");

	//	System.out.println("生成交易记录，作品的作者ID=" + proUserId + "作品的价格，交易金额平台抽成10%=" + price);
	//	productionBizImp.productionPayFinish(request, proId3, userId, proUserId, price);
	System.out.println("充值人，充值金额"+sessionBean.getAddMoney()+"---》="+sessionBean.getUserId());
	//addMoneyPayFinish
	productionBizImp.addMoneyPayFinish(request, sessionBean);
		return new ModelAndView("redirect:/user/UserInformation.action");

		// return null;
	}
	
	@RequestMapping("/checkMoney.action")
	@ResponseBody
	public Integer checkMoney(HttpServletRequest request, Integer proId) {
		System.out.println("检查账户余额");
		UserBean userBean = (UserBean) request.getSession().getAttribute("user");
		Integer result=	productionBizImp.checkMoney(userBean.getUserId(), proId);
	 System.out.println(result);
		return  result;
	}
}
