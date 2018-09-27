package org.great.handler;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.biz.UserBiz;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/user")//用户的handler包
public class UserHandler {
@Resource
private UserBiz userBizImp;


@RequestMapping("/search.action")
public ModelAndView serach(String name,HttpServletRequest request,String page,String state) {

	ModelAndView modelAndView=new ModelAndView();

	request.setAttribute("objList", userBizImp.getAllList(name));
	request.setAttribute("searchName", name);
	request.setAttribute("page",1);
	modelAndView.setViewName("jsp/serachresult");
	return modelAndView;
}
@RequestMapping("/selectepage.action")
//雇主分页ajax
@ResponseBody
public List<Object> selectEpage(String name,String page,String state){
	return userBizImp.search(name,page,state,1);
}
@RequestMapping("/selectbpage.action")
//服务商分页ajax
@ResponseBody
public List<Object> selectBpage(String name,String page,String state){
	return userBizImp.search(name,page,state,2);
}
@RequestMapping("/EmployerInformation.action")//用户详细信息
public ModelAndView EmployerInformation(HttpServletRequest request,String userid){
	ModelAndView modelAndView=new ModelAndView();
	
	request.setAttribute("user", userBizImp.userinfo(userid));
	modelAndView.setViewName("jsp/employerInfo");
	return modelAndView;
}
@RequestMapping("/returnHome.action")//返回主页
public ModelAndView returnHome(){
	ModelAndView modelAndView=new ModelAndView();
	modelAndView.setViewName("jsp/home");
	return modelAndView;
}
@RequestMapping("/UserInformation.action")//个人中心
ModelAndView UserInformation(HttpServletRequest request,String userid){
	ModelAndView modelAndView=new ModelAndView();
	
	request.setAttribute("userInfo", userBizImp.userinfo(userid));
	modelAndView.setViewName("jsp/userInfo");
	return modelAndView;

}
}
