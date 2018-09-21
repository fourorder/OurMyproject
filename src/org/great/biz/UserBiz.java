package org.great.biz;

import java.util.List;

public interface UserBiz {
	public List<Object> search(String name,String page,String state);
	public boolean checkAccount(String userAccount);
}
