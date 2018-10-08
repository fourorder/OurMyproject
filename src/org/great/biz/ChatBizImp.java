package org.great.biz;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.great.bean.ChatBean;
import org.great.bean.UserBean;
import org.great.mapper.ChatMapper;
import org.springframework.stereotype.Service;

@Service
public class ChatBizImp implements ChatBiz{
@Resource
private ChatMapper chatMapper;
	public void addChatRecord(ChatBean chatBean){
		chatMapper.addChatRecord(chatBean);
	}
	public UserBean getUserId(String account){
		return chatMapper.getUserId(account);
	}
	public List<ChatBean> getChat(int receiveflag,int touserid,int userid){
		return chatMapper.getChat(receiveflag,touserid,userid);
	}
	@Override
	public void updateFlag(int chatid) {
		
		chatMapper.updateFlag(chatid);
	}
	@Override
	public List<Object> getMsgInfo(String page,String state,int touserid) {
		// TODO Auto-generated method stub
		List<Object> list=new ArrayList<Object>();
		List<UserBean> list1=new ArrayList<UserBean>();
		int page1=Integer.parseInt(page);
		int count1=0;
		count1=chatMapper.getAllMsg(touserid).size();	
				
		int countpage1=(int) Math.ceil(((float)count1)/3);
		if(state==null){
			state="";
		}
		if(state.equals("next")&&(page1<(int) Math.ceil(((float)count1)/3))){
			page1++;				
		}else if(state.equals("last")&&(page1>1)){
			page1--; 				
		}else if (state.equals("jump")){
			
		}else if (state.equals("home")) {
			page1=1;
		}else if (state.equals("end")) {
			page1=countpage1;
		}
		int end=page1*3;
		int start=end-2;
		//组装信息
		Iterator<UserBean> iterator=chatMapper.getMsgInfo(end,start,touserid).iterator();
		while (iterator.hasNext()) {
			UserBean userBean = iterator.next();
			userBean.setCount(chatMapper.getCount(userBean.getUserId(),
					touserid));
			list1.add(userBean);
			}
		list.add(list1);//用户列表			
		list.add(page1);//当前页数
		list.add(countpage1);//总页数
		list.add(count1);//总条数
		return list;
	}
	public List<ChatBean> chatNum(int receiveflag,int touserid){
		return chatMapper.chatNum(receiveflag,touserid);
	}
}
