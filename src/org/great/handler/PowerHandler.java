package org.great.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
	
	
	
	/*@RequestMapping("/toFindAllMenu.action")
	public ModelAndView toFindAllMenu(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/powerManage");
	
		 HashMap<String, ArrayList<AuthorityBean>> map= new HashMap<String, ArrayList<AuthorityBean>>();
		 map= PowerBizImp.findAllMenu(0);
			for (Map.Entry<String, ArrayList<AuthorityBean>> entry : map.entrySet()) {

				System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());

				ArrayList<AuthorityBean> list=new ArrayList<AuthorityBean>();
				list=entry.getValue();
				
				
				
			}
		
		
		return null;
	}*/
	
	
	//ajax  方法名加了个u 
	@RequestMapping("/toFindAllMenuu.action")
	@ResponseBody
	public  HashMap<String, ArrayList<AuthorityBean>> toFindAllMenuu(HttpServletRequest request,int roleId) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/powerManage");
	
		 HashMap<String, ArrayList<AuthorityBean>> map= new HashMap<String, ArrayList<AuthorityBean>>();
		//System.out.println("写死，要传角色id，有powerJSP传目前角色id=2");
		 
		//System.out.println("ajax传过来的id="+roleId);
		 map= PowerBizImp.findAllMenu(roleId);
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
		
	 
	//	System.out.println("管理");
		ArrayList<CharacterBean> list=new ArrayList<CharacterBean>();
		list= PowerBizImp.findCharacter();
		request.setAttribute("list", list);
		return list;
	}
	//String[]
	
	//ajax query菜单权限   
		@RequestMapping("/toSubmitPower.action")
		@ResponseBody
		public /*ArrayList<CharacterBean>*/void  toSubmitPower(HttpServletRequest request
				, Integer[] arrayObj,Integer roldId
				) {
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("jsp/powerManage");
			System.out.println("需要更改的角色权限ID="+roldId);
			PowerBizImp.toSubmitPower(arrayObj, roldId);
	
			//return null;
		}
	
		
		//ajax   添加角色  返回新的角色list
				@RequestMapping("/toAddRole.action")
				@ResponseBody
				public ArrayList<CharacterBean>  toAddRole(HttpServletRequest request
						, String roleIntro, String roleName
						) {
					
					PowerBizImp.toAddRole(roleIntro, roleName);
					ArrayList<CharacterBean> list=new ArrayList<CharacterBean>();
					list= PowerBizImp.findCharacter();
					request.setAttribute("list", list);
				 
			
					 return list;
				}
		
					
		
				//ajax   判断是否存在
				@RequestMapping("/findRoleExist.action")
				@ResponseBody
				public ArrayList<CharacterBean>  findRoleExist(HttpServletRequest request
						, String roleName
						) {
					
					//PowerBizImp.toAddRole(roleIntro, roleName);
					ArrayList<CharacterBean> list=new ArrayList<CharacterBean>();
					list= PowerBizImp.findRoleExist(roleName);
					request.setAttribute("list", list);
				 
			
					 return list;
				}		
				
				//ajax   删除角色ID    返回新的角色list
				@RequestMapping("/confirmDelRole.action")
				@ResponseBody
				public  ArrayList<CharacterBean>  confirmDelRole(HttpServletRequest request
						, Integer delRoleId
						) {
		
					PowerBizImp.delRole(delRoleId);
					ArrayList<CharacterBean> list=new ArrayList<CharacterBean>();
					list= PowerBizImp.findCharacter();
					request.setAttribute("list", list);
					  return list;
				}
				
				
				
				//ajax   确实该角色是否正在使用
				@RequestMapping("/confirmRoleUsing.action")
				@ResponseBody
				public  Integer confirmRoleUsing(HttpServletRequest request
						, Integer delRoleId
						) {
	//	System.out.println("handler检查角色是否在使用");
		Integer state=PowerBizImp.confirmRoleUsing(delRoleId);
					
				//	request.setAttribute("state", state);
				//	System.out.println("ajax返回确认的值="+state);
					return state;
				}
				
				
}
