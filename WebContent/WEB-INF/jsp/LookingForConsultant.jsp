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
<link href="iTunesArtwork@2x.png" sizes="114x114"
	rel="apple-touch-icon-precomposed">
<link type="text/css" rel="stylesheet"
	href="<%=path%>admin/css/core.css">
<link type="text/css" rel="stylesheet"
	href="<%=path%>admin/css/icon.css">
<link type="text/css" rel="stylesheet"
	href="<%=path%>admin/css/home.css">
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<script type="text/javascript"
	src="<%=path%>admin/js/jquery-1.5.2.min.js"></script>
	<script src="<%=path%>demand/js/common.js" type="text/javascript"
	charset="utf-8"></script>
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
<%-- <script type="text/javascript">
      
      
        var page = ${requestScope.page}
        function selectDemand(state){
        	
        	$("#demandDateList").empty();
        	var num=$("#btnjump").val();
        	if(num!=""){
        		page=num;		
        	}
        	$.ajax({
        	 url:"<%=path%>demand/selectDemand.action",
       		 data:"state="+state+"&page="+page+"&searchName="+$('#searchName').val(),
       		 dataType:"json",
       		 type:"post",
       		 success:function(redata){
       			page=redata[0];
       			var countpage = redata[1];
			   	var list=redata[2];
		        var len = list.length;
		        
       			
		
		       
		    
		        for(var i=0;i<len;i++){    
		        	
		            var e = list[i];
		            
		            $("#demandDateList").append(
		            		
		            " <div class='ydc-asset-img-list'>"
		          	+"<a href='<%=path%>demand/queryDemand.action?demandid="+e.demandId+"'>"
		            +"<img src='<%=path%>
	picture/findPicture.action?url="
													+ e.demandHead
													+ "' width='217' height='217'>"

													+ "<div class='ydc-asset-img-list-til'>"
													+ e.demandTitle + "</div>"

													+ "</a></div>");
						}
						/* $("#pages").html(page + "/" + countpage); */
					}
				})

	}
</script> --%>
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
							<span class="ydc-tag">新手期</span> <span class="ydc-mal"><i
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
						<li class="ydc-menu-item"><a href="index.html" class="">
								<i class="ydc-icon ydc-icon-home fl"></i> 首页
						</a></li>
						<li class="ydc-menu-item"><a href="release.html" class="">
								<i class="ydc-icon ydc-icon-find fl"></i> 发布
						</a></li>
						<li class="ydc-menu-item"><span class="ydc-menu-sub-title">
								<i class="ydc-icon ydc-icon-file fl"></i> 管理
						</span>
							<ul>
								<li><a href="content.html" class="active">内容管理</a></li>
								<li><a href="related.html">内容同步</a></li>
								<li><a href="asset.html">素材中心</a></li>
							</ul></li>
						<li class="ydc-menu-item"><span class="ydc-menu-sub-title">
								<i class="ydc-icon ydc-icon-record fl"></i> 数据

						</span>
							<ul>
								<li><a href="subscribe.html">订阅数据</a></li>
								<li><a href="content-data.html">内容数据</a></li>
								<li><a href="index-starLevel.html">指数星级</a></li>
							</ul></li>
						<li class="ydc-menu-item"><span class="ydc-menu-sub-title">
								<i class="ydc-icon ydc-icon-set fl"></i> 设置

						</span>
							<ul>
								<li><a href="info.html">账号信息</a></li>
								<li><a href="account.html">账号状态</a></li>
							</ul></li>
						<li class="ydc-menu-item"><span class="ydc-menu-sub-title">
								<i class="ydc-icon ydc-icon-customer fl"></i> 客服

						</span>
							<ul>
								<li><a href="#">在线咨询</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<!-- left end -->
			<div class="ydc-column ydc-column-8">
					<div class="ydc-release-content">
						<div class="ydc-tabPanel ydc-tabPanel-release">
							<div class="ydc-release-tab-head">
								<ul>
									<li class="hit">内容管理</li>
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
									<c:forEach items="${consList}" var="consList">


										<div class="ydc-group-table-item">
											<div class="ydc-group-table-item-img">
												<img
													src="<%=path%>picture/findPicture.action?url=${consList.userBean.userHead}">
											</div>
											<div class="ydc-actions">
												<div>
													<button class="ydc-actions-trigger">查看详情</button>
													<button class="ydc-actions-trigger" onClick="location.href='<%=path%>demand/applicationConsultant.action?userid=${consList.userBean.userId} &demandid=${demandInfo.demandId}'">申请</button>
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
								<%-- <ol>
									<li class="ydc-previous-item">
										<button class="ydc-previous-item-btn-medium"
											onclick="selectDemand('last')" id="last">
											<span>上一页</span>
										</button>
									</li>
									<li id="pages">${requestScope.page}/${requestScope.countpage}</li>
									<li class="ydc-previous-item">
										<button class="ydc-previous-item-btn-medium"
											onclick="selectDemand('next')" id="next">
											<span>下一页</span>
										</button>

									</li>
									<li class="ydc-item-quick">第
										<div class="ydc-item-quick-kun">
											<input type="number" aria-invalid="false" class=""
												id="btnjump">
										</div>页
										<button style="margin-left: 5px;"
											class="ydc-previous-item-btn-medium"
											onclick="selectDemand('jump')">
											<span>跳转</span>
										</button>
									</li>
								</ol> --%>

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
	<script type="text/javascript">
		bkLib.onDomLoaded(function() {
			nicEditors.allTextAreas()
		});//编辑器
	</script>
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
			setTimeout(showSlides, 3000); // AD滚动时间
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
		})//tab
	</script>
	<script type="text/javascript">
		function textLimitCheck(thisArea, maxLength) {
			if (thisArea.value.length > maxLength) {
				alert(maxLength + ' 个字限制. \r超出的将自动清除.');
				thisArea.value = thisArea.value.substring(0, 30);
				thisArea.focus();
			}
			messageCount.innerText = thisArea.value.length;
			messageCount1.innerText = thisArea.value.length;
			messageCount2.innerText = thisArea.value.length;
		}//标题输入框字数限制
	</script>

</body>
</html>