<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<script type="text/javascript" src="<%=path%>admin/js/jquery-1.5.2.min.js"></script>
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
					
					<span class="fr" id="fr1">
						
						<a href="<%=path %>user/home.action" title="众包首页"><i class="o-home"></i>众包首页</a>
						
						
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
									<c:forEach items="${consList}" var="consList">


										<div class="ydc-group-table-item">
											<div class="ydc-group-table-item-img">
												<img
													src="<%=path%>picture/findPicture.action?url=${consList.userBean.userHead}">
											</div>
											<div class="ydc-actions">
												<div>
													<a href="<%=path%>user/EmployerInformation.action?userid=${consList.userBean.userId}" target="_blank" ><button class="ydc-actions-trigger">查看详情</button></a>
													<%-- <button class="ydc-actions-trigger" onClick="location.href='<%=path%>demand/applicationConsultant.action?userid=${consList.userBean.userId} &demandid=${demandInfo.demandId}'">申请</button> --%>
												<button class="ydc-actions-trigger" onclick="addAdviser(${consList.userBean.userId},${consList.counselorMoney})">申请</button>
												</div>
											</div>
											<div class="ydc-group-table-item-text">
												<span> <a href="#">顾问：${consList.userBean.userName}</a>
												</span> <span class="ydc-group-table-item-tag">价格：￥   ${consList.counselorMoney}</span>
											</div>
											<div class="ydc-group-table-item-info">
												<span>注册时间：${consList.userBean.userRegisterTime}</span> <span>| 手机：${consList.userBean.userTel} </span>
													
											</div>
										</div>


									</c:forEach>

										
									</div>
								</div>
			
			



							<div class="ydc-pagination">
								

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
	<script type="text/javascript">
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
<!-- 投标ajax	 -->
 <script type="text/javascript" src="<%=path%>admin/js/jquery.min.js"></script>
	<script type="text/javascript">
	var employerId = ${demandInfo.fromUserBean.userId};
	function addAdviser(consultantId,counselorMoney) {
		var ss = confirm("是否选择该用户成为顾问？");
		if (ss == true){
			 $.ajax({
	        	 url:"<%=path%>demand/applicationConsultantajax.action",
	       		 data:"employerId="+employerId+"&consultantId="+consultantId+"&demandId=${demandInfo.demandId}"+"&counselorMoney="+counselorMoney,
	       		 dataType:"json",
	       		 type:"post",
	       		 success:function(redata){
	       			 
	       			if(redata==1){
	       				alert("申请成功，请耐心等待结果");
	       				
	       				window.location.href="<%=path%>demand/goDemandControl.action";

	       			}else if(redata==3){
	       				var r = confirm("用户余额不足，是否进入充值页面");
	       				if (r == true){
	       					window.location.href="<%=path%>user/accountManage.action?page=1";
	       				}
	       			}
				   
	       			
	       		 }

			});
		}
	}
</script>
	
	

</body>
</html>