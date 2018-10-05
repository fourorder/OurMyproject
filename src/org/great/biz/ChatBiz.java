package org.great.biz;

import java.util.List;

import org.great.bean.ChatBean;
import org.great.bean.UserBean;

public interface ChatBiz {
	public void addChatRecord(ChatBean chatBean);
	public UserBean getUserId(String account);
	public List<ChatBean> getChat(int receiveflag,int touserid,int userid);
	public void updateFlag(int chatid);
	public List<Object> getMsgInfo(String page,String state,int touserid);
	public List<ChatBean> chatNum(int receiveflag,int touserid);
}
