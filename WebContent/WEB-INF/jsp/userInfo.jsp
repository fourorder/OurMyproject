<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<head>

	<title>个人中心</title>
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/core.css">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/icon.css">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/home.css">
	
</head>
<body>
<!-- head YDC begin -->
	<header class="ydc-header">
		<div class="ydc-entered">
			<div class="ydc-header-content ydc-flex">
				<div class="ydc-column">
					<a href="index.html" class="ydc-column-ydc-logo">
						<img src="admin/images/icon/ydc-logo.png" title="" about="" alt="">
					</a>
				</div>
				<div class="ydc-column">
					<div class="ydc-column-user">
						<div class="ydc-user-photo">
							<a href="javascript:;">
								<img src="admin/images/icon/photo.png" title="" about="" alt="">
							</a>
						</div>
						<div class="ydc-user-info">
							<div class="ydc-user-info-name">
								<a href="javascript:;">一点车</a>
							</div>
							<div class="ydc-user-info-func ydc-flex">
								<span class="ydc-tag">账号审核中</span>
								<span class="ydc-mal"><i class="ydc-icon ydc-icon-mail fl"></i><em>12</em></span>
								<a href="login.html">退出</a>
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
			<div class="ydc-flex">
				<!-- left begin -->
				<div class="ydc-column ydc-column-2">
					<div class="ydc-menu">
						<ul>
							<li class="ydc-menu-item">
								<a href="index.html" class="">
									<i class="ydc-icon ydc-icon-home fl"></i>
									首页
								</a>
							</li>
							<li class="ydc-menu-item">
								<a href="release.html" class="">
									<i class="ydc-icon ydc-icon-find fl"></i>
									发布
								</a>
							</li>
							<li class="ydc-menu-item">
                                    <span class="ydc-menu-sub-title">
                                        <i class="ydc-icon ydc-icon-file fl"></i>
                                        管理
                                    </span>
								<ul>
									<li>
										<a href="content.html">内容管理</a>
									</li>
									<li>
										<a href="related.html">内容同步</a>
									</li>
									<li>
										<a href="asset.html">素材中心</a>
									</li>
								</ul>
							</li>
							<li class="ydc-menu-item">
                                    <span class="ydc-menu-sub-title">
                                        <i class="ydc-icon ydc-icon-record fl"></i>
                                        数据

                                    </span>
								<ul>
									<li>
										<a href="subscribe.html">订阅数据</a>
									</li>
									<li>
										<a href="content-data.html">内容数据</a>
									</li>
									<li>
										<a href="index-starLevel.html">指数星级</a>
									</li>
								</ul>
							</li>
							<li class="ydc-menu-item">
                                    <span class="ydc-menu-sub-title">
                                        <i class="ydc-icon ydc-icon-set fl"></i>
                                        设置

                                    </span>
								<ul>
									<li>
										<a href="info.html" class="active">账号信息</a>
									</li>
									<li>
										<a href="account.html">账号状态</a>
									</li>
								</ul>
							</li>
							<li class="ydc-menu-item">
                                    <span class="ydc-menu-sub-title">
                                        <i class="ydc-icon ydc-icon-customer fl"></i>
                                        客服

                                    </span>
								<ul>
									<li>
										<a href="customer.html">在线咨询</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<!-- left end -->
				<!-- right begin -->
				<div class="ydc-column ydc-column-8">
					<div class="ydc-release-content">
						<div class="ydc-tabPanel ydc-tabPanel-release">
							<div class="ydc-release-tab-head">
								<ul>
									<li class="hit">帐号设置</li>
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
										<label>用户状态</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.stateBean.stateName}</label>
										</div>
									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>性别</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.userSex}</label>
										</div>
									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>用户地址</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.userAddress}</label>
										</div>
									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>身份证号</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.userIdentity}</label>
										</div>
									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>身份证照片</label>
										<div class="ydc-reg-form-input">
											<label>已提交</label>
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
										<label>信用分</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.userCredit}</label>
										</div>
									</div>
									<div class="ydc-reg-form-group clearfix">
										<label>账户余额</label>
										<div class="ydc-reg-form-input">
											<label>${userInfo.userMoney}</label>
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
											<a class="btn fl" href="<%=path%>user/UserInforEdit.action?userid=${userInfo.userId}">修改</a>
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

	<script type="text/javascript" src="admin/js/jquery.min.js"></script>
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

</body>
</html>