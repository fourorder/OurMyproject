package org.great.biz;

import java.util.List;

public interface UserBiz {
	public List<Object> search(String name,String page,String state,int falg);
	public List<Object> getAllList(String name);
}
