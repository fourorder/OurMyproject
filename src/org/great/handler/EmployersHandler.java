package org.great.handler;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.UserBean;
import org.great.biz.UserBiz;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/employers")//雇主管理的handler包
public class EmployersHandler {
     private int num=1;//页数
	@Resource
	private UserBiz userBizImp;
	
	@RequestMapping("/page.action")//跳到资讯配置页面
	public ModelAndView test(HttpServletRequest request,String name,String page,String number){
		int countPage=userBizImp.countEmployers();
		int totalPages = countPage / 5 + ((countPage % 5) > 0 ? 1 : 0);//定义总页数
		int num=Integer.parseInt(number);
		if(page.equals("tpage")) {
			num--;
			if(num<=0) {
				num=1;
			}
		}else if(page.equals("npage")) {
			num++;
			if(totalPages<num) {
				num=totalPages;
			}
			
		}
		
		List<UserBean> list=new ArrayList<UserBean>();
		list=userBizImp.employers(name, num);
		request.setAttribute("Elist", list);
		request.setAttribute("countPage", totalPages);
		request.setAttribute("num", num);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/employersPage");
		return modelAndView;
	}
	
	
	@RequestMapping("/operation.action")//对雇主操作
	public ModelAndView test1(HttpServletRequest request,String operation){
		System.out.println(operation);
		int a =userBizImp.delEmployers(operation);
		if(a>0) {
			return new ModelAndView("redirect:page.action?page=tpage") ;
		}else {
			System.out.println("删除失败");
		}
		return null;
	}
}
