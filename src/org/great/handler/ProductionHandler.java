package org.great.handler;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.ConditionBean;
import org.great.bean.ParameterBean;
import org.great.bean.ProductionBean;
import org.great.biz.ProductionBiz;
import org.great.mapper.ParameterMapper;
import org.great.mapper.ProductionMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
		System.out.println("管理");
		ArrayList<ParameterBean> list=new ArrayList<ParameterBean>();
		list=parameterMapper.findProductionClass();
		request.setAttribute("list", list);
		return mav;
	}
	
	
	
	@RequestMapping("/toIssueProduction.action")
	public ModelAndView toIssueProduction(HttpServletRequest request
			,String title,Integer  price,Integer className,String area2,MultipartFile file		
			,Integer userId,MultipartFile  productionFile
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/productionAllList");
		System.out.println("进入发布ID写死了"+"neirRong="+area2);
		System.out.println("biaoti="+title+"jiage="+price+"fenlei="+className);
		   String filename =productionFile.getOriginalFilename();
		   System.out.println("filename="+filename);
		   userId=2;
		productionBizImp.toIssueProduction(request, title, price, className, area2,file,userId,productionFile);
		
		
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
		
		System.out.println("商品详情,商品ID="+proId);
		ProductionBean productionBean=new ProductionBean();
		productionBean=productionBizImp.findProductionDetal(proId);
		System.out.println("作品名字="+productionBean.getProductionName());
		request.setAttribute("productionBean", productionBean);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/productionDetal");
		
		return mav;
	}
	
	@RequestMapping("/ProductionPay.action")
	public ModelAndView toProductionPay(HttpServletRequest request,Integer  proId) {
	
		System.out.println("商品支付页面="+proId);
		ProductionBean productionBean=new ProductionBean();
		productionBean=productionBizImp.findProductionDetal(proId);
		System.out.println("作品名字="+productionBean.getProductionName());
		request.setAttribute("productionBean", productionBean);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/productionPay");
		
		return mav;
		
	}
	
	
}
