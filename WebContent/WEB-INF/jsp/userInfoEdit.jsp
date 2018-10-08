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

	
	<title>修改资料</title>
	<link rel="icon" type="image/x-icon" href="favicon.ico">
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
<style type="text/css">
.aui {
    float: left;
    display: block;
    padding: 9px 10px;
    width: 800px;
    font-weight: 400;
    line-height: 20px;
    text-align: left;
    color: #464545;
}
</style>	

</head>
<body>
<!-- head YDC begin -->
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
	
									
			
						<form  method="post" action="<%=path%>user/ToUserInforEdit.action" enctype="multipart/form-data">
								 <div class="aui-card-form-item preview  aui-news" style="margin-top:20px;">
                                                <label class="aui-card-form-label">头像:</label>
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
										
										
										<div class="aui-card-form-item">
											<label class="aui">帐号名称:&emsp;&emsp;&emsp;${userInfo.userAccount}</label>
											<input type="hidden" name="userId" value="${userInfo.userId}">
										</div>
										<div class="aui-card-form-item">
											<label class="aui">帐号类型:&emsp;&emsp;&emsp;${userInfo.characterBean.characterName}</label>
										</div>
									
								<div class="aui-card-form-item">
									<label class="aui-card-form-label">用户概述:</label>
										<div class="ydc-reg-form-input ydc-reg-form-input-width">
												<textarea id="userProfile" name="userProfile">${userInfo.userProfile}</textarea>
												
										</div>	
								</div>
								<div class="aui-card-form-item">
								
								</div>
                                 <div class="aui-card-form-item">
											<label class="aui-card-form-label">姓名:</label>
											<div class="ydc-reg-form-input">
												<input type="text" id="userName" name="userName" class="ydc-form-control" autocomplete="off" value="${userInfo.userName}">
											</div>
								</div>         
								<div class="aui-card-form-item">
								
								</div>		
										
										
										
										 <div class="aui-card-form-item">
											<label class="aui-card-form-label">身份证号:</label>
											<div class="ydc-reg-form-input clearfix">
												<input type="text" id="userIdentity" name="userIdentity" class="ydc-form-control" readonly="true" autocomplete="off" value="${userInfo.userIdentity}">
												<div class="ydc-reg-form-text">
													<p>帐号信息填写需真实有效，如发现虚假以及非个人真实信息导致帐号收益无法提取，责任由帐号个人承担</p>
												</div>
												
											</div>

										</div>
										<div class="aui-card-form-item">
								
								</div>
									
										<div class="aui-card-form-item">
											<label class="aui-card-form-label">联系手机:</label>
											<div class="ydc-reg-form-input">
												<input type="text" id="userTel" name="userTel" class="ydc-form-control" autocomplete="off" value="${userInfo.userTel}">
												
											</div>
											

										</div>
										<div class="aui-card-form-item">
								
								</div>
										<div class="aui-card-form-item">
											<label class="aui-card-form-label">邮箱:</label>
											<div class="ydc-reg-form-input">
												<input type="text" id="userMail" name="userMail" class="ydc-form-control" autocomplete="off" value="${userInfo.userMail}">
											</div>
											<div class="ydc-reg-form-text">
												<p>请使用自己日常使用邮箱便于接受相关信息</p>
											</div>
										</div>
										
										<div class="aui-card-form-item">
								
								</div>
									
									  <div class="ydc-btn" style="margin-top:20px;">
                                                <button class="btn">修改</button>
                                            
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