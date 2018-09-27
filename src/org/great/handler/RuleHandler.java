package org.great.handler;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.great.bean.RuleBean;
import org.great.biz.RuleBiz;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/rule")
public class RuleHandler {
@Resource
private RuleBiz ruleBizImp;
@RequestMapping("/page.action")
public ModelAndView test(HttpServletRequest request,String ruleName,String page,String number) {
	List<RuleBean> rule=ruleBizImp.countRule();
	int countPage=rule.size();
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
	
	List<RuleBean> list=new ArrayList<RuleBean>();
	list=ruleBizImp.rule(ruleName, num);
	System.out.println("需求有："+list.size());
	request.setAttribute("Flist", list);
	request.setAttribute("countPage", totalPages);
	request.setAttribute("num", num);
	ModelAndView modelAndView=new ModelAndView();
	modelAndView.setViewName("jsp/ruleManager");
	return modelAndView;
}
@RequestMapping("/findById.action")
@ResponseBody
public List<Object> test(int ruleId){
	List<Object> list=new ArrayList<>();
	List<RuleBean> list1=ruleBizImp.findInfo(ruleId);
	list.add(list1);
	
	return list;
	
}
@RequestMapping("changeInfo.action")
public ModelAndView test(HttpServletRequest request) {
	String ruleId2=request.getParameter("ruleId2");
	String ruleName2=request.getParameter("ruleName2");
	String securityMoney2=request.getParameter("securityMoney2");
	String dealMoney2=request.getParameter("dealMoney2");
	String auctionTime2=request.getParameter("auctionTime2");
	String completeTime2=request.getParameter("completeTime2");
	ruleBizImp.changeInfo(Integer.valueOf(ruleId2),ruleName2,Integer.valueOf(securityMoney2),Integer.valueOf(dealMoney2),auctionTime2,completeTime2);
	
	ModelAndView modelAndView=new ModelAndView("redirect:/rule/page.action?page=tpage&number=1");
	
	
	
	
	
	
	
	return modelAndView;
	
}
@RequestMapping("/changeState.action")
@ResponseBody
public List<Object> test(String ruleName,String ruleId,String stateId,String number) {
	int num=Integer.valueOf(number);
	 int stateId2=Integer.valueOf(stateId);
if(stateId2==3) {
	ruleBizImp.changeState(Integer.valueOf(ruleId),Integer.valueOf(stateId));//删除
}else if(stateId2==1) {
	ruleBizImp.changeState2(Integer.valueOf(ruleId),Integer.valueOf(stateId));
}else if(stateId2==2) {
	ruleBizImp.changeState3(Integer.valueOf(ruleId),Integer.valueOf(stateId));
}
		
	
	
	List<RuleBean> rule=ruleBizImp.countRule();
	
	int countPage=rule.size();//总用户数
	int totalPages = countPage / 2 + ((countPage % 2) > 0 ? 1 : 0);//定义总页数
	if(num>totalPages) {
		num=totalPages;
	}
	List<RuleBean> list=new ArrayList<RuleBean>();
	list=ruleBizImp.rule(ruleName, num);
	
	List<Object> list2=new ArrayList<>();
	
	list2.add(list);
	list2.add(num);
	list2.add(totalPages);
	return list2 ;	
}
@RequestMapping("/selectPage.action")
@ResponseBody
public List<Object> selectPage(String ruleName,String page,String number) {
	if(number=="") {
		number="1";
	}
	int countPage=0;
	List<Object> list1=new ArrayList<>();
	if(ruleName=="") {
		System.out.println("我来了");
		System.out.println("page="+page);
		
		List<RuleBean> rule=ruleBizImp.countRule();
		countPage=rule.size();//总用户数
		System.out.println("总用户数为："+countPage);
		
	}else {
		System.out.println("我来了");
		System.out.println("page="+page);
		
		List<RuleBean> rule=ruleBizImp.countRule2(ruleName);
		
		 countPage=rule.size();//总用户数
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
	System.out.println("ruleName="+ruleName);
	List<RuleBean> list=new ArrayList<RuleBean>();
	
	list=ruleBizImp.rule(ruleName, num);
	
	
	
	System.out.println("list.size()="+list.size());
	list1.add(list);
	list1.add(num);
	list1.add(totalPages);
	return list1;
	
	
}
@RequestMapping("/addRule.action")
public ModelAndView test2(HttpServletRequest request) {
	String ruleName3=request.getParameter("ruleName3");
	String securityMoney3=request.getParameter("securityMoney3");
	String dealMoney3=request.getParameter("dealMoney3");
	String auctionTime3=request.getParameter("auctionTime3");
	String completeTime3=request.getParameter("completeTime3");
	ruleBizImp.addRule(ruleName3,Integer.valueOf(securityMoney3),Integer.valueOf(dealMoney3),auctionTime3,completeTime3);
	
	ModelAndView modelAndView=new ModelAndView("redirect:/rule/page.action?page=tpage&number=1");
	
	
	
	
	
	
	
	return modelAndView;
	
}
}
