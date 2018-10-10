<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<html>
<head>
	<meta charset="UTF-8">
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
	<meta name="baidu-site-verification" content="ZVPGgtpUfW"/>
	<title>交易记录</title>
	<link rel="stylesheet" href="<%=path%>css/oindex.css">
	<link rel="icon" type="image/x-icon" href="<%=path%>favicon.ico">
	<link href="<%=path%>iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/core.css">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/icon.css">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/home.css">


</head>
<body>

<!-- head YDC begin -->
	 <div class="o-top">
				<div class="width1180">
					<span class="fr">
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
<!-- head YDC end -->

<!-- content YDC begin -->
	<section>
		<div class="ydc-content-slide ydc-body">
			<div class="ydc-flex">
				<!-- right begin -->
				<div class="ydc-column ydc-column-8" style="margin:auto;">
					<div class="ydc-release-content">
						<div class="ydc-tabPanel ydc-tabPanel-release">
							<div class="ydc-release-tab-head">
								<ul>
									<li class="hit">交易记录</li>
								</ul>
							</div>
							<div class="ydc-panes">
								<div class="ydc-panes-account">
									<table>
										<thead>
											<tr>
												<th>用户</th>
												<th>日期</th>
												<th>交易类型</th>
												<th>接收人</th>
												<th>交易金额</th>
											</tr>
										</thead>
									<tbody id="tb">
									<c:forEach items="${fundList}"  var="fund">
									<tr>
												<td>${fund.userBean.userName}</td>
												<td>${fund.dealDate}</td>
												<td>${fund.businessBean.businessName}</td>
												<td>${fund.toUserBean.userName}</td>
												<td>${fund.dealMoney}</td>
									</tr>
									</c:forEach>											
										</tbody>
									</table>
								</div>
								<div class="ydc-pagination">
									<ol>
										<li class="ydc-previous-item">
											<button class="ydc-previous-item-btn-medium ydc-disabled" onclick="selectFund('last')" id="last"   disabled="disabled">
												<span>上一页</span>
											</button>
										</li>
										<li id="l1">${requestScope.page}/${requestScope.countPage}</li>
										<li class="ydc-previous-item">
										<c:if test="${requestScope.countPage=='1'}">
										<button class="ydc-previous-item-btn-medium ydc-disabled" onclick="selectFund('next')" id="next" disabled="disabled">
												<span>下一页</span>
										</button>
										</c:if>
										<c:if test="${requestScope.countPage!='1'}">
										<button class="ydc-previous-item-btn-medium" onclick="selectFund('next')" id="next">
												<span>下一页</span>
										</button>
										</c:if>	
										</li>
										<li class="ydc-item-quick">
											第<div class="ydc-item-quick-kun"><input type="number" aria-invalid="false" class="" id="btn1" onclick="checknum(this)"></div>页
											<button style="margin-left:5px;" class="ydc-previous-item-btn-medium"  onclick="selectFund('jump')" >
												<span>跳转</span>
											</button>
										</li>
									</ol>
								</div>
								
							</div>
						</div>
					</div>
				</div>
				<!-- right end -->
			</div>
		</div>

	</section>
<!-- content YDC end -->

	<script type="text/javascript" src="<%=path %>admin/js/jquery.min.js"></script>
	

	<script type="text/javascript">
	function checknum(obj){
		if($(obj).val()!=""){
			if($(obj).val()<1){				
				$("#btn1").val(1);
			}	
		}
	}
	
	    
var page="${requestScope.page}";
function selectFund(state){
	
	$("#tb").empty();
	var num=$("#btn1").val();
	if(num!=""&&state=="jump"){
		page=num;		
	}
	$.ajax({	
		 url:"<%=path%>fund/selectFund.action",
		 data:"state="+state+"&page="+page,
		 dataType:"json",
		 type:"post",
		 success:function(redata){
		
			   		page=redata[0];
			   	 var list=redata[1];
		         var len = list.length;
		         var size=redata[2];
		         for(var i=0;i<len;i++){    			        	 
		             var e = list[i];
		             $("#tb").append("<tr><td>"+e.userBean.userName+"</td><td>"+e.dealDate+"</td><td>"+e.businessBean.businessName+"</td><td>"+e.toUserBean.userName+"</td><td>"+e.dealMoney+"</td></tr>"); 
		         } 	
		         if(page==1){
		        	 $("#last").attr("class","ydc-previous-item-btn-medium ydc-disabled"); 
		        	 $("#last").attr("disabled",true);
		         }else{
		        	 $("#last").attr("class","ydc-previous-item-btn-medium");
		        	 $("#last").attr("disabled",false);
		         }
		         if(page==size){
		        	 $("#next").attr("class","ydc-previous-item-btn-medium ydc-disabled");
		        	 $("#next").attr("disabled",true);
		         }else{
		        	 $("#next").attr("class","ydc-previous-item-btn-medium");
		        	 $("#next").attr("disabled",false);
		         }
		         $("#l1").html(page+"/"+size);
		         
		 }
	 }); 
    	
}
</script>
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