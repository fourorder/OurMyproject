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
<title>雇主故事列表页</title>
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
<div style="height: 45%;width: 60%; margin:0 auto;">
<form action="<%=path %>employers/list.action?page=tpage&number=1" method="post" >
用户名：<input type="text" name="title" id="title"  placeholder="请输入内容" value="<%= request.getAttribute("title")==null?"":request.getAttribute("title")%>" style="width: 100px;height: 20px" >  
  <select name="state"  id="num" >
        <option value="3" >请选择</option>
         <option value="0" >未刪除</option>
          <option value="1" >已删除</option>
        </select>
<input type="submit" value="查询" 	class="layui-btn layui-btn-normal" /> 
<input type="button" value="配置故事" 	class="layui-btn layui-btn-normal" onclick="deploy()" /> 
</form>
<table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th>标题</th>
      <th>内容</th>
      <th>时间</th>
       <th>账号</th>
         <th>状态</th>
          <th>启用/禁用</th>
         <th>操作</th>
    </tr> 
  </thead>
  <tbody>
 <c:forEach items="${Slist}"  var="fund">
 <tr>
 <td>${fund.userStoryTitle}</td>
  <td>${fund.userStoryContent}</td>
   <td>${fund.userStoryTime}</td>
    <td>${fund.userAccount}</td>
     <c:if test="${fund.stateId  eq 0}">
       <td><a >未删除</a></td>
       </c:if>
       <c:if test="${fund.stateId  eq 1}">
       <td><a>已删除</a></td>
       </c:if>
     <c:if test="${fund.enableDisableId  eq 3}">
       <td><a class="layui-btn layui-btn-sm layui-btn-radius " href="<%=path %>employers/storyOperation.action?operation=forbidden&account=${fund.userAccount}&number=1">禁用</a></td>
       </c:if>
       <c:if test="${fund.enableDisableId  eq 4}">
       <td><a class="layui-btn layui-btn-sm layui-btn-radius layui-btn-danger" href="<%=path %>employers/storyOperation.action?operation=start&account=${fund.userAccount}&number=1" >启用</a></td>
       </c:if>
       <td><a class="layui-btn layui-btn-sm layui-btn-danger" href="<%=path %>employers/delUpdate.action?operation=del&userAccount=${fund.userAccount}"  onclick="return firm()">删除</a>
       <a class="layui-btn layui-btn-sm" href="<%=path %>employers/delUpdate.action?operation=update&userAccount=${fund.userAccount}" >修改</a>
      </td>
 </tr>
 </c:forEach>
<tr>

   <td colspan="3"><a class="layui-btn layui-btn-sm" href="<%=path %>employers/list.action?page=tpage&number=${num}&title=${title}&state=${state}">上一页</a></td>
   <td >当前页：<span id="currentPage">${num}</span>&nbsp;&nbsp;&nbsp;总页数：<span id="totalPages">${countPage}</span></td>
  <td> <input type="text" name="skip" id="skip" style="width: 30px"  onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">&nbsp;&nbsp;<a onclick="skip()"  class="layui-btn layui-btn-xs">转</a></td>
  <td colspan="2"><a class="layui-btn layui-btn-sm" href="<%=path %>employers/list.action?page=npage&number=${num}&title=${title}&state=${state}">下一页</a></td>
 <td colspan="5">
</td>
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
		window.location.href = "<%=path %>employers/story.action";
	}
    function skip() {
    	var number=$("#skip").val();
        window.location.href = "<%=path %>employers/list.action?page=skip&title=${title}&state=${state}&number="+number;	
   	}
    
    function firm(accton) {
        //利用对话框返回的值 （true 或者 false）
        if (confirm("是否删除")) {
           return true;
        }
        else {
        	 return false;
        }
 
    }
</script>
<script type="text/javascript">
	
</script>
</body>
</html>