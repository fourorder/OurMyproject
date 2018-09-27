package org.great.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.AuthorityBean;
import org.great.bean.CharacterBean;
import org.great.bean.ParameterBean;
import org.great.biz.PowerBiz;
import org.great.biz.ProductionBiz;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/powder")
public class PowerHandler {

	@Resource
	private PowerBiz PowerBizImp;
	
	
	@RequestMapping("/toFindCharacter.action")
	public ModelAndView toManageProduction(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/powerManage");
	//	System.out.println("管理");
		ArrayList<CharacterBean> list=new ArrayList<CharacterBean>();
		list= PowerBizImp.findCharacter();
		request.setAttribute("list", list);
		return mav;
	}
	
	
	
	@RequestMapping("/toFindAllMenu.action")
	public ModelAndView toFindAllMenu(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/powerManage");
	
		 HashMap<String, ArrayList<AuthorityBean>> map= new HashMap<String, ArrayList<AuthorityBean>>();
		 map= PowerBizImp.findAllMenu();
			for (Map.Entry<String, ArrayList<AuthorityBean>> entry : map.entrySet()) {

				System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());

				/*ArrayList<AuthorityBean> list=new ArrayList<AuthorityBean>();
				list=entry.getValue();*/
				
				
				
			}
		
		
		return null;
	}
	
	
	//ajax  方法名加了个u 
	@RequestMapping("/toFindAllMenuu.action")
	@ResponseBody
	public  HashMap<String, ArrayList<AuthorityBean>> toFindAllMenuu(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/powerManage");
	
		 HashMap<String, ArrayList<AuthorityBean>> map= new HashMap<String, ArrayList<AuthorityBean>>();
		 map= PowerBizImp.findAllMenu();
			for (Map.Entry<String, ArrayList<AuthorityBean>> entry : map.entrySet()) {

				System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());

				/*ArrayList<AuthorityBean> list=new ArrayList<AuthorityBean>();
				list=entry.getValue();*/
				
				
				
			}
		
		
		return map;
	}
	
	
	//ajax  查找所以角色 方法后面都多加了 r  n   
	@RequestMapping("/toFindCharacterr.action")
	@ResponseBody
	public ArrayList<CharacterBean> toManageProductionn(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/powerManage");
	//	System.out.println("管理");
		ArrayList<CharacterBean> list=new ArrayList<CharacterBean>();
		list= PowerBizImp.findCharacter();
		request.setAttribute("list", list);
		return list;
	}
	
}
