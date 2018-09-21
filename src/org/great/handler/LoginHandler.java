package org.great.handler;



import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.biz.FundBiz;
import org.great.biz.LoginBiz;
import org.great.biz.UserBiz;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/user")
public class LoginHandler {
@Resource
private FundBiz fundBizImp;
@Resource
private  LoginBiz loginBizImp;
@Resource
private UserBiz userBizImp;
private String msg;
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
@RequestMapping("/checkAccount.action")
@ResponseBody
public List<Object> checkAccount(String userAccount){
	List<Object> list=new ArrayList<Object>();
	if (userBizImp.checkAccount(userAccount)) {
		msg="邮箱已被占用";
		
	}else {
		msg="邮箱可以使用";
	}
	list.add(msg);
	return list;
}

}
