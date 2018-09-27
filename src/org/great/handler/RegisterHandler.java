package org.great.handler;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.biz.RegisterBiz;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@Scope("prototype")
@RequestMapping("/register")
public class RegisterHandler  {
	@RequestMapping("/registerShow.action")
	public  ModelAndView show() {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/register1");
				
		return modelAndView;
		
	}
	@RequestMapping("/registerShow2.action")
	public ModelAndView show2(HttpServletRequest request) {
		ModelAndView modelAndView=new ModelAndView();
		String userAccount=request.getParameter("userAccount");
		String userPwd=request.getParameter("userPwd");
		request.setAttribute("userAccount", userAccount);
		request.setAttribute("userPwd", userPwd);
		modelAndView.setViewName("jsp/register2");
				
		return modelAndView;
	}
	@RequestMapping("/registerShow3.action")
	public ModelAndView show3(HttpServletRequest request) {
		ModelAndView modelAndView=new ModelAndView();
		String userAccount=request.getParameter("userAccount");
		String userPwd=request.getParameter("userPwd");
		String characterId=request.getParameter("characterId");
		request.setAttribute("userAccount", userAccount);
		request.setAttribute("userPwd", userPwd);
		request.setAttribute("characterId", characterId);
		System.out.println(userAccount+"----"+userPwd+"-----"+characterId);
		
		modelAndView.setViewName("jsp/register3");
				
		return modelAndView;
	}
	@Resource
	private RegisterBiz registerBizImp;
	@RequestMapping("/register.action")
	public ModelAndView register(HttpServletRequest request) {
		
		ModelAndView modelAndView=new ModelAndView();
	    String userAccount=request.getParameter("userAccount");
	    System.out.println(userAccount);
        String userPwd=request.getParameter("userPwd");
        System.out.println(userPwd);
        String characterId=request.getParameter("characterId");
        System.out.println(characterId);
        String userName=request.getParameter("userName");
        System.out.println(userName);
        String userTel=request.getParameter("userTel");
        System.out.println(userTel);
        String userIdentity=request.getParameter("userIdentity");
        System.out.println(userIdentity);
        String stateId=request.getParameter("stateId");
        System.out.println(stateId);
		registerBizImp.register(userAccount, userPwd, Integer.valueOf(characterId), userName, Long.valueOf(userTel), userIdentity, Integer.valueOf(stateId), request);
		
		modelAndView.setViewName("jsp/login");
				
		return modelAndView;
	}
	


}