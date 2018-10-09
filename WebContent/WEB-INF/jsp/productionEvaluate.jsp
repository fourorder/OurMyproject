<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <link rel="stylesheet" href="<%=path%>css/oindex.css">


<title>修改资料</title>
<link href="iTunesArtwork@2x.png" sizes="114x114"
	rel="apple-touch-icon-precomposed">
<link type="text/css" rel="stylesheet"
	href="<%=path%>admin/css/core.css">
<link type="text/css" rel="stylesheet"
	href="<%=path%>admin/css/icon.css">
<link type="text/css" rel="stylesheet"
	href="<%=path%>admin/css/home.css">
<script type="text/javascript"
	src="<%=path%>admin/js/jquery-1.5.2.min.js"></script>
<script type="text/javascript">
	var currentShowCity = 0;
	$(document).ready(function() {
		$("#province").change(function() {
			$("#province option").each(function(i, o) {
				if ($(this).attr("selected")) {
					$(".city").hide();
					$(".city").eq(i).show();
					currentShowCity = i;
				}
			});
		});

		$("#province").change();
	});

	function getSelectValue() {
		alert("1级=" + $("#province").val());
		$(".city").each(function(i, o) {
			if (i == currentShowCity) {

				alert("2级=" + $(".city").eq(i).val());
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
<c:forEach items="${menuList}"  var="menuList" >	          
                               
                               <li class="ydc-menu-item">
                                    <a href="<%=path%>${menuList.pathName}" class="">
                                        <i class="${menuList.divClass }"></i>
                                        ${menuList.authorityName }
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
								<li class="hit">购买作品评价</li>
							</ul>
						</div>
						<div class="ydc-panes">
							<form method="post" action="<%=path%>production/submitProductionEvaluate.action?proAndUserId=${proAndUserList.proAndUserId}"
								enctype="multipart/form-data">
								<div class="ydc-reg-form-class ydc-reg-form-reg"
									style="margin-top: 40px;">
									<div class="aui-card-form-item preview  aui-news" style="margin-top:20px;">
                                                <label class="aui">作品封面:</label>
                                                
                                                    <img src="<%=path%>picture/findPicture.action?url=${productionBean.productionImage}">
                                               
                                               
                                     </div>
									<div class="aui-card-form-item">
										<label class="aui">作品名称:${productionBean.productionName}</label>
									</div>
									
									<div class="aui-card-form-item">
											<label class="aui">作品类型:${productionBean.className}</label>
									</div>
									<div class="aui-card-form-item">
											<label class="aui">服务商:${productionBean.userName}</label>
									</div>
									<div class="aui-card-form-item">
											<label class="aui">价格:${productionBean.productionMoney}</label>
									</div>
									 <div class="aui-card-form-item">
											<label class="aui">交易时间: ${proAndUserList.payTime}</label>
									</div>
									<div class="aui-card-form-item">
									<c:if test="${empty proAndUserList.productionEvaluate}">
<label class="aui">作品评分:<input  type="text"   name="point"   > </label>
</c:if>
<c:if test="${not empty proAndUserList.productionEvaluate}">
  <label class="aui">作品评分:<input type="text" readonly  name="point"  value="${proAndUserList.point}" > </label>
</c:if> 
											
									</div>
									 <div class="aui-card-form-item">
											<label class="aui">评价: </label>
									</div>
									  <div class="aui-card-form-item">
									  
									  
									  <c:if test="${empty proAndUserList.productionEvaluate}">
	<label class="aui"><textarea   style="resize:none" name="evaluate" id="evaluate" value="${proAndUserList.productionEvaluate}"  >${proAndUserList.productionEvaluate}</textarea></label>
</c:if>
<c:if test="${not empty proAndUserList.productionEvaluate}">
 	<label class="aui"><textarea  readonly  style="resize:none"  name="evaluate" id="evaluate" value="${proAndUserList.productionEvaluate}"  >${proAndUserList.productionEvaluate}</textarea></label>
</c:if> 
										
									</div>
								</div>							
								<div class="aui-card-form-item preview  aui-news" style="margin-top: 20px;">
 
								</div>
								
								<div class="ydc-btn" style="margin-top: 20px;">
								 
									
<c:if test="${empty proAndUserList.productionEvaluate}">
<button class="btn">提交</button>
	<button class="btn"  name="Submit"  onclick="javascript:history.go(-1)" >返回</button>
</c:if>

<c:if test="${not empty proAndUserList.productionEvaluate}">
   	<button class="btn"  name="Submit"  onclick="javascript:history.go(-1)" >返回</button>
</c:if> 
								</div>
							</form>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- right end -->
	

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
			if (slideIndex > slides.length) {
				slideIndex = 1
			}
			slides[slideIndex - 1].style.display = "block";
			setTimeout(showSlides, 3000); // 滚动时间
		}
	</script>

	<script type="text/javascript">
		$(function() {
			$('.ydc-tabPanel ul li').click(
					function() {
						$(this).addClass('hit').siblings().removeClass('hit');
						$('.ydc-panes>div:eq(' + $(this).index() + ')').show()
								.siblings().hide();
					})
		})
	</script>
	<script>
		jQuery(function() {
			upload_start();
		});
		//tab切换
		$(function() {
			$('.aui-ad-tab-title ul li').click(
					function() {
						$(this).addClass('aui-current').siblings().removeClass(
								'aui-current');
						$('.aui-ad-tab-body>div:eq(' + $(this).index() + ')')
								.show().siblings().hide();
					})
		});
	</script>



</body>
</html>