<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>  
        <meta charset="UTF-8">  
        <title>Test WebSocket</title>
        <script type="text/javascript" src="js/jquery.min.js"></script> 
        <script type="text/javascript" >

        var websocket = null;  
        /* var username = localStorage.getItem("name"); */  
        var username = "user";
          
        //判断当前浏览器是否支持WebSocket  
        if ('WebSocket' in window) { 
           /*  websocket = new WebSocket("ws://" + document.location.host + "/WebChat/websocket/" + username + "/"+ _img);  */ 
        	/*  websocket = new WebSocket("ws://" + document.location.host + "/WebChat/websocket/" + username); */
        	 websocket = new WebSocket("ws://localhost:8080/Myproject/websocket");
        } else {  
            alert('当前浏览器 Not support websocket')  
        }  
          
        //连接发生错误的回调方法  
        websocket.onerror = function() {  
            setMessageInnerHTML("WebSocket连接发生错误");  
        };  
          
        //连接成功建立的回调方法  
        websocket.onopen = function() {  
            setMessageInnerHTML("WebSocket连接成功");  
        }  
          
        //接收到消息的回调方法  
        websocket.onmessage = function(event) {  
            setMessageInnerHTML(event.data); 
            alert(event.data);
        }  
          
        //连接关闭的回调方法  
        websocket.onclose = function() {  
            setMessageInnerHTML("WebSocket连接关闭");  
        }  
          
        //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。  
        window.onbeforeunload = function() {  
            closeWebSocket();  
        }  
          
        //关闭WebSocket连接  
        function closeWebSocket() {  
            websocket.close();  
        }  

        function send(){
        	 websocket.send("{To:'"+$("#content").val()+"'}");        	
        	
        }
        
        </script>
    </head>
    <body>
       <div class="container">
           <div calss="item">
           <span>ID:</span>
           <input type="text" class="identity">
           <button class="start-conn-btn" >链接</button>
           <span>toUser:</span>
           <input type="text" class="to-user">
           </div>
           <div class="show-message">
           
           </div>
           <div calss="item">
           <span >内容:</span>
           <textarea  class="msg-context" id="content"></textarea>
           </div>
           <div><button class="send-btn" onclick="send()">send</button></div>
       </div> 
    </body> 

</html>