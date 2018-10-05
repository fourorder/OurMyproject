package org.great.handler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.biz.UserBiz;
import org.great.mapper.UserMapper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/lighthouse")//资金流向的handler包
public class LighthouseHandler {
	@Resource UserBiz userBizImp;
	@RequestMapping("/gotolighthouse.action")//跳到曝光台页面
	public ModelAndView test(HttpServletRequest request,String page,String state){
		ModelAndView modelAndView=new ModelAndView();
		request.setAttribute("lighthouseList", userBizImp.userCredit(page, state));
		modelAndView.setViewName("jsp/lighthouse");
		return modelAndView;
	}
	@RequestMapping("/selectpage.action")//跳到曝光台页面
	@ResponseBody
	public List<List<Object>> selectPage(HttpServletRequest request,String page,String state){
		
		return userBizImp.userCredit(page, state);

		
	}
	
}
