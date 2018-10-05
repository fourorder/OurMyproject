package org.great.handler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.AuthorityBean;
import org.great.bean.BidBean;
import org.great.bean.DailyBean;
import org.great.bean.DemandBean;
import org.great.bean.DemandBeanX;
import org.great.bean.DemandInfoBean;
import org.great.bean.ParameterBean;
import org.great.bean.QueryBean;
import org.great.bean.UpdateDemandBean;
import org.great.bean.UserBean;
import org.great.biz.DemandBiz;
import org.great.mapper.AuthoriyMapper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/demand") // 用户的handler包
public class DemandHandler {
	private int page;// 当前也
	private int countpage;// 总页
	private String searchName;
	private int  count;//总条数
	@Resource
	private DemandBiz demandBizImp;
	@Resource
	private AuthoriyMapper authoriyMapper;

	@Resource
	private UserBean userBean;
	@RequestMapping("/fromDemand.action") // 进入发布页面
	public ModelAndView fromDemand(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsp/releaseRequirements");
		ArrayList<ParameterBean> parameterBeans = new ArrayList<>();
		parameterBeans = demandBizImp.getParmater();
		request.setAttribute("parameterBeans", parameterBeans);
		return modelAndView;
	}

	@RequestMapping("/addDemand.action") // 提交
	public ModelAndView addDemand(HttpServletRequest request, String userid, String demandTitle,
			String demandInformation, String parameterId, MultipartFile file, String dealMoney, String securityMoney) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/user/home.action");
		demandBizImp.addDemand(request, userid, demandTitle, demandInformation, parameterId, file, dealMoney,
				securityMoney);

		return modelAndView;
	}

	// checkTheDemand .jsp 供应商查看需求
	@RequestMapping("/toDemand.action")
	public ModelAndView toDemand(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsp/checkTheDemand");
		page = 1;
		ArrayList<DemandBeanX> demandBeans = demandBizImp.getDemandList(page, null);
		countpage = demandBizImp.demandCount(null);
		request.setAttribute("demandBeans", demandBeans);
		request.setAttribute("page", page);
		request.setAttribute("countpage", countpage);
		return modelAndView;
	}

	// ajax分页查询
	@RequestMapping("/selectDemand.action") // ajax分页跳转
	@ResponseBody
	public List<Object> selectDemand(String state, String page, String searchName) {

		return demandBizImp.queayDemandList(state, page, searchName);
	}

	// 查看需求详情 demandInfo.jsp
	@RequestMapping("/queryDemand.action")
	public ModelAndView queryDemand(HttpServletRequest request, String demandid) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsp/demandInfo");
		request.setAttribute("demandInfo", demandBizImp.getDemandInfoBean(demandid));
		
		request.setAttribute("bidList", demandBizImp.getBidList(demandid));
		
		return modelAndView;
	}

	// addBid.action
	// ajax我要投标
	@RequestMapping("/addBid.action") // ajax分页跳转
	@ResponseBody
	public ArrayList<BidBean> addBid(HttpServletRequest request, String demandid) {

		userBean = (UserBean) request.getSession().getAttribute("user");

		demandBizImp.addBid(userBean.getUserId() + "", demandid);
		return demandBizImp.getBidList(demandid);
	}

	//// 雇主进入个人中心查看已发布需求 demandControl 9/27
	@RequestMapping("/goDemandControl.action")
	public ModelAndView goDemandControl(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("jsp/demandControl");
		userBean = (UserBean) request.getSession().getAttribute("user");
		page = 1;
		// 获取需求类型表
		request.setAttribute("parameterBeans", demandBizImp.getParmater());
		// 获取需求状态表
		request.setAttribute("stateParmeter", demandBizImp.getParmaterState());
		// 获取需求列表
		request.setAttribute("demandInfo",
				demandBizImp.getDemandInfoList(page, null, userBean.getUserId() + "", "0", "0"));
		
		request.setAttribute("page", page);
		
		count = demandBizImp.demandCountEmployer(null, userBean.getUserId() + "", "0", "0");
		int size = 6;
		int countpage = 0;
		if (count % size != 0) {
			countpage = count / size + 1;
		} else {
			countpage = count / size;
		}
		
		request.setAttribute("countpage", countpage);
		request.setAttribute("count", count);
		
		return modelAndView;
	}

	@RequestMapping("/page.action")
	public ModelAndView test(HttpServletRequest request,String demandTitle,String page,String number) {
		List<DemandBean> demand=demandBizImp.countDemand(demandTitle);
		int countPage=demand.size();
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
			System.out.println("我来了");
			System.out.println("page="+page);
			
			List<DemandBean> demand=demandBizImp.countDemand(demandTitle);
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
	public List<Object> test(String demandTitle,String demandId,String stateId,String number,String page) {
		int num=Integer.valueOf(number);
		 int stateId2=Integer.valueOf(stateId);
	if(stateId2==3) {
		demandBizImp.changeState(Integer.valueOf(demandId),Integer.valueOf(stateId));//删除
	}else if(stateId2==1) {
		demandBizImp.changeState2(Integer.valueOf(demandId),Integer.valueOf(stateId));//审核通过
	}else if(stateId2==2) {
		demandBizImp.changeState3(Integer.valueOf(demandId),Integer.valueOf(stateId));//违规下架
	}
			
		
		
	/*	List<DemandBean> demand=demandBizImp.countDemand(demandTitle);
		
		int countPage=demand.size();//总用户数
		int totalPages = countPage / 5 + ((countPage % 5) > 0 ? 1 : 0);//定义总页数
		if(num>totalPages) {
			num=totalPages;
		}
		List<DemandBean> list=new ArrayList<DemandBean>();
		list=demandBizImp.demand(demandTitle, num);
		
		List<Object> list2=new ArrayList<>();
		
		list2.add(list);
		list2.add(num);
		list2.add(totalPages);
<<<<<<< HEAD
		return list2 ;	
=======
		return list2 ;	*/
	
	if(number=="") {
		number="1";
	}
	int countPage=0;
	List<Object> list1=new ArrayList<>();
		System.out.println("我来了");
		System.out.println("page="+page);
		
		List<DemandBean> demand=demandBizImp.countDemand(demandTitle);
		countPage=demand.size();//总用户数
		

	
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
	List<DemandBean> list=new ArrayList<DemandBean>();
	list=demandBizImp.demand(demandTitle, num);
	list1.add(list);
	list1.add(num);
	list1.add(totalPages);
	return list1;
	}
	// 雇主进入查看投标详情 bidControl 9/27
		@RequestMapping("/gobidControl.action")
		public ModelAndView gobidControl(HttpServletRequest request, String demandid) {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("jsp/bidControl");
			count = demandBizImp.getBidList(demandid).size();
			request.setAttribute("demandInfo", demandBizImp.getDemandInfoBean(demandid));
			request.setAttribute("bidList", demandBizImp.getBidList(demandid));
			request.setAttribute("count", count);
			return modelAndView;
		}
		//确定投标人
		@RequestMapping("/determineBid.action")
		public ModelAndView determineBid(HttpServletRequest request, String userid,String demandid) {
			ModelAndView modelAndView = new ModelAndView();
			UpdateDemandBean demandBean = new UpdateDemandBean();
			demandBean.setToUserId(userid);
			demandBean.setStateId("10");
			demandBean.setDemandId(demandid);
			demandBizImp.updateDemand(demandBean);
			modelAndView.setViewName("redirect:/demand/goDemandControl.action");
			return modelAndView;
		}
		//ajax 返回供应商查看
		// ajax分页查询
			@RequestMapping("/selectDemandEmployer.action") // ajax分页跳转
			@ResponseBody
			public List<Object> selectDemandEmployer(String userid,String state, String page, String searchName,String parameterid,String stateid ) {
				
				return demandBizImp.queayDemandEmployerList(userid, state, page, searchName, parameterid, stateid);
			}
			//服务商投标成功后获取的任务 supplierBid
			@RequestMapping("/goSupplierBid.action")
			public ModelAndView goSupplierBid(HttpServletRequest request){
				ModelAndView modelAndView = new ModelAndView();
				userBean = (UserBean) request.getSession().getAttribute("user");
				//------------菜单------
						
				ArrayList<AuthorityBean> menuList=new ArrayList<AuthorityBean>();
				menuList=authoriyMapper.findOwnMune(userBean.getUserId());
				request.setAttribute("menuList", menuList);
				//---------------------
				
				
				
				modelAndView.setViewName("jsp/supplierBid");
				ArrayList<DemandInfoBean>list =demandBizImp.getsupplierBidList(userBean.getUserId() + "");
				count = list.size();
				request.setAttribute("count", count);
				request.setAttribute("demandInfo",list);
				return modelAndView;
			}
			@RequestMapping("/daily.action") //查重日报
			public ModelAndView daily(HttpServletRequest request, String userid,String demandid) {
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		        String time=df.format(new Date());// new Date()为获取当前系统时间
		        String a=demandBizImp.daily(time);
				if(a!=null) {
					System.out.println("今日已提交");
					ModelAndView modelAndView = new ModelAndView();
					modelAndView.setViewName("jsp/repetitionPage");
					return modelAndView;
				}else {
					ModelAndView modelAndView = new ModelAndView();
					request.setAttribute("demandid", demandid);
					modelAndView.setViewName("jsp/dailyPage");
					return modelAndView;
				}
				
			
			}
		
			@RequestMapping("/submit.action") //提交日报
			public ModelAndView submit(HttpServletRequest request,String demandid,String content) {
				int demandId=Integer.parseInt(demandid);
				int a =demandBizImp.sumbit(content,demandId);
				if(a>0) {
					System.out.println("提交成功！");
				}
					ModelAndView modelAndView = new ModelAndView();
					modelAndView.setViewName("jsp/dailyPage");
					return modelAndView;
			}
			
}
