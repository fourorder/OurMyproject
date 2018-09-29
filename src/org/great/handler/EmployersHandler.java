package org.great.handler;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.great.bean.UserBean;
import org.great.bean.UserStoryBean;
import org.great.biz.UserBiz;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/employers")//雇主管理的handler包
public class EmployersHandler {

	@Resource
	private UserBiz userBizImp;
	
	@RequestMapping("/page.action")//跳到雇主列表
	@ResponseBody
	public ModelAndView test(HttpServletRequest request,String name,String page,String number,String ordinal){
		if(ordinal==null) {
			ordinal="0";
		}
		int state=Integer.parseInt(ordinal);
		int countPage=userBizImp.countEmployers(name,state);
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
		}else if(page.equals("skip")) {
			if(num>totalPages) {
				num=totalPages;
			}else if(num<=0 ) {
				num=1;
			}
		}
		List<UserBean> list=new ArrayList<UserBean>();
		list=userBizImp.employers(name, num,state);
		System.out.println("shuju："+list.size());
		request.setAttribute("Elist", list);
		request.setAttribute("countPage", totalPages);
		request.setAttribute("num", num);
		request.setAttribute("username",name);
		request.setAttribute("state",state);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/employersPage");
		return modelAndView;
	
	}
	
	
	@RequestMapping("/operation.action")//对雇主操作
	public ModelAndView test1(HttpServletResponse response,HttpServletRequest request,String operation,String account)  throws IOException{
		if(operation.equals("del")) {
			int a =userBizImp.delEmployers(account,"3");
			if(a>0) {
				return new ModelAndView("redirect:page.action?page=tpage&number=1") ;
			}else {
				System.out.println("删除失败");
			
			   	return new ModelAndView("redirect:page.action?page=tpage&number=1") ;
			}
		}else if(operation.equals("forbidden")){
			System.out.println("禁用业务");
			int a =userBizImp.delEmployers(account,"2");
			if(a>0) {
				return new ModelAndView("redirect:page.action?page=tpage&number=1") ;
			}else {
				System.out.println("禁用失败");
			
			   	return new ModelAndView("redirect:page.action?page=tpage&number=1") ;
			}
		}else if(operation.equals("start")){
			System.out.println("启用业务");
			int a =userBizImp.delEmployers(account,"1");
			if(a>0) {
				return new ModelAndView("redirect:page.action?page=tpage&number=1") ;
			}else {
				System.out.println("启用失败");
			
			   	return new ModelAndView("redirect:page.action?page=tpage&number=1") ;
			}
		}
		return null;
		
	}
	
	@RequestMapping("/update.action")//修改雇主信息
	public ModelAndView test2(HttpServletRequest request,String account){
		System.out.println(account);
		List<UserBean> list=new ArrayList<UserBean>();
		list =userBizImp.updateInfo(account);
		if(list.size()>0) {
			request.setAttribute("Elist", list);
			ModelAndView modelAndView=new ModelAndView();
			modelAndView.setViewName("jsp/updateEmp");
			return modelAndView ;
		}else {
			System.out.println("删除失败");
		}
		return null;
	}
	
	@RequestMapping("/updateAck.action")//确认修雇主信息
	public ModelAndView test3(HttpServletRequest request,UserBean ub){
		int a =userBizImp.updateUser(ub);
		System.out.println("a="+a);
		if(a>0) {
			System.out.println("修改成功");
			return new ModelAndView("redirect:page.action?page=tpage&number=1");
		}else {
			return new ModelAndView("redirect:update.action?operation="+ub.userAccount);
		}
		
	}
	@RequestMapping("/story.action")//配置雇主故事
	public ModelAndView test5(HttpServletRequest request,String operation){
		List<UserBean> list=new ArrayList<UserBean>();
		list=userBizImp.selectAll();
		if(list.size()>0) {
			request.setAttribute("Slist", list);
		}
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/storyDeploy");
		return modelAndView ;
	}
	@RequestMapping("/updateStory.action")//配置雇主故事
	public ModelAndView test6(HttpServletRequest request,UserStoryBean usb,MultipartFile file){
		String productionImage=upLoadFile(request, file);
		usb.setStoryImg(productionImage);
		List<UserStoryBean> list=new ArrayList<UserStoryBean>();
		list=userBizImp.selectStory(usb.getUserAccount());
		if(list.size()>0) {
			int state =list.get(0).getStateId();
			usb.setStateId(state);
			int a=userBizImp.updateStory(usb);
			if(a>0) {
				System.out.println("覆盖成功！");
				ModelAndView modelAndView=new ModelAndView();
				modelAndView.setViewName("jsp/storyList");
				return modelAndView ;
			}
		}else {
			usb.setStateId(0);
		int a=userBizImp.insertStory(usb);
		if(a>0) {
			ModelAndView modelAndView=new ModelAndView();
			modelAndView.setViewName("jsp/storyList");
			return modelAndView ;
		}
		}
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/storyList");
		return modelAndView ;
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


	
	@RequestMapping("/list.action")//雇主故事列表
	public ModelAndView test6(HttpServletRequest request,String page,String title,String state,String number ){
		if(state==null) {
			state="3";
		}
		int ordinal=Integer.parseInt(state);
		int countPage=userBizImp.countStory(title, ordinal);
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
		}else if(page.equals("skip")) {
			if(num>totalPages) {
				num=totalPages;
			}else if(num<=0 ) {
				num=1;
			}
		}
		
		System.out.println("标题："+title+"状态："+state);
		List<UserStoryBean> list=new ArrayList<UserStoryBean>();
		list=userBizImp.conditionQuery(title,num,ordinal);
		System.out.println("shuju："+list.size());
		request.setAttribute("Slist", list);
		request.setAttribute("countPage", totalPages);
		request.setAttribute("num",num);
		request.setAttribute("title",title);
		request.setAttribute("state",state);
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/storyList");
		return modelAndView ;
	}
	
	@RequestMapping("/delUpdate.action")//删除修改
	public ModelAndView test6(HttpServletRequest request,String operation,String userAccount){
		if(operation.equals("del")){
		int a=	userBizImp.delStory(userAccount);
		if(a>0) {
			return new ModelAndView("redirect:list.action?page=tpage&number=1");
		}
		}else if(operation.equals("update")){
			System.out.println("账号="+userAccount);
		List<UserStoryBean> list= new ArrayList<UserStoryBean>();
			list=userBizImp.updateOne(userAccount);
			System.out.println("账号="+userAccount+"list="+list.size());
			if(list.size()>0) {
				request.setAttribute("Slist", list);
				ModelAndView modelAndView=new ModelAndView();
				modelAndView.setViewName("jsp/updateStory");
				return modelAndView ;
			}
		
		}
		return null;
		
	}
	@RequestMapping("/updateOk.action")//确认修改
	public ModelAndView test7(HttpServletRequest request,UserStoryBean usb,MultipartFile file){
		String productionImage=upLoadFile(request, file);
		usb.setStoryImg(productionImage);
		int a= userBizImp.updateOk(usb);
		if(a>0) {
			return new ModelAndView("redirect:list.action?page=tpage&number=1");
		}
		return new ModelAndView("redirect:list.action?page=tpage&number=1");
		
	}
	@RequestMapping("/storyOperation.action")//故事的启用禁用
	public ModelAndView test8(HttpServletRequest request,String operation,String account){
		
		if(operation.equals("forbidden")) {
			int a =userBizImp.forbiddenStory(account);
			if(a>0) {
				System.out.println("禁用成功");
			}
		}else if(operation.equals("start")){
			int a =userBizImp.startStory(account);
			if(a>0) {
				System.out.println("启用成功");
			}
		}
		
		return new ModelAndView("redirect:list.action?page=tpage&number=1");
		
	}

	
}
