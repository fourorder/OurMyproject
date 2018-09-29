package org.great.tools;

import java.io.IOException;  
import java.util.Map;  
import java.util.concurrent.ConcurrentHashMap;  
import javax.websocket.*;  
import javax.websocket.server.PathParam;  
import javax.websocket.server.ServerEndpoint;  
import net.sf.json.JSONObject;  
  
//@ServerEndpoint("/websocket/{username}")
@ServerEndpoint("/websocket/{username}")
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
      
    @OnOpen  
    public void onOpen(@PathParam("username") String username, Session session) throws IOException {  
    	System.out.println("已经成功连接");
        this.username = username;  
        this.session = session;  
          
//        addOnlineCount();  
        clients.put(username, this);  
        System.out.println(username);  
    }  
  
    @OnClose  
    public void onClose() throws IOException {  
        clients.remove(username); 
        System.out.println("用户下线"+username);
//        subOnlineCount();  
    }  
  
    @OnMessage  
    public void onMessage(String message) throws IOException {  
    	System.out.println("发送消息"+message);
//        JSONObject jsonTo = JSONObject.fromObject(message);  
          
//        if (!jsonTo.get("To").equals("All")){  
//            sendMessageTo("给一个人", jsonTo.get("To").toString());  
//        }else{  
//            sendMessageAll("给所有人");  
//        } 
    	sendMessageTo(message.split("\\|")[1], message.split("\\|")[2],message.split("\\|")[0]);
    	
    }  
  
    @OnError  
    public void onError(Session session, Throwable error) {  
        error.printStackTrace();  
    }  
  
    public void sendMessageTo(String message, String To,String From) throws IOException {  
        // session.getBasicRemote().sendText(message);  
        //session.getAsyncRemote().sendText(message);  
//        for (Socket item : clients.values()) {  
//            if (item.username.equals(To) )  
//                item.session.getAsyncRemote().sendText(message);  
//        }  
//    	System.out.println(clients.size());
//      for (Socket item : clients.values()) {  
//           System.out.println(item.username);  
//           
//  }  
    	
    	if (clients.get(To) != null) {
    		 clients.get(To).session.getAsyncRemote().sendText(From+"|"+message);
    		} else {
    		 System.out.println("当前用户不在线");
    		}

    		
    }  
      
//    public void sendMessageAll(String message) throws IOException {  
//        for (Socket item : clients.values()) {  
//            item.session.getAsyncRemote().sendText(message);  
//        }  
//    }  
      
      
  
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