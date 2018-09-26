package org.great.handler;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.ConditionBean;
import org.great.bean.ParameterBean;
import org.great.bean.ProductionBean;
import org.great.bean.UserBean;
import org.great.biz.ProductionBiz;
import org.great.mapper.ParameterMapper;
import org.great.mapper.ProductionMapper;
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
	private ProductionBiz productionBizImp;
	
	
	@RequestMapping("/toProduction.action")
	public ModelAndView toProduction(HttpServletRequest request,String conditionName,String fieldName) {
		ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
		
		ConditionBean conditionBean=new ConditionBean();
		conditionBean.setCurrentPage(1);
		if(conditionName!=null) {
			conditionBean.setConditionName("%"+conditionName+"%");
		}
		if(fieldName!=null) {
		 
			conditionBean.setFieldName("%"+fieldName+"%");
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
	//	System.out.println("管理");
		ArrayList<ParameterBean> list=new ArrayList<ParameterBean>();
		list=parameterMapper.findProductionClass();
		request.setAttribute("list", list);
		return mav;
	}
	
	
	
	@RequestMapping("/toIssueProduction.action")
	public ModelAndView toIssueProduction(HttpServletRequest request
			,String title,Integer  price,Integer className,String area2,MultipartFile file		
			,MultipartFile  productionFile
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/productionAllList");
		   String filename =productionFile.getOriginalFilename();
		  UserBean userBean= (UserBean) request.getSession().getAttribute("user");//从session取出userbean对象
		productionBizImp.toIssueProduction(request, title, price, className, area2,file,
				userBean.getUserId(),productionFile);
		
		
		return mav;
	}
	
	
	@RequestMapping("/AddPages.action")
	@ResponseBody
	public ConditionBean AddPages(HttpServletRequest request, Integer currentPage, Integer totalPages
			,String conditionName,String fieldName ,String state
			) {
		//System.out.println("下一页"+currentPage+"总页数"+totalPages);
		//System.out.println("条件"+conditionName+fieldName);
		
		
		ConditionBean conditionBean=new ConditionBean();
		conditionBean.setCurrentPage(currentPage);
		conditionBean.setCurrentPage(currentPage);
		conditionBean.setTotalPages(totalPages);
		if(conditionName!=null) {
			conditionBean.setConditionName("%"+conditionName+"%");
		}
		if(fieldName!=null) {
		 
			conditionBean.setFieldName("%"+fieldName+"%");
		}
	//	System.out.println(conditionBean.getConditionName()+"---->"+conditionBean.getFieldName());
		ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
	 
		 list=productionBizImp.findProductionList(conditionBean,request,state).getProList();
		
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
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/alipay.trade.page.pay");
		
		return mav;
		
	}
	
	@RequestMapping("/productionPayFinish.action")
	public void productionPayFinish(HttpServletRequest request,Integer  proId,
			Integer userId,Integer  proUserId,Double price) throws UnsupportedEncodingException, AlipayApiException
	  {//ModelAndView
		ServletContext application = request.getSession().getServletContext();
//		HttpSession session = request.getSession();
//		System.out.println("1111111111111111111111111");
//		System.out.println(session);
		String proId2=application.getAttribute("buyProductionId").toString();
		Integer  proId3=Integer.valueOf(proId2);
		System.out.println("ooppppp"+proId3);
		
		//---------------------------------------
		

			//获取支付宝POST过来反馈信息
			Map<String,String> params = new HashMap<String,String>();
			Map<String,String[]> requestParams = request.getParameterMap();
			for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i]
							: valueStr + values[i] + ",";
				}
				//乱码解决，这段代码在出现乱码时使用
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
				System.out.println("参数条那件="+name+"==--->"+valueStr);
				params.put(name, valueStr);
			}
			
			boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

			//——请在这里编写您的程序（以下代码仅作参考）——
			
			/* 实际验证过程建议商户务必添加以下校验：
			1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
			2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
			3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
			4、验证app_id是否为该商户本身。
			*/
			if(signVerified) {//验证成功
				//商户订单号
				String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
			
				//支付宝交易号
				String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
			
				//交易状态
		//		String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
				
				 String passback_params = java.net.URLEncoder.encode(params.get("passback_params"),"UTF-8");
				 System.out.println("自定义参数="+passback_params);
				
			/*	if(trade_status.equals("TRADE_FINISHED")){
					//判断该笔订单是否在商户网站中已经做过处理
					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
					//如果有做过处理，不执行商户的业务程序
						
					//注意：
					//退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
				}else if (trade_status.equals("TRADE_SUCCESS")){
					//判断该笔订单是否在商户网站中已经做过处理
					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
					//如果有做过处理，不执行商户的业务程序
					
					//注意：
					//付款完成后，支付宝系统发送该交易状态通知
				}*/
				
				System.out.println("success");
				
			}else {//验证失败
				System.out.println("fail");
			
				//调试用，写文本函数记录程序运行情况是否正常
				//String sWord = AlipaySignature.getSignCheckContentV1(params);
				//AlipayConfig.logResult(sWord);
			}
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
		
		//return null;
	}
	
	
	@RequestMapping("/productionToManage.action")
	public ModelAndView productionToManage(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/ProductionManage");
	//	System.out.println("管理");
ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
		
		ConditionBean conditionBean=new ConditionBean();
		conditionBean.setCurrentPage(1);
		/*if(conditionName!=null) {
			conditionBean.setConditionName("%"+conditionName+"%");
		}
		if(fieldName!=null) {
		 
			conditionBean.setFieldName("%"+fieldName+"%");
		}*/
		conditionBean.setConditionName("%"+"陈键"+"%");
		System.out.println("写死，查找服务商的作品。传session userName");
		 list=productionBizImp.findProductionList(conditionBean,request,null).getProList();
		//list=productionMapper.findProductionList(conditionBean);
		request.setAttribute("list", list);
		return mav;
	}
	
	
}
