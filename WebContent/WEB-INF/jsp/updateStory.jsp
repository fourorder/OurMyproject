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
<title>修改故事</title>

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
<div align="center" style="height: 90%;width: 40%;margin:0 auto;background-color: #eff4d8; text-align: left" >
<form  class="layui-form layui-form-pane" action="<%=path %>employers/updateOk.action" method="post" >
<c:forEach items="${Slist}"  var="fund">
<div class="layui-form-item">
            <label class="layui-form-label">标题：</label>
            <div class="layui-input-block">
                <input type="text"  name="userStoryTitle" required  lay-verify="required" value="${fund.userStoryTitle}" autocomplete="off" class="layui-input">
            </div>
        </div>
<div class="layui-form-item">
            <label class="layui-form-label">内容：</label>
            <div class="layui-input-block">
                <input type="text" name="userStoryContent" required  lay-verify="required" value="${fund.userStoryContent}" autocomplete="off" class="layui-input">
            </div>
        </div>
<div class="layui-form-item">
            <label class="layui-form-label">时间：</label>
            <div class="layui-input-block">
                <input type="text"  id="test1"  name="userStoryTime" required  lay-verify="required" value="${fund.userStoryTime}" autocomplete="off" class="layui-input">
            </div>
        </div>
<div class="layui-form-item">
            <label class="layui-form-label">账号：</label>
            <div class="layui-input-block">
                <input type="text" name="userAccount"   required  lay-verify="required" value="${fund.userAccount}" autocomplete="off" class="layui-input">
            </div>
        </div>
   <div class="layui-form-item">
    <label class="layui-form-label">状态：</label>
    <div class="layui-input-block">
       <input type="text" name="stateId"  required  lay-verify="required" value="${fund.stateId}" autocomplete="off" class="layui-input">
    </div>
  </div>
     </c:forEach>   
     <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="submit" class="layui-btn"   value="提交">
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>

</form>

</div>
    
        
        <script src="<%=path %>layui/layui.js"></script>
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

</script>

</body>
</html>