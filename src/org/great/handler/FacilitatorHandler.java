package org.great.handler;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.dbutils.handlers.columns.StringColumnHandler;
import org.apache.jasper.tagplugins.jstl.core.If;
import org.great.bean.UserBean;
import org.great.biz.UserBiz;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/facilitator")
public class FacilitatorHandler  {
	@Resource
private UserBiz userBizImp;
@RequestMapping("/page.action")
public ModelAndView test(HttpServletRequest request,String name,String page,String number) {
	List<UserBean> user1=userBizImp.countFacilitator();
	List<UserBean> user2=userBizImp.countFacilitator2();
	int countPage=user1.size()+user2.size();//总用户数
	int totalPages = countPage / 2 + ((countPage % 2) > 0 ? 1 : 0);//定义总页数
	int num=Integer.parseInt(number);
	if(page.equals("tpage")) {
		num--;
		if(num<=0) {
			num=1;
		}
	}else if(page.equals("npage")) {
		num++;
		if (totalPages<num) {
			num=totalPages;
		}
		
	}
	System.out.println("总用户数为："+countPage);
	System.out.println("当前页为："+num);
	System.out.println("总共页数："+totalPages);
	
	List<UserBean> list=new ArrayList<UserBean>();
	list=userBizImp.facilitator(name, num);
	System.out.println("服务商有："+list.size());
	request.setAttribute("Flist", list);
	request.setAttribute("countPage", totalPages);
	request.setAttribute("num", num);
/*	request.setAttribute("totalCount", countPage);*/
	ModelAndView modelAndView=new ModelAndView();
	modelAndView.setViewName("jsp/facilitator");
	return modelAndView;

	
}
@RequestMapping("/changeState.action")
@ResponseBody
public List<Object> test(String userName,String userId,String stateId,String number) {
	int num=Integer.valueOf(number);
			
	userBizImp.changeState(Integer.valueOf(userId),Integer.valueOf(stateId));
	List<UserBean> user1=userBizImp.countFacilitator();
	List<UserBean> user2=userBizImp.countFacilitator2();
	int countPage=user1.size()+user2.size();//总用户数
	int totalPages = countPage / 2 + ((countPage % 2) > 0 ? 1 : 0);//定义总页数
	if(num>totalPages) {
		num=totalPages;
	}
	List<UserBean> list=new ArrayList<UserBean>();
	list=userBizImp.facilitator(userName, num);
	
	List<Object> list2=new ArrayList<>();
	
	list2.add(list);
	list2.add(num);
	list2.add(totalPages);
	return list2 ;	
}
@RequestMapping("/selectPage.action")
@ResponseBody
public List<Object> selectPage(String userName,String page,String number) {
	if(number=="") {
		number="1";
	}
	int countPage=0;
	List<Object> list1=new ArrayList<>();
	if(userName=="") {
		System.out.println("我来了");
		System.out.println("page="+page);
		
		List<UserBean> user1=userBizImp.countFacilitator();
		List<UserBean> user2=userBizImp.countFacilitator2();
		countPage=user1.size()+user2.size();//总用户数
		System.out.println("总用户数为："+countPage);
	}else {
		System.out.println("我来了");
		System.out.println("page="+page);
		
		List<UserBean> user1=userBizImp.countFacilitator3(userName);
		List<UserBean> user2=userBizImp.countFacilitator4(userName);
		 countPage=user1.size()+user2.size();//总用户数
		System.out.println("总用户数为："+countPage);
	}
	
	int totalPages = countPage / 2 + ((countPage % 2) > 0 ? 1 : 0);//定义总页数
	int num=Integer.parseInt(number);
	if(page.equals("tpage")) {
		num--;
		if(num<=0) {
			num=1;
		}
	}else if(page.equals("npage")) {
		num++;
		if (totalPages<num) {
			num=totalPages;
		}
		
	}else if(page.equals("page")) {
		if(num>totalPages) {
			num=totalPages;
		}else if(num<0) {
			num=1;
		}
	}
	System.out.println("当前页为："+num);
	System.out.println("总共页数："+totalPages);
	List<UserBean> list=new ArrayList<UserBean>();
	list=userBizImp.facilitator(userName, num);
	list1.add(list);
	list1.add(num);
	list1.add(totalPages);
	return list1;
	
	
}
@RequestMapping("/selectPage2.action")
@ResponseBody
public List<Object> selectPage2(String userName,String page,String number) {
	int countPage=0;
	List<Object> list1=new ArrayList<>();
	if(userName=="") {
		System.out.println("我来了");
		System.out.println("page="+page);
		
		List<UserBean> user1=userBizImp.countFacilitator();
		List<UserBean> user2=userBizImp.countFacilitator2();
		 countPage=user1.size()+user2.size();//总用户数
		System.out.println("总用户数为："+countPage);
	}else {
		System.out.println("我来了");
		System.out.println("page="+page);
		
		List<UserBean> user1=userBizImp.countFacilitator3(userName);
		List<UserBean> user2=userBizImp.countFacilitator4(userName);
		 countPage=user1.size()+user2.size();//总用户数
	}
	
	int totalPages = countPage / 2 + ((countPage % 2) > 0 ? 1 : 0);//定义总页数
	int num=Integer.parseInt(number);
	if(page.equals("tpage")) {
		num--;
		if(num<=0) {
			num=1;
		}
	}else if(page.equals("npage")) {
		num++;
		if (totalPages<num) {
			num=totalPages;
		}
		
	}else if(page.equals("page")) {
		if(num>totalPages) {
			num=totalPages;
		}else if(num<0) {
			num=1;
		}
	}
	System.out.println("当前页为："+num);
	System.out.println("总共页数："+totalPages);
	List<UserBean> list=new ArrayList<UserBean>();
	list=userBizImp.facilitator(userName, num);
	list1.add(list);
	list1.add(num);
	list1.add(totalPages);
	return list1;
	
	
}
@RequestMapping("changeInfo.action")
public ModelAndView test(HttpServletRequest request) {
	String userId=request.getParameter("userId");
	String userName=request.getParameter("userName");
	String userTel=request.getParameter("userTel");
	String userAccount=request.getParameter("userAccount");
	String userSex=request.getParameter("userSex");
	String userMail=request.getParameter("userMail");
	String userIdentity=request.getParameter("userIdentity");
	String userCredit=request.getParameter("userCredit");
	String userMoney=request.getParameter("userMoney");
	String userRegisterTime=request.getParameter("userRegisterTime");
	userBizImp.changeInfo(Integer.valueOf(userId), userName,Long.valueOf(userTel) , userAccount, userSex, userMail, userIdentity,Integer.valueOf(userCredit) ,Integer.valueOf(userMoney) , userRegisterTime);
	
	ModelAndView modelAndView=new ModelAndView("redirect:/facilitator/page.action?page=tpage&number=1");
	
	
	
	
	
	
	
	return modelAndView;
	
}
}

