package org.great.mapper;

import java.util.ArrayList;

import org.great.bean.AuthorityBean;
import org.great.bean.CharacterBean;
import org.springframework.stereotype.Repository;
@Repository
public interface PowerMapper {

	
	
	//找到所以的角色
	public ArrayList<CharacterBean> findCharacter();
	
	
	
}
