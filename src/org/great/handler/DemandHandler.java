package org.great.handler;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.DemandBean;
import org.great.bean.UserBean;
import org.great.biz.DemandBiz;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/demand")
public class DemandHandler {
	@Resource
	private DemandBiz demandBizImp;
	@RequestMapping("/page.action")
	public ModelAndView test(HttpServletRequest request,String demandTitle,String page,String number) {
		List<DemandBean> demand=demandBizImp.countDemand();
		int countPage=demand.size();
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
		
		List<DemandBean> list=new ArrayList<DemandBean>();
		list=demandBizImp.demand(demandTitle, num);
		System.out.println("需求有："+list.size());
		request.setAttribute("Flist", list);
		request.setAttribute("countPage", totalPages);
		request.setAttribute("num", num);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/demandManager");
		return modelAndView;

		
	}
	@RequestMapping("/selectPage.action")
	@ResponseBody
	public List<Object> selectPage(String demandTitle,String page,String number) {
		if(number=="") {
			number="1";
		}
		int countPage=0;
		List<Object> list1=new ArrayList<>();
		if(demandTitle=="") {
			System.out.println("我来了");
			System.out.println("page="+page);
			
			List<DemandBean> demand=demandBizImp.countDemand();
			countPage=demand.size();//总用户数
			
		}else {
			System.out.println("我来了");
			System.out.println("page="+page);
			
			List<DemandBean> demand=demandBizImp.countDemand2(demandTitle);
			
			 countPage=demand.size();//总用户数
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
		List<DemandBean> list=new ArrayList<DemandBean>();
		list=demandBizImp.demand(demandTitle, num);
		list1.add(list);
		list1.add(num);
		list1.add(totalPages);
		return list1;
		
		
	}
	@RequestMapping("/findById.action")
	@ResponseBody
	public List<Object> test(int demandId){
		List<Object> list=new ArrayList<>();
		List<DemandBean> list1=demandBizImp.findInfo(demandId);
		String fromUserName=demandBizImp.findFromUserName(demandId);
		String toUserName=demandBizImp.findToUserName(demandId);
		String parameterName=demandBizImp.findParameterName(demandId);
		String stateName=demandBizImp.findStateName(demandId);
		list.add(fromUserName);
		list.add(toUserName);
		list.add(parameterName);
		list.add(stateName);
		list.add(list1);
		
		return list;
		
	}
	@RequestMapping("changeInfo.action")
	public ModelAndView test(HttpServletRequest request) {
		String demandId2=request.getParameter("demandId2");
		String demandDetailInformation2=request.getParameter("demandDetailInformation2");
		String securityMoney2=request.getParameter("securityMoney2");
		String dealMoney2=request.getParameter("dealMoney2");
		String completeTime2=request.getParameter("completeTime2");
		String auctionTime2=request.getParameter("auctionTime2");
		String demandHead2=request.getParameter("demandHead2");
		demandBizImp.changeInfo(Integer.valueOf(demandId2),demandDetailInformation2,Integer.valueOf(securityMoney2),Integer.valueOf(dealMoney2),completeTime2,auctionTime2,demandHead2);
		
		ModelAndView modelAndView=new ModelAndView("redirect:/demand/page.action?page=tpage&number=1");
		
		
		
		
		
		
		
		return modelAndView;
		
	}
	@RequestMapping("/changeState.action")
	@ResponseBody
	public List<Object> test(String demandTitle,String demandId,String stateId,String number) {
		int num=Integer.valueOf(number);
		 int stateId2=Integer.valueOf(stateId);
	if(stateId2==3) {
		demandBizImp.changeState(Integer.valueOf(demandId),Integer.valueOf(stateId));//删除
	}else if(stateId2==2) {
		demandBizImp.changeState2(Integer.valueOf(demandId),Integer.valueOf(stateId));//审核通过
	}else if(stateId2==1) {
		demandBizImp.changeState3(Integer.valueOf(demandId),Integer.valueOf(stateId));//违规下架
	}
			
		
		
		List<DemandBean> demand=demandBizImp.countDemand();
		
		int countPage=demand.size();//总用户数
		int totalPages = countPage / 2 + ((countPage % 2) > 0 ? 1 : 0);//定义总页数
		if(num>totalPages) {
			num=totalPages;
		}
		List<DemandBean> list=new ArrayList<DemandBean>();
		list=demandBizImp.demand(demandTitle, num);
		
		List<Object> list2=new ArrayList<>();
		
		list2.add(list);
		list2.add(num);
		list2.add(totalPages);
		return list2 ;	
	}
}
