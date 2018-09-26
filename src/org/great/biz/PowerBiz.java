package org.great.biz;

import java.util.ArrayList;
import java.util.HashMap;

import org.great.bean.AuthorityBean;
import org.great.bean.CharacterBean;


 

public interface PowerBiz {

	//找到所以的角色
	public ArrayList<CharacterBean> findCharacter();
	
	
	//查找所以菜单，父类及子类map 装。
	public HashMap<String, ArrayList<AuthorityBean>> findAllMenu(int id);
	
	//确认 菜单
	public void toSubmitPower(Integer[] arrayObj,Integer roldId);
	
	//添加角色
	public void toAddRole(String roleIntro, String roleName );
	
	//验证角色是否存在
	public ArrayList<CharacterBean> findRoleExist(String roleName);
	
	//删除角色
	public void delRole(int id);
	
	//判断该角色 是否正在使用	
	public Integer confirmRoleUsing(int id);
	
	
}
