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
<title>投标管理</title>
<style type="text/css">
.imghard{
    overflow: hidden;
    background-color: #eee;
    position: relative;
    float: left;
    height: 300px;
    width: 300px;
    margin: 20px;
}

</style>
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
	<link rel="stylesheet" href="<%=path%>css/oindex.css">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/core.css">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/icon.css">
	<link type="text/css" rel="stylesheet" href="<%=path%>admin/css/home.css">
        <script type="text/javascript" src="<%=path%>admin/js/jquery-1.5.2.min.js"></script>

		<link rel="stylesheet" type="text/css" href="css/normalize.css" />

		<script src="<%=path%>demand/js/common.js" type="text/javascript" charset="utf-8"></script>
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
<script type="text/javascript" src="<%=path%>admin/js/jquery.min.js"></script>

</head>
<body>
	<!-- head YDC begin -->
	<div class="o-top">
				<div class="width1180">
					<span class="fr">
						
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
			<!-- left end -->
			<div class="ydc-column ydc-column-8">
					<div class="ydc-release-content">
						<div class="ydc-tabPanel ydc-tabPanel-release">
							<div class="ydc-release-tab-head">
								<ul>
									<li class="hit">需求管理</li>
								</ul>
								
							</div>
							<div class="ydc-panes">
								<div class="ydc-pane" style="display:block;">
		<div class="clearfix">
									
									
									

		<div class="imghard">
		<img src="<%=path%>picture/findPicture.action?url=${demandInfo.demandHead}"
					width="300" height="300" /></div>
		<!--conet -->
		
			<div class="tr-nobdr">
				<h3>${demandInfo.demandTitle}</h3>
			</div>
			<div class="txt-h">
				<span class="nowprice">佣金￥<a href="">${demandInfo.dealMoney}</a></span>


			</div>
			<div class="txt-h">
				<span class="nowprice">押金￥<a href="">${demandInfo.securityMoney}</a></span>


			</div>
			<div class="txt-h">
				<h3>需求类型:${demandInfo.parameterBean.parameterName}</h3>
			</div>
			
			<div class="nobdr-btns">
				
				<button class="addcart yh"
					onClick="location.href='<%=path%>demand/goDemandControl.action'">返回</button>
			</div>
			
			</div>
			
			<div class="ydc-group-altogether">共<span> ${count}</span>人	投标</div>
			
		
									
									
									
									<div class="ydc-group-table">
									<!-- 这个是主标签 -->
									<c:forEach items="${bidList}" var="bidList">




										<!-- 审核中，查看详情，可编辑 -->

										<div class="ydc-group-table-item">
											<div class="ydc-group-table-item-img">
												<img
													src="<%=path%>picture/findPicture.action?url=${bidList.userBean.userHead}">
											</div>
											<div class="ydc-actions">
												<div>
													<a href="<%=path%>user/EmployerInformation.action?userid=${bidList.userBean.userId}" target="_blank" ><button class="ydc-actions-trigger">查看详情</button></a>
													<a href="<%=path%>demand/determineBid.action?userid=${bidList.userBean.userId} &demandid=${demandInfo.demandId}&securityMoney=${demandInfo.securityMoney}" onclick="return addBid()"><button class="ydc-actions-trigger" >确定招标</button></a>
												</div>
											</div>
											<div class="ydc-group-table-item-text">
												<span> <a href="#">供应商：${bidList.userBean.userName}</a>
												</span> <span class="ydc-group-table-item-tag">信用分：${bidList.userBean.userCredit}</span>
											</div>
											<div class="ydc-group-table-item-info">
												<span>注册时间：${bidList.userBean.userRegisterTime}</span> <span>|
													投标时间：${bidList.bidTime} | 手机：${bidList.userBean.userTel} </span>
													
											</div>
										</div>


									</c:forEach>

								
										
									</div>
								</div>
			


						</div>
					
				</div>
			</div>
			<!-- right end -->
		</div>
	</div>
	</div>
	</section>
	<!-- content YDC end -->

	<script type="text/javascript" src="<%=path%>admin/js/nicEdit.js"></script>
	<script type="text/javascript" src="<%=path%>admin/js/upImg.js"></script>
	<!-- 确认雇主ajax	 -->
 	<script type="text/javascript">
 	function addBid(){
 		var ss = confirm("是否选择该用户未招标对象？");
 		if (ss == true){
 			return true;
 		}else{
 			return false;
 		}
 	}
 	</script>

	
</body>
</html>