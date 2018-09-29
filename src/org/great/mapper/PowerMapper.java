package org.great.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.great.bean.AuthorityBean;
import org.great.bean.CharacterBean;
import org.springframework.stereotype.Repository;
@Repository
public interface PowerMapper {

	
	
	//找到所以的角色
	public ArrayList<CharacterBean> findCharacter();
	
	//添加角色
		public void toAddRole(@Param(value="roleIntro")String roleIntro, @Param(value="roleName")String roleName );
	
		//验证角色是否存在
		public ArrayList<CharacterBean> findRoleExist(String roleName);
		
		//删除该角色的角色表记录
		public void delRole(int id );
		
	//查找user表  是否正在使用
		public ArrayList<CharacterBean> confirmRoleUsing1(int id);
		
		/*//查找顾问表  是否正在使用
		public ArrayList<CharacterBean> confirmRoleUsing2(int id);*/
		
		
		
}
