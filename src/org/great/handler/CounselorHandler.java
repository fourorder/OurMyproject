package org.great.handler;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.CounselorBean;
import org.great.biz.CounselorBiz;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/counselor")//顾问
public class CounselorHandler {

	
	@Resource
	private CounselorBiz counselorImp;
	
	@RequestMapping("/application.action")//跳到申请页面
	public ModelAndView test(HttpServletRequest request,String account){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/ApplicationConsultants");
		request.setAttribute("account", account);
		return modelAndView;	
	}
	@RequestMapping("/affirm.action")//跳到申请页面
	@ResponseBody
	public Integer test1(HttpServletRequest request,CounselorBean cb){
		int state=7;
		List <CounselorBean> list=new ArrayList<CounselorBean>();
		list=counselorImp.select(cb.getUserAccount());
		if(list.size()>0) {
			System.out.println("该用户已申请");
			if(list.get(0).getAuditState()==0) {
				System.out.println("该用户正在审核");
				state=0;
				return state;
			}else if(list.get(0).getAuditState()==1) {
				System.out.println("该用户已是顾问");
				state=1;
				return state;
			}
		}else {
			cb.setAuditState(0);
			int a =counselorImp.applyFor(cb);
			if(a>0) {
				state=2;
				return state;
			}
		}

		return state;	
	}
	
	@RequestMapping("/list.action")//跳到列表页面
	public ModelAndView test3(HttpServletRequest request,String state1,String page,String number){
		if(state1==null) {
			state1="4";
		}
		int state=Integer.parseInt(state1);
		int countPage=counselorImp.countCounserlor(state);//总条数
		int totalPages = countPage / 5 + ((countPage % 5) > 0 ? 1 : 0);//定义总页数
		int num=Integer.parseInt(number);
		List<CounselorBean> list=new ArrayList<CounselorBean>();
		list=counselorImp.conditionQuery(state, num);
		request.setAttribute("Clist", list);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("num", num);
		request.setAttribute("state",state);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/counselorList");
		return modelAndView;	
	}
	@RequestMapping("/Alist.action")//跳到列表页面
	@ResponseBody
	public List<Object> test4(HttpServletRequest request,String state1,String page,String number){
		if(state1==null) {
			state1="4";
		}
		System.out.println("进入Handler");
		int state=Integer.parseInt(state1);
		int countPage=counselorImp.countCounserlor(state);//总条数
		int totalPages = countPage / 5 + ((countPage % 5) > 0 ? 1 : 0);//定义总页数
		int num=Integer.parseInt(number);
		System.out.println("num="+num+"page="+page);
		if(page.equals("tpage")) {
			num--;
			if(num<=0) {
				num=1;
			}
		}else if(page.equals("npage")) {
			num++;
			if(num>totalPages) {
				num=totalPages;
			}
		}
        List<Object> obj=new ArrayList<Object>();
		List<CounselorBean> list=new ArrayList<CounselorBean>();
		list=counselorImp.conditionQuery(state, num);
		System.out.println("list="+list.get(0).getUserAccount());
		System.out.println("总页="+totalPages+"当前页："+num);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("num", num);
		request.setAttribute("state",state);
           obj.add(num);
           obj.add(totalPages);
           obj.add(list);
		return obj;	
	}
	@RequestMapping("/applicationOk.action")//确认通过审核
	public ModelAndView test5(HttpServletRequest request,String account){
		int a =counselorImp.applyForOk(account);
		if(a>0) {
			System.out.println("成功");
		}
		
		return new ModelAndView("redirect:list.action?page=tpage&number=1");	
	}
}
