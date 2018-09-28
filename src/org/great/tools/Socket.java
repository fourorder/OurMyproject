package org.great.tools;

import java.io.IOException;  
import java.util.Map;  
import java.util.concurrent.ConcurrentHashMap;  
import javax.websocket.*;  
import javax.websocket.server.PathParam;  
import javax.websocket.server.ServerEndpoint;  
import net.sf.json.JSONObject;  
  
//@ServerEndpoint("/websocket/{username}")
@ServerEndpoint("/websocket") 
public class Socket {  
  
    private static int onlineCount = 0;  
    private static Map<String, Socket> clients = new ConcurrentHashMap<String, Socket>();  
    private Session session;  
    private String username;  
      
    @OnOpen  
    public void onOpen(@PathParam("username") String username, Session session) throws IOException {  
    	System.out.println("已经成功连接");
        this.username = "username";  
        this.session = session;  
          
        addOnlineCount();  
        clients.put("username", this);  
        System.out.println("已连接");  
    }  
  
    @OnClose  
    public void onClose() throws IOException {  
        clients.remove(username);  
        subOnlineCount();  
    }  
  
    @OnMessage  
    public void onMessage(String message) throws IOException {  
    	System.out.println("发送消息"+message);
        JSONObject jsonTo = JSONObject.fromObject(message);  
          
        if (!jsonTo.get("To").equals("All")){  
            sendMessageTo("给一个人", jsonTo.get("To").toString());  
        }else{  
            sendMessageAll("给所有人");  
        }  
    }  
  
    @OnError  
    public void onError(Session session, Throwable error) {  
        error.printStackTrace();  
    }  
  
    public void sendMessageTo(String message, String To) throws IOException {  
        // session.getBasicRemote().sendText(message);  
        //session.getAsyncRemote().sendText(message);  
        for (Socket item : clients.values()) {  
            if (item.username.equals(To) )  
                item.session.getAsyncRemote().sendText(message);  
        }  
    }  
      
    public void sendMessageAll(String message) throws IOException {  
        for (Socket item : clients.values()) {  
            item.session.getAsyncRemote().sendText(message);  
        }  
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