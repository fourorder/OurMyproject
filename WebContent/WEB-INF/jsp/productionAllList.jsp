<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>作品</title>
<style>
* { margin: 0; padding: 0;}
ul { list-style-type: none;}
.keyword { display: block; width: 300px; margin: 0 auto 20px; padding: 8px; border: 1px solid #ccc;}

.jq22 { width: 1000px; margin: 0 auto; font-size: 0;}
.filtr-item { display: inline-block; width: 230px; padding: 10px;}
.filtr-item a { color: #444; text-decoration: none;}
.filtr-item img { width: 100%; height: 131px;}
.filtr-item span { display: block; margin-top: 5px; font-size: 12px; text-align: center;}
</style>
</head>

<body>
<h1>搜索</h1>

<a href="<%=path%>production/toManageProduction.action" >临时跳转，后期删掉，跳转进入服务商后台管理</a>

<input class="keyword" placeholder="请输入关键字" data-search>

<div class="jq22">
	<div class="filtr-item" data-category="2">
		<a href="#">
			<img src="<%=path%>picture/findPicture.action?url=production1.png"  alt="">
			<span class="ss">仿QQ绿钻抽奖转盘</span>
		</a>
	</div>
	<div class="filtr-item" data-category="1">
		<a href="#">
			<img src="<%=path%>picture/findPicture.action?url=production2.png"  alt="">
			<span>jQuery筛选过滤插件Filterizr</span>
		</a>
	</div>
	<div class="filtr-item" data-category="1">
		<a href="#">
			<img src="images/a3.png" alt="">
			<span>jQuery全屏滚动插件DD Full Screen Slider</span>
		</a>
	</div>
	
	<div class="filtr-item" data-category="3">
		<a href="#">
			<img src="images/a4.png" alt="">
			<span>让IE7 IE8支持CSS3 background-size属性</span>
		</a>
	</div>
	<div class="filtr-item" data-category="1">
		<a href="#">
			<img src="images/a5.png" alt="">
			<span>轻巧的jQuery提示框插件Tipso</span>
		</a>
	</div>
	<div class="filtr-item" data-category="2">
		<a href="#">
			<img src="images/a6.png" alt="">
			<span>简单的jQuery幻灯片插件ck_slide</span>
		</a>
	</div>
	<div class="filtr-item" data-category="1">
		<a href="#">
			<img src="images/a7.png" alt="">
			<span>WOW.js – 让页面滚动更有趣</span>
		</a>
	</div>
	<div class="filtr-item" data-category="2">
		<a href="#">
			<img src="images/a8.png" alt="">
			<span>fullPage.js制作网易邮箱大师页面</span>
		</a>
	</div>
	<div class="filtr-item" data-category="2">
		<a href="#">
			<img src="images/a9.png" alt="">
			<span>onepage-scroll制作iPhone 5s页面</span>
		</a>
	</div>
	<div class="filtr-item" data-category="2">
		<a href="#">
			<img src="images/a1.png" alt="">
			<span>jqueryrotate制作机锋网积分抽奖效果</span>
		</a>
	</div>
	<div class="filtr-item abc" data-category="2">
		<a href="#">
			<img src="images/a2.png" alt="">
			<span>jQuery左右垂直反向滚动插件multiscroll.js</span>
		</a>
	</div>
</div>

<script src="<%=path%>js/jquery.min.js"></script>
<script src="<%=path%>js/jquery.filterizr.js"></script>

<script>
$(function() {
	$('.jq22').filterizr();

	$('.nav li').on('click', function() {
		$(this).toggleClass('active').siblings().removeClass('active');
	});
});
</script>

<!-- 以下信息与演示无关，可不必理会 -->
<style>
body { margin: 0; border-left: 200px solid #ccc;}

h1 { margin: 40px auto; font: 32px "Microsoft Yahei"; text-align: center;}

.menu { position: fixed; left: 0; top: 0; bottom: 0; width: 200px; padding-top: 100px; font-family: Consolas,arial,"宋体"; background-color: #ccc; overflow-y: auto;}
.menu a { display: block; height: 40px; margin: 0 0 1px 2px; padding-left: 10px; line-height: 40px; font-size: 14px; color: #333; text-decoration: none;}
.menu a:hover { background-color: #eee;}
.menu .cur { color: #000; background-color: #fff !important;}

.vad { margin: 50px 0 10px; font-family: Consolas,arial,宋体,sans-serif; text-align:center;}
.vad a { display: inline-block; height: 36px; line-height: 36px; margin: 0 5px; padding: 0 50px; font-size: 14px; text-align:center; color:#eee; text-decoration: none; background-color: #222;}
.vad a:hover { color: #fff; background-color: #000;}
.thead { width: 728px; height: 90px; margin: 0 auto; border-bottom: 40px solid transparent;}

.code { position: relative; margin-top: 100px; padding-top: 41px;}
.code h3 { position: absolute; top: 0; z-index: 10; width: 100px; height: 40px; font: 16px/40px "Microsoft Yahei"; text-align: center; cursor: pointer;}
.code .cur { border: 1px solid #f0f0f0; border-bottom: 1px solid #f8f8f8; background-color: #f8f8f8;}
.code .h31 { left: 0;}
.code .h32 { left: 102px;}
.code .h33 { left: 204px;}
.code .h34 { left: 306px;}
.code ol { padding: 0;}
.code { width: 800px; margin-left: auto; margin-right: auto;}
pre { padding: 15px 0; border: 1px solid #f0f0f0; background-color: #f8f8f8;}
.f-dn { display: none;}
</style>



<div class="menu">
	<a href="index.html">1、单选</a>
	<a href="index2.html">2、多选</a>
	<a href="index3.html">3、排序</a>
	<a class="cur" href="index4.html">4、搜索</a>
	<a href="index5.html">5、指定筛选过滤</a>
	<a href="index6.html">6、回调函数</a>
</div>

</body>
</html>