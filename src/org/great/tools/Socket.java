package org.great.tools;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;  
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.websocket.*;  
import javax.websocket.server.PathParam;  
import javax.websocket.server.ServerEndpoint;


import org.great.bean.ChatBean;
import org.great.biz.ChatBiz;
import org.great.biz.ChatBizImp;
import org.great.biz.UserBiz;
import org.great.biz.UserBizImp;
import org.great.mapper.ChatMapper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;

import net.sf.json.JSONObject;
import sun.awt.image.PixelConverter.Ushort4444Argb;  
//@ServerEndpoint("/websocket/{username}")
@ServerEndpoint("/websocket/{username}/{flag}/{touser}")
/**
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 * 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 * @ServerEndpoint 可以把当前类变成websocket服务类
 */ 
public class Socket {  
  
    private static int onlineCount = 0;  
    private static Map<String, Socket> clients = new ConcurrentHashMap<String, Socket>();  
    private Session session;  
    private String username;
    private String touser;
    private static Map<String, Boolean> onlineFlag=new ConcurrentHashMap<String, Boolean>();
//    private ChatBiz chatBizImp=(ChatBiz) new ChatBizImp();
    private ChatBizImp chatBizImp = (ChatBizImp) ContextLoader.getCurrentWebApplicationContext().getBean("ChatBizImp");
    private UserBizImp userBizImp = (UserBizImp) ContextLoader.getCurrentWebApplicationContext().getBean("UserBizImp");
    @OnOpen  
    public void onOpen(@PathParam("username") String username, 
    		Session session,@PathParam("flag") String flag,@PathParam("touser") String touser) throws IOException {  
    	System.out.println("已经成功连接");
        this.username = username;  
        this.session = session;
        this.touser=touser;
        List<ChatBean> chatlist=new ArrayList<ChatBean>();

//        addOnlineCount();  
        
        if (flag.equals("0")) {//0表示不在聊天界面
        	clients.put(username, this);
        	 onlineFlag.put(username, false);
        	 clients.get(username).
    		 session.getAsyncRemote().sendText(chatBizImp.chatNum(0,chatBizImp.getUserId(username).getUserId()).size()+"");	 
		}else if (flag.equals("1")) {//1表示在聊天界面
			clients.put(username+"@"+touser, this);//拼接为了区分同个用户不同session
			onlineFlag.put(username, true);
			chatlist=chatBizImp.getChat(0,chatBizImp.getUserId(username).getUserId(),
					chatBizImp.getUserId(touser).getUserId());
			if (chatlist.size()>0) {
				int len=chatlist.size();
				for (int i = 0; i < len; i++) {
				
			    		 clients.get(username+"@"+touser).
			    		 session.getAsyncRemote().sendText(userBizImp.user(chatlist.get(i).getUserId()).userAccount+"|"+chatlist.get(i).getChatContent());
			    		 chatBizImp.updateFlag(chatlist.get(i).getChatId());
			    		
					
				}
				
			}
		}
       
        System.out.println(username);         
        
      
    }  
  
    @OnClose  
    public void onClose() throws IOException {  
        clients.remove(username); 
        clients.remove(username+"@"+touser);
        System.out.println("用户下线"+username+"@"+touser);
//        subOnlineCount();  
    }  
  
    @OnMessage  
    public void onMessage(String message) throws IOException {    	
    	
    	ChatBean chatBean=new ChatBean();
    	chatBean.setChatContent(message.substring(message.split("\\|")[0].length()+1, message.lastIndexOf("|")));
    	
    	chatBean.setToUserId(chatBizImp.getUserId(message.substring(message.lastIndexOf("|")+1)).getUserId());    	
    	chatBean.setUserId(chatBizImp.getUserId(message.split("\\|")[0]).getUserId());
    	chatBean.setChatTime(getTime());
    	if ((clients.get(message.substring(message.lastIndexOf("|")+1))==null)&&(clients.get(message.substring(message.lastIndexOf("|")+1)+"@"+message.split("\\|")[0])==null)) {
    		chatBean.setReceiveFlag(0);//表示不在线
    		
		}else if (clients.get(message.substring(message.lastIndexOf("|")+1)+"@"+message.split("\\|")[0])!=null) {    		
			chatBean.setReceiveFlag(1);//1表示在聊天页
			
		}else if(clients.get(message.substring(message.lastIndexOf("|")+1)+"@"+message.split("\\|")[0])==null){			
			chatBean.setReceiveFlag(0);//0和其他表示不在聊天页
		}
    	chatBizImp.addChatRecord(chatBean);

    	sendMessageTo(message.substring(message.split("\\|")[0].length()+1, message.lastIndexOf("|")), 
    			message.substring(message.lastIndexOf("|")+1),message.split("\\|")[0]);
    	
    }  
  
    @OnError  
    public void onError(Session session, Throwable error) {  
        error.printStackTrace();  
    }  
  
    public void sendMessageTo(String message, String To,String From) throws IOException {  
            	
//    	if (clients.get(To+"@"+From) != null) {
//    	if (onlineFlag.get(To)!=null) {
//    		if (onlineFlag.get(To)) {
//    			if (clients.get(To+"@"+From) != null){
//    				clients.get(To+"@"+From).session.getAsyncRemote().sendText(From+"|"+message);
//    			}    			
//			}else {
//				if (clients.get(To) != null){
//					clients.get(To).session.getAsyncRemote().sendText(
//							chatBizImp.chatNum(0,chatBizImp.getUserId(To).getUserId()).size()+"");
//				}
//				
//			}
//		}else {
//			System.out.println("用户未在线");
//		}
    	if (clients.get(To+"@"+From) != null) {
    		clients.get(To+"@"+From).session.getAsyncRemote().sendText(From+"|"+message);
		}else{
			if (clients.get(To) != null){
				clients.get(To).session.getAsyncRemote().sendText(
						chatBizImp.chatNum(0,chatBizImp.getUserId(To).getUserId()).size()+"");
			}
		}
    		
    		 
//    		} else {
//    		 System.out.println("当前用户不在线");
//    		}

    		
    }  
      
    private String getTime(){
    	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
    	return df.format(new Date());// new Date()为获取当前系统时间
    }
      
  
    public static synchronized int getOnlineCount() {  
        return onlineCount;  
    }  
  
    public static synchronized void addOnlineCount() {  
        Socket.onlineCount++;  
    }  
  
    public static synchronized void subOnlineCount() {  
        Socket.onlineCount--;  
    }  
  
    public static synchronized Map<String, Socket> getClients() {  
        return clients;  
    }  
}  