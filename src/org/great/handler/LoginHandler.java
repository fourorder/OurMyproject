package org.great.handler;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.apache.struts2.ServletActionContext;
import org.great.bean.UserBean;
import org.great.biz.AdvertisingBiz;
import org.great.biz.FundBiz;
import org.great.biz.InformationBiz;
import org.great.biz.LineBiz;
import org.great.biz.LoginBiz;
import org.great.biz.ProductionBiz;
import org.great.biz.UserBiz;
import org.great.biz.UserStoryBiz;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
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
@Resource
private ProductionBiz productionBizImp;
@Resource
private InformationBiz informationBizImp;
@Resource
private LineBiz lineBizImp;
@Resource
private UserStoryBiz userStoryBizImp;
@Resource
private AdvertisingBiz advertisingBizImp;
private String msg;
private int a;
@RequestMapping("/login.action")
//@Log(operationType = "登入", operationName = "用户登入")
public ModelAndView login(String userAccount,String userPwd,HttpServletRequest request,HttpSession session,HttpServletResponse response) {
	ModelAndView modelAndView=new ModelAndView();
String userPwd2=DigestUtils.md5DigestAsHex(userPwd.getBytes());
int flag=loginBizImp.login(userAccount, userPwd2, request);

if(flag==1) {
	
	ServletContext application = session.getServletContext();
	String sessionId = (String) application.getAttribute(userAccount); //获取登录用户的 sessionId

	if (sessionId!=null && !"".equals(sessionId)) {
	    System.out.println("该账号已登录，请您更换账号进行登录！");
	    String msg="该账号已登录，请您更换账号进行登录！";
	  modelAndView.addObject("message",msg);
	    

	  
	    modelAndView.setViewName("jsp/login");
	} else {
	    application.setAttribute(userAccount, session.getId());//设置登录用户的 sessionId
	    modelAndView.setViewName("redirect:/user/home.action");
	}
	
}else if(flag==2){
    String message="用户已被锁定";
	request.setAttribute("message", message);
	modelAndView.setViewName("jsp/login");
}else if(flag==3) {
	String message="账户密码错误";
	request.setAttribute("message", message);
	modelAndView.setViewName("jsp/login");
}else if (flag==4) {
	modelAndView.setViewName("jsp/administrationPage");
}
			    
	return modelAndView;
	
}
//跳转到登录页（猪陈毅你为什么不打注释！！！！！）
@RequestMapping("/show.action")
public ModelAndView show(HttpServletRequest request) {
	ModelAndView modelAndView=new ModelAndView();
modelAndView.setViewName("jsp/login");
	return modelAndView;
	
}
//跳转到首页
@RequestMapping("/home.action")
public ModelAndView home(HttpServletRequest request) {
	ModelAndView modelAndView=new ModelAndView();
modelAndView.setViewName("jsp/home");
request.setAttribute("fundList", fundBizImp.getFundList("1"));
request.setAttribute("page", 1);
request.setAttribute("informationList1", informationBizImp.getInformation(301));
request.setAttribute("informationList2", informationBizImp.getInformation(302));
request.setAttribute("informationList3", informationBizImp.getInformation(303));
request.setAttribute("informationList4", informationBizImp.getInformation(304));
request.setAttribute("lineList",lineBizImp.getLine());
request.setAttribute("story", userStoryBizImp.getStory());
request.setAttribute("adverList", advertisingBizImp.getAllAdver());
request.getSession().setAttribute("productionList",productionBizImp.getProductionList());//将热卖作品信息放入request
	return modelAndView;
	
}
//跳转到注册页面
@RequestMapping("/gotoregister.action")
public ModelAndView goToRegist() {
	ModelAndView modelAndView=new ModelAndView();
	
	modelAndView.setViewName("jsp/register1");
	
	return modelAndView;
	
}
@RequestMapping("/logout.action")
public ModelAndView logout(HttpServletRequest request,HttpSession session) {
	ModelAndView modelAndView=new ModelAndView();
	ServletContext application = session.getServletContext();
	UserBean user=(UserBean) request.getSession().getAttribute("user");
	application.removeAttribute(user.userAccount);//系统退出，移除该用户的sessionId
	request.getSession().invalidate();//移出session中所以信息
	modelAndView.setViewName("jsp/login");	
	return modelAndView;
	
}

@RequestMapping("/checkAccount.action")
@ResponseBody
public List<Object> checkAccount(String userAccount){
	List<Object> list=new ArrayList<Object>();
	if (userBizImp.checkAccount(userAccount)) {
		/*msg="邮箱已被占用";*/
		a=1;
		
	}else {
		/*msg="邮箱可以使用";*/
		a=2;
	}
	list.add(a);
	return list;
}

}
