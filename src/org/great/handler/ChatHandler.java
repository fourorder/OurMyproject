package org.great.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.great.bean.UserBean;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/chat")//顾问
public class ChatHandler {
	@RequestMapping("/gotochat.action")//跳到申请页面
	public ModelAndView test(HttpServletRequest request,String account,String msg){
		ModelAndView modelAndView=new ModelAndView();		
		request.setAttribute("toUser", account);
		UserBean userBean=(UserBean) request.getSession().getAttribute("user");
		request.setAttribute("msg", msg);
		System.out.println(account);
		System.out.println(userBean.userAccount);
		modelAndView.setViewName("jsp/onlinechat");
		return modelAndView;	
	}
	
	
}
