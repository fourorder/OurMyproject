package org.great.biz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.great.bean.AuthorityBean;
import org.great.bean.CharacterBean;
import org.great.mapper.AuthoriyMapper;
import org.great.mapper.PowerMapper;
import org.junit.jupiter.api.Test;
import org.springframework.stereotype.Service;



 
@Service
public class PowerBizImp implements PowerBiz {
	@Resource
	private  PowerMapper powerMapper;
	@Resource
	private  AuthoriyMapper authoriyMapper;
	
	
	@Override
	public ArrayList<CharacterBean> findCharacter() {
		// TODO Auto-generated method stub
		
		
		ArrayList<CharacterBean> list=new ArrayList<CharacterBean>();
		list=powerMapper.findCharacter();
		
		return list;
	}


	@Override
	public HashMap<String, ArrayList<AuthorityBean>> findAllMenu() {
		// TODO Auto-generated method stub
		HashMap<String, ArrayList<AuthorityBean>> map= new HashMap<String, ArrayList<AuthorityBean>>();
		
		 ArrayList<AuthorityBean> parentList=new  ArrayList<AuthorityBean>();
		 ArrayList<AuthorityBean> SubclassList=new  ArrayList<AuthorityBean>();
		 parentList=authoriyMapper.findAllParentMune();
		 
		 for (AuthorityBean list : parentList) {
			 
			 int parentId=list.getAuthorityId();
			 System.out.println("所有父类菜单ID，父类菜单ID="+parentId);
			 System.out.println("父类菜单名字="+list.getAuthorityName());
			 SubclassList=authoriyMapper.findAllSubclassMune(parentId);
			 map.put(list.getAuthorityName(), SubclassList);
		 }
		 
		 
		
		return map;
	}

  /*@Test
	public void find() {
	 HashMap<String, ArrayList<AuthorityBean>> map= new HashMap<String, ArrayList<AuthorityBean>>();
	 map= findAllMenu();
		for (Map.Entry<String, ArrayList<AuthorityBean>> entry : map.entrySet()) {

			System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());

		}
	 
	 
	} */
	
}
