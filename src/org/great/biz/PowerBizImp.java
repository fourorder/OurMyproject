package org.great.biz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Map;

import javax.annotation.Resource;

import org.great.bean.AuthorityBean;
import org.great.bean.CharacterBean;
import org.great.mapper.AuthoriyMapper;
import org.great.mapper.PowerMapper;
import org.springframework.stereotype.Service;

@Service
public class PowerBizImp implements PowerBiz {
	@Resource
	private PowerMapper powerMapper;
	@Resource
	private AuthoriyMapper authoriyMapper;

	@Override
	public ArrayList<CharacterBean> findCharacter() {
		// TODO Auto-generated method stub

		ArrayList<CharacterBean> list = new ArrayList<CharacterBean>();
		list = powerMapper.findCharacter();

		return list;
	}

	@Override
	public HashMap<String, ArrayList<AuthorityBean>> findAllMenu(int id) {
		// TODO Auto-generated method stub
		HashMap<String, ArrayList<AuthorityBean>> map = new HashMap<String, ArrayList<AuthorityBean>>();

		ArrayList<AuthorityBean> parentList = new ArrayList<AuthorityBean>();
		ArrayList<AuthorityBean> SubclassList = new ArrayList<AuthorityBean>();
		ArrayList<AuthorityBean> ownList = new ArrayList<AuthorityBean>();

		// 已拥有的菜单 不区分父类子类
		ownList = authoriyMapper.findOwnMune(id);

		// 所有父类菜单
		parentList = authoriyMapper.findAllParentMune();

		for (AuthorityBean list : parentList) {

			int parentId = list.getAuthorityId();
			// System.out.println("所有父类菜单ID，父类菜单ID="+parentId);
			// System.out.println("父类菜单名字="+list.getAuthorityName());
			SubclassList = authoriyMapper.findAllSubclassMune(parentId);
			map.put(list.getAuthorityName(), SubclassList);

			// 循环遍历 已拥有的菜单id 改变状态 用于勾选
			for (AuthorityBean list2 : SubclassList) {
				for (AuthorityBean list3 : ownList) {
					// System.out.println("所有的菜单的子菜单id包括="+list2.getAuthorityId()
					// +"已拥有的菜单id包括="+list3.getAuthorityId());
					if (list2.getAuthorityId() == list3.getAuthorityId()) {

						list2.setState(1);
						// System.out.println("更改完后的状态为="+list2.getState());
					}

				}

			}

		}

		return map;
	}

	@Override
	public void toSubmitPower(Integer[] arrayObj, Integer roldId) {
		// TODO Auto-generated method stub

		AuthorityBean authorityBean = new AuthorityBean();
		Integer parentId = 0;
		// Integer parentIdList=new Integer[](parentIdList);
		ArrayList<Integer> parentIdList = new ArrayList<Integer>();

		// 1.清空该角色所以的菜单
		authoriyMapper.delMune(roldId);

		// 2.遍历传进来的确认的子菜单 去找父类菜单
		for (int i = 0; i < arrayObj.length; i++) {
			int muneId = arrayObj[i];
			System.out.println("菜单有=" + muneId);
			parentId = authoriyMapper.findParentMune(muneId);

			parentIdList.add(parentId);
		}

		/*
		 * for(int i=0;i<parentIdList.size();i++) {
		 * 
		 * System.out.println("没有去重前父类id有="+parentIdList.get(i));
		 * 
		 * }
		 */

		// 3.父类菜单存在list 去重
		LinkedHashSet<Integer> set = new LinkedHashSet<Integer>(parentIdList.size());
		set.addAll(parentIdList);
		parentIdList.clear();
		parentIdList.addAll(set);
		/*
		 * for(int i=0;i<parentIdList.size();i++) {
		 * 
		 * System.out.println("去重后父类id有="+parentIdList.get(i));
		 * 
		 * }
		 */
		// 4. 子类菜单 父类菜单 角色id 写入数据库
		// 父类菜单
		for (int i = 0; i < parentIdList.size(); i++) {

			// System.out.println("去重后父类id有="+parentIdList.get(i));
			authoriyMapper.setRoleAndMenu(roldId, parentIdList.get(i));
		}

		// 子类菜单
		for (int i = 0; i < arrayObj.length; i++) {

			// System.out.println("去重后父类id有="+parentIdList.get(i));
			authoriyMapper.setRoleAndMenu(roldId, arrayObj[i]);
		}

	}

	@Override
	public void toAddRole(String roleIntro, String roleName) {
		// TODO Auto-generated method stub
		
		powerMapper.toAddRole(roleIntro, roleName);
	}

	@Override
	public ArrayList<CharacterBean> findRoleExist(String roleName) {
		// TODO Auto-generated method stub
	
		ArrayList<CharacterBean> list=new ArrayList<CharacterBean>();
		
		list=powerMapper.findRoleExist(roleName);
		
		return list;
	}

	@Override
	public void delRole(int id) {
		// TODO Auto-generated method stub
		//1清除该角色的菜单
		authoriyMapper.delMune(id);
		//2 删除该角色的角色表记录
		powerMapper.delRole(id);
	}

	@Override
	public Integer confirmRoleUsing(int id) {
		// TODO Auto-generated method stub
	
		//1.查找user表  是否正在使用
	ArrayList<CharacterBean> list=new ArrayList<CharacterBean>();
		
		list=powerMapper.confirmRoleUsing1(id);
	 
		if(list.size()==0) {
			return 0;
		}
		
		
		
		
		return 1;
	}

}
