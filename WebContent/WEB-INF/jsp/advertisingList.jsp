<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>广告列表页</title>
 <script type="text/javascript" src="<%=path %>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>js/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="<%=path %>layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path %>css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<style type="text/css">

        body{TEXT-ALIGN: center;}

    </style>

</head>
<body>
<div style="height: 45%;width: 85%; margin:0 auto;">
<form action="<%=path %>adver/list.action?page=tpage&number=1" method="post" >
用户名：<input type="text" name="title"  placeholder="请输入内容" value="<%= request.getAttribute("title")==null?"":request.getAttribute("title")%>" style="width: 100px;height: 20px" >  
 日期： <input type="text"  id="test1" onchange="check()" name="time" value="<%= request.getAttribute("time")==null?"":request.getAttribute("time")%>" style="width: 100px;height: 20px">
<input type="submit" value="查询" 	class="layui-btn layui-btn-normal" /> 
<input type="button" value="配置广告" 	class="layui-btn layui-btn-normal" onclick="deploy()" /> 
</form>
<table class="layui-table">
 
  <thead>
    <tr>
      <th>标题</th>
      <th>内容</th>
      <th>时间</th>
       <th>地址</th>
        <th>图片</th>
         <th width="50">序号</th>
         <th width="150">操作</th>
    </tr> 
  </thead>
  <tbody>
 <c:forEach items="${Alist}"  var="fund">
 <tr>
 <td>${fund.advertisementTitle}</td>
  <td>${fund.advertisementContent}</td>
   <td>${fund.advertisementPublishTime}</td>
    <td>${fund.advertisementAddress}</td>
     <td>${fund.advertisementImage}</td>
      <td>${fund.advertisementNum}</td>
       <td><a class="layui-btn layui-btn-sm layui-btn-danger" href="<%=path %>adver/operation.action?operation=del&title=${fund.advertisementTitle}&time=${fund.advertisementPublishTime}&state=${fund.advertisementNum}" onclick="return firm()">删除</a>
       <a class="layui-btn layui-btn-sm" href="<%=path %>adver/operation.action?operation=update&title=${fund.advertisementTitle}&time=${fund.advertisementPublishTime}&state=${fund.advertisementNum}" >修改</a>
      </td>
 </tr>
 </c:forEach>
<tr>
 
   <td colspan="7"><a>当前页：${num}&nbsp;&nbsp;&nbsp;总页数：${countPage}</a>
   <input type="text" name="skip" id="skip" style="width: 30px"  onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">&nbsp;&nbsp;<a onclick="skip()"  class="layui-btn layui-btn-xs">转</a>
     <a class="layui-btn layui-btn-sm" href="<%=path %>adver/list.action?page=tpage&number=${num}&title=${title}&time=${time}">上一页</a>
    <a class="layui-btn layui-btn-sm" href="<%=path %>adver/list.action?page=npage&number=${num}&title=${title}&time=${time}">下一页</a></td>
   </tr>
</tbody>
</table>
</div>
<script type="text/javascript" src="<%=path %>layui/layui.js"></script>
<script>
    layui.use(['form','layer','laydte'], function(){
  	  var form = layui.form;
  	  var layer=layui.layer;
  	  var laydate=layui.laydate;
  	  
  	
  	});
  
    layui.use('laydate', function(){
    	  var laydate = layui.laydate;
    	  
    	  laydate.render({
    	    elem: '#test1' //指定元素
    	  });
    	});
    function deploy() {
		window.location.href = "<%=path %>adver/page.action";
	}
    
    function skip() {
     var number=$("#skip").val();
     window.location.href = "<%=path %>adver/list.action?page=skip&title=${title}&time=${time}&number="+number;	
	}
        //日期格式验证 
    function check(){
    	var a = /^(\d{4})-(\d{2})-(\d{2})$/
    	if (!a.test(document.getElementById("test1").value)) { 
    	alert("日期格式不正确!") 
    	return false 
    	} 
    	else 
    	return true 
    	} 
    function firm() {
        //利用对话框返回的值 （true 或者 false）
        if (confirm("是否删除")) {
           return true;
        }
        else {
        	 return false;
        }
 
    }
</script>
</body>
</html>