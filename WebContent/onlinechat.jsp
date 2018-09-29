<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
	<head>
		<meta charset="utf-8" />
		<title>聊天室</title>
		<link rel="stylesheet" type="text/css" href="<%=path %>css/style.css" />
		<script type="text/javascript" src="<%=path %>js/my.js" ></script>
	</head>
	<body>
	${user.userAccount}
		<div class="outer">
			<div class="box">
				<div class="chat" >
					<div class="top">
						<span class="">${toUser}</span>
					</div>
					 <div class="content">
						<select multiple="multiple" id="leftContent">
							
						</select>
					</div> 
					<div class="send" >
						<input type="text" id="leftText" class="sText" />
						<input type="button" id="leftSendBtn" class="btn" value="发送" onclick="send()"/>
					</div>
				</div>
			</div>
			
			<!-- <div calss="item">
           <span>ID:</span>
           <input type="text" class="identity" id="fromuser">
           <button class="start-conn-btn" onclick="online()">链接</button>
           <span>toUser:</span>
           <input type="text" class="to-user" id="touser">
           </div> -->
			<!-- <div class="box">
				<div class="chat">
					<div class="top">
						<span class="">灞波儿奔</span>
					</div>
					<div class="content">
						<select multiple="multiple" id="rightContent">

						</select>
					</div>
					<div class="send">
						<input type="text" id="rightText" class="sText"/>
						<input type="button" id="rightSendBtn" class="btn" value="发送"/>
					</div>
				</div>
			</div> -->
		</div>
	</body>
 <script type="text/javascript" src="<%=path %>js/jquery.min.js"></script> 
        <script type="text/javascript" >

        var websocket = null;  
         
      /*   var username = "user"; */
          
/*       function online(){ */
    	  //判断当前浏览器是否支持WebSocket  
    	  $(function(){ 

              if ('WebSocket' in window) { 
            	  alert('${user.userAccount}');
              	 var username = ${user.userAccount} 
                 /*  websocket = new WebSocket("ws://" + document.location.host + "/WebChat/websocket/" + username + "/"+ _img);  */ 
              	  websocket = new WebSocket("ws://" + document.location.host + "/Myproject/websocket/" + username); 
              	/*  websocket = new WebSocket("ws://localhost:8080/Myproject/websocket"); */
              } else {  
                  alert('当前浏览器 Not support websocket')  
              }  
        	  
            //接收到消息的回调方法  
              websocket.onmessage = function(event) {  
                  /* setMessageInnerHTML(event.data);  */
                  /* alert(event.data); */
                /*   $("#leftContent").append(event.data); */
            /*     $("#leftContent").appendChild(option); */
            	var leftContent = document.getElementById("leftContent");
            	var len = event.data.length;
          		var option1 = document.createElement("option");
          		option1.innerHTML = event.data;
          		option1.style.backgroundColor = "white";
          		option1.style.marginLeft = "10px";
          		option1.style.width = len * 15 + len*2 + "px";
          		leftContent.appendChild(option1);
                  
              }  
			});
    	  
                   
    	  
    /*   } */
        
          
       /*  //连接发生错误的回调方法  
        websocket.onerror = function() {  
            setMessageInnerHTML("WebSocket连接发生错误");  
        }; */  
          
       /*  //连接成功建立的回调方法  
        websocket.onopen = function() {  
            setMessageInnerHTML("WebSocket连接成功");  
        }  
           */
           
         
           /* //连接关闭的回调方法  
           websocket.onclose = function() {  
               setMessageInnerHTML("WebSocket连接关闭");  
           }  
             
           //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。  
           window.onbeforeunload = function() {  
               closeWebSocket();  
           }   */
      
        //关闭WebSocket连接  
        function closeWebSocket() {  
            websocket.close();  
        }  

        function send(){
        	 /* websocket.send("{To:'"+$("#content").val()+"'}"); */
        	 websocket.send($("#fromuser").val()+"|"+$("#leftText").val()+"|"+$("#touser").val()); 
        	
        }
        
        </script>
</html>