<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name='TTUNION_verify' content='b846c3c2b85efabc496d2a2b8399cd62'>
	<meta name="sogou_site_verification" content="gI1bINaJcL"/>
	<meta name="360-site-verification" content="37ae9186443cc6e270d8a52943cd3c5a"/>
	<meta name="baidu_union_verify" content="99203948fbfbb64534dbe0f030cbe817">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="apple-touch-fullscreen" content="yes">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE;chrome=1">
	<meta name="format-detection" content="telephone=no">
	<meta name="keywords" content="一点车 -  让您多懂一点车,一点车，让您多懂一点车的常识，在这里，您会看到汽车相关的知识，汽车日常保养，汽车多用小知识，汽车简单维修以及清洗保养等等。">
	<meta name="description" content="一点车 -  让您多懂一点车,一点车，让您多懂一点车的常识，在这里，您会看到汽车相关的知识，汽车日常保养，汽车多用小知识，汽车简单维修以及清洗保养等等。。">
	<meta name="author" content="AUI, a-ui.com">
	<meta name="baidu-site-verification" content="ZVPGgtpUfW"/>
	<title>规则介绍</title>
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/core.css">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/icon.css">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/home.css">
	<link type="text/css" rel="stylesheet" href="<%=path%>css/bootstrap.css">
	<link rel="stylesheet" href="<%=path%>css/oindex.css">
	<script type="text/javascript" src="<%=path%>js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=path%>js/jquery.superslide.2.1.1.js"></script>


</head>
<body>
<div class="o-top">
				<div class="width1180">
					
					<span class="fr" id="fr1">
						<!-- <a href="#" title="登录">登录</a>
						<a href="#" title="注册">注册</a> -->
						<a href="<%=path %>user/home.action" title="众包首页"><i class="o-home"></i>众包首页</a>
						<a href="#" title="联系我们" ><i class="o-contract"></i>联系我们</a>
						<!--登录后
						<a title="管理员" href="http://www.yizhihou.com/member/" target="_blank" rel="nofollow">嘉客</a>
						<a href="http://www.yizhihou.com/member/logout.php" rel="nofollow">退出</a>
						-->
					</span>
				</div>
</div>
<!-- content YDC begin -->
	<section>
		<div class="ydc-content-slide ydc-body">
			<div class="ydc-page-content">
				<div class="ydc-page-head">
					<h3 style="color: #333">一站式服务众包平台规则介绍</h3>
					<textarea rows="40" cols="151"  readonly="readonly">
					${requestScope.rule.content}
					</textarea>
				</div>
				
				
			</div>
		</div>

	</section>
<!-- content YDC end -->

	<script type="text/javascript" src="<%=path%>admin/js/jquery.min.js"></script>
<script type="text/javascript">

var websocket = null;  
var username = '${user.userAccount}'; 
/*   var username = "user"; */
  
/*       function online(){ */
  //判断当前浏览器是否支持WebSocket  
  if ('WebSocket' in window) { 
  	
     /*  websocket = new WebSocket("ws://" + document.location.host + "/WebChat/websocket/" + username + "/"+ _img);  */ 
  	  websocket = new WebSocket("ws://" + document.location.host + "/Myproject/websocket/" + username); 
  	/*  websocket = new WebSocket("ws://localhost:8080/Myproject/websocket"); */
  } else {  
      alert('当前浏览器 Not support websocket')  
  }  
  
//接收到消息的回调方法  
  websocket.onmessage = function(event) {  
	
		if(event.data!=null){
			var arr=event.data.split("|");
			var text=arr[1];
			var touser=arr[0];
			$("#fr1").append("<a href='<%=path%>chat/gotochat.action?account="+touser+"&msg="+text+"' title='有新消息'  target='_blank'><i class='o-contract'></i>有新消息</a>");
		}
		
      
  }  
   
//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。  
  window.onbeforeunload = function() {  
      closeWebSocket();  
  }   

//关闭WebSocket连接  
function closeWebSocket() {  
   websocket.close();  
}  

</script>

</body>
</html>