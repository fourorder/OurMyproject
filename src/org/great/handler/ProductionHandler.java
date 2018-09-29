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
import org.great.bean.ProductionBean;
import org.great.bean.SessionBean;
import org.great.bean.UserBean;
import org.great.biz.ProductionBiz;
import org.great.mapper.AuthoriyMapper;
import org.great.mapper.ParameterMapper;
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
	
	
	@RequestMapping("/toProduction.action")
	public ModelAndView toProduction(HttpServletRequest request,String conditionName,String fieldName) {
		ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
		
		ConditionBean conditionBean=new ConditionBean();
		conditionBean.setCurrentPage(1);
		if(conditionName!=null && conditionName!="" ) {
			conditionBean.setConditionName("%"+conditionName+"%");
			request.setAttribute("conditionName", conditionName);
		}
		if(fieldName!=null && fieldName!="") {
		 
			conditionBean.setFieldName("%"+fieldName+"%");
			request.setAttribute("fieldName", fieldName);
		}
	
		 list=productionBizImp.findProductionList(conditionBean,request,null).getProList();
		//list=productionMapper.findProductionList(conditionBean);
		request.setAttribute("list", list);
		
	
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/productionAllList");
		
		return mav;
	}
	
	@RequestMapping("/toManageProduction.action")
	public ModelAndView toManageProduction(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/issueProduction");
		System.out.println("管理");
		ArrayList<ParameterBean> list=new ArrayList<ParameterBean>();
		list=parameterMapper.findProductionClass();
		request.setAttribute("list", list);
		
		//------------菜单------
		UserBean userBean=(UserBean) request.getSession().getAttribute("user");
		ArrayList<AuthorityBean> menuList=new ArrayList<AuthorityBean>();
		menuList=authoriyMapper.findOwnMune(userBean.getUserId());
		request.setAttribute("menuList", menuList);
		//---------------------
		return mav;
	}
	
	
	
	@RequestMapping("/toIssueProduction.action")
	public ModelAndView toIssueProduction(HttpServletRequest request
			,String title,Integer  price,Integer className,String area2,MultipartFile file		
			,MultipartFile  productionFile
			) {
		
	/*	ModelAndView mav = new ModelAndView();
	mav.setViewName("jsp/productionAllList");*/
	   String filename =productionFile.getOriginalFilename();
		  UserBean userBean= (UserBean) request.getSession().getAttribute("user");//从session取出userbean对象
		productionBizImp.toIssueProduction(request, title, price, className, area2,file,
				userBean.getUserId(),productionFile);
		
		
		return new ModelAndView("redirect:/production/productionToManage.action");
	}
	
	
	@RequestMapping("/AddPages.action")
	@ResponseBody
	public ConditionBean AddPages(HttpServletRequest request, Integer currentPage, Integer totalPages
			,String conditionName,String fieldName ,String state
			) {
	//	System.out.println("下一页"+currentPage+"总页数"+totalPages);
	//	System.out.println("handler 条件="+conditionName+"-->"+fieldName);
		//System.out.println("条件"+conditionName+fieldName);
		
		
		ConditionBean conditionBean=new ConditionBean();
		conditionBean.setCurrentPage(currentPage);
		//conditionBean.setCurrentPage(currentPage);
		conditionBean.setTotalPages(totalPages);
		if(conditionName!=null && conditionName!="" ) {
			conditionBean.setConditionName("%"+conditionName+"%");
			request.setAttribute("conditionName", conditionName);
		}
		if(fieldName!=null && fieldName!="") {
		 
			conditionBean.setFieldName("%"+fieldName+"%");
			request.setAttribute("fieldName", fieldName);
		}
	//	System.out.println(conditionBean.getConditionName()+"---->"+conditionBean.getFieldName());
		ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
	 
		 list=productionBizImp.findProductionList(conditionBean,request,state).getProList();
		
		 request.setAttribute("list", list);
 
			conditionBean.setProList(list);
		return conditionBean;
	}
	
	
	@RequestMapping("/ManageAddPages.action")
	@ResponseBody
	public ConditionBean ManageAddPages(HttpServletRequest request, Integer currentPage, Integer totalPages,String conditionName,String fieldName
			,String state
			) {
		//System.out.println("下一页"+currentPage+"总页数"+totalPages);
		//System.out.println("条件"+conditionName+fieldName);
		 UserBean userBean= (UserBean) request.getSession().getAttribute("user");//从session取出userbean对象
		
		ConditionBean conditionBean=new ConditionBean();
		conditionBean.setCurrentPage(currentPage);
		//conditionBean.setCurrentPage(currentPage);
		conditionBean.setTotalPages(totalPages);
		conditionBean.setUserName(userBean.getUserId());
		if(conditionName!=null && conditionName!="" ) {
			conditionBean.setConditionName("%"+conditionName+"%");
			request.setAttribute("conditionName", conditionName);
		}
		if(fieldName!=null && fieldName!="") {
		 
			conditionBean.setFieldName("%"+fieldName+"%");
			request.setAttribute("fieldName", fieldName);
		}
	//	System.out.println(conditionBean.getConditionName()+"---->"+conditionBean.getFieldName());
		ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
	 list=productionBizImp.toManageProductionList(conditionBean, request, state).getProList();
		// list=productionBizImp.findProductionList(conditionBean,request,state).getProList();
		
		 request.setAttribute("list", list);
 
			conditionBean.setProList(list);
		return conditionBean;
	}
	
	
	
	
	
	
	@RequestMapping("/toProductionDetal.action")
	public ModelAndView toProductionDetal(HttpServletRequest request,Integer  proId) {
		
		
		ProductionBean productionBean=new ProductionBean();
		productionBean=productionBizImp.findProductionDetal(proId);
		
		request.setAttribute("productionBean", productionBean);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/productionDetal");
		
		return mav;
	}
	
	/*@RequestMapping("/ProductionPay.action")
	public ModelAndView toProductionPay(HttpServletRequest request,Integer  proId) {
	
		System.out.println("商品支付页面="+proId);
		ProductionBean productionBean=new ProductionBean();
		productionBean=productionBizImp.findProductionDetal(proId);
		System.out.println("作品名字="+productionBean.getProductionName());
		request.setAttribute("productionBean", productionBean);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/productionPay");
		
		return mav;
		
	}*/
	@RequestMapping("/ProductionPay.action")
	public ModelAndView toProductionPay(HttpServletRequest request,Integer  proId 
			) {
	
		System.out.println("商品支付页面="+proId);
		ProductionBean productionBean=new ProductionBean();
		productionBean=productionBizImp.findProductionDetal(proId);
		System.out.println("作品名字="+productionBean.getProductionName());
		request.setAttribute("productionBean", productionBean);
	 
		 
		 
		 
		request.setAttribute("WIDout_trade_no", System.currentTimeMillis());
		request.setAttribute("WIDtotal_amount", productionBean.getProductionMoney());
		request.setAttribute("WIDbody", productionBean.getProductionName());
		request.setAttribute("WIDsubject", productionBean.getProductionId());		
		request.setAttribute("proId", productionBean.getProductionId());
		request.setAttribute("userId", productionBean.getUserId());
		request.setAttribute("proUserId", productionBean.getUserId());
		request.setAttribute("price", productionBean.getProductionMoney()); 
		ServletContext application = request.getSession().getServletContext();
		application.setAttribute("buyProductionId",productionBean.getProductionId());
//		application.getAttribute("name"); 
		//session存购买作品的ID
	//	session.removeAttribute("buyProductionId");
//System.out.println("购买作品ID="+productionBean.getProductionId())("buyProductionId", productionBean.getProductionId());
//		String proId2=session.getAttribute("buyProductionId").toString();
//		Integer  proId3=Integer.valueOf(proId2);
//		System.out.println("购买作品的ID="+proId3);
		
		//session丢失   session数据存数据库
		
		long time=System.currentTimeMillis();
		UserBean userBean=(UserBean) request.getSession().getAttribute("user");
		System.out.println("购买者，存数据库Session表，id="+userBean.getUserId());
		productionBean.getProductionId();
		
		SessionBean sessionBean=new SessionBean();
		sessionBean.setTime(time);
		sessionBean.setUserId(userBean.getUserId());
		sessionBean.setProductionId(productionBean.getProductionId());
		sessionMapper.setSession(sessionBean);
		request.setAttribute("time", time);
		
		 request.getSession().setAttribute("time", time);
		 
		// String notify_url = "http://127.0.0.1:8080/Myproject/production/productionPayFinish.action?time="+time;
		 AlipayConfig.notify_url="http://127.0.0.1:8080/Myproject/production/productionPayFinish.action?time="+time;
			// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
			//public static String return_url = "http://127.0.0.1:8080/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";
			//String return_url = "http://127.0.0.1:8080/Myproject/production/productionPayFinish.action?time="+time;
		 AlipayConfig.return_url= "http://127.0.0.1:8080/Myproject/production/productionPayFinish.action?time="+time;
		//--------------
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/alipay.trade.page.pay");
		
		return mav;
		
	}
	
	@RequestMapping("/productionPayFinish.action")
	public ModelAndView productionPayFinish(HttpServletRequest request,Integer  proId,
			Integer userId,Integer  proUserId,Double price,Long time) throws UnsupportedEncodingException, AlipayApiException
	  {//ModelAndView
		ServletContext application = request.getSession().getServletContext();
//		HttpSession session = request.getSession();
//		System.out.println("1111111111111111111111111");
//		System.out.println(session);
		System.out.println("接收到的time="+time);
		SessionBean sessionBean=new SessionBean();
		sessionBean=sessionMapper.findSession(time);
		UserBean userBean=userMapper.user(sessionBean.getUserId());
		request.getSession().setAttribute("user", userBean);
		Integer  proId3=sessionBean.getProductionId();
		userId=sessionBean.getUserId();
				 
//-------------------------------		
	/*	String proId2=application.getAttribute("buyProductionId").toString();
		Integer  proId3=Integer.valueOf(proId2);
		System.out.println("ooppppp"+proId3);*/
		
		//---------------------------------------
		

		
		//——请在这里编写您的程序（以上代码仅作参考）——
		 
		
		//--------------------------------------
		
		
		
		
		
		ProductionBean productionBean=new ProductionBean();
		productionBean=productionBizImp.findProductionDetal(proId3);
		price=productionBean.getProductionMoney();
		proUserId=productionBean.getUserId();
			
		//---------------------------
		//String userId2=request.getParameter("userId");
		//String userId3=request.getParameter("body");
	//	AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		//alipayRequest.getBizContent();
	 
		System.out.println("完成支付，作品归属记录,购买人ID="+userId+"---作品ID>"+proId3);
		 //System.out.println(userId2);
		// System.out.println(userId3);
		System.out.println("生成交易记录，作品的作者ID="+proUserId+"作品的价格，交易金额平台抽成10%="+price);
		productionBizImp.productionPayFinish(request, proId3, userId, proUserId, price);
		return new ModelAndView("redirect:/production/toProduction.action");
		 
		//return null;
	}
	
	
	@RequestMapping("/productionToManage.action")
	public ModelAndView productionToManage(HttpServletRequest request,String conditionName,String fieldName) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/ProductionManage");
	//	System.out.println("管理");
ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
		
		ConditionBean conditionBean=new ConditionBean();
		conditionBean.setCurrentPage(1);
		if(conditionName!=null && conditionName!="" ) {
			conditionBean.setConditionName("%"+conditionName+"%");
			request.setAttribute("conditionName", conditionName);
		}
		if(fieldName!=null && fieldName!="") {
		 
			conditionBean.setFieldName("%"+fieldName+"%");
			request.setAttribute("fieldName", fieldName);
		}
		UserBean userBean=(UserBean) request.getSession().getAttribute("user");
		System.out.println("当前的服务商id="+userBean.getUserId());
		conditionBean.setUserName(userBean.getUserId());
	//	System.out.println("要去查询该商家的作品，商家");
	//	conditionBean.setConditionName("%"+"陈键"+"%");
	//	System.out.println("写死，查找服务商的作品。传session userName");
		list=productionBizImp.toManageProductionList(conditionBean, request, null).getProList();
	//	list=productionBizImp.findProductionList(conditionBean,request,null).getProList();
		//list=productionMapper.findProductionList(conditionBean);
		request.setAttribute("list", list);
		
		//------------菜单------
		ArrayList<AuthorityBean> menuList=new ArrayList<AuthorityBean>();
		menuList=authoriyMapper.findOwnMune(userBean.getUserId());
		request.setAttribute("menuList", menuList);
		//---------------------
		
		
		
		return mav;
	}
	
	@RequestMapping("/toEditProduction.action")
	public ModelAndView toEditProduction(HttpServletRequest request,Integer proId) {
		//System.out.println("进入编辑作品的handler，编辑作品的id="+proId);
	
		ProductionBean productionBean=new ProductionBean();
		productionBean=productionBizImp.findProductionDetal(proId);
		request.setAttribute("production", productionBean);
		
		
		ArrayList<ParameterBean> list=new ArrayList<ParameterBean>();
		list=parameterMapper.findProductionClass();
		request.setAttribute("list", list);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/toEditProduction");
	 
		return mav;
	}
	
	@RequestMapping("/editProduction.action")
	public ModelAndView editProduction(HttpServletRequest request
			,String title,Float  price,Integer className,String area2,MultipartFile file		
			,MultipartFile  productionFile,Integer proId
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/productionAllList");
		 //  String filename =productionFile.getOriginalFilename();
		//  UserBean userBean= (UserBean) request.getSession().getAttribute("user");//从session取出userbean对象
	System.out.println("要编辑的作品ID="+proId);
	/*	productionBizImp.toIssueProduction(request, title, price, className, area2,file,
				userBean.getUserId(),productionFile);*/
	productionBizImp.editProduction(request, proId, title, price, className, area2, file, productionFile);
		
		return new ModelAndView("redirect:/production/productionToManage.action");
	}
	
	@RequestMapping("/toDelProduction.action")
	public ModelAndView toDelProduction(HttpServletRequest request,Integer proId) {
		
		System.out.println("要删除的作品ID="+proId); 
		
		
		productionMapper.delProduction(proId);
		return new ModelAndView("redirect:/production/productionToManage.action");
	}
	
	
	@RequestMapping("/toAdminProductionManage.action")
	public ModelAndView toAdminProductionManage(HttpServletRequest request,String conditionName,String fieldName) {
		ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
		
		ConditionBean conditionBean=new ConditionBean();
		conditionBean.setCurrentPage(1);
		//System.out.println("handler 条件="+conditionName+"-->"+fieldName);
		if(conditionName!=null && conditionName!="" ) {
			conditionBean.setConditionName("%"+conditionName+"%");
			request.setAttribute("conditionName", conditionName);
		}
		if(fieldName!=null && fieldName!="") {
		 
			conditionBean.setFieldName("%"+fieldName+"%");
			request.setAttribute("fieldName", fieldName);
		}
	
		 list=productionBizImp.findProductionList(conditionBean,request,null).getProList();
		//list=productionMapper.findProductionList(conditionBean);
		request.setAttribute("list", list);
		
	
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/adminProductionManager");
		
		
		//----------------菜单-------
		
		
		
		//----------------------
		
		
		
		return mav;
	}
	
	
	@RequestMapping("/adminProductionDetal.action")
	public ModelAndView adminProductionDetal(HttpServletRequest request,Integer  proId) {
		
		
		ProductionBean productionBean=new ProductionBean();
		productionBean=productionBizImp.findProductionDetal(proId);
		
		request.setAttribute("productionBean", productionBean);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/adminManageProductionDetal");
		
		return mav;
	}
	
	@RequestMapping("/adminToDelProduction.action")
	@ResponseBody
	public ConditionBean adminToDelProduction(HttpServletRequest request,Integer delProId,String conditionName,String fieldName,Integer currentPage) {
		
		System.out.println("要删除的作品ID="+delProId); 
		
		
		productionMapper.delProduction(delProId);
		
		
ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
		
		ConditionBean conditionBean=new ConditionBean();
		conditionBean.setCurrentPage(currentPage);
		//System.out.println("handler 条件="+conditionName+"-->"+fieldName);
		if(conditionName!=null && conditionName!="" ) {
			conditionBean.setConditionName("%"+conditionName+"%");
			request.setAttribute("conditionName", conditionName);
		}
		if(fieldName!=null && fieldName!="") {
		 
			conditionBean.setFieldName("%"+fieldName+"%");
			request.setAttribute("fieldName", fieldName);
		}
	
		 list=productionBizImp.findProductionList(conditionBean,request,null).getProList();
		//list=productionMapper.findProductionList(conditionBean);
		request.setAttribute("list", list);
		conditionBean.setProList(list);
		
		return conditionBean;
	}
	
	@RequestMapping("/adminToIllegalProduction.action")
	@ResponseBody
	public ConditionBean adminToIllegalProduction(HttpServletRequest request,Integer delProId,String conditionName,String fieldName,Integer currentPage) {
		
		System.out.println("要下架的作品ID="+delProId); 
		
		
		productionMapper.adminToIllegalProduction(delProId);
		
		
ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
		
		ConditionBean conditionBean=new ConditionBean();
		conditionBean.setCurrentPage(currentPage);
		//System.out.println("handler 条件="+conditionName+"-->"+fieldName);
		if(conditionName!=null && conditionName!="" ) {
			conditionBean.setConditionName("%"+conditionName+"%");
			request.setAttribute("conditionName", conditionName);
		}
		if(fieldName!=null && fieldName!="") {
		 
			conditionBean.setFieldName("%"+fieldName+"%");
			request.setAttribute("fieldName", fieldName);
		}
	
		 list=productionBizImp.findProductionList(conditionBean,request,null).getProList();
		//list=productionMapper.findProductionList(conditionBean);
		request.setAttribute("list", list);
		conditionBean.setProList(list);
		
		return conditionBean;
	}
	
	@RequestMapping("/adminToPsaaProduction.action")
	@ResponseBody
	public ConditionBean adminToPsaaProduction(HttpServletRequest request,Integer delProId,String conditionName,String fieldName,Integer currentPage) {
		
		System.out.println("通过审核的作品ID="+delProId); 
		
		
		productionMapper.adminToPsaaProduction(delProId);
		
		
ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
		
		ConditionBean conditionBean=new ConditionBean();
		conditionBean.setCurrentPage(currentPage);
		//System.out.println("handler 条件="+conditionName+"-->"+fieldName);
		if(conditionName!=null && conditionName!="" ) {
			conditionBean.setConditionName("%"+conditionName+"%");
			request.setAttribute("conditionName", conditionName);
		}
		if(fieldName!=null && fieldName!="") {
		 
			conditionBean.setFieldName("%"+fieldName+"%");
			request.setAttribute("fieldName", fieldName);
		}
	
		 list=productionBizImp.findProductionList(conditionBean,request,null).getProList();
		//list=productionMapper.findProductionList(conditionBean);
		request.setAttribute("list", list);
		conditionBean.setProList(list);
		
		return conditionBean;
	}
	
	@RequestMapping("/toProductionManage.action")
	public ModelAndView toProductionManage(HttpServletRequest request,String conditionName,String fieldName) {
		System.out.println("进入作品中心的搜索");
		ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
		
		ConditionBean conditionBean=new ConditionBean();
		conditionBean.setCurrentPage(1);
		if(conditionName!=null && conditionName!="" ) {
			conditionBean.setConditionName("%"+conditionName+"%");
			request.setAttribute("conditionName", conditionName);
		}
		if(fieldName!=null && fieldName!="") {
		 
			conditionBean.setFieldName("%"+fieldName+"%");
			request.setAttribute("fieldName", fieldName);
		}
	
		 list=productionBizImp.findProductionList(conditionBean,request,null).getProList();
		//list=productionMapper.findProductionList(conditionBean);
		request.setAttribute("list", list);
		
	
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/ProductionManage");
		System.out.println("进入作品中心的搜索");
		return mav;
	}
	
	@RequestMapping("/findBuyProduction.action")
	public ModelAndView findBuyProduction(HttpServletRequest request,String conditionName,String fieldName) {
		ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
		
		ConditionBean conditionBean=new ConditionBean();
		conditionBean.setCurrentPage(1);
		// System.out.println("handler 条件="+conditionName+"-->"+fieldName);
			if(conditionName!=null && conditionName!="" ) {
				conditionBean.setConditionName("%"+conditionName+"%");
				request.setAttribute("conditionName", conditionName);
			}
			if(fieldName!=null && fieldName!="") {
			 
				conditionBean.setFieldName("%"+fieldName+"%");
				request.setAttribute("fieldName", fieldName);
			}
		UserBean userBean=(UserBean) request.getSession().getAttribute("user");
	//	System.out.println("当前的服务商id="+userBean.getUserId());
		conditionBean.setUserName(userBean.getUserId());
		list=productionBizImp.findBuyProduction(conditionBean, request, null).getProList();
		//list=productionBizImp.findProductionList(conditionBean,request,null).getProList();
		//list=productionMapper.findProductionList(conditionBean);
		request.setAttribute("list", list);
		
	
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/buyProduction2");
		
		
		//----------------菜单-------
		//------------菜单------
		ArrayList<AuthorityBean> menuList=new ArrayList<AuthorityBean>();
		menuList=authoriyMapper.findOwnMune(userBean.getUserId());
		request.setAttribute("menuList", menuList);
		//---------------------
		
		
		//----------------------
		
		
		
		return mav;
	}
	@RequestMapping("/buyProductionAddPages.action")
	@ResponseBody
	public ConditionBean buyProductionAddPages(HttpServletRequest request, Integer currentPage, Integer totalPages
			,String conditionName,String fieldName ,String state
			) {
	//	System.out.println("下一页"+currentPage+"总页数"+totalPages);
	 	//System.out.println("handler 条件="+conditionName+"-->"+fieldName);
		//System.out.println("条件"+conditionName+fieldName);
		
		
		ConditionBean conditionBean=new ConditionBean();
		conditionBean.setCurrentPage(currentPage);
		//conditionBean.setCurrentPage(currentPage);
		conditionBean.setTotalPages(totalPages);
		if(conditionName!=null && conditionName!="" ) {
			conditionBean.setConditionName("%"+conditionName+"%");
			request.setAttribute("conditionName", conditionName);
		}
		if(fieldName!=null && fieldName!="") {
		 
			conditionBean.setFieldName("%"+fieldName+"%");
			request.setAttribute("fieldName", fieldName);
		}
	//	System.out.println(conditionBean.getConditionName()+"---->"+conditionBean.getFieldName());
		ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
		UserBean userBean=(UserBean) request.getSession().getAttribute("user");
	//	System.out.println("当前的服务商id="+userBean.getUserId());
		conditionBean.setUserName(userBean.getUserId());
	//	 list=productionBizImp.findProductionList(conditionBean,request,state).getProList();
		 list=productionBizImp.findBuyProduction(conditionBean, request, state).getProList();
			
		 request.setAttribute("list", list);
 
			conditionBean.setProList(list);
		return conditionBean;
	}
}
