<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	<title>帐号状态 -- 一点车 -  让您多懂一点车</title>
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>admin/css/core.css">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>admin/css/icon.css">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>admin/css/home.css">

</head>
<body>

<div class="ydc-body-content">
	<div class="ydc-body-bj">
		<%-- <div class="ydc-body-logo" >
			 <a href="login.html">
				 <img src="<%=basePath%>images/logo1.png" alt="" width="800px" height="20px"> 
			</a> 
		</div> --%>
		<div class="ydc-body-login">
			<h2>登录</h2>
			<div class="ydc-body-login-content">
				<form action="<%=basePath%>user/login.action"name="myform" method="post">
					<div class="ydc-body-login-box">
						<div class="ydc-user-img">
							<div class="ydc-user-img-img"><img src="<%=basePath%>admin/images/icon/ph.png" alt=""></div>
						</div>
						<div class="ydc-user-border">
							<input type="email" name="userAccount" id="userAccount" data-type="email" placeholder="请输入邮箱账号">
						</div>
					</div>
					<div class="ydc-body-login-box">
						<div class="ydc-user-img">
							<div class="ydc-user-img-img"><img src="<%=basePath%>admin/images/icon/pad.png" alt=""></div>
						</div>
						<div class="ydc-user-border">
							<input type="password" name="userPwd" id="userPwd" data-type="password" placeholder="密码">
						</div>
					</div>
					<div class="ydc-bod-aq">
						<p>为了您的账号安全，请勿在公共电脑登录</p>
					</div>
					<div class="clearfix">
						<!-- <div class="fl">
							<input type="checkbox" checked="checked">
							<label>十天内免登录</label>
						</div> -->
						<div class="fr">
							<a href="<%=basePath%>user/forgetPwd.action">忘记密码</a>
						</div>
					</div>
				
					<div class="ydc-body-submit">
					
						<a href="javascript:document.myform.submit();">登录</a>
					</div>
					<div class="ydc-login-box">
						<a href="<%=basePath%>register/registerShow.action" target="_blank">立即注册</a>
						<!-- <span>|</span>
						<a href="customer.html" target="_blank">常见问题</a> -->

					</div>
				</form>

			</div>

		</div>
	</div>
	<div class="ydc-footer-news">
		<div class="ydc-footer">
			<div>
				<p>©2018 众包版权所有About 公司简介  联系方法  招聘信息  客户服务  隐私政策  广告服务  网站地图  意见反馈  不良信息举报</p>
			</div>
		</div>
	</div>
</div>

<!-- head YDC begin -->
<!-- head YDC end -->

<!-- content YDC begin -->
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
window.onload=function(){
	var message = "${requestScope.message}";
	if (message != "") {
		alert(message);
	}
}
	

</script>



</script>
</body>
</html>