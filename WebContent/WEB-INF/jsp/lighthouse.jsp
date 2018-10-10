<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<%=path%>css/bootstrap.css">
<link rel="stylesheet" href="<%=path%>css/oindex.css">
<script type="text/javascript" src="<%=path%>js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>js/jquery.superslide.2.1.1.js"></script>
<title>Insert title here</title>
<style type="text/css">
/*图片框样式-------------------------------*/

*{margin:0;padding:0;list-style-type:none;}
body{font:12px/180% "宋体",Arial, Helvetica, sans-serif;}
.clear{clear:both;}
.demopage{width:600px;margin:0 auto;}
/* item */
.item{width:150px;height:150px;border:2px solid #00BFFF;margin:5px 5px 5px 0;overflow:hidden;position:relative;float:left;}
.item .caption{width:150px;height:150px;background:url(images/dianbg.png);_background:#000000;color:#8A2BE2;font-weight:bold;position:absolute;left:0;display:none;/*background:#000000;filter:alpha(opacity=70);-moz-opacity:0.7;-khtml-opacity:0.7;opacity:0.7;*/}
.item .caption a{text-decoration:none;color:#0cc7dd;font-size:14px;padding:5px;display:block;}
.item .caption p a{padding:5px;margin:0;font-size:12px;color:#fff;font-weight:normal;}
.item img{border:0;position:absolute;}

/*六个图片框的位置*/
#img1{position:absolute;
top:160px;
left:420px;
}
#img2{position:absolute;
top:160px;
left:670px;
}
#img3{position:absolute;
top:160px;
left:920px;
}
#img4{position:absolute;
top:340px;
left:420px;
}
#img5{position:absolute;
top:340px;
left:670px;
}
#img6{position:absolute;
top:340px;
left:920px;
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
<script type="text/javascript" src="<%=path%>js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>js/jquery.superslide.2.1.1.js"></script>
<script src="<%=path%>js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script type="text/javascript">


 $(document).ready(function(){
	//移动像素的图像
  	var move = -15;
  	//缩放比例，1.2 =120％
  	var zoom = 1.2;
  	//在对这些缩略图的鼠标滑过事件
  	$('.item').hover(function(){
  		 //根据缩放百分比设置宽度和高度
  		width = $('.item').width() * zoom;
  		height = $('.item').height() * zoom;
  		//移动和缩放图像
  		$(this).find('img').stop(false,true).animate({'width':width, 'height':height, 'top':move, 'left':move}, {duration:200}); 
  		//显示标题
  		$(this).find('div.caption').stop(false,true).fadeIn(200);
  	},function(){
  		 //复位图像
  		$(this).find('img').stop(false,true).animate({'width':$('.item').width(), 'height':$('.item').height(), 'top':'0', 'left':'0'}, {duration:100});	 
  		//隐藏标题
  		$(this).find('div.caption').stop(false,true).fadeOut(200);
  	});	
	
}); 


</script> 
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
<h1 class="text-info" style="position:absolute; left:690px; top:50px;">曝光台</h1>
<div id="con1">
	<c:forEach items="${requestScope.lighthouseList[0][0]}"  var="obj" varStatus="status">	
	<a href="<%=path%>user/EmployerInformation.action?userid=${obj.userId}"><div class="item" id="img${status.count}" >
		<img width="150" height="150" alt="${obj.userName}" src="<%=path%>images/banner-touxiang.png" />
		<div class="caption" style="text-align:center;" >
			<p>账户:${obj.userAccount}</p>
			<p>昵称:${obj.userName}</p>
			<p>信誉:${obj.userCredit}</p>
			<p>注册时间:${obj.userRegisterTime}</p>
		</div>
		<div style="position:absolute;top:120px;"><font color="red" size="4px">${obj.userName}</font></div>
	</div >	
	</a>								
	</c:forEach>
 
<div style="position:absolute;top:560px;left:540px;" id="div1">
<button class="mybtn" onclick="selectpage('home')">首页</button>
共${requestScope.lighthouseList[0][3]}条
当前页数：[${requestScope.lighthouseList[0][1]}/${requestScope.lighthouseList[0][2]}]
<button class="mybtn" onclick="selectpage('end')">末页</button>
<button class="mybtn" onclick="selectpage('last')" disabled="disabled" id="last">上一页</button>
<c:if test="${requestScope.lighthouseList[0][2]=='1'}">
<button class="mybtn" onClick="selectpage('next')" id="next" disabled="disabled">下一页</button>
</c:if>
<c:if test="${requestScope.lighthouseList[0][2]!='1'}">
<button class="mybtn" onClick="selectpage('next')" id="next">下一页</button>
</c:if>
到第<input type="number" style="width:40px;" id="pageNum" value="" onclick="checknum(this)">页
<button class="mybtn" onclick="selectpage('jump')">跳转</button>
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
var page=1;
function selectpage(state){
	var num=$("#pageNum").val();
	$("#con1").empty();
	if(num!=""&&state=="jump"){
		page=num;		
	} 
	$.ajax({	
		 url:"<%=path%>lighthouse/selectpage.action",
		 data:"state="+state+"&page="+page,
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
		             $("#con1").append("<a href='#'><div class='item' id='img"+i+"'><img width='150' height='150' alt='"+e.userName+"' src='<%=path%>images/banner-touxiang.png' /><div class='caption' style='text-align:center;' ><p>账户:"+e.userAccount+"</p><p>昵称:"+e.userName+"</p><p>信誉:"+e.userCredit+"</p><p>注册时间:"+e.userRegisterTime+"</p></div><div style='position:absolute;top:120px;'><font color='red' size='4px'>"+e.userName+"</font></div></div></a>"); 
		         } 		
		         page=nowPage;
		        //移动像素的图像
		     	var move = -15;
		     	//缩放比例，1.2 =120％
		     	var zoom = 1.2;
		     	//在对这些缩略图的鼠标滑过事件
		     	$('.item').hover(function(){
		     		 //根据缩放百分比设置宽度和高度
		     		width = $('.item').width() * zoom;
		     		height = $('.item').height() * zoom;
		     		//移动和缩放图像
		     		$(this).find('img').stop(false,true).animate({'width':width, 'height':height, 'top':move, 'left':move}, {duration:200}); 
		     		//显示标题
		     		$(this).find('div.caption').stop(false,true).fadeIn(200);
		     	},function(){
		     		 //复位图像
		     		$(this).find('img').stop(false,true).animate({'width':$('.item').width(), 'height':$('.item').height(), 'top':'0', 'left':'0'}, {duration:100});	 
		     		//隐藏标题
		     		$(this).find('div.caption').stop(false,true).fadeOut(200);
		     	});		     	
		     	$("#con1").append("<div  style='position:absolute;top:560px;left:540px;' id='div1'><button class='mybtn' onclick=\"selectpage('home')\"> 首页 </button> 共"+count+"条当前页数：["+nowPage+"/"+countPage+"] <button class='mybtn' onclick=\"selectpage('end')\"> 末页 </button> <button class='mybtn' onclick=\"selectpage('last')\" id='last'> 上一页 </button> <button class='mybtn' onclick=\"selectpage('next')\" id='next'> 下一页 </button> 到第<input type='number' style='width:40px;' id='pageNum' value='' onclick='checknum(this)'>页 <button class='mybtn' onclick=\"selectpage('jump')\"> 跳转 </button></div>");	    
		     	if(page==1){
		        	 $("#last").attr("disabled",true);
		         }else{
		        	 $("#last").attr("disabled",false);
		         }
		         if(page==countPage){
		        	 $("#next").attr("disabled",true);
		         }else{
		        	 $("#next").attr("disabled",false);
		         }
		 }
	 }); 
    	
}

</script>
</html>