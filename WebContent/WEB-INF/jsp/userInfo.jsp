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
	<link rel="stylesheet" href="<%=path%>css/oindex.css">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/core.css">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/icon.css">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/home.css">
	
</head>
<body>
<!-- head YDC begin -->
	<div class="o-top">
				<div class="width1180">
					
					<span class="fr" id="fr1">
						
						<a href="<%=path %>user/home.action" title="众包首页"><i class="o-home"></i>众包首页</a>
						<a href="#" title="联系我们" ><i class="o-contract"></i>联系我们</a>
						
					</span>
				</div>
</div>
<!-- head YDC end -->

<!-- content YDC begin -->
	<section>
		<div class="ydc-content-slide ydc-body">
			<div class="ydc-flex">
				<!-- left begin -->
				<div class="ydc-column ydc-column-2">
					<div class="ydc-menu">
						<ul>
						<c:forEach items="${menuList}"  var="menuList">
							<li class="ydc-menu-item">
								<a href="<%=path %>${menuList.pathName}" class="">
									<i class="${menuList.divClass}"></i>
									${menuList.authorityName}
								</a>
							</li>
						</c:forEach>
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
									
									<!-- <div class="ydc-reg-form-group clearfix">
										<label>已有内容发布渠道</label>
										<div class="ydc-reg-form-input">
											<label>https://weibo.com/525135676</label>
										</div>
									</div> -->
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
	<!-- <script type="text/javascript">
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
	</script> -->

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