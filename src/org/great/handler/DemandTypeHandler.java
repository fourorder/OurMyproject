package org.great.handler;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.DemandTypeBean;
import org.great.biz.DemandTypeBiz;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
@Controller
@Scope("prototype")
@RequestMapping("/demandType") 
public class DemandTypeHandler {
	@Resource
	private DemandTypeBiz demandTypeBizImp;
	@RequestMapping("/page.action")
	public ModelAndView test(HttpServletRequest request,String parameterName,String page,String number) {
		List<DemandTypeBean> demandType=demandTypeBizImp.countDemandType(parameterName);
		int countPage=demandType.size();
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
		
		List<DemandTypeBean> list=new ArrayList<DemandTypeBean>();
		list=demandTypeBizImp.demandType(parameterName, num);
		System.out.println("需求有："+list.size());
		request.setAttribute("Flist", list);
		request.setAttribute("countPage", totalPages);
		request.setAttribute("num", num);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/demandTypeManage");
		return modelAndView;

		
	}
	@RequestMapping("/addDemandType.action")
	public ModelAndView test2(HttpServletRequest request) {
		String parameterName3=request.getParameter("parameterName3");	
		demandTypeBizImp.addDemandType(parameterName3);		
		ModelAndView modelAndView=new ModelAndView("redirect:/demandType/page.action?page=tpage&number=1");
		return modelAndView;
		
	}
	@RequestMapping("/changeState.action")
	@ResponseBody
	public List<Object> test(String parameterName,String parameterId,String number,String page) {
		
		int num=Integer.valueOf(number);
		demandTypeBizImp.changeState(Integer.valueOf(parameterId));//删除
			
		
		
	if(number=="") {
		number="1";
	}
	int countPage=0;
	List<Object> list1=new ArrayList<>();
		System.out.println("我来了");
		System.out.println("page="+page);
		
		List<DemandTypeBean> demandType=demandTypeBizImp.countDemandType(parameterName);
		countPage=demandType.size();//总用户数
		


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
	List<DemandTypeBean> list=new ArrayList<DemandTypeBean>();
	list=demandTypeBizImp.demandType(parameterName, num);
	list1.add(list);
	list1.add(num);
	list1.add(totalPages);
	return list1;
	}
	
	@RequestMapping("/selectPage.action")
	@ResponseBody
	public List<Object> selectPage(String parameterName,String page,String number) {
		if(number=="") {
			number="1";
		}
		int countPage=0;
		List<Object> list1=new ArrayList<>();
			System.out.println("我来了");
			System.out.println("page="+page);
			
			List<DemandTypeBean> demandType=demandTypeBizImp.countDemandType(parameterName);
			countPage=demandType.size();//总用户数
			

		
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
		List<DemandTypeBean> list=new ArrayList<DemandTypeBean>();
		list=demandTypeBizImp.demandType(parameterName, num);
		list1.add(list);
		list1.add(num);
		list1.add(totalPages);
		return list1;
		
		
		
	}
}
