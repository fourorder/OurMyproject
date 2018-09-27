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
<title>雇主修改页</title>

    <script type="text/javascript" src="<%=path %>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>js/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="<%=path %>layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path %>css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">

</head>

<style type="text/css">

        body{TEXT-ALIGN: center;}

        .demo-input{padding-left: 10px; height: 38px; min-width: 262px; line-height: 38px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;}
    </style>
    

    
<body>
<div align="center" style="height: 90%;width: 40%;margin:0 auto;background-color: #eff4d8; text-align: left" >
<form  class="layui-form layui-form-pane" action="<%=path %>employers/updateAck.action" method="post" >
<c:forEach items="${Elist}"  var="fund">
<input type="hidden" name="userAccount" value="${fund.userAccount}">
<div class="layui-form-item">
            <label class="layui-form-label">用户名：</label>
            <div class="layui-input-block">
                <input type="text" name="userName" required  lay-verify="required" value="${fund.userName}" autocomplete="off" class="layui-input">
            </div>
        </div>
<div class="layui-form-item">
            <label class="layui-form-label">密码：</label>
            <div class="layui-input-block">
                <input type="text" name="userPwd" required  lay-verify="required" value="${fund.userPwd}" autocomplete="off" class="layui-input">
            </div>
        </div>
<div class="layui-form-item">
            <label class="layui-form-label">手机号：</label>
            <div class="layui-input-block">
                <input type="text" name="userTel" required  lay-verify="required" value="${fund.userTel}" autocomplete="off" class="layui-input">
            </div>
        </div>
<div class="layui-form-item">
            <label class="layui-form-label">账号：</label>
            <div class="layui-input-block">
                <input type="text" name="userAccount" disabled="disabled" required  lay-verify="required" value="${fund.userAccount}" autocomplete="off" class="layui-input">
            </div>
        </div>
<input type="hidden" name="sex" value="${fund.userSex}" id="sex">
   <div class="layui-form-item">
    <label class="layui-form-label">性别：</label>
    <div class="layui-input-block">
       <input type="radio" name="userSex" value="1" title="男" checked="checked">
      <input type="radio" name="userSex" value="0" title="女" >
    </div>
  </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱：</label>
            <div class="layui-input-block">
                <input type="text" name="userMail" required  lay-verify="required" value="${fund.userMail}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">身份证：</label>
            <div class="layui-input-block">
                <input type="text" name="userIdentity" disabled="disabled" required  lay-verify="required" value="${fund.userIdentity}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地址：</label>
            <div class="layui-input-block">
                <input type="text" name="userAddress" required  lay-verify="required" value="${fund.userAddress}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">头像：</label>
            <div class="layui-input-block">
                <input type="text" name="Title" required  lay-verify="required" value="${fund.userHead}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">信用分：</label>
            <div class="layui-input-block">
                <input type="text" name="userCredit" required  lay-verify="required" value="${fund.userCredit}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">余额：</label>
            <div class="layui-input-block">
                <input type="text" disabled="disabled" required  lay-verify="required" value="${fund.userMoney}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户简介：</label>
            <div class="layui-input-block">
                <input type="text" name="userProfile" required  lay-verify="required" value="${fund.userProfile}" autocomplete="off" class="layui-input">
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


</script>
<script type="text/javascript">
$(function(){
	var sex=$("#sex").val();
	 if(sex!=null){
	        $("input:radio[name='userSex'][value="+sex+"]").attr('checked','true');
	    }
})

</script>

</body>
</html>