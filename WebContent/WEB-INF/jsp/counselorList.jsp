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
<title>顾问列表</title>
<script type="text/javascript" src="<%=path %>js/jquery.min.js"></script>
 <link rel="stylesheet" href="<%=path %>plugins/layui/css/layui.css" media="all" />
  <script type="text/javascript" src="<%=path %>js/jquery-1.9.1.min.js"></script>
  
  
  
  
<style type="text/css">

        body{TEXT-ALIGN: center;}

    </style>

</head>
<body>
<div align="center" style="height: 50%;width: 80%;margin:0 auto;background-color: #eff4d8; text-align: center"  id="table">
<form action="<%=path %>counselor/list.action?page=tpage&number=1" method="post" >
<select name="state1" >
<option value="4">请选择</option>
<option value="0">待审核</option>
<option value="1">已审核</option>
</select>
<input type="submit" value="查询" style="width:70px;height: 30px" >
</form>
<table class="layui-table" >
<thead>
 <tr>
<th>账号</th>
<th>内容</th>
<th>费用</th>
<th>图片</th>
<th>顾问类型</th>
<th>状态</th>
<th>启用/禁用</th>
<th>操作</th>
</tr>
</thead>
<c:forEach items="${Clist}"  var="fund">
<tbody id="ccc">
<tr>
<td>${fund.userAccount}</td>
<td>${fund.counselorIntroduction}</td>
<td>${fund.counselorMoney}</td>
<td>${fund.counselorImg}</td>
<td>${fund.serviceType}</td>
<c:if test="${fund.auditState  eq 0}">
       <td>待审核</td>
       <td><a onclick="return firm()" href="<%=path %>counselor/applicationOk.action?account=${fund.userAccount}">点击通过</a></td>
</c:if>
<c:if test="${fund.auditState  eq 1}">
       <td>已审核</td>
       <td><a>审核通过</a></td>
</c:if>
 <c:if test="${fund.enableDisableId  eq 3}">
       <td><a class="layui-btn layui-btn-sm layui-btn-radius " href="<%=path %>counselor/storyOperation.action?operation=forbidden&account=${fund.userAccount}&number=1">禁用</a></td>
       </c:if>
       <c:if test="${fund.enableDisableId  eq 4}">
       <td><a class="layui-btn layui-btn-sm layui-btn-radius layui-btn-danger" href="<%=path %>counselor/storyOperation.action?operation=start&account=${fund.userAccount}&number=1" >启用</a></td>
       </c:if>
       </tr>

</tbody>
</c:forEach>
</table>
当前页<span id="num">${num}</span>总页数<span id="totalPages">${totalPages}</span>
<a class="layui-btn layui-btn-sm" href="<%=path %>counselor/list.action?page=tpage&number=${num}&state=${state}">上一页</a>&nbsp;&nbsp;
<a class="layui-btn layui-btn-sm" href="<%=path %>counselor/list.action?page=npage&number=${num}&state=${state}">下一页</a>




</div>
<script>

function firm() {
    //利用对话框返回的值 （true 或者 false）
    if (confirm("是否通过审核")) {
       return true;
    }
    else {
    	 return false;
    }

}
</script>
</body>
</html>