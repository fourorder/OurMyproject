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
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<script type="text/javascript"
	src="<%=path%>demand/js/jquery-1.9.1.min.js"></script>
<script src="<%=path%>demand/js/common.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript">
	function mybid() {
		var r = confirm("是否参加该需求的投标");
		if (r == true) {
			$("#bidlist").empty();
			$.ajax({
	        	 url:"<%=path%>demand/addBid.action",
	       		 data:"demandid=${demandInfo.demandId}",
	       		 dataType:"json",
	       		 type:"post",
	       		 success:function(redata){
	       			
				   	var list=redata;
			        var len = list.length;    
			        for(var i=0;i<len;i++){    
			        	
			            var e = list[i];
			            
			            $("#bidlist").append(
			            "<li>投标人:"+e.userBean.userName+"&nbsp;&nbsp;投标时间:"+e.bidTime+"</li>"	
			            
			            );
			         } 	
	       			 alert("申请成功");
	       		 }

			});
		}
	}
</script>
</head>
<body>
	<div class="showall">
		<!--left -->
		<div class="showbot">
			<div id="showbox">
				<img
					src="<%=path%>picture/findPicture.action?url=${demandInfo.demandHead}"
					width="400" height="400" />

			</div>
			<!--展示图片盒子-->


		</div>
		<!--conet -->
		<div class="tb-property">
			<div class="tr-nobdr">
				<h3>${demandInfo.demandTitle}</h3>
			</div>
			<div class="txt">
				<span class="nowprice">佣金￥<a href="">${demandInfo.dealMoney}</a></span>


			</div>
			<div class="txt">
				<span class="nowprice">押金￥<a href="">${demandInfo.securityMoney}</a></span>


			</div>
			<div class="txt-h">
				<span class="tex-o">需求类型:</span>
				<ul class="glist" id="glist"
					data-monitor="goodsdetails_fenlei_click">
					<li><a title="红色36g" href="">${demandInfo.parameterBean.parameterName}</a></li>

				</ul>
			</div>


			<div class="nobdr-btns">
				<button class="addcart yh" onclick="mybid()">
					<img src="<%=path%>demand/images/ht.png" width="25" height="25" />我要投标
				</button>
				<button class="addcart yh"
					onClick="location.href='<%=path%>demand/toDemand.action'">返回</button>
			</div>

		</div>
		<!--right -->
		<div class="extInfo">
			<div class="brand-logo">
				<a href="" title="商家头像"> <img
					src="<%=path%>picture/findPicture.action?url=${demandInfo.fromUserBean.userHead}" width="150px" height="150px" />
				</a>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			
			<div class="seller-pop-box">
				<span class="tr">雇主名称：${demandInfo.fromUserBean.userName}</span> <span
					class="tr">雇主信用分：${demandInfo.fromUserBean.userCredit}</span> <span
					class="tr">雇主电话：${demandInfo.fromUserBean.userTel}</span> <span
					class="tr hoh"> <a title="雇主地址" href="">雇主地址：${demandInfo.fromUserBean.userAddress}</a>
				</span>
			</div>
			<div class="seller-phone">
				<span class="pop im"> <a href="" data-name="联系卖家"><img
						src="<%=path%>demand/images/phon.png" />联系卖家</a>
				</span> <span class="pop in"> <a href="<%=path%>chat/gotochat.action?account=${demandInfo.fromUserBean.userAccount}&msg=" target="_blank" data-name="咨询卖家"><img
						src="<%=path%>demand/images/qq.png" />咨询卖家</a>
				</span>

			</div>

		</div>
	</div>
	<!-- 推荐搭配 -->


	<!-- 商品介紹 -->
	<div class="gdetail">
		<!-- left -->
		<div class="aside">
			<h3>看了还看</h3>
			<dl class="ac-mod-list">
				<dt>
					<a href=""><img src="images/hdy_09.png" /></a>
				</dt>
				<dd>
					需求2 <span>￥99</span>
				</dd>
			</dl>
			<dl class="ac-mod-list">
				<dt>
					<a href=""><img src="images/hdy_07.png" /></a>
				</dt>
				<dd>
					需求3 <span>￥99</span>
				</dd>
			</dl>
			<dl class="ac-mod-list">
				<dt>
					<a href=""><img src="images/hdy_11.jpg" /></a>
				</dt>
				<dd>
					需求1 <span>￥99</span>
				</dd>
			</dl>
		</div>
		<!-- right -->
		<script>
			var detail = document.querySelector('.detail');
			var origOffsetY = detail.offsetTop;
			function onScroll(e) {
				window.scrollY >= origOffsetY ? detail.classList.add('sticky')
						: detail.classList.remove('sticky');
			}
			document.addEventListener('scroll', onScroll);
		</script>
		<div class="detail">
			<div class="active_tab" id="outer">
				<ul class="act_title_left" id="tab">
					<li class="act_active"><a href="#">投标列表</a></li>
					<li><a href="#">需求详情</a></li>

				</ul>

				<div class="clear"></div>
			</div>
			<div id="content" class="active_list">
				<!--需求信息-->
				<div id="ui-a" class="ui-a">
					<ul id="bidlist" style="display: block;">
					<c:forEach items="${bidList}"  var="bidList" >
						<li>投标人:${bidList.userBean.userName}&nbsp;&nbsp;投标时间:${bidList.bidTime}</li>
					</c:forEach>	
					</ul>
				</div>
				<!--一投标商家-->
				<div id="bit" class="bit">
					<ul style="display: none;">

						<li>需求名称：${demandInfo.demandTitle}</li>
						<li>商品编号：${demandInfo.demandId}</li>
						<li>商品状态：${demandInfo.stateParameterBean.parameterName}</li>	
						<li>发布时间：${demandInfo.publishTime}</li>
						<li>需求详情：${demandInfo.demandDetaIlinformation}</li>
					</ul>
				</div>


			</div>
			<script>
				$(function() {
					window.onload = function() {
						var $li = $('#tab li');
						var $ul = $('#content ul');

						$li.mouseover(function() {
							var $this = $(this);
							var $t = $this.index();
							$li.removeClass();
							$this.addClass('act_active');
							$ul.css('display', 'none');
							$ul.eq($t).css('display', 'block');
						})
					}
				});
			</script>
		</div>
	</div>
</body>
</html>