package org.great.handler;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.DemandBean;
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
public ModelAndView test(HttpServletRequest request,String content,String page,String number) {
	List<RuleBean> rule=ruleBizImp.countRule(content);
	int countPage=rule.size();
	int totalPages = countPage / 5 + ((countPage % 5) > 0 ? 1 : 0);//定义总页数
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
	list=ruleBizImp.rule(content, num);
	System.out.println("需求有："+list.size());
	request.setAttribute("Flist", list);
	request.setAttribute("countPage", totalPages);
	request.setAttribute("num", num);
	ModelAndView modelAndView=new ModelAndView();
	modelAndView.setViewName("jsp/ruleManage");
	return modelAndView;
}
@RequestMapping("/findById.action")
@ResponseBody
public List<Object> test(int introductionId){
	List<Object> list=new ArrayList<>();
	List<RuleBean> list1=ruleBizImp.findInfo(introductionId);
	list.add(list1);
	
	return list;
	
}
@RequestMapping("/changeInfo.action")
public ModelAndView test(HttpServletRequest request) {
	String introductionId2=request.getParameter("introductionId2");
	String content2=request.getParameter("content2");
	String state=request.getParameter("state2");
	System.out.println(introductionId2);
	System.out.println(content2);
	System.out.println(state);
	
	ruleBizImp.changeInfo(Integer.valueOf(introductionId2),content2,Integer.valueOf(state));
	
	ModelAndView modelAndView=new ModelAndView("redirect:/rule/page.action?page=tpage&number=1");
	
	
	
	
	
	
	
	return modelAndView;
	
}

@RequestMapping("/changeState.action")
@ResponseBody
public List<Object> test(String content,String introductionId,String upFlag,String number,String page) {
	
	int num=Integer.valueOf(number);
	 int stateId2=Integer.valueOf(upFlag);
if(stateId2==3) {
	ruleBizImp.changeState(Integer.valueOf(introductionId));//删除
}else if(stateId2==5) {
	ruleBizImp.changeState2(Integer.valueOf(introductionId));//禁用
}else if(stateId2==6) {
	ruleBizImp.changeState3(Integer.valueOf(introductionId));//启用
}
		
	
	
if(number=="") {
	number="1";
}
int countPage=0;
List<Object> list1=new ArrayList<>();
	System.out.println("我来了");
	System.out.println("page="+page);
	
	List<RuleBean> rule=ruleBizImp.countRule(content);
	countPage=rule.size();//总用户数
	


int totalPages = countPage / 5 + ((countPage % 5) > 0 ? 1 : 0);//定义总页数

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
List<RuleBean> list=new ArrayList<RuleBean>();
list=ruleBizImp.rule(content, num);
list1.add(list);
list1.add(num);
list1.add(totalPages);
return list1;
}

@RequestMapping("/selectPage.action")
@ResponseBody
public List<Object> selectPage(String content,String page,String number) {
	if(number=="") {
		number="1";
	}
	int countPage=0;
	List<Object> list1=new ArrayList<>();
		System.out.println("我来了");
		System.out.println("page="+page);
		
		List<RuleBean> demand=ruleBizImp.countRule(content);
		countPage=demand.size();//总用户数
		

	
	int totalPages = countPage / 5 + ((countPage % 5) > 0 ? 1 : 0);//定义总页数
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
	List<RuleBean> list=new ArrayList<RuleBean>();
	list=ruleBizImp.rule(content, num);
	list1.add(list);
	list1.add(num);
	list1.add(totalPages);
	return list1;
	
	
	
}

@RequestMapping("/addRule.action")
public ModelAndView test2(HttpServletRequest request) {
	String content3=request.getParameter("content3");
	
	ruleBizImp.addRule(content3);
	
	ModelAndView modelAndView=new ModelAndView("redirect:/rule/page.action?page=tpage&number=1");
	
	
	
	
	
	
	
	return modelAndView;
	
}
}
