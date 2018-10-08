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



<title>提交合同</title>
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
	<header class="ydc-header">
	<div class="ydc-entered">
		<div class="ydc-header-content ydc-flex">
			<div class="ydc-column">
				<a href="index.html" class="ydc-column-ydc-logo"> <img
					src="admin/images/icon/ydc-logo.png" title="" about="" alt="">
				</a>
			</div>
			<div class="ydc-column">
				<div class="ydc-column-user">
					<div class="ydc-user-photo">
						<a href="javascript:;"> <img src="admin/images/icon/photo.png"
							title="" about="" alt="">
						</a>
					</div>
					<div class="ydc-user-info">
						<div class="ydc-user-info-name">
							<a href="javascript:;">一点车</a>
						</div>
						<div class="ydc-user-info-func ydc-flex">
							<span class="ydc-tag">账号审核中</span> <span class="ydc-mal"><i
								class="ydc-icon ydc-icon-mail fl"></i><em>12</em></span> <a
								href="javascript:;">退出</a>
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
								<li class="hit">提交合同</li>
							</ul>
						</div>
						<div class="ydc-panes">
							<form method="post" action="<%=path%>demand/updateContrac.action"
								enctype="multipart/form-data">
								<div class="ydc-reg-form-class ydc-reg-form-reg"
									style="margin-top: 40px;">
									<div class="aui-card-form-item preview  aui-news" style="margin-top:20px;">
                                                <label class="aui">封面:</label>
                                                
                                                    <img src="<%=path%>picture/findPicture.action?url=${demandInfo.demandHead}">
                                               
                                               
                                     </div>
									<div class="aui-card-form-item">
										<label class="aui">需求标题:${demandInfo.demandTitle}</label>
									</div>
									
									<div class="aui-card-form-item">
											<label class="aui">需求类型:${demandInfo.parameterBean.parameterName}</label>
									</div>
									<div class="aui-card-form-item">
											<label class="aui">雇主:${demandInfo.fromUserBean.userName}</label>
									</div>
									<div class="aui-card-form-item">
											<label class="aui">服务商:${demandInfo.toUserBean.userName}</label>
									</div>
									<div class="aui-card-form-item">
											<label class="aui">顾问:${demandInfo.adviserUserBean.userName}</label>
									</div>
									<div class="aui-card-form-item">
											<label class="aui">押金:${demandInfo.securityMoney}</label>
									</div>
									<div class="aui-card-form-item">
											<label class="aui">佣金:${demandInfo.dealMoney}</label>
									</div>
									<div class="aui-card-form-item">
											<label class="aui">项目工期:${demandInfo.completeTime}</label>
									</div>
									<div class="aui-card-form-item">
											<label class="aui">需求信息:${demandInfo.demandDetaIlinformation}</label>
									</div>
									<div class="aui-card-form-item">
											<label class="aui"><a href="<%=path %>download.action?upUrl=${contract.contractPath}"   class=" btn btn-warning illegalBtn rightSize"  type="button"  data-id=${list.productionId } id="illegal">下载合同</a></label>
									</div>
								</div>
								
								
								
															
								<div class="aui-card-form-item preview  aui-news" style="margin-top: 20px;">

									<div class="aui-card-form-item">
									
										<div class="aui-card-form-item">
										上传合同:<input type="file"   name="file" />
										</div>
										<div class="aui-remarks">
											<p>请下载合同，并在盖章后重新上传</p>
										</div>
									</div>
								</div>
								
								
								
								<div class="ydc-btn" style="margin-top: 20px;">
								<input type="hidden" id="demandid" name="demandid" value="${demandInfo.demandId}">
									<button class="btn">提交</button>
									<button class="btn" onClick="location.href='<%=path%>demand/returnContract.action'">返回</button>
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