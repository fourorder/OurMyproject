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
}
