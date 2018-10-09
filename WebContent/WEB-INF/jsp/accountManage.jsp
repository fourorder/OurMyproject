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
<title>账户管理页</title>

    <script type="text/javascript" src="<%=path%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>plugins/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=path%>plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path%>css/global.css" media="all">
    <link rel="stylesheet" href="<%=path%>laydate/theme/default/laydate.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
   
   <link rel="stylesheet" href="<%=path%>css/bootstrap.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    


 <style type="text/css">

        body{TEXT-ALIGN: center;}

    </style>
</head>
<body>
<div style="height: 50%;width: 95%; margin:0 auto;">

<!-- <input type="text" id="query" placeholder="请输入规则内容进行搜索" style="width:30.333%" />&nbsp;&nbsp;&nbsp;<button onclick="query()" class="layui-btn layui-btn-normal" style="width:10.333%" ><span class="layui-btn layui-btn-normal">搜索</span></button> -->
  


<table class="layui-table" style="border-collapse:collapse;table-layout:fixed;width:600px;margin:auto;"   border="1">

  <thead>
    <tr>
    
      <th >用户</th>
      <th >日期</th>
      <th >交易类型</th>
      <th >接收人</th>
      <th >交易金额</th>
      
             
    </tr> 
  </thead>
 
  <tr> 
 
        
         
        
  <tbody id="tb">
   <c:forEach items="${fundList}"  var="fund"> 

      
  <tr>
    <td>${fund.userBean.userName}</td>
	<td>${fund.dealDate}</td>
	<td>${fund.businessBean.businessName}</td>
	<td>${fund.toUserBean.userName}</td>
	<td>${fund.dealMoney}</td>
  </tr>
        </c:forEach>
  </tbody>

</table>
<button class="btn btn-primary"  onclick="selectFund('last')" id="last" disabled="disabled">上一页</button>
   当前页：<a id="aaa">${requestScope.page}</a>
          总页数：<a id="eee">${requestScope.countPage}</a>
     第<input type="text" id="btn1" size=2/>页<button onclick="selectFund('jump')" class="layui-btn layui-btn-normal"><span >跳转</span></button>
     <button class="btn btn-primary"  onclick="selectFund('next')" id="next">下一页</button>
</div>
<script type="text/javascript">
var page="${requestScope.page}";
var allPage="${requestScope.countPage}";
$(window).load(function() {
    
	if(allPage==1){
    	 $("#next").attr("class","btn btn-primary");
    	 $("#next").attr("disabled",true);
     }else{
    	 $("#next").attr("class","btn btn-primary");
    	 $("#next").attr("disabled",false);
     }//等所有的js和图片加载完毕，才执行的方法
	});
function selectFund(state){
	
	$("#tb").empty();
	var num=$("#btn1").val();
	if(num!=""){
		page=num;		
	}
	$.ajax({	
		 url:"<%=path%>fund/selectFund.action",
		 data:"state="+state+"&page="+page,
		 dataType:"json",
		 type:"post",
		 success:function(redata){
		
			   		page=redata[0];
			   	 var list=redata[1];
		         var len = list.length;
		         var size=redata[2];
		         for(var i=0;i<len;i++){    			        	 
		             var e = list[i];
		             $("#tb").append("<tr><td>"+e.userBean.userName+"</td><td>"+e.dealDate+"</td><td>"+e.businessBean.businessName+"</td><td>"+e.toUserBean.userName+"</td><td>"+e.dealMoney+"</td></tr>"); 
		         } 	
		         if(page==1){
		        	 $("#last").attr("class","btn btn-primary"); 
		        	 $("#last").attr("disabled",true);
		         }else{
		        	 $("#last").attr("class","btn btn-primary");
		        	 $("#last").attr("disabled",false);
		         }
		         if(page==size){
		        	 $("#next").attr("class","btn btn-primary");
		        	 $("#next").attr("disabled",true);
		         }else{
		        	 $("#next").attr("class","btn btn-primary");
		        	 $("#next").attr("disabled",false);
		         }
		         $("#aaa").html(page);
		         $("#eee").html(size);
		         
		         
		 }
	 }); 
    	
}
	   
</script>




</body>
</html>