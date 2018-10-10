<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=path%>css/oindex.css">
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
<%--  <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/core.css">
<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/icon.css"> --%>
<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/home.css"> 
<script type="text/javascript" src="<%=path%>js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>js/jquery.superslide.2.1.1.js"></script>
<script src="<%=path%>js/jquery-1.4.2.min.js" type="text/javascript"></script>
<title>搜索信誉</title>
</head>
<body>
<div class="o-top">
				<div class="width1180">
					
					<span class="fr">
						<!-- <a href="#" title="登录">登录</a>
						<a href="#" title="注册">注册</a> -->
						<a href="<%=path %>user/home.action" title="众包首页"><i class="o-home"></i>众包首页</a>
						
						<!--登录后
						<a title="管理员" href="http://www.yizhihou.com/member/" target="_blank" rel="nofollow">嘉客</a>
						<a href="http://www.yizhihou.com/member/logout.php" rel="nofollow">退出</a>
						-->
					</span>
				</div>
</div>
<div class="o-search" style="position:absolute;left:500px;top:80px;">
<form action="<%=path%>user/searchcredit.action" method="post" >
<input type="text" class="search-text"  placeholder="请输入您要搜索的用户" name="username" id="name"><button class="search-bnt" type="submit"><img src="<%=path%>images/search-i.png">  搜索</button>
</form>
</div>
<div class="ydc-column ydc-column-8" style="position:absolute;top:200px;left:400px;">
					<div class="ydc-release-content">
						<div class="ydc-tabPanel ydc-tabPanel-release">
							<div class="ydc-release-tab-head">
								<ul>
									<li class="hit1" >账户信息</li>
								</ul>
							</div>
							<div class="ydc-panes">
								<div class="ydc-pane ydc-pane-clear" style="display:block;">
									<div class="ydc-reg-form-group clearfix">
										<label>帐号名称</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.userAccount}</label>
										</div>
									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>帐号类别</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.characterBean.characterName}</label>
										</div>
									</div>
									
									<div class="ydc-reg-form-group clearfix">
										<label>帐号图标</label>
										<div class="ydc-reg-form-input">
											<label></label>
											<div class="ydc-reg-form-text ydc-reg-form-user-logo">
												<img src="<%=path%>picture/findPicture.action?url=${userInfo.userHead}" alt="">
											</div>
										</div>
									</div>
									
									<div class="ydc-reg-form-group clearfix">
										<label>用户概述</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.userProfile}</label>
										</div>
									</div>
									
									<div class="ydc-reg-form-group clearfix">
										<label>姓名</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.userName}</label>
										</div>
									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>信誉</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.userCredit}</label>
										</div>
									</div>																		
									<!-- <div class="ydc-reg-form-group clearfix" style="margin-top:40px;">
										<div class="ydc-reg-form-button" style="margin-left:255px;">
											<a class="btn fl" href="info-edit.html">修改</a>
										</div>
									</div> -->
								</div>
							</div>
						</div>
					</div>
				</div>
</body>
</html>