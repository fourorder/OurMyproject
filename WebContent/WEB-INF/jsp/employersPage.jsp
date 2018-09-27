<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>雇主管理页</title>

    <script type="text/javascript" src="<%=path %>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>js/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="<%=path %>layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path %>css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">


 <style type="text/css">

        body{TEXT-ALIGN: center;}

    </style>
 
</head>
<body >

<div style="height: 45%;width: 100%; margin:0 auto;">

<form action="<%=path %>employers/page.action?page=tpage&number=1" method="post" >
用户名：<input type="text" name="name"  placeholder="请输入内容" value="<%= request.getAttribute("username")==null?"":request.getAttribute("username")%>" style="width: 100px;height: 20px" >  
      <select name="ordinal" lay-filter="aihao">
       <option value="0" >请选择状态</option>
        <option value="1">启用</option>
        <option value="2">禁用</option>
        <option value="3">删除</option>
      </select>
<input type="submit" value="查询" 	class="layui-btn layui-btn-normal" /> 
</form>
<table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th>用户名</th>
      <th>手机号</th>
      <th>账号</th>
       <th>性别</th>
        <th>邮箱</th>
         <th>身份证</th>
          <th>地址</th>
           <th>信用分</th>
            <th>余额</th>
             <th>状态</th>
            <th>角色Id</th>
            <th>注册时间</th>
             <th>启用/禁用</th>
             <th>操作</th>
    </tr> 
  </thead>
  <tbody>
  <c:forEach items="${Elist}"  var="fund">
  <tr>
  <td>${fund.userName}</td>
  <td>${fund.userTel}</td>
  <td>${fund.userAccount}</td>
  <td>${fund.userSex}</td>
  <td>${fund.userMail}</td>
  <td>${fund.userIdentity}</td>
   <td>${fund.userAddress}</td>
    <td>${fund.userCredit}</td>
     <td>${fund.userMoney}</td>
      <td>${fund.stateId}</td>
      <td>${fund.characterId}</td>
       <td>${fund.userRegisterTime}</td>
       <c:if test="${fund.stateId  eq 1}">
       <td><a class="layui-btn layui-btn-sm layui-btn-radius layui-btn-danger" href="<%=path %>employers/operation.action?operation=forbidden&account=${fund.userAccount}&number=1">禁用</a></td>
       </c:if>
       <c:if test="${fund.stateId  eq 2}">
       <td><a class="layui-btn layui-btn-sm layui-btn-radius " href="<%=path %>employers/operation.action?operation=start&account=${fund.userAccount}&number=1" >启用</a></td>
       </c:if>
        <c:if test="${fund.stateId  eq 3}">
       <td><a class="layui-btn layui-btn-sm layui-btn-radius  layui-btn-disabled" name="state">已删除</a></td>
       </c:if>
       <td><a class="layui-btn layui-btn-sm layui-btn-danger"  href="<%=path %>employers/operation.action?operation=del&account=${fund.userAccount}&number=1" onclick="return firm()">删除</a>
       <a class="layui-btn layui-btn-sm"  href="<%=path %>employers/update.action?account=${fund.userAccount}" >修改</a>
       </td>
  </tr>
  </c:forEach>
   <tr>
   <td colspan="6"><a class="layui-btn layui-btn-sm" href="<%=path %>employers/page.action?page=tpage&number=${num}&name=${username}&ordinal=${state}">上一页</a></td>
   <td ><a>当前页：${num}&nbsp;&nbsp;&nbsp;总页数：${countPage}</a></td>
  <td> <input type="text" name="skip" id="skip" style="width: 30px"  onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">&nbsp;&nbsp;<a onclick="skip()"  class="layui-btn layui-btn-xs">转</a></td>
    <td colspan="6"><a class="layui-btn layui-btn-sm" href="<%=path %>employers/page.action?page=npage&number=${num}&name=${username}&ordinal=${state}"  id="npage">下一页</a></td>
   </tr>
  </tbody>
</table>


</div>
 <script  src="<%=path %>layui/layui.js"></script>
<script >
layui.use(['form','layer','laydte'], function(){
	  var form = layui.form;
	  var layer=layui.layer;
	  var laydate=layui.laydate;
	  
	});
function skip() {
    var number=$("#skip").val();
    window.location.href = "<%=path %>employers/page.action?page=skip&name=${username}&ordinal=${state}&number="+number;	
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