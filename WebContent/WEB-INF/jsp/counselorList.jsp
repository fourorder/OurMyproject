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
<style type="text/css">

        body{TEXT-ALIGN: center;}

    </style>

</head>
<body>
<div align="center" style="height: 90%;width: 50%;margin:0 auto;background-color: #eff4d8; text-align: center"  id="table">
<select id="state1">
<option value="4">请选择</option>
<option value="0">待审核</option>
<option value="1">已审核</option>
</select>
<button  style="width:70px;height: 30px" onclick="sstate()">查询</button>

<table class="layui-table" >
<thead>
 <tr>
<th>账号</th>
<th>内容</th>
<th>费用</th>
<th>状态</th>
<th>操作</th>
</tr>
</thead>
<tbody id="ccc">
<c:forEach items="${Clist}"  var="fund">
<tr>
<td>${fund.userAccount}</td>
<td>${fund.counselorIntroduction}</td>
<td>${fund.counselorMoney}</td>
<c:if test="${fund.auditState  eq 0}">
       <td>待审核</td>
       <td><a onclick="return firm()" href="<%=path %>counselor/applicationOk.action?account=${fund.userAccount}">点击通过</a></td>
</c:if>
<c:if test="${fund.auditState  eq 1}">
       <td>已审核</td>
       <td><a>审核通过</a></td>
</c:if>
</tr>
</c:forEach>
</tbody>
<tr>
<td colspan="5">当前页<span id="num">${num}</span>总页数<span id="totalPages">${totalPages}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="上一页" onclick="page('tpage')">&nbsp;&nbsp;
<input type="button" value="下一页" onclick="page('npage')">
</td>
</tr>

</table>

</div>
<script>
function page(page) {
	var nn=$("#num").text();
	var state1=$("#state1").val();
		$.ajax({	
			 url:"<%=path %>counselor/Alist.action",
			data:"page="+page+"&number="+nn+"&state1="+state1,
			dataType:"json",
			type:"post",
		   success:function(redata){
				$("#ccc").empty();
				$("#num").empty();
				 $("#totalPages").empty();
				var num=redata[0]
				var totalPages=redata[1]
				 $("#num").html(num);
				 $("#totalPages").html(totalPages);
				var list=redata[2]
				 var len = list.length;
				 for(var i=0;i<len;i++){ 
					 var e = list[i];
					 if(e.auditState==0){
						 $("#ccc").append(
									"<tr><td>"+e.userAccount+"</td>"+
									"<td>"+e.counselorIntroduction+"</td>"+
									"<td>"+e.counselorMoney+"</td>"+
									"<td>待审核</td>"+
									"<td><a onclick='return firm()' href='<%=path %>counselor/applicationOk.action?account="+e.userAccount+"'>点击通过</a></td>"+
									"</tr>"
							 
							 ); 
					 }else if(e.auditState==1){
						 $("#ccc").append(
									"<tr><td>"+e.userAccount+"</td>"+
									"<td>"+e.counselorIntroduction+"</td>"+
									"<td>"+e.counselorMoney+"</td>"+
									"<td>已审核</td>"+
									"<td><a>审核通过</a></td>"+
									"</tr>"
							 
							 );  
					 }
					 
				 }
					
				}
			
		})
}
function sstate() {
	
	var state1=$("#state1").val();
	alert(state1)
	$.ajax({	
			 url:"<%=path %>counselor/Alist.action",
			data:"page="+page+"&number="+nn+"&state1="+state1,
			dataType:"json",
			type:"post",
		   success:function(redata){
				$("#ccc").empty();
				 var len = redata.length;
				 for(var i=0;i<len;i++){ 
					 var e = redata[i];
					 if(e.auditState==0){
						 $.ajax({	
							 url:"<%=path %>counselor/Alist.action",
							data:"page="+page+"&number="+nn+"&state1="+state1,
							dataType:"json",
							type:"post",
						   success:function(redata){
								$("#ccc").empty();
								$("#num").empty();
								 $("#totalPages").empty();
								var num=redata[0]
								var totalPages=redata[1]
								 $("#num").html(num);
								 $("#totalPages").html(totalPages);
								var list=redata[2]
								 var len = list.length;
								 for(var i=0;i<len;i++){ 
									 var e = list[i];
									 if(e.auditState==0){
										 $("#ccc").append(
													"<tr><td>"+e.userAccount+"</td>"+
													"<td>"+e.counselorIntroduction+"</td>"+
													"<td>"+e.counselorMoney+"</td>"+
													"<td>待审核</td>"+
													"<td><a onclick='return firm()' href='<%=path %>counselor/applicationOk.action?account="+e.userAccount+"'>点击通过</a></td>"+
													"</tr>"
											 
											 ); 
									 }else if(e.auditState==1){
										 $("#ccc").append(
													"<tr><td>"+e.userAccount+"</td>"+
													"<td>"+e.counselorIntroduction+"</td>"+
													"<td>"+e.counselorMoney+"</td>"+
													"<td>已审核</td>"+
													"<td><input type='button' value='查看' style='width:70px;height:30px'></td>"+
													"</tr>"
											 
											 );  
									 }
									 
								 }
									
								}
							
						})
					 }else if(e.auditState==1){
						 $("#ccc").append(
									"<tr><td>"+e.userAccount+"</td>"+
									"<td>"+e.counselorIntroduction+"</td>"+
									"<td>"+e.counselorMoney+"</td>"+
									"<td>已审核</td>"+
									"<td><input type='button' value='查看' style='width:70px;height:30px'></td>"+
									"</tr>"
							 
							 );  
					 }
					 
				 }
					
				}
			
		})
}
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