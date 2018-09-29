package org.great.handler;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.CounselorBean;
import org.great.bean.InformationBean;
import org.great.biz.InformationBiz;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/infor")//资讯设置的handler包
public class InformationHandler {
	
	@Resource
	private InformationBiz informationBizImp;
	
	
	@RequestMapping("/inforPage.action")//跳到资讯列表
	public ModelAndView test(HttpServletRequest request,String state1,String page,String number){
		if(state1==null) {
			state1="7";
		}
		int state=Integer.parseInt(state1);
		int countPage=informationBizImp.countInfor(state);
		int totalPages = countPage / 5 + ((countPage % 5) > 0 ? 1 : 0);//定义总页数
		int num=Integer.parseInt(number);
		List<InformationBean> list=new ArrayList<>();
		list=informationBizImp.conditionQuery(state, num);
		request.setAttribute("Clist", list);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("num", num);
		request.setAttribute("state",state);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/inforList");
		return modelAndView;
	}
	@RequestMapping("/Alist.action")//跳到列表页面
	@ResponseBody
	public List<Object> test4(HttpServletRequest request,String state1,String page,String number){
		if(state1==null) {
			state1="7";
		}
		System.out.println("进入Handler");
		int state=Integer.parseInt(state1);
		int countPage=informationBizImp.countInfor(state);//总条数
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
		List<InformationBean> list=new ArrayList<InformationBean>();
		list=informationBizImp.conditionQuery(state, num);
		System.out.println("总页="+totalPages+"当前页："+num+"list="+list.size());
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("num", num);
		request.setAttribute("state",state);
           obj.add(num);
           obj.add(totalPages);
           obj.add(list);
		return obj;	
	}	
	
	@RequestMapping("/page.action")//跳到资讯配置页面
	public ModelAndView test1(HttpServletRequest request){
		List<String> list=new ArrayList<String>();
		list=informationBizImp.informationType();
		request.setAttribute("list", list);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/informationPage");
		return modelAndView;
	}
	
	
	@RequestMapping("/mation.action")//跳到提交页
	public ModelAndView test2(HttpServletRequest request,InformationBean ib,MultipartFile file,String parameterName){
		String productionImage=upLoadFile(request, file);
		int Parid=informationBizImp.selectPid(parameterName);
		ib.setInformationImg(productionImage);
		ib.setParameterId(Parid);
		int a=informationBizImp.setInformation(ib);
		if(a>0) {
			System.out.println();
		}
	return new ModelAndView("redirect:inforPage.action?page=tpage&number=1");
		
		
	}
	@RequestMapping("/infolist.action")
	public ModelAndView infolist(HttpServletRequest request,String typeid){
		ModelAndView modelAndView=new ModelAndView();
		request.setAttribute("informationList", informationBizImp.getInforList(Integer.parseInt(typeid), 5, 1));
		request.setAttribute("typeid", typeid);
		request.setAttribute("page", 1);
		request.setAttribute("countPage",informationBizImp.getcountPage(Integer.parseInt(typeid)));
		modelAndView.setViewName("jsp/informationList");
		return modelAndView;
	}
	@RequestMapping("/selectInfo.action")
	@ResponseBody
	public List<Object> selectInfo(String page,String state,String parameterid){
		return informationBizImp.selectInfo(page, state, parameterid);
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


@RequestMapping("/delInfor.action")//删除
public ModelAndView test3(HttpServletRequest request,int inforId){
System.out.println(inforId);
  int a=informationBizImp.delInfor(inforId);
  if(a>0) {
	  return new ModelAndView("redirect:inforPage.action?page=tpage&number=1");
  }
	return new ModelAndView("redirect:inforPage.action?page=tpage&number=1");
}
@RequestMapping("/updateInfor.action")//修改
public ModelAndView test5(HttpServletRequest request,int inforId){
	List<InformationBean> list=new ArrayList<InformationBean>();
	list=informationBizImp.selectOne(inforId);
	request.setAttribute("list", list);
	ModelAndView modelAndView=new ModelAndView();
	modelAndView.setViewName("jsp/updateInformation");
	return modelAndView;
}

@RequestMapping("/updateInfor1.action")//修改
public ModelAndView test4(HttpServletRequest request,InformationBean ib){
	int a=informationBizImp.updateInfor(ib);
	if(a>0) {
		System.out.println("修改成功");
	}
	return new ModelAndView("redirect:inforPage.action?page=tpage&number=1");
}

}
