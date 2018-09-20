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
<%-- <link type="text/css" rel="stylesheet" href="<%=path%>css/bootstrap.css">  --%>

<script type="text/javascript" src="<%=path%>js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>js/jquery.superslide.2.1.1.js"></script>
<script src="<%=path%>js/jquery-1.4.2.min.js" type="text/javascript"></script>
<style>
*{ margin:0; padding:0;}
body{ font-family:'微软雅黑';}
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
.con1,.con2,.con3{height:190px;border-top:2px solid #04B6E9;margin-top:-2px;}
.con2,.con3{display:none;}
.con1 ul,.con2 ul,.con3 ul{padding:5px;}
.con1 ul li,.con2 ul li,.con3 ul li{background:url(images/point.png) no-repeat left center;padding:0 0 0 10px;font-size:14px;line-height:180%;color:#252525;}
.con1 ul li:hover,.con2 ul li:hover,.con3 ul li:hover{color:#04B6E9;cursor:pointer;text-decoration:underline;}

/*图片框样式-------------------------------*/

*{margin:0;padding:0;list-style-type:none;}
body{font:12px/180% "宋体",Arial, Helvetica, sans-serif;}
.clear{clear:both;}
.demopage{width:600px;margin:0 auto;}
/* item */
.item{width:150px;height:150px;border:2px solid #000;margin:5px 5px 5px 0;overflow:hidden;position:relative;float:left;}
.item .caption{width:150px;height:150px;background:url(images/dianbg.png);_background:#000000;color:#fff;font-weight:bold;position:absolute;left:0;display:none;/*background:#000000;filter:alpha(opacity=70);-moz-opacity:0.7;-khtml-opacity:0.7;opacity:0.7;*/}
.item .caption a{text-decoration:none;color:#0cc7dd;font-size:14px;padding:5px;display:block;}
.item .caption p a{padding:5px;margin:0;font-size:12px;color:#fff;font-weight:normal;}
.item img{border:0;position:absolute;}

/*六个图片框的位置*/
#img1{position:absolute;
top:60px;
left:120px;
}
#img2{position:absolute;
top:60px;
left:370px;
}
#img3{position:absolute;
top:60px;
left:620px;
}
#img4{position:absolute;
top:240px;
left:120px;
}
#img5{position:absolute;
top:240px;
left:370px;
}
#img6{position:absolute;
top:240px;
left:620px;
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
<div class="o-search" style="position:absolute;left:500px;top:80px;">
<form action="<%=path%>user/search.action" method="post">
<input type="text" class="search-text"  placeholder="请输入您搜索的关键词" name="name"><button class="search-bnt" type="submit"><img src="<%=path%>images/search-i.png">  搜索</button>
</form>
</div>
<div class="tab" style="height:500px;width:900px;position:absolute;top:10px;left:300px;">
	<ul class="menu">
		<li class="active" style="width:300px;">雇主</li>
		<li style="width:300px;">服务商</li>
		<li style="width:300px;">商品</li>
	</ul>
	<div class="con1" >
	<c:forEach items="${objList[0][0]}"  var="obj" varStatus="status">
	
	<a href="#"><div class="item" id="img${status.count}">
		<img width="150" height="150" alt="${obj.userName}" src="<%=path%>images/banner-touxiang.png" />
		<div class="caption" style="text-align:center;" >
			<p>账户:${obj.userAccount}</p>
			<p>昵称:${obj.userName}</p>
			<p>注册时间:${obj.userRegisterTime}</p>
		</div>
		<div style="position:absolute;left:60px;top:120px;"><font color="red" size="4px">${obj.userName}</font></div>
	</div>	
	</a>								
	</c:forEach>
<div  style="position:absolute;top:460px;left:240px;">
<button class="mybtn">首页</button>
共${requestScope.objList[0][3]}条
当前页数：[${requestScope.objList[0][1]}/${requestScope.objList[0][2]}]
<button class="mybtn">末页</button>
<button class="mybtn">上一页</button>
<button class="mybtn">下一页</button>
到第<input type="text" style="width:25px;">页
<button class="mybtn">跳转</button>
	</div> 

	</div>
	<div class="con2">
		
	</div>
	<div class="con3">
		
	</div>
</div>



</body>
</html>