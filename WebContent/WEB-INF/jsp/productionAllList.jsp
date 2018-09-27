<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
 

<a href="<%=path%>production/toManageProduction.action" >临时跳转，后期删掉，跳转进入服务商后台管理</a>
<form  method="post" action="<%=path%>production/toProduction.action">
 <input type="text"   name="conditionName"  id="conditionName" /><input type="text"   name="fieldName"  id="fieldName"  /> <input type="submit"  value="搜索" />
 </form>
<div class="jq22"  id="proList">

	
	
	  <c:forEach items="${list}"  var="list" >	              
	           <div class="filtr-item" data-category="2">
	              <a href="<%=path%>production/toProductionDetal.action?proId=${list.productionId}">
			<img src="<%=path%>picture/findPicture.action?url=${list.productionImage}"  alt="">
			<span class="ss">${list.productionName }</span>
		</a>
	</div>
</c:forEach>	
	
		

</div>
当前页<span id="currentPage" >${currentPage}</span>  总页数<span id="totalPages"  >${totalPages } </span>  <a >上一页</a>  <a href="<%=path %>production/AddPages.action?currentPage=${currentPage}&totalPages=${totalPages}">下一页</a>
<input type="button"   value="上一页"  onclick="addPages('last')" />
<input type="button"   value="下一页"  onclick="addPages('next')" />
<script src="<%=path%>js/jquery.min.js"></script>
<script src="<%=path%>js/jquery.filterizr.js"></script>

<script>
$(function() {
	$('.jq22').filterizr();

	$('.nav li').on('click', function() {
		$(this).toggleClass('active').siblings().removeClass('active');
	});
});

function addPages(state){
	 

	$("#proList").empty();
	
	$.ajax({	
		 url:"<%=path %>production/AddPages.action",
		 data:"currentPage="+${currentPage}+"&state="+state+"&totalPages="+${totalPages}+"&conditionName="+$("#conditionName").val()+"&fieldName="+$("#fieldName").val(),
		 dataType:"json",
		 type:"post",
		 success:function(redata){
			 $("#currentPage").empty();
			 $("#totalPages").empty();
			 $("#currentPage").html(redata.currentPage);
			 $("#totalPages").html(redata.totalPages);
			 
			 var list=redata.proList;
			 var len = list.length;
			
			 for(var i=0;i<len;i++){    			        	 
	             var e = list[i];
	           
	             $("#proList").append("<div class='filtr-item' data-category='2'> <a href='<%=path%>production/toProductionDetal.action?proId="+e.productionId+"'>"
	            		+ 	"<img src='<%=path%>picture/findPicture.action?url="+e.productionImage+" ' >"
	            				+"<span class='ss'>"+e.productionName +"</span>"
	            				+"</a></div> "
	             );
	            
			 
			 
			 } 	 
			 
		 }
	});
	
}

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



<!-- <div class="menu">
	<a href="index.html">1、单选</a>
	<a href="index2.html">2、多选</a>
	<a href="index3.html">3、排序</a>
	<a class="cur" href="index4.html">4、搜索</a>
	<a href="index5.html">5、指定筛选过滤</a>
	<a href="index6.html">6、回调函数</a>
</div> -->

</body>
</html>