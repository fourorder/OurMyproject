package org.great.handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.AdvertisingBean;
import org.great.biz.AdvertisingBiz;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/adver")//广告设置的handler包
public class AdvertisingHandler {
	
	@Resource
	private AdvertisingBiz advertisingBizImp;
	
	@RequestMapping("/page.action")//跳到广告设置页面
	public ModelAndView test(){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/advertisingSet");
		return modelAndView;	
	}
	
	
	@RequestMapping("/advertising.action")//跳到提交页
	public ModelAndView test(HttpServletRequest request,String Title,String Content,String Time,String Address,String Image){
		ModelAndView modelAndView=new ModelAndView();
		AdvertisingBean ab=new AdvertisingBean();
		ab.setAdvertisementTitle(Title);
		ab.setAdvertisementContent(Content);
		ab.setAdvertisementPublishTime(Time);
		ab.setAdvertisementAddress(Address);
		ab.setAdvertisementImage(Image);
		
		int a = advertisingBizImp.setAdvertising(ab);
		 System.out.println("结果："+a);
		if(a>0) {
			modelAndView.setViewName("jsp/advertisingSet");
			return modelAndView;
		}
		modelAndView.setViewName("jsp/advertisingSet");
		return modelAndView;
		
	}
	
	
}
