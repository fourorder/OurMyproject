package org.great.handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.biz.IntroductionBiz;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/introduction")
public class IntroductionHandler {
@Resource
private IntroductionBiz introductionBizImp;
@RequestMapping("/getrule.action")
public ModelAndView getRule(HttpServletRequest request){
	ModelAndView modelAndView=new ModelAndView();
	request.setAttribute("rule", introductionBizImp.showRule());
	modelAndView.setViewName("jsp/rule");
	return modelAndView;
	
}
	
}
