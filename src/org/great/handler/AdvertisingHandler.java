package org.great.handler;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.AdvertisingBean;
import org.great.biz.AdvertisingBiz;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import oracle.net.aso.i;

@Controller
@Scope("prototype")
@RequestMapping("/adver")//广告设置的handler包
public class AdvertisingHandler {
	
	@Resource
	private AdvertisingBiz advertisingBizImp;
	
	@RequestMapping("/page.action")//跳到广告设置页面
	public ModelAndView test(){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/advertisingSet");
		return modelAndView;	
	}
	
	
	@RequestMapping("/list.action")//跳到广告列表
	public ModelAndView test2(HttpServletRequest request,String title,String page,String number,String time){
		int countPage=advertisingBizImp.countAdvertising(title,time);
		int totalPages = countPage / 5 + ((countPage % 5) > 0 ? 1 : 0);//定义总页数
		int num=Integer.parseInt(number);
		System.out.println("num"+num+"页数："+totalPages);
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
		List<AdvertisingBean> list=new ArrayList<AdvertisingBean>();
		list=advertisingBizImp.selectAll(title,time,num);
		System.out.println("list="+list.size());
		request.setAttribute("Alist", list);
		request.setAttribute("countPage", totalPages);
		request.setAttribute("num", num);
		request.setAttribute("title",title);
		request.setAttribute("time",time);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("jsp/advertisingList");
		return modelAndView;	
	}
	
	
	@RequestMapping("/advertising.action")//跳到提交页
	public ModelAndView test1(HttpServletRequest request,AdvertisingBean ab,MultipartFile file){
		System.out.println("--------"+file);
		String productionImage=upLoadFile(request, file);
		
		ModelAndView modelAndView=new ModelAndView();
		List<AdvertisingBean> list=new ArrayList<AdvertisingBean>();
		int num=ab.getAdvertisementNum();
		list=advertisingBizImp.selectAdvertising(num);
		if(list.size()>0) {
			System.out.println("存在数据，是否覆盖");
			int a=advertisingBizImp.updateNum(list.get(0).getAdvertisementTitle(),list.get(0).getAdvertisementPublishTime());
		if(a>0) {
			ab.setAdvertisementImage(productionImage);
			int b =advertisingBizImp.insertAdvertising(ab);
			if(b>0) {
				System.out.println("配置成功");
			}
		}
		}else {
			ab.setAdvertisementImage(productionImage);
			int b =advertisingBizImp.insertAdvertising(ab);
			if(b>0) {
				System.out.println("配置成功");
			}
		}
		modelAndView.setViewName("jsp/advertisingSet");
		return modelAndView;
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


	
	
	@RequestMapping("/operation.action")//删除/修改
	public ModelAndView test3(HttpServletRequest request,String operation,String title,String time,int state){
		if(operation.equals("del")) {
			if(state==0) {
				return new ModelAndView("redirect:list.action?page=tpage&number=1");
			}
			int a=advertisingBizImp.updateNum(title, time);
			if(a>0) {
				System.out.println("删除成功！");
				return new ModelAndView("redirect:list.action?page=tpage&number=1");
			}
		}else if(operation.equals("update")){
			List<AdvertisingBean> list=new ArrayList<AdvertisingBean>();
			list=advertisingBizImp.selectOne(title, time);
			if(list.size()>0) {
				request.setAttribute("Alist", list);
				ModelAndView modelAndView=new ModelAndView();
				modelAndView.setViewName("jsp/updateAdver");
				return modelAndView;	
			}
		}
		
		return null;	
	}
	
	
	@RequestMapping("/affirm.action")//确认修改
	public ModelAndView test4(HttpServletRequest request,AdvertisingBean ab){
	
		System.out.println("标题："+ab.getAdvertisementTitle()+"时间："+ab.getAdvertisementPublishTime());
		List<AdvertisingBean> list=new ArrayList<AdvertisingBean>();
		list=advertisingBizImp.selectAdvertising(ab.getAdvertisementNum());
		int num=ab.getAdvertisementNum();
		if(list.size()>0) {
			int a=advertisingBizImp.updateSerial(num);
		if(a>0) {
			int b=advertisingBizImp.affirm(ab);
			if(b>0) {
				return new ModelAndView("redirect:list.action?page=tpage&number=1");
			}
		}
		}else {
			int b=advertisingBizImp.affirm(ab);
			if(b>0) {
				return new ModelAndView("redirect:list.action?page=tpage&number=1");
			}
		}
		
		
		return null;	
	}
	@RequestMapping("/gotoadver.action")//跳到广告页面
	public String goToAdver(String flag){
		int num=Integer.parseInt(flag);
		String url=null;
		switch (num) {
		case 1:
			url="redirect:"+advertisingBizImp.goToAdver(num).getAdvertisementAddress();
			break;
		case 2:
			url="redirect:"+advertisingBizImp.goToAdver(num).getAdvertisementAddress();
			break;
		case 3:
			url="redirect:"+advertisingBizImp.goToAdver(num).getAdvertisementAddress();
			break;			
		default:
			break;
		}
		return url;
	}
	
}
