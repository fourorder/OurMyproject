<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>搜索结果</title>
<link rel="stylesheet" href="<%=path%>css/oindex.css">

<script type="text/javascript" src="<%=path%>js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>js/jquery.superslide.2.1.1.js"></script>
<script src="<%=path%>js/jquery-1.4.2.min.js" type="text/javascript"></script>
<style>
*{ margin:0; padding:0;}
body{ font-family:'微软雅黑';height:800px;}
ul,ul li{ list-style:none;}
/* topmenu */
#topmenu{width:450px;margin:30px auto 0 auto;height:80px;position:relative;}
#topmenu ul{margin:0;padding:0;}
#topmenu ul li{float:left;font-size:12px;background:#222;position:relative;text-align:center;width:70px;margin:0 10px;display:inline;line-height:30px;}
#topmenu ul li a{color:#aaa;text-decoration:none;}
#topmenu ul li a:hover{color:#fff;}
#topmenu ul li.active a{color:#fff;font-weight:800;}
/* tab */
.tab{width:430px;margin:200px auto;border:1px solid #ccc;}
.tab ul.menu{height:34px;background:#04B6E9;}
.tab ul.menu li{float:left;text-align:center;width:120px;height:32px;background:#f6f6f6;line-height:32px;list-style:none;font-size:12px;cursor:pointer;}
.tab ul.menu li.active{background:#04B6E9;color:#fff;}
.con1,.con2,.con3,.con4{height:190px;border-top:2px solid #04B6E9;margin-top:-2px;}
.con2,.con3,.con4{display:none;}
.con1 ul,.con2 ul,.con3 ul,.con4 ul{padding:5px;}
.con1 ul li,.con2 ul li,.con3 ul li,.con4 ul li{background:url(images/point.png) no-repeat left center;padding:0 0 0 10px;font-size:14px;line-height:180%;color:#252525;}
.con1 ul li:hover,.con2 ul li:hover,.con3 ul li,.con4 ul li:hover{color:#04B6E9;cursor:pointer;text-decoration:underline;}
/*图片框样式-------------------------------*/

*{margin:0;padding:0;list-style-type:none;}
body{font:12px/180% "宋体",Arial, Helvetica, sans-serif;}
.clear{clear:both;}
.demopage{width:600px;margin:0 auto;}
/* item */
.item{width:150px;height:220px;border:2px solid #00BFFF;margin:5px 5px 5px 0;overflow:hidden;position:relative;float:left;}
.item .caption{width:150px;height:150px;background:url(images/dianbg.png);_background:#000000;color:#8A2BE2;font-weight:bold;position:absolute;left:0;display:none;/*background:#000000;filter:alpha(opacity=70);-moz-opacity:0.7;-khtml-opacity:0.7;opacity:0.7;*/}
.item .caption a{text-decoration:none;color:#0cc7dd;font-size:14px;padding:5px;display:block;}
.item .caption p a{padding:5px;margin:0;font-size:12px;color:#fff;font-weight:normal;}
.item img{border:0;position:absolute;}

/*六个图片框的位置*/
#img1{position:absolute;
top:40px;
left:170px;
}
#img2{position:absolute;
top:40px;
left:420px;
}
#img3{position:absolute;
top:40px;
left:670px;
}
#img4{position:absolute;
top:270px;
left:170px;
}
#img5{position:absolute;
top:270px;
left:420px;
}
#img6{position:absolute;
top:270px;
left:670px;
}

.mybtn{
    background-color: #04B6E9;
    border: none;
    color: white;
     padding: 5px 8px; 
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 10px;
   border-radius: 6px;
    cursor: pointer;
}
</style>

</head>

<body>
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
<script type="text/javascript">

$(function () {
   $('.tab ul.menu li').click(function(){
        //获得当前被点击的元素索引值
        var Index = $(this).index();
		//给菜单添加选择样式
	    $(this).addClass('active').siblings().removeClass('active');
		//显示对应的div
		$('.tab').children('div').eq(Index).show().siblings('div').hide();
   
   });
});

 $(document).ready(function(){
	//移动像素的图像
	/* var move = -15;
	//缩放比例，1.2 =120％
	var zoom = 1.2; */
	//在对这些缩略图的鼠标滑过事件
	$('.item').hover(function(){
		/* //根据缩放百分比设置宽度和高度
		width = $('.item').width() * zoom;
		height = $('.item').height() * zoom;
		//移动和缩放图像
		$(this).find('img').stop(false,true).animate({'width':width, 'height':height, 'top':move, 'left':move}, {duration:200}); */
		//显示标题
		$(this).find('div.caption').stop(false,true).fadeIn(200);
	},function(){
		/* //复位图像
		$(this).find('img').stop(false,true).animate({'width':$('.item').width(), 'height':$('.item').height(), 'top':'0', 'left':'0'}, {duration:100}); */	
		//隐藏标题
		$(this).find('div.caption').stop(false,true).fadeOut(200);
	}); 
	
/* 	$(this).find('div.caption').stop(false,true).fadeIn(200); */
	
}); 


</script> 
<div class="o-search" style="position:absolute;left:540px;top:80px;">
<form action="<%=path%>user/search.action?page=1" method="post">
<input type="text" class="search-text"  placeholder="请输入您搜索的关键词" name="name" value="${requestScope.searchName}" id="name"><button class="search-bnt" type="submit"><img src="<%=path%>images/search-i.png">  搜索</button>
</form>
</div>
<div class="tab" style="height:550px;width:1000px;position:absolute;top:10px;left:300px;">
	<ul class="menu">
		<li class="active" style="width:250px;">雇主</li>
		<li style="width:250px;">服务商</li>
		<li style="width:250px;">商品</li>
		<li style="width:250px;">外站搜索</li>

	</ul>
	<div class="con1" id="con1">
	<c:forEach items="${objList[0][0]}"  var="obj" varStatus="status">	
	<a href="<%=path%>user/EmployerInformation.action?userid=${obj.userId}" target="_blank" ><div class="item" id="img${status.count}" >
		<img width="150" height="150" alt="${obj.userName}" src="<%=path%>picture/findPicture.action?url=${obj.userHead}" />
		<div class="caption" style="text-align:center;" >
			<p>账户:${obj.userAccount}</p>
			<p>昵称:${obj.userName}</p>
			<p>注册时间:${obj.userRegisterTime}</p>
		</div>
		<font color="red" size="5px" style="position:absolute;bottom:0px;">${obj.userName}</font>
	</div >	
	</a>								
	</c:forEach>
<div style="position:absolute;top:510px;left:260px;" id="div1">
<button class="mybtn" onClick="selectepage('home')">首页</button>
共${requestScope.objList[0][3]}条
当前页数：[${requestScope.objList[0][1]}/${requestScope.objList[0][2]}]
<button class="mybtn" onClick="selectepage('end')">末页</button>
<button class="mybtn" onClick="selectepage('last')" id="elast" disabled="disabled">上一页</button>
<c:if test="${requestScope.objList[0][2]=='1'}">
<button class="mybtn" onClick="selectepage('next')" id="enext" disabled="disabled">下一页</button>
</c:if>
<c:if test="${requestScope.objList[0][2]!='1'}">
<button class="mybtn" onClick="selectepage('next')" id="enext">下一页</button>
</c:if>
到第<input type="number" style="width:40px;" id="epageNum" value="" onclick="checknum(this)">页
<button class="mybtn" onClick="selectepage('jump')">跳转</button>
</div> 
	</div>
	<div class="con2" id="con2">
<c:forEach items="${objList[1][0]}"  var="obj" varStatus="status">	
	
<a href="<%=path%>user/EmployerInformation.action?userid=${obj.userId}" target="_blank" ><div class="item" id="img${status.count}" >

		<img width="150" height="150" alt="${obj.userName}" src="<%=path%>picture/findPicture.action?url=${obj.userHead}" />
		<div class="caption" style="text-align:center;" >
			<p>账户:${obj.userAccount}</p>
			<p>昵称:${obj.userName}</p>
			<p>注册时间:${obj.userRegisterTime}</p>
		</div>
		<font color="red" size="5px" style="position:absolute;bottom:0px;">${obj.userName}</font>
	</div >	
	</a>								
	</c:forEach>
<div style="position:absolute;top:510px;left:260px;" id="div1">
<button class="mybtn" onClick="selectbpage('home')">首页</button>
共${requestScope.objList[1][3]}条
当前页数：[${requestScope.objList[1][1]}/${requestScope.objList[1][2]}]
<button class="mybtn" onClick="selectbpage('end')">末页</button>
<button class="mybtn" onClick="selectbpage('last')" id="blast" disabled="disabled">上一页</button>
<c:if test="${requestScope.objList[1][2]=='1'}">
<button class="mybtn" onClick="selectbpage('next')" id="bnext" disabled="disabled">下一页</button>
</c:if>
<c:if test="${requestScope.objList[1][2]!='1'}">
<button class="mybtn" onClick="selectbpage('next')" id="bnext">下一页</button>
</c:if>
到第<input type="number" style="width:40px;" id="bpageNum" value="" onclick="checknum(this)">页
<button class="mybtn" onClick="selectbpage('jump')">跳转</button>
</div> 	
	</div>
	<div class="con3" id="con3">
<c:forEach items="${objList[2][0]}"  var="obj" varStatus="status">	
	<a href="<%=path%>production/toProductionDetal.action?proId=${obj.productionId}" target="_blank "><div class="item" id="img${status.count}" >

		<img width="150" height="150" alt="${obj.productionName}" src="<%=path%>picture/findPicture.action?url=${obj.productionImage}" />
		<div class="caption" style="text-align:center;" >
			<p>价格:${obj.productionMoney}</p>
			<p>购买次数:${obj.buyCount}</p>
			<p>上架时间:${obj.productionPublishTime}</p>
		</div>
		<font color="red" size="5px" style="position:absolute;bottom:0px;">${obj.productionName}</font>
	</div >	
	</a>								
	</c:forEach>
<div style="position:absolute;top:510px;left:260px;" id="div1">
<button class="mybtn" onClick="selectppage('home')">首页</button>
共${requestScope.objList[2][3]}条
当前页数：[${requestScope.objList[2][1]}/${requestScope.objList[2][2]}]
<button class="mybtn" onClick="selectppage('end')">末页</button>
<button class="mybtn" onClick="selectppage('last')" id="plast" disabled="disabled">上一页</button>
<c:if test="${requestScope.objList[2][2]=='1'}">
<button class="mybtn" onClick="selectppage('next')" id="pnext" disabled="disabled">下一页</button>
</c:if>
<c:if test="${requestScope.objList[2][2]!='1'}">
<button class="mybtn" onClick="selectppage('next')" id="pnext">下一页</button>
</c:if>
到第<input type="number" style="width:40px;" id="ppageNum" value="" onclick="checknum(this)">页
<button class="mybtn" onClick="selectppage('jump')">跳转</button>
</div> 		
	</div>
	
	
	<div class="con4" id="con4">
<c:forEach items="${objList[3][0]}"  var="obj" varStatus="status">	
	 <a href="${obj.productionFile}" target="_blank"><div class="item" id="img${status.count}" > 

		<img width="150" height="150" alt="" src="${obj.productionImage}" />
		 <div class="caption" style="text-align:center;" >
		</div> 
		   <font color="red" size="1px" style="position:absolute;top:150px;">${obj.productionDetal}</font>
	</div >	
	
	</a>	 						
	</c:forEach>
 <div style="position:absolute;top:510px;left:260px;" id="div1">
<button class="mybtn" onClick="selectopage('home')">首页</button>
共${requestScope.objList[3][3]}条
当前页数：[${requestScope.objList[3][1]}/${requestScope.objList[3][2]}]
<button class="mybtn" onClick="selectopage('end')">末页</button>
<button class="mybtn" onClick="selectopage('last')" id="olast" disabled="disabled">上一页</button>
<c:if test="${requestScope.objList[3][2]=='1'}">
<button class="mybtn" onClick="selectopage('next')" id="onext" disabled="disabled">下一页</button>
</c:if>
<c:if test="${requestScope.objList[3][2]!='1'}">
<button class="mybtn" onClick="selectopage('next')" id="onext">下一页</button>
</c:if>
到第<input type="number" style="width:40px;" id="opageNum" value="" onclick="checknum(this)">页
<button class="mybtn" onClick="selectopage('jump')">跳转</button>
</div>  		
	</div>
</div>



</body>
<script type="text/javascript">
function checknum(obj){
	if($(obj).val()!=""){
		if($(obj).val()<1){				
			$(obj).val(1);
		}	
	}
}
var epage="${requestScope.page}";
var bpage="${requestScope.page}";
var ppage="${requestScope.page}";
var opage="${requestScope.page}";
function selectepage(state){
	var num=$("#epageNum").val();
	$("#con1").empty();
	if(num!=""&&state=="jump"){
		epage=num;		
	} 
	$.ajax({	
		 url:"<%=path%>user/selectepage.action",
		 data:"state="+state+"&epage="+epage+"&name="+$('#name').val(),
		 dataType:"json",
		 type:"post",
		 success:function(redata){	 		
			   	 var objList=redata[0];
			   	 var list=objList[0];
		         var len = list.length+1;
		         var nowPage=objList[1];
		         var countPage=objList[2];		         
		         var count=objList[3];
		         for(var i=1;i<len;i++){    			        	 
		             var e = list[i-1];
		             $("#con1").append("<a href='<%=path%>user/EmployerInformation.action?userid="+e.userId+"' target='_blank'><div class='item' id='img"+i+"'><img width='150' height='150' alt='"+e.userName+"' src='<%=path%>picture/findPicture.action?url="+e.userHead+"' /><div class='caption' style='text-align:center;' ><p>账户:"+e.userAccount+"</p><p>昵称:"+e.userName+"</p><p>注册时间:"+e.userRegisterTime+"</p></div><font color='red' size='5px'style='position:absolute;bottom:0px;'>"+e.userName+"</font></div></a>"); 
		         }
		         
		         epage=nowPage;
		       /* //移动像素的图像
		     	var move = -15;
		     	//缩放比例，1.2 =120％
		     	var zoom = 1.2;
		     	//在对这些缩略图的鼠标滑过事件 */
		     	$('.item').hover(function(){
		     		/* //根据缩放百分比设置宽度和高度
		     		width = $('.item').width() * zoom;
		     		height = $('.item').height() * zoom;
		     		//移动和缩放图像
		     		$(this).find('img').stop(false,true).animate({'width':width, 'height':height, 'top':move, 'left':move}, {duration:200}); */
		     		//显示标题
		     		$(this).find('div.caption').stop(false,true).fadeIn(200);
		     	},function(){
		     		/* //复位图像
		     		$(this).find('img').stop(false,true).animate({'width':$('.item').width(), 'height':$('.item').height(), 'top':'0', 'left':'0'}, {duration:100});	 */
		     		//隐藏标题
		     		$(this).find('div.caption').stop(false,true).fadeOut(200);
		     	});		     	
		     	$("#con1").append("<div  style='position:absolute;top:510px;left:260px;' id='div1'><button class='mybtn' onclick=\"selectepage('home')\"> 首页 </button> 共"+count+"条当前页数：["+nowPage+"/"+countPage+"] <button class='mybtn' onclick=\"selectepage('end')\"> 末页 </button> <button class='mybtn' onclick=\"selectepage('last')\" id='elast'> 上一页 </button> <button class='mybtn' onclick=\"selectepage('next')\" id='enext'> 下一页 </button> 到第<input type='number' style='width:40px;' id='epageNum' value='' onclick='checknum(this)'>页 <button class='mybtn' onclick=\"selectepage('jump')\"> 跳转 </button></div>");
		     	if(epage==1){
		        	 $("#elast").attr("disabled",true);
		         }else{
		        	 $("#elast").attr("disabled",false);
		         }
		         if(epage==countPage){
		        	 $("#enext").attr("disabled",true);
		         }else{
		        	 $("#enext").attr("disabled",false);
		         }
		         
		 }
	 }); 
    	
}


function selectbpage(state){
	var num=$("#bpageNum").val();
	$("#con2").empty();
	if(num!=""&&state=="jump"){
		bpage=num;		
	} 
	$.ajax({	
		 url:"<%=path%>user/selectbpage.action",
		 data:"state="+state+"&bpage="+bpage+"&name="+$('#name').val(),
		 dataType:"json",
		 type:"post",
		 success:function(redata){	 		
			   	 var objList=redata[0];
			   	 var list=objList[0];
		         var len = list.length+1;
		         var nowPage=objList[1];
		         var countPage=objList[2];		         
		         var count=objList[3];
		         for(var i=1;i<len;i++){    			        	 
		             var e = list[i-1];
		             $("#con2").append("<a href='<%=path%>user/EmployerInformation.action?userid="+e.userId+"' target='_blank'><div class='item' id='img"+i+"'><img width='150' height='150' alt='"+e.userName+"' src='<%=path%>picture/findPicture.action?url="+e.userHead+"' /><div class='caption' style='text-align:center;' ><p>账户:"+e.userAccount+"</p><p>昵称:"+e.userName+"</p><p>注册时间:"+e.userRegisterTime+"</p></div><font color='red' size='5px'style='position:absolute;bottom:0px;'>"+e.userName+"</font></div></a>"); 
		         } 	
		         bpage=nowPage;
		       //移动像素的图像
		     	/* var move = -15;
		     	//缩放比例，1.2 =120％
		     	var zoom = 1.2;
		     	//在对这些缩略图的鼠标滑过事件 */
		     	$('.item').hover(function(){
		     		//根据缩放百分比设置宽度和高度
		     		/* width = $('.item').width() * zoom;
		     		height = $('.item').height() * zoom;
		     		//移动和缩放图像
		     		$(this).find('img').stop(false,true).animate({'width':width, 'height':height, 'top':move, 'left':move}, {duration:200}); */
		     		//显示标题
		     		$(this).find('div.caption').stop(false,true).fadeIn(200);
		     	},function(){
		     		/* //复位图像
		     		$(this).find('img').stop(false,true).animate({'width':$('.item').width(), 'height':$('.item').height(), 'top':'0', 'left':'0'}, {duration:100});	 */
		     		//隐藏标题
		     		$(this).find('div.caption').stop(false,true).fadeOut(200);
		     	});		     	
		     	$("#con2").append("<div  style='position:absolute;top:510px;left:260px;' ><button class='mybtn' onclick=\"selectbpage('home')\"> 首页 </button> 共"+count+"条当前页数：["+nowPage+"/"+countPage+"] <button class='mybtn' onclick=\"selectbpage('end')\"> 末页 </button> <button class='mybtn' onclick=\"selectbpage('last')\"  id='blast'> 上一页 </button> <button class='mybtn' onclick=\"selectbpage('next')\" id='bnext'> 下一页 </button> 到第<input type='number' style='width:40px;' id='bpageNum' value='' onclick='checknum(this)'>页 <button class='mybtn' onclick=\"selectbpage('jump')\"> 跳转 </button></div>");
		     	if(bpage==1){
		        	 $("#blast").attr("disabled",true);
		         }else{
		        	 $("#blast").attr("disabled",false);
		         }
		         if(bpage==countPage){
		        	 $("#bnext").attr("disabled",true);
		         }else{
		        	 $("#bnext").attr("disabled",false);
		         }
		 }
	 }); 
    	
}

function selectppage(state){
	var num=$("#ppageNum").val();
	$("#con3").empty();
	if(num!=""&&state=="jump"){
		ppage=num;		
	} 
	$.ajax({	
		 url:"<%=path%>user/selectppage.action",
		 data:"state="+state+"&ppage="+ppage+"&name="+$('#name').val(),
		 dataType:"json",
		 type:"post",
		 success:function(redata){	 		
			   	 var objList=redata[0];
			   	 var list=objList[0];
		         var len = list.length+1;
		         var nowPage=objList[1];
		         var countPage=objList[2];		         
		         var count=objList[3];
		         for(var i=1;i<len;i++){    			        	 
		             var e = list[i-1];
		             $("#con3").append("<a href='<%=path%>product/toProductionDetal.action?proId="+e.productionId+"' target='_blank ''><div class='item' id='img"+i+"'><img width='150' height='150' alt='"+e.productionName+"' src='<%=path%>picture/findPicture.action?url="+e.productionImage+"' /><div class='caption' style='text-align:center;' ><p>价格:"+e.productionMoney+"</p><p>购买次数:"+e.buyCount+"</p><p>上架时间:"+e.productionPublishTime+"</p></div><font color='red' size='5px' style='position:absolute;bottom:0px;'>"+e.productionName+"</font></div></a>"); 
		         } 	
		         ppage=nowPage;
		       //移动像素的图像
		     	/* var move = -15;
		     	//缩放比例，1.2 =120％
		     	var zoom = 1.2;
		     	//在对这些缩略图的鼠标滑过事件 */
		     	$('.item').hover(function(){
		     		//根据缩放百分比设置宽度和高度
		     		/* width = $('.item').width() * zoom;
		     		height = $('.item').height() * zoom;
		     		//移动和缩放图像
		     		$(this).find('img').stop(false,true).animate({'width':width, 'height':height, 'top':move, 'left':move}, {duration:200}); */
		     		//显示标题
		     		$(this).find('div.caption').stop(false,true).fadeIn(200);
		     	},function(){
		     		/* //复位图像
		     		$(this).find('img').stop(false,true).animate({'width':$('.item').width(), 'height':$('.item').height(), 'top':'0', 'left':'0'}, {duration:100});	 */
		     		//隐藏标题
		     		$(this).find('div.caption').stop(false,true).fadeOut(200);
		     	});		     	
		     	$("#con3").append("<div  style='position:absolute;top:510px;left:260px;' ><button class='mybtn' onclick=\"selectppage('home')\"> 首页 </button> 共"+count+"条当前页数：["+nowPage+"/"+countPage+"] <button class='mybtn' onclick=\"selectppage('end')\"> 末页 </button> <button class='mybtn' onclick=\"selectppage('last')\" id='plast'> 上一页 </button> <button class='mybtn' onclick=\"selectppage('next')\" id='pnext'> 下一页 </button> 到第<input type='number' style='width:40px;' id='ppageNum' value='' onclick='checknum(this)'>页 <button class='mybtn' onclick=\"selectppage('jump')\"> 跳转 </button></div>");
		     	if(ppage==1){
		        	 $("#plast").attr("disabled",true);
		         }else{
		        	 $("#plast").attr("disabled",false);
		         }
		         if(ppage==countPage){
		        	 $("#pnext").attr("disabled",true);
		         }else{
		        	 $("#pnext").attr("disabled",false);
		         }
		 }
	 }); 
    	
}

function selectopage(state){
	var num=$("#opageNum").val();
	$("#con4").empty();
	if(num!=""&&state=="jump"){
		opage=num;		
	} 
	$.ajax({	
		 url:"<%=path%>user/selectopage.action",
		 data:"state="+state+"&opage="+opage+"&name="+$('#name').val(),
		 dataType:"json",
		 type:"post",
		 success:function(redata){	 		
			 var objList=redata[0];
		   	 var list=objList[0];
	         var len = list.length+1;
	         var nowPage=objList[1];
	         var countPage=objList[2];		         
	         var count=objList[3];
	         for(var i=1;i<len;i++){    			        	 
	             var e = list[i-1];		            
	             $("#con4").append("<a href='"+e.productionFile+"' target='_blank'><div class='item' id='img"+i+"' ><img width='150' height='150' alt='' src='"+e.productionImage+"' /><div class='caption' style='text-align:center;' ></div><font color='red' size='1px' style='position:absolute;top:150px;'>"+e.productionDetal+"</font></div ></a>");
	         } 
	         opage=nowPage;
	       //移动像素的图像
	     	/* var move = -15;
	     	//缩放比例，1.2 =120％
	     	var zoom = 1.2;
	     	//在对这些缩略图的鼠标滑过事件 */
	     	$('.item').hover(function(){
	     		//根据缩放百分比设置宽度和高度
	     		/* width = $('.item').width() * zoom;
	     		height = $('.item').height() * zoom;
	     		//移动和缩放图像
	     		$(this).find('img').stop(false,true).animate({'width':width, 'height':height, 'top':move, 'left':move}, {duration:200}); */
	     		//显示标题
	     		$(this).find('div.caption').stop(false,true).fadeIn(200);
	     	},function(){
	     		/* //复位图像
	     		$(this).find('img').stop(false,true).animate({'width':$('.item').width(), 'height':$('.item').height(), 'top':'0', 'left':'0'}, {duration:100});	 */
	     		//隐藏标题
	     		$(this).find('div.caption').stop(false,true).fadeOut(200);
	     	});		     	
	     	$("#con4").append("<div  style='position:absolute;top:510px;left:260px;' ><button class='mybtn' onclick=\"selectopage('home')\"> 首页 </button> 共"+count+"条当前页数：["+nowPage+"/"+countPage+"] <button class='mybtn' onclick=\"selectopage('end')\"> 末页 </button> <button class='mybtn' onclick=\"selectopage('last')\" id='olast'> 上一页 </button> <button class='mybtn' onclick=\"selectopage('next')\" id='onext'> 下一页 </button> 到第<input type='number' style='width:40px;' id='opageNum' value='' onclick='checknum(this)'>页 <button class='mybtn' onclick=\"selectopage('jump')\"> 跳转 </button></div>");
	     	if(opage==1){
	        	 $("#olast").attr("disabled",true);
	         }else{
	        	 $("#olast").attr("disabled",false);
	         }
	         if(opage==countPage){
	        	 $("#onext").attr("disabled",true);
	         }else{
	        	 $("#onext").attr("disabled",false);
	         }
	            	 
	 
		 }
	 }); 
    	
}
</script>

</html>