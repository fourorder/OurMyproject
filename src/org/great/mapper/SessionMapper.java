package org.great.mapper;

import org.great.bean.SessionBean;
import org.springframework.stereotype.Repository;

@Repository
public interface SessionMapper {

	
	//插入
	public void setSession(SessionBean sessionBean);
	//查找
	public SessionBean findSession (long time);
	
	
	
	public void setSessionUser(SessionBean sessionBean);
}
