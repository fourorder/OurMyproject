package org.great.handler;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.ApplicationBean;
import org.great.bean.CounselorBean;
import org.great.bean.DailyBean;
import org.great.bean.DemandBeanX;
import org.great.bean.InformationBean;
import org.great.biz.CounselorBiz;
import org.great.biz.DemandBiz;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/counselor")//顾问
public class CounselorHandler {

	
	@Resource
	private DemandBiz demandBizImp;
	
	@RequestMapping("/application.action")//跳到申请页面
	public ModelAndView test(HttpServletRequest request,String account,String userId){
		ModelAndView modelAndView=new ModelAndView();
		List<String> list1=new ArrayList<String>();
		list1=demandBizImp.type();
		request.setAttribute("list", list1);
		request.setAttribute("account", account);
		request.setAttribute("userId", userId);
		modelAndView.setViewName("jsp/applicationPage");
		return modelAndView;	
			
	}
	@RequestMapping("/judge.action")//判断是否是顾问
	@ResponseBody
	public int test8(HttpServletRequest request,String account,int userId){
		List <CounselorBean> list=new ArrayList<CounselorBean>();
		list=demandBizImp.select(account);
		if(list.size()>0) {
			System.out.println("该用户已申请");
			if(list.get(0).getAuditState()==0) {
				System.out.println("该用户正在审核");
				return 1;
			}else if(list.get(0).getAuditState()==1) {
				System.out.println("该用户已是顾问");
				return 2;
			}
		}

		return 0;	
	}
	
	@RequestMapping("/applyForList.action")//申请列表
	@ResponseBody
	public List<Object> test9(HttpServletRequest request,String account,String userId,String state,String page,String number){
		   List<Object> obj=new ArrayList<Object>();
		   if(state==null) {
				state="0";
			}
		   if(number==null || "".equals(number)) {
			   number="1";
			}
			  
			System.out.println("进入Handler");
			int state1=Integer.parseInt(state);
			int userid=Integer.parseInt(userId);
			int countPage=demandBizImp.countApplyFor(userid,state1);//总数
			int totalPages = countPage / 5 + ((countPage % 5) > 0 ? 1 : 0);//定义总页数
			int num=Integer.parseInt(number);
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
			List<ApplicationBean> list=new ArrayList<ApplicationBean>();
			list=demandBizImp.selectApplyFor(state1, num,userid);
			System.out.println("list="+list.size());
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("num", num);
			request.setAttribute("state1",state1);
			 obj.add(num);
	           obj.add(totalPages);
	           obj.add(list);
		return obj;	
	}
	
	
	
	@RequestMapping("/affirm.action")//跳到列表
	public ModelAndView test1(HttpServletRequest request,CounselorBean cb,MultipartFile file){
		String productionImage=upLoadFile(request, file);
		cb.setCounselorImg(productionImage);
		cb.setAuditState(0);
		cb.setEnableDisableId(3);
		List <CounselorBean> list=new ArrayList<CounselorBean>();
		list=demandBizImp.select(cb.getUserAccount());
		ModelAndView modelAndView=new ModelAndView();
		if(list.size()>0) {
			System.out.println("该用户已申请");
			if(list.get(0).getAuditState()==0) {
				System.out.println("该用户正在审核");
				modelAndView.setViewName("jsp/auditPage");
				return modelAndView;
			}else if(list.get(0).getAuditState()==1) {
				System.out.println("该用户已是顾问");
				modelAndView.setViewName("jsp/applicationPage");
				return modelAndView;
			}
		}else {
			cb.setAuditState(0);
			cb.setCounselorImg(productionImage);
			int a =demandBizImp.applyFor(cb);
			if(a>0) {
				
				return new ModelAndView("redirect:list.action?page=tpage&number=1");
			}
		}

		return new ModelAndView("redirect:list.action?page=tpage&number=1");	
	}
	
public String upLoadFile(HttpServletRequest request,MultipartFile file) {
		
		//上传图片--------------------
			
			//上传文件路径
			 String path = request.getServletContext().getRealPath("/images/");
			// System.out.println(path);
	        //上传文件名
	        String filename = file.getOriginalFilename();
	        
	        File filepath = new File(path,filename);
	        //判断路径是否存在，如果不存在就创建一个
	        if (!filepath.getParentFile().exists()) { 
	            filepath.getParentFile().mkdirs();
	        }
	        //将上传文件保存到一个目标文件当中
	        String uploadDocName=System.currentTimeMillis()+"@"+filename;
	        try {
				file.transferTo(new File(path + File.separator + uploadDocName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        System.out.println("Biz"+path+"-->"+uploadDocName);
	        
	        //-----------------------
			
			return uploadDocName;
		}

	
	@RequestMapping("/list.action")//跳到列表页面
	public ModelAndView test3(HttpServletRequest request,String state1,String page,String number){
		if(state1==null) {
			state1="4";
		}
		int state=Integer.parseInt(state1);
		int countPage=demandBizImp.countCounserlor(state);//总条数
		int totalPages = countPage / 5 + ((countPage % 5) > 0 ? 1 : 0);//定义总页数
		int num=Integer.parseInt(number);
		List<CounselorBean> list=new ArrayList<CounselorBean>();
		list=demandBizImp.conditionQuery(state, num);
		request.setAttribute("Clist", list);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("num", num);
		request.setAttribute("state",state);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/counselorList");
		return modelAndView;	
	}
	@RequestMapping("/applicationOk.action")//确认通过审核
	public ModelAndView test5(HttpServletRequest request,String account){
		int a =demandBizImp.applyForOk(account);
		if(a>0) {
			System.out.println("成功");
		}
		
		return new ModelAndView("redirect:list.action?page=tpage&number=1");	
	}
	@RequestMapping("/storyOperation.action")//启用禁用详情
	public ModelAndView test6(HttpServletRequest  request,String operation,String account){
		if(operation.equals("forbidden")) {
			int a=demandBizImp.forbidden(account);
			if(a>0) {
				System.out.println("禁用");
			}
		}else if(operation.equals("start")){
			int a=demandBizImp.start(account);
			if(a>0) {
				System.out.println("启用");
			}
		}
		
		return new ModelAndView("redirect:list.action?page=tpage&number=1");	
	}
	
	
	@RequestMapping("/applyForOk.action")//确认通过雇主审核详情
	public ModelAndView applyForOk(HttpServletRequest request,String action,String demandid){
		System.out.println("通过拒绝详情操作");
		int demandId=Integer.parseInt(demandid);
		if(action.equals("ok")) {
		int a=demandBizImp.applyFprPass(demandId);
		int b =demandBizImp.applyFprPass2(demandId);
		if(a>0 &&b>0) {
			//返回还未写
			return null;	
		}
	   }else if(action.equals("refuse")) {
		   int a=demandBizImp.applyFprreFuse(demandId);
		   int b=demandBizImp.applyFprreFuse2(demandId);
			if(a>0 && b>0) {
				//返回还未写
				return null;	
			}
			}else if(action.equals("particulars")) {
				List<DemandBeanX> list=new ArrayList<DemandBeanX>();
				list=demandBizImp.particulars(demandId);
				int id=Integer.parseInt(list.get(0).getParameterId());
				String type=demandBizImp.selectType(id);
				System.out.println("list="+list);
				if(list.size()>0) {
					System.out.println(list.get(0).getDemandTitle());
					request.setAttribute("list", list);
					request.setAttribute("type", type);
					request.setAttribute("demandid", demandId);
					ModelAndView modelAndView=new ModelAndView();
					modelAndView.setViewName("jsp/particularsPage");
					return modelAndView;	
				}
	
}
		
		return null;	
	}
	
	@RequestMapping("/project.action")//所接受项目
	@ResponseBody
	public Map<String, Object> test10(HttpServletRequest request,String account,int userId){
	  List<Integer> list=new ArrayList<Integer>();
	  list= demandBizImp.serialNum(account);
	  int id=demandBizImp.selectId(account);
	  request.setAttribute("id", id);
	  Map<String, Object> map = new HashMap<String, Object>();
      map.put("list", list);
		return map;	
	}
	@RequestMapping("/parameter.action")//查询项目详细信息
	@ResponseBody
	public List<Object> test11(HttpServletRequest request,int parameterId,String state1,String page,String number){
		System.out.println("state1="+state1);
		int countPage=demandBizImp.countDaily(parameterId, state1);//总条数
		int totalPages = countPage / 5 + ((countPage % 5) > 0 ? 1 : 0);//定义总页数
		int num=Integer.parseInt(number);
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
		List<DailyBean> list=new ArrayList<DailyBean>();
		
	    list= demandBizImp.selectDaily(parameterId,state1,num);
	    request.setAttribute("totalPages", totalPages);
		request.setAttribute("num", num);
		request.setAttribute("state1",state1);
		 obj.add(num);
           obj.add(totalPages);
           obj.add(list);
	    return obj;	
	}
	@RequestMapping("/evaluation.action")//所接受项目
	public ModelAndView test12(HttpServletRequest request,int userId,String evaluation,String notation,String time){
	 System.out.println("userId="+userId+"evaluation="+evaluation+"notation="+notation+"time"+time);
	int a= demandBizImp.sEvaluation(userId, evaluation, notation, time);
	if(a>0) {
		System.out.println("评价成功");
	}
	ModelAndView modelAndView=new ModelAndView();
	modelAndView.setViewName("jsp/particularsPage");
	return modelAndView;		
	}
}
