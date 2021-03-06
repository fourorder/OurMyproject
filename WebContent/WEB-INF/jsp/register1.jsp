<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
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
	<meta name="keywords" content="一点车 -  让您多懂一点车,一点车，让您多懂一点车的常识，在这里，您会看到汽车相关的知识，汽车日常保养，汽车多用小知识，汽车简单维修以及清洗保养等等。">
	<meta name="description" content="一点车 -  让您多懂一点车,一点车，让您多懂一点车的常识，在这里，您会看到汽车相关的知识，汽车日常保养，汽车多用小知识，汽车简单维修以及清洗保养等等。。">
	<meta name="author" content="AUI, a-ui.com">
	<meta name="baidu-site-verification" content="ZVPGgtpUfW"/>
	<title>用户注册</title>
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>admin/css/core.css">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>admin/css/icon.css">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>admin/css/home.css">


</head>
<body>

<!-- head YDC begin -->
	<header class="ydc-header">
		<div class="ydc-entered">
			<div class="ydc-header-content ydc-flex">
				<div class="ydc-column">
					
				</div>
				<div class="ydc-column">
					<div class="ydc-column-user">
						<div class="ydc-user-photo">
							<!--<a href="javascript:;">-->
								<!--<img src="admin/images/icon/photo.png" title="" about="" alt="">-->
							<!--</a>-->
						</div>
						<div class="ydc-user-info">
							<div class="ydc-user-info-name">
								<!--<a href="javascript:;">一点车</a>-->
							</div>
							<div class="ydc-user-info-func ydc-flex">
								<!--<span class="ydc-tag">新手期</span>-->
								<!--<span class="ydc-mal"><i class="ydc-icon ydc-icon-mail fl"></i><em>12</em></span>-->
								<a href="<%=basePath%>user/show.action">退出</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
<!-- head YDC end -->

<!-- content YDC begin -->
	<section>
		<div class="ydc-content-slide ydc-body">
			<div class="ydc-page-content" style="overflow:hidden">
				<div class="ydc-reg-title">
					<ul class="clearfix">
						<li class="ydc-reg-step active">
							<em></em>
							<h3>登录邮箱账号</h3>
						</li>
						<li class="ydc-reg-step">
							<em></em>
							<h3>选择帐号类别</h3>
						</li>
						<li class="ydc-reg-step">
							<em></em>
							<h3>填写媒体信息</h3>
						</li>
					</ul>
				</div>
				<div class="ydc-reg-form clearfix">
					<form action="<%=basePath%>register/registerShow2.action"name="myform" method="post" >
						<div class="ydc-reg-form-group clearfix">
							<label>邮箱账号:</label>
							<div class="ydc-reg-form-input">
								<input type="text" id="userAccount" name="userAccount" onblur="checkAccount()" class="ydc-form-control" autocomplete="off" placeholder="账号通行证/邮箱">
								<!-- <span id="accountspan"></span> -->
								 <div id="accountspan" style="position:absolute; left:350px;top:10px; width:100px;color:red;"></div>
							</div>
							<div class="ydc-reg-form-text">
							</br></br>
								<p>请填写账号邮箱，作为登录帐号。</p>
							</div>
						</div>
						<div class="ydc-reg-form-group clearfix">
							<label>密码:</label>
							<div class="ydc-reg-form-input">
								<input type="password" id="userPwd" name="userPwd"  onblur="checkPwd()"     class="ydc-form-control" autocomplete="off" placeholder="密码">
							    <span id="pwdspan"></span>
							</div>
							
						</div>
						<div class="ydc-reg-form-group">
							<div class="ydc-reg-form-button">
								<a class="btn" type="submit" href="javascript:document.myform.submit();" onclick="return checkForm()">下一步</a>
							</div>
						</div>
					</form>
				</div>
				<div class="ydc-right-banner" style="margin-top:80px;">
					<div class="slideshow-container">
						<a href="https://xihazahuopu.taobao.com/" target="_blank" class="mySlides fade">
							<img src="<%=basePath%>admin/images/ad/ad1.jpg" style="width:100%">
						</a>
						<a href="https://weibo.com/525135676" target="_blank" class="mySlides fade">
							<img src="<%=basePath%>admin/images/ad/ad2.jpg" style="width:100%">
						</a>
						<a href="http://www.a-ui.cn/" target="_blank" class="mySlides fade">
							<img src="<%=basePath%>admin/images/ad/ad3.jpg" style="width:100%">
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="ydc-footer">
			<div>
				<p>©2018 众包版权所有About 公司简介  联系方法  招聘信息  客户服务  隐私政策  广告服务  网站地图  意见反馈  不良信息举报</p>
			</div>
		</div>
	</section>
<!-- content YDC end -->

	<script type="text/javascript" src="<%=basePath%>admin/js/jquery.min.js"></script>
	<script type="text/javascript">
	    var slideIndex = 0;
	    showSlides();

	    function showSlides() {
	        var i;
	        var slides = document.getElementsByClassName("mySlides");
	        for (i = 0; i < slides.length; i++) {
	            slides[i].style.display = "none";
	        }
	        slideIndex++;
	        if (slideIndex> slides.length) {slideIndex = 1}
	        slides[slideIndex-1].style.display = "block";
	        setTimeout(showSlides, 3000); // 滚动时间
	    }
	</script>

	<script type="text/javascript">
	    $(function(){
	        $('.ydc-tabPanel ul li').click(function(){
	            $(this).addClass('hit').siblings().removeClass('hit');
	            $('.ydc-panes>div:eq('+$(this).index()+')').show().siblings().hide();
	        })
	    })
	</script>
	<script type="text/javascript">
	 function checkAccount(){
           var flag;
	        var  userAccount  = document.getElementById("userAccount").value;

	       var account = /^[a-z0-9]\w+@[a-z0-9]{2,3}(\.[a-z]{2,3}){1,2}$/i;  // .com .com.cn

	       var accountspan = document.getElementById("accountspan");
	       $.ajax({					
				 url:"<%=basePath%>user/checkAccount.action",
				 data:{"userAccount":$("#userAccount").val()},
				 dataType:"json",
				 type:"post",
				 async: false,
				 success:function(data){
					 
					 $("#accountspan").html(data[0]);
					 
					 if(data[0]==2){
						 if(account.test(userAccount)){

					           //符合规则 

					           accountspan.innerHTML="邮箱可以使用".fontcolor("green");

					          
				               flag=true;
					           

					       } else{

					           //不符合规则

					           accountspan.innerHTML="邮箱格式输入错误".fontcolor("red");

					           flag =false;

					       }  
					 }else{
						 accountspan.innerHTML="邮箱已被占用".fontcolor("red");
						 flag= false;
					 }
				 }
			 });
	      
	       return flag;
	      
	 	  

	    }
	 
	//校验密码  6位

	    function checkPwd(){

	       var  userPwd  = document.getElementById("userPwd").value;

	  

	           var pwd = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)\S{8,}$/;

	           var pwdspan = document.getElementById("pwdspan");

	           if(pwd.test(userPwd)){

	              //符合规则 

	              pwdspan.innerHTML="密码输入正确".fontcolor("green");

	              return true;

	           }else{

	              //不符合规则

	              pwdspan.innerHTML="密码必须符合由数字,大写字母,小写字母,至少其中两种组成，且长度不小于8，同时第一位不能为数字".fontcolor("red");

	              return false;

	           }
	}

	           function checkForm(){

	               var userAccount = checkAccount();

	               var userPwd  = checkPwd();

	               if(userAccount&&userPwd){

	                   return true;

	               }else{

	                   return false;

	               }

	      

	    }
	</script>


</body>
</html>