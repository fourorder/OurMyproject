package org.great.mapper;

import java.util.ArrayList;

import org.great.bean.AuthorityBean;
import org.springframework.stereotype.Repository;
@Repository
public interface AuthoriyMapper {

	
	
	//查找所有父类菜单
		public ArrayList<AuthorityBean> findAllParentMune();
		//查找所有子类菜单  条件为父类菜单ID
		public ArrayList<AuthorityBean> findAllSubclassMune( int pId);
}
