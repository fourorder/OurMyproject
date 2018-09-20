package org.great.handler;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.biz.FundBiz;
import org.great.biz.LoginBiz;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/user")
public class LoginHandler {
@Resource
private FundBiz fundBizImp;
@Resource
private  LoginBiz loginBizImp;

@RequestMapping("/login.action")
public ModelAndView login(String userAccount,String userPwd,HttpServletRequest request) {
	ModelAndView modelAndView=new ModelAndView();
	

	int flag=loginBizImp.login(userAccount, userPwd, request);

			    if(flag==1) {
					modelAndView.setViewName("jsp/home");
				}else if(flag==2){
				    String message="用户已被锁定";
					request.setAttribute("message", message);
					modelAndView.setViewName("jsp/login");
				}else if(flag==3) {
					 String message="账户密码错误";
					request.setAttribute("message", message);
					modelAndView.setViewName("jsp/login");
				}
	return modelAndView;
	
}

@RequestMapping("/show.action")
public ModelAndView show() {
	ModelAndView modelAndView=new ModelAndView();
	
modelAndView.setViewName("jsp/login");
	
	return modelAndView;
	
}	

}
