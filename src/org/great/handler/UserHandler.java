package org.great.handler;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.biz.UserBiz;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/user")//用户的handler包
public class UserHandler {
@Resource
private UserBiz userBizImp;
@RequestMapping("/search")
public ModelAndView serach(String name,HttpServletRequest request) {
	ModelAndView modelAndView=new ModelAndView();
	request.setAttribute("objList", userBizImp.search(name));
	modelAndView.setViewName("jsp/serachresult");
	return modelAndView;
}


}
