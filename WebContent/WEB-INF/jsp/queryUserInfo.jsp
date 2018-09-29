<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

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

<title>雇主信息</title>
	
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/core.css">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/icon.css">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/home.css">
	
</head>
<body>
<!-- content YDC begin -->
	<section>
		<div class="ydc-content-slide ydc-body">
			<div class="ydc-flex">
				<!-- left begin -->
				
				<!-- left end -->
				<!-- right begin -->
				<div class="ydc-column ydc-column-8">
					<div class="ydc-release-content">
						<div class="ydc-tabPanel ydc-tabPanel-release">
							<div class="ydc-release-tab-head">
								<ul>
									<li class="hit">用户信息</li>
								</ul>
							</div>
							<div class="ydc-panes">
								<div class="ydc-pane ydc-pane-clear" style="display:block;">
									<div class="ydc-reg-form-group clearfix">
										<label>用户名称</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.userName}</label>
										</div>
									</div>
									
									<div class="ydc-reg-form-group clearfix">
										<label>用户头像</label>
										<div class="ydc-reg-form-input">
											<label></label>
											<div class="ydc-reg-form-text ydc-reg-form-user-logo">
												<img src="<%=path%>picture/findPicture.action?url=${userInfo.userHead}" alt="">
											</div>
										</div>
									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>用户简介</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.userProfile}</label>
										</div>
									</div>
									
									<div class="ydc-reg-form-group clearfix">
										<label>地址</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.userAddress}</label>
										</div>
									</div>
									
									
									<div class="ydc-reg-form-group clearfix">
										<label>联系手机</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.userTel}</label>
										</div>
									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>邮箱</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.userMail}</label>
										</div>
									</div>
									
									
									<div class="ydc-reg-form-group clearfix">
										<label>用户角色</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.stateBean.stateName}</label>
										</div>
									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>用户状态</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.characterBean.characterName}</label>
										</div>
									</div>
									
									
									
									
									
									<div class="ydc-reg-form-group clearfix">
										<label>已有内容发布渠道</label>
										<div class="ydc-reg-form-input">
											<label>https://weibo.com/525135676</label>
										</div>
									</div>
									
									
									
									
									
									
									
									
									
									
									<div class="ydc-reg-form-group clearfix" style="margin-top:40px;">
										<div class="ydc-reg-form-button" style="margin-left:255px;">
											<a class="btn fl" href="<%=path%>user/returnHome.action">返回</a>
										</div>
									</div>
									<div class="ydc-reg-form-group clearfix" style="margin-top:40px;">
										<div class="ydc-reg-form-button" style="margin-left:255px;">
											
										</div>
									</div>
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
</body>
</html>