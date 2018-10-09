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



<title>需求详情</title>
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link href="iTunesArtwork@2x.png" sizes="114x114"
	rel="apple-touch-icon-precomposed">
<link rel="stylesheet" href="<%=path%>css/oindex.css">
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

			<span class="fr" id="fr1"> <a href="<%=path%>user/home.action"
				title="众包首页"><i class="o-home"></i>众包首页</a> <a href="#" title="联系我们"><i
					class="o-contract"></i>联系我们</a>

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
						<c:forEach items="${menuList}" var="menuList">
							<li class="ydc-menu-item"><a
								href="<%=path %>${menuList.pathName}" class=""> <i
									class="${menuList.divClass}"></i> ${menuList.authorityName}
							</a></li>
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
								<li class="hit">需求详情</li>
							</ul>
						</div>
						<div class="ydc-panes">

							<div class="ydc-reg-form-class ydc-reg-form-reg"
								style="margin-top: 40px;">
								<div class="aui-card-form-item preview  aui-news"
									style="margin-top: 20px;">
									<label class="aui">封面:</label> <img
										src="<%=path%>picture/findPicture.action?url=${demandInfo.demandHead}"
										width='400px' height='400px'>


								</div>
								<div class="aui-card-form-item">
									<label class="aui">需求标题:${demandInfo.demandTitle}</label>
								</div>

								<div class="aui-card-form-item">
									<label class="aui">需求类型:${demandInfo.parameterBean.parameterName}</label>
								</div>

								<div class="aui-card-form-item">
									<label class="aui">需求状态:${demandInfo.stateParameterBean.parameterName}</label>
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
									<label class="aui">投标天数:${demandInfo.auctionTime}</label>
								</div>
								<div class="aui-card-form-item">
									<label class="aui">发布时间:${demandInfo.publishTime}</label>
								</div>
								<div class="aui-card-form-item">
									<label class="aui">项目工期:${demandInfo.completeTime}</label>
								</div>
								<div class="aui-card-form-item">
									<label class="aui">需求信息:${demandInfo.demandDetaIlinformation}</label>
								</div>

								<div class="aui-card-form-item">
									<label class="aui">雇主签署合同时间:${contract.fromTime}</label>
								</div>
								<div class="aui-card-form-item">
									<label class="aui">服务商签署合同时间:${contract.toTime}</label>
								</div>

								<div class="aui-card-form-item">
									<label class="aui">顾问评价:${demandDeal.consultanteValuation}</label>
								</div>

								<c:if
									test="${contract.parameterBean.parameterId==2042 || contract.parameterBean.parameterId==2085}">
									<div class="aui-card-form-item">
										<label class="aui"><a
											href="<%=path %>download.action?upUrl=${contract.contractPath}"
											class=" btn btn-warning illegalBtn rightSize" type="button"
											data-id=${list.productionId } id="illegal">下载合同</a></label>
									</div>
									<div class="aui-card-form-item">
										<label class="aui"><a
											href="<%=path %>user/print.action?url=${contract.contractPath}&page=redirect:/demand/queryDemandInfo.action?demandid=${demandInfo.demandId}"
											class=" btn btn-warning illegalBtn rightSize" type="button"
											data-id=${list.productionId } id="illegal">打印合同</a></label>
									</div>
								</c:if>


								<c:if test="${demandInfo.stateParameterBean.parameterId==1865}">
									<div class="aui-card-form-item">
										<label class="aui"><a
											href="<%=path %>download.action?upUrl=${demandInfo.filePath}"
											class=" btn btn-warning illegalBtn rightSize" type="button"
											data-id=${demandInfo.filePath } id="illegal">下载工程</a></label>
									</div>

								</c:if>

								<c:if
									test="${demandInfo.stateParameterBean.parameterId==1865&&demandDeal.auditState==2085}">
									<div class="aui-card-form-item">
										<a
											href="<%=path%>demand/complete.action?demandid=${demandInfo.demandId}&toUserId=${demandInfo.toUserBean.userId}&dealMoney=${demandInfo.dealMoney}&securityMoney=${demandInfo.securityMoney}"
											onclick="return complete()">
											<div class="ydc-btn" style="margin-top: 20px;">
												<button class="btn">完成交易</button>
											</div></a>
									</div>

								</c:if>

								<c:if
									test="${demandInfo.stateParameterBean.parameterId==1865&&demandDeal.auditState==2086}">
									<div class="aui-card-form-item">
										<label class="aui">交易完成</label>
									</div>

								</c:if>

							</div>
							<div class="ydc-btn" style="margin-top: 20px;">
								<input type="hidden" id="demandid" name="demandid"
									value="${demandInfo.demandId}">

								<button class="btn"
									onClick="location.href='<%=path%>demand/returnDemand.action'">返回</button>
							</div>







						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- right end --> </section>
	<!-- content YDC end -->

	<!-- content YDC end -->
	<script type="text/javascript" src="<%=path%>admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path%>admin/js/nicEdit.js"></script>
	<script type="text/javascript" src="<%=path%>admin/js/upImg.js"></script>
	<!-- 确认完成交易	 -->
	<script type="text/javascript">
		function complete() {
			var ss = confirm("是否完成本次交易？");
			if (ss == true) {
				return true;
			} else {
				return false;
			}
		}
	</script>



</body>
</html>