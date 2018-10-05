package org.great.handler;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.LineBean;

import org.great.biz.LineBiz;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/line")
public class LineHandler {
@Resource
private LineBiz lineBizImp;
@RequestMapping("/page.action")
public ModelAndView test(HttpServletRequest request,String lineName,String page,String number) {
	List<LineBean> line=lineBizImp.countLine(lineName);
	int countPage=line.size();
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
	
	List<LineBean> list=new ArrayList<LineBean>();
	list=lineBizImp.line(lineName, num);
	System.out.println("需求有："+list.size());
	request.setAttribute("Flist", list);
	request.setAttribute("countPage", totalPages);
	request.setAttribute("num", num);
	ModelAndView modelAndView=new ModelAndView();
	modelAndView.setViewName("jsp/lineManage");
	return modelAndView;
}
@RequestMapping("/findById.action")
@ResponseBody
public List<Object> test(int lineId){
	List<Object> list=new ArrayList<>();
	List<LineBean> list1=lineBizImp.findInfo(lineId);
	list.add(list1);
	
	return list;
	
}

@RequestMapping("changeInfo.action")
public ModelAndView test(HttpServletRequest request) {
	String lineId2=request.getParameter("lineId2");
	String lineName2=request.getParameter("lineName2");
	String lineAddress2=request.getParameter("lineAddress2");
	String state=request.getParameter("state2");
	
	
	lineBizImp.changeInfo(Integer.valueOf(lineId2),lineName2,lineAddress2,Integer.valueOf(state));
	
	ModelAndView modelAndView=new ModelAndView("redirect:/line/page.action?page=tpage&number=1");
	
	
	
	
	
	
	
	return modelAndView;
	
}

@RequestMapping("/changeState.action")
@ResponseBody
public List<Object> test(String lineName,String lineId,String lineState,String number,String page) {
	
	int num=Integer.valueOf(number);
	 int stateId2=Integer.valueOf(lineState);
if(stateId2==3) {
	lineBizImp.changeState(Integer.valueOf(lineId));//删除
}else if(stateId2==5) {
	lineBizImp.changeState2(Integer.valueOf(lineId));//禁用
}else if(stateId2==6) {
	lineBizImp.changeState3(Integer.valueOf(lineId));//启用
}
		
	
	
if(number=="") {
	number="1";
}
int countPage=0;
List<Object> list1=new ArrayList<>();
	System.out.println("我来了");
	System.out.println("page="+page);
	
	List<LineBean> line=lineBizImp.countLine(lineName);
	countPage=line.size();//总用户数
	


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
List<LineBean> list=new ArrayList<LineBean>();
list=lineBizImp.line(lineName, num);
list1.add(list);
list1.add(num);
list1.add(totalPages);
return list1;
}


@RequestMapping("/selectPage.action")
@ResponseBody
public List<Object> selectPage(String lineName,String page,String number) {
	if(number=="") {
		number="1";
	}
	int countPage=0;
	List<Object> list1=new ArrayList<>();
		System.out.println("我来了");
		System.out.println("page="+page);
		
		List<LineBean> line=lineBizImp.countLine(lineName);
		countPage=line.size();//总用户数
		

	
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
	List<LineBean> list=new ArrayList<LineBean>();
	list=lineBizImp.line(lineName, num);
	list1.add(list);
	list1.add(num);
	list1.add(totalPages);
	return list1;
	
	
	
}

@RequestMapping("/addRule.action")
public ModelAndView test2(HttpServletRequest request) {
	String lineName3=request.getParameter("lineName3");
	String lineAddress3=request.getParameter("lineAddress3");
	
	lineBizImp.addRule(lineName3,lineAddress3);
	
	ModelAndView modelAndView=new ModelAndView("redirect:/line/page.action?page=tpage&number=1");
	
	
	
	
	
	
	
	return modelAndView;
	
}
}
