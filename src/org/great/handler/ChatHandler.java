package org.great.handler;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.UserBean;
import org.great.biz.ChatBiz;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/chat")//顾问
public class ChatHandler {
	@Resource
	private ChatBiz chatBizImp;
	@RequestMapping("/gotochat.action")//跳到申请页面
	public ModelAndView test(HttpServletRequest request,String account){
		ModelAndView modelAndView=new ModelAndView();
		request.setAttribute("toUser", account);
		modelAndView.setViewName("jsp/onlinechat");
		return modelAndView;	
	}
	@RequestMapping("/chatlist.action")//跳到未读消息列表
	public ModelAndView chatList(HttpServletRequest request,String page,String state){
		ModelAndView modelAndView=new ModelAndView();
		UserBean userBean=(UserBean) request.getSession().getAttribute("user");
		request.setAttribute("chatList",chatBizImp.getMsgInfo(page,state,userBean.getUserId()) );
		modelAndView.setViewName("jsp/chatlist");
		return modelAndView;
	}
	@RequestMapping("/selectchat.action")
	@ResponseBody
	public List<Object> selectchat(HttpServletRequest request,String page,String state){
		UserBean userBean=(UserBean) request.getSession().getAttribute("user");
		return chatBizImp.getMsgInfo(page,state,userBean.getUserId());
	}
	
	
}
