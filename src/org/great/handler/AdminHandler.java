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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/admin") // 用户的handler包
public class AdminHandler {
	@Resource
	private UserBiz userBizImp;
	@RequestMapping("/page.action")
	public ModelAndView test(HttpServletRequest request,String userAccount,String page,String number) {
		List<UserBean> user1=userBizImp.countAdmin();
		List<UserBean> user2=userBizImp.countAdmin2();
		int countPage=user1.size()+user2.size();//总用户数
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
		
		List<UserBean> list=new ArrayList<UserBean>();
		list=userBizImp.admin(userAccount, num);
		System.out.println("管理员有："+list.size());
		request.setAttribute("Flist", list);
		request.setAttribute("countPage", totalPages);
		request.setAttribute("num", num);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/admin");
		return modelAndView;

		
	}
	@RequestMapping("/selectPage.action")
	@ResponseBody
	public List<Object> selectPage(String userAccount,String page,String number) {
		if(number=="") {
			number="1";
		}
		int countPage=0;
		List<Object> list1=new ArrayList<>();
		if(userAccount=="") {
			System.out.println("我来了");
			System.out.println("page="+page);
			
			List<UserBean> user1=userBizImp.countAdmin();
			List<UserBean> user2=userBizImp.countAdmin2();
			countPage=user1.size()+user2.size();//总用户数
			System.out.println("总用户数为："+countPage);
		}else {
			System.out.println("名字模糊查询");
			System.out.println("page="+page);
			
			List<UserBean> user1=userBizImp.countAdmin3(userAccount);
			List<UserBean> user2=userBizImp.countAdmin4(userAccount);
			 countPage=user1.size()+user2.size();//总用户数
			System.out.println("总用户数为："+countPage);
		}
		
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
		List<UserBean> list3=new ArrayList<UserBean>();
		list3=userBizImp.admin(userAccount,num);
		System.out.println("list3.size()="+list3.size());
		list1.add(list3);
		list1.add(num);
		list1.add(totalPages);
		return list1;
		
		
	}
	@RequestMapping("/changeState.action")
	@ResponseBody
	public List<Object> test(String userAccount,String userId,String stateId,String number,String page) {
		int num=Integer.valueOf(number);
		int countPage=0;	
		userBizImp.adminChangeState(Integer.valueOf(userId),Integer.valueOf(stateId));
		if(userAccount=="") {
			System.out.println("我来了");
			System.out.println("page="+page);
			
			List<UserBean> user1=userBizImp.countAdmin();
			List<UserBean> user2=userBizImp.countAdmin2();
			countPage=user1.size()+user2.size();//总用户数
			System.out.println("总用户数为："+countPage);
		}else {
			System.out.println("名字模糊查询");
			System.out.println("page="+page);
			
			List<UserBean> user1=userBizImp.countAdmin3(userAccount);
			List<UserBean> user2=userBizImp.countAdmin4(userAccount);
			 countPage=user1.size()+user2.size();//总用户数
			System.out.println("总用户数为："+countPage);
		}
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
		
		List<UserBean> list=new ArrayList<UserBean>();
		list=userBizImp.admin(userAccount, num);
		
		List<Object> list2=new ArrayList<>();
		
		list2.add(list);
		list2.add(num);
		list2.add(totalPages);
		return list2 ;	
	}
	@RequestMapping("/addAdmin.action")
	public ModelAndView addAdmin(HttpServletRequest request) {
		
		String userAccount=request.getParameter("userAccount");	
		System.out.println("管理员账号:"+userAccount);
		userBizImp.addAdmin(userAccount);		
		ModelAndView modelAndView=new ModelAndView("redirect:/admin/page.action?number=1&page=tpage");
	
		return modelAndView;
		
	}
}
