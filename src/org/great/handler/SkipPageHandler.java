package org.great.handler;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/skippage")
public class SkipPageHandler {
	@RequestMapping("/gotosearchcredit.action")//跳转到信誉查询页面
	public ModelAndView searchCredit(){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/searchcredit");
		return modelAndView;
	}
	
}
