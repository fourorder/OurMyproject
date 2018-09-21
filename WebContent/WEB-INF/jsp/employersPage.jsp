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
    <link rel="stylesheet" href="<%=path %>plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path %>css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">


 <style type="text/css">

        body{TEXT-ALIGN: center;}

    </style>
</head>
<body>
<div style="height: 50%;width: 95%; margin:0 auto;">
<form action="<%=path %>employers/page.action?page=tpage" method="post">
姓名：<input type="text" name="name"  placeholder="请输入内容"  >  
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
       <td><a  class="layui-btn layui-btn-sm layui-btn-danger"  href="<%=path %>employers/operation.action?operation=${fund.userAccount}">删除</a>
       <a   class="layui-btn" onclick="update()">修改</a>
       </td>
  </tr>
  </c:forEach>
   <tr>
   <td colspan="6"><a class="layui-btn layui-btn-sm" href="<%=path %>employers/page.action?page=tpage">上一页</a></td>
   <td ><a>当前页：${num}&nbsp;&nbsp;&nbsp;总页数：${countPage}</a></td>
    <td colspan="6"><a class="layui-btn layui-btn-sm" href="<%=path %>employers/page.action?page=npage">下一页</a></td>
   </tr>
  </tbody>
</table>
</div>

 <script type="text/javascript" src="<%=path %>plugins/layui/layui.js"></script>
<script type="text/javascript">
function update() {
	layer.open({
		title: '修改',
		content: '可以填写任意的layer代码',
		area:  ['500px', '300px'],
		btn: ['yes', 'no'],
		yes: function(index, layero){
			layer.alert('酷毙了', {icon: 1});
		  }
		});  
}

</script>
</body>
</html>