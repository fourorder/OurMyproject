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
<title>个人信息修改</title>
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
	
	<title>修改资料</title>
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/core.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/icon.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/home.css">
        <script type="text/javascript" src="<%=path%>admin/js/jquery-1.5.2.min.js"></script>
        <script type="text/javascript">
        var currentShowCity=0;
        $(document).ready(function(){
            $("#province").change(function(){
                $("#province option").each(function(i,o){
                    if($(this).attr("selected"))
                    {
                        $(".city").hide();
                        $(".city").eq(i).show();
                        currentShowCity=i;
                    }
                });
            });

            $("#province").change();
        });

        function getSelectValue(){
            alert("1级="+$("#province").val());
            $(".city").each(function(i,o){
                if(i == currentShowCity){

                    alert("2级="+$(".city").eq(i).val());
                }
            });
        }
	
        </script>
	
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
								<a href="javascript:;">退出</a>
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
										<a href="#">在线咨询</a>
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
								<form  method="post" action="<%=path%>user/ToUserInforEdit.action" enctype="multipart/form-data">
									<div class="ydc-reg-form-class ydc-reg-form-reg" style="margin-top:40px;">
										<div class="ydc-reg-form-group clearfix">
											<label>帐号名称:${userInfo.userAccount}</label>
											
											<input type="hidden" name="userId" value="${userInfo.userId}">
										</div>
									<div class="ydc-reg-form-class ydc-reg-form-reg"
										style="margin-top: 40px;">
										<div class="ydc-reg-form-group clearfix">
<<<<<<< HEAD
											<label>帐号类型:${userInfo.characteBean.characterName}</label>

=======
											<label>帐号类型:${userInfo.characterBean.characterName}</label>
											
									</div>
					
>>>>>>> branch 'master' of https://github.com/fourorder/OurMyproject.git
										</div>

									</div>
									<div class="aui-card-form-item preview  aui-news" style="margin-top:20px;">
                                                <label class="aui-card-form-label">封面:</label>
                                                <div class="aui-file-up-img" id="preview_0">
                                                    <img class="" id="imghead_0" border="0" src="<%=path%>picture/findPicture.action?url=${userInfo.userHead}">
                                                </div>
                                                <div class="aui-file-up-btn clearfix ">
                                                    <div class="idPicFile aui-btn aui-file-new">
                                                        <input type="file" name="file" id="1" class="file_photo aui-file-new-up" style="margin:0;">
                                                        <a>上传图片</a>
                                                    </div>
                                                    <div class="aui-remarks">
                                                        <p>图片尺寸建议：800*400 图片大小不超过1MB</p>
                                                    </div>
                                                </div>
                                            </div>
									<!-- <div class="ydc-reg-form-group clearfix">
											<label>帐号头像:</label>
											<div class="ydc-reg-form-input">
												<input type="file" id="" name="userHeadfile" class="" autocomplete="off" placeholder="">
												<div class="ydc-reg-form-text">
													<p>选取至少160*160尺寸的图片。请勿上传二维码或其他推广性质图片作为图标。</p>
												</div>
											</div>
									</div> -->
									<div class="ydc-reg-form-group clearfix">
											<label>用户概述:</label>
											<div class="ydc-reg-form-input ydc-reg-form-input-width">
												<textarea id="userProfile" name="userProfile">${userInfo.userProfile}</textarea>
												<div class="ydc-reg-form-text">
													<p>请输入账户简述</p>
												</div>
											</div>
									</div>
                                          
										<%-- <div class="ydc-reg-form-group clearfix">
											<label>用户概述:</label>
											<div class="ydc-reg-form-input ydc-reg-form-input-width">
												<textarea id="userProfile" name="userProfile" style="width: 100%,height="30px";">${userInfo.userProfile}</textarea>
												<div class="ydc-reg-form-text">
													<p>请输入账户简述</p>
												</div>
											</div>
										</div> --%>
										
										
										<div class="ydc-reg-form-group clearfix">
											<label>姓名:</label>
											<div class="ydc-reg-form-input">
												<input type="text" id="userName" name="userName" class="ydc-form-control" autocomplete="off" value="${userInfo.userName}">
											</div>
										</div>
										<div class="ydc-reg-form-group clearfix">
											<label>身份证号:</label>
											<div class="ydc-reg-form-input clearfix">
												<input type="text" id="userIdentity" name="userIdentity" class="ydc-form-control" readonly="true" autocomplete="off" value="${userInfo.userIdentity}">
												<div class="ydc-reg-form-text">
													<p>帐号信息填写需真实有效，如发现虚假以及非个人真实信息导致帐号收益无法提取，责任由帐号个人承担</p>
												</div>
												
											</div>

										</div>
										
									
										<div class="ydc-reg-form-group clearfix">
											<label>联系手机:</label>
											<div class="ydc-reg-form-input">
												<input type="text" id="userTel" name="userTel" class="ydc-form-control" autocomplete="off" value="${userInfo.userTel}">
												
											</div>
											

										</div>
										<div class="ydc-reg-form-group clearfix">
											<label>邮箱:</label>
											<div class="ydc-reg-form-input">
												<input type="text" id="userMail" name="userMail" class="ydc-form-control" autocomplete="off" value="${userInfo.userMail}">
											</div>
											<div class="ydc-reg-form-text">
												<p>请使用自己日常使用邮箱便于接受相关信息</p>
											</div>
										</div>
										
										
									</div>
									  <div class="ydc-btn" style="margin-top:20px;">
                                                <button class="btn">修改</button>
                                            
                                       </div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- right end -->
			</div>
		</div>

	</section>
<!-- content YDC end -->

	 <!-- content YDC end -->
       <script type="text/javascript" src="<%=path%>admin/js/jquery.min.js"></script>
       <script type="text/javascript" src="<%=path%>admin/js/nicEdit.js"></script>
        <script type="text/javascript" src="<%=path%>admin/js/upImg.js"></script>
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
	<script>
    jQuery(function(){
	        upload_start();
	    });
	    //tab切换
	    $(function(){
	        $('.aui-ad-tab-title ul li').click(function(){
	            $(this).addClass('aui-current').siblings().removeClass('aui-current');
	            $('.aui-ad-tab-body>div:eq('+$(this).index()+')').show().siblings().hide();
	        })
	    });
	
        </script>
     
    

</body>
</html>