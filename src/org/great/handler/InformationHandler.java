package org.great.handler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.InformationBean;
import org.great.biz.InformationBiz;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/infor")//资讯设置的handler包
public class InformationHandler {
	
	@Resource
	private InformationBiz informationBizImp;
	
	@RequestMapping("/page.action")//跳到资讯配置页面
	public ModelAndView test(){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/informationPage");
		return modelAndView;
	}
	
	
	@RequestMapping("/mation.action")//跳到提交页
	public ModelAndView test(HttpServletRequest request,String Title,String Content,String Time,String Address){
		ModelAndView modelAndView=new ModelAndView();
        InformationBean ib=new InformationBean();
        ib.setInformationTitle(Title);
        ib.setInformationContent(Content);
        ib.setInformationPublishTime(Time);
        ib.setInformationAddress(Address);
        int a =informationBizImp.setInformation(ib);
        System.out.println("结果："+a);
        if(a>0) {
        	modelAndView.setViewName("jsp/informationPage");
        	return modelAndView;
        }
		modelAndView.setViewName("jsp/home");
		System.out.println("失败！");
		return modelAndView;
		
		
	}
	@RequestMapping("/infolist.action")
	public ModelAndView infolist(HttpServletRequest request,String typeid){
		ModelAndView modelAndView=new ModelAndView();
		request.setAttribute("informationList", informationBizImp.getInforList(Integer.parseInt(typeid), 5, 1));
		request.setAttribute("typeid", typeid);
		request.setAttribute("page", 1);
		request.setAttribute("countPage",informationBizImp.getcountPage(Integer.parseInt(typeid)));
		modelAndView.setViewName("jsp/informationList");
		return modelAndView;
	}
	@RequestMapping("/selectInfo.action")
	@ResponseBody
	public List<Object> selectInfo(String page,String state,String parameterid){
		return informationBizImp.selectInfo(page, state, parameterid);
	}
	


}
