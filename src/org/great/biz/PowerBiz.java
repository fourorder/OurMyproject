package org.great.biz;

import java.util.ArrayList;
import java.util.HashMap;

import org.great.bean.AuthorityBean;
import org.great.bean.CharacterBean;

 

public interface PowerBiz {

	//找到所以的角色
	public ArrayList<CharacterBean> findCharacter();
	
	
	//查找所以菜单，父类及子类map 装。
	public HashMap<String, ArrayList<AuthorityBean>> findAllMenu();
	
}
