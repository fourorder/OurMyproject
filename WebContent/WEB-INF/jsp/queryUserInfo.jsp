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



<title>用户信息</title>
	
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
				<div class="ydc-column ydc-column-8" style="margin:auto;">
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
											<label>${userInfo.userName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span class="pop in"> <a href="<%=path%>chat/gotochat.action?account=${userInfo.userAccount}" target="_blank" data-name="联系用户"><img
						src="<%=path%>demand/images/qq.png" />联系用户</a>
				</span></label>
										</div>
									</div>
									
									<div class="ydc-reg-form-group clearfix">
										<label>用户头像</label>
										<div class="ydc-reg-form-input">
											<label>
											<div class="ydc-reg-form-text ydc-reg-form-user-logo">
												<img src="<%=path%>picture/findPicture.action?url=${userInfo.userHead}" alt="">
											</div>
											</label>
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
										<label>用户信用分</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.userCredit}</label>
										</div>
									</div>
									
									
									<div class="ydc-reg-form-group clearfix">
										<label>注册时间</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.userRegisterTime}</label>
										</div>
									</div>
									
									
									
									
									
									
									
									
									
									
									<%-- <div class="ydc-reg-form-group clearfix" style="margin-top:40px;">
										<div class="ydc-reg-form-button" style="margin-left:255px;">
											<a class="btn fl" href="<%=path%>user/home.action">返回</a>
										</div>
									</div> --%>
									
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