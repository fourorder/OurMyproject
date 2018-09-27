package org.great.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.great.bean.AuthorityBean;
import org.springframework.stereotype.Repository;
@Repository
public interface AuthoriyMapper {

	
	
	//查找所有父类菜单
		public ArrayList<AuthorityBean> findAllParentMune();
		
		//查找所有子类菜单  条件为父类菜单ID
		public ArrayList<AuthorityBean> findAllSubclassMune( int pId);
		
		//查找所有 已经有的菜单  不区分父类子类   条件为角色id
		public ArrayList<AuthorityBean> findOwnMune(int id);
	
		//清空该角色菜单
		public void delMune(int id);
		
		//根据子类菜单 查找父类菜单
		public Integer findParentMune(int subclassMuneId);
		
		// 将所有菜单id 和角色id 写入数据库 
		public void setRoleAndMenu( @Param(value="roleId")Integer roleId, @Param(value="menuId")Integer menuId);
		
	 
		
}
