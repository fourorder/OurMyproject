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
<title>服务商管理页</title>

    <script type="text/javascript" src="<%=path%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>plugins/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=path%>plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path%>css/global.css" media="all">
    <link rel="stylesheet" href="<%=path%>laydate/theme/default/laydate.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css"><link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


 <style type="text/css">

        body{TEXT-ALIGN: center;}

    </style>
</head>
<body>
<div style="height: 50%;width: 95%; margin:0 auto;">
<%-- <form action="<%=path%>employers/page.action?page=tpage&number=1" method="post"> --%>
<!-- 姓名：<input type="text" name="name"  placeholder="请输入内容"  >  
<input type="submit" value="查询" id="query"	class="layui-btn layui-btn-normal" />  --> 
  姓名：<input type="text" id="query" /><button onclick="query()"><span class="layui-btn layui-btn-normal">查询</span></button>
<!-- </form> -->
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
            <th>角色名字</th>
            <th>注册时间</th>
             <th>操作</th>
             <th>用户ID</th>
    </tr> 
  </thead>
  <tbody id="ccc">
   <c:forEach items="${Flist}"  var="facilitator"> 
  <c:if test="${facilitator.stateId==1}">
      
  <tr> 
  
  <td >${facilitator.userName}</td>
  <td >${facilitator.userTel}</td>
  <td >${facilitator.userAccount}</td>
  <td >${facilitator.userSex}</td>
  <td >${facilitator.userAccount}</td>
  <td >${facilitator.userIdentity}</td>
   <td >${facilitator.userAddress}</td>
    <td >${facilitator.userCredit}</td>
     <td >${facilitator.userMoney}</td>
      <td>
<%--       <input type="hidden" value="${facilitator.userId}" id="userId"/>
       
       <input type="hidden" value="${facilitator.stateId}" id="stateId"/> --%>
       <a class="layui-btn layui-btn-sm layui-btn-danger" id="zzz" href="#"  onclick="changeState(${facilitator.userId},${facilitator.stateId},${num});return false;">${facilitator.stateName}</a></td>
      <td >${facilitator.characterName}</td>
       <td >${facilitator.userRegisterTime}</td>
       <td >
       <a class="layui-btn layui-btn-sm layui-btn-danger" id="yyy" href="#"  onclick="changeState(${facilitator.userId},3,${num});return false;" >删除</a>
       <a class="layui-btn layui-btn-sm layui-btn-danger" data-toggle="modal" data-target="#editVoince" data-id="edit">编辑</a>
       



       </td>
       <td >${facilitator.userId}</td>
      
       
      
  </tr>
  </c:if> 
  </c:forEach>
  </tbody>
  <tr> 
  <tbody id="ddd">
   <c:forEach items="${Flist}"  var="facilitator"> 
     <c:if test="${facilitator.stateId==2}">
      
   <tr>

  <td >${facilitator.userName}</td>
  <td >${facilitator.userTel}</td>
  <td >${facilitator.userAccount}</td>
  <td >${facilitator.userSex}</td>
  <td >${facilitator.userAccount}</td>
  <td >${facilitator.userIdentity}</td>
   <td >${facilitator.userAddress}</td>
    <td>${facilitator.userCredit}</td>
     <td >${facilitator.userMoney}</td>
      <%-- <td><a class="layui-btn layui-btn-sm layui-btn-danger" id="stateName" href="<%=path%>facilitator/changeState.action?userId=${facilitator.userId}&stateId=${facilitator.stateId}">${facilitator.stateName}</a></td> --%>
       <td> 
<%--        <input type="hidden" value="${facilitator.userId}" id="userId"/>
       
       <input type="hidden" value="${facilitator.stateId}" id="stateId"/> --%>
       <a class="layui-btn layui-btn-sm layui-btn-danger" id="zzz" href="#"  onclick="changeState(${facilitator.userId},${facilitator.stateId},${num});return false;">${facilitator.stateName}</a></td>
      <td >${facilitator.characterName}</td>
       <td >${facilitator.userRegisterTime}</td>
       
     <td >
     <a class="layui-btn layui-btn-sm layui-btn-danger" id="yyy" href="#"  onclick="changeState(${facilitator.userId},3,${num});return false;" >删除</a>
       <a class="layui-btn layui-btn-sm layui-btn-danger" data-toggle="modal" data-target="#editVoince" data-id="edit">编辑</a>	
       </td>
       <td >${facilitator.userId}</td>
        </tr>
       </c:if> 

  
  </c:forEach>
  </tbody>
   <tr>
   <td colspan="5"><a class="layui-btn layui-btn-sm" href="#" onclick="lastPage();return false;" id="last">上一页</a></td>
   <td >当前页：<a id="aaa">${num}</a><br>
          总页数：<a id="eee">${countPage}</a><br>
     第<input type="text" id="btn" size=2/>页<button onclick="selectPage()"><span class="layui-btn layui-btn-normal">跳转</span></button>
   
   
   </td>
   <td colspan="5"><a class="layui-btn layui-btn-sm" href="#"  onclick="nextPage();return false;" id="next">下一页</a></td>
   </tr>
  <!-- model start -->
       <form action="<%=path%>facilitator/changeInfo.action" method="POST">
       <div class="modal fade" id="editVoince" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog"> 
          <div class="modal-content">        
            <div class="modal-header">       
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> 
                <h4 class="modal-title">修改服务商信息</h4>       
            </div>         
            <div class="modal-body">            
               <div class="planel_boxs">           
                  <div class="row">                              
                    <label>用户名：</label>                    
                    <input type="text" name="userName" class="form-controls userName"> <br>             
                    <label>手机号：</label>           
                    <input type="text" name="userTel" class="form-controls userTel"><br> 
                    <label>账号：</label>           
                    <input type="text" name="userAccount" class="form-controls userAccount"><br>
                    <label>性别：</label>
                    <input type="text" name="userSex" class="form-controls userSex"><br>
                    <label>邮箱：</label>
                    <input type="text" name="userMail" class="form-controls userMail"><br>
                    <label>身份证：</label>
                    <input type="text" name="userIdentity" class="form-controls userIdentity"><br>
                    <label>信用分：</label>
                    <input type="text" name="userCredit" class="form-controls userCredit"><br>
                    <label>余额：</label>
                    <input type="text" name="userMoney" class="form-controls userMoney"><br>
                    <label>注册时间：</label>
                    <input type="text" name="userRegisterTime" class="form-controls userRegisterTime"><br>
                    <label>用户ID：</label>
                    <input type="text" name="userId" class="form-controls userId" readonly="readonly"><br>                    
        </div>            
          </div>        
          </div>      
            <div class="modal-footer text-center">       
                    <input type="submit" class="btn btn-default btn_blue" value="保存">        
                       <button type="button" class="btn btn-default btn_red" data-dismiss="modal">取消</button>    
                           </div>     
                            </div>  
                             </div></div>
                             </form>
                             <!-- model end -->
</table>

</div>
<script type="text/javascript">
var number=1; 
var allPage="${requestScope.countPage}";
$(document).ready(
		function() 
		{
			$("#last").removeAttr("onclick");   //在这里写代码
			if(allPage==1){
				$("#next").removeAttr("onclick"); 
			}
		});
function changeState(userId,stateId,number){
	number = $("#aaa").html();
	$.ajax({
		url:"<%=path%>facilitator/changeState.action",
		 data:"userId="+userId+"&stateId="+stateId+"&number="+number,
		 dataType:"json",
		 type:"post",
		 success:function(data){ 
			
			 allPage=data[2];
			 $("#ccc").empty();
			 $("#ddd").empty(); 
			 $("#eee").html(allPage);
			 var list=data[0];
			 var num=data[1];
			   number=num;
			 $("#aaa").html(num);
			 if(num==1){
			$("#last").removeAttr("onclick");
			    }
	         var len = list.length;
	         for(var i=0;i<len;i++){  

	             var e = list[i];
	             if(e.stateId==1){
	            	 $("#ccc").append("<tr><td>"+e.userName+"</td>"
	            			 +"<td>"+e.userTel+"</td>"
	            			 +"<td>"+e.userAccount+"</td>"
	            			 +"<td>"+e.userSex+"</td>"
	            			 +"<td>"+e.userAccount+"</td>"
	            			 +"<td>"+e.userIdentity+"</td>"
	            			 +"<td>"+e.userAddress+"</td>"
	            			 +"<td>"+e.userCredit+"</td>"
	            			 +"<td>"+e.userMoney+"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+","+e.stateId+","+num+");return false;'>"                                              
	            			 +e.stateName+"</a>"
	            			 +"</td>"
	            			 +"<td>"+e.characterName+"</td>"
	            			 +"<td>"+e.userRegisterTime+"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+",3,"+num+");return false;'>"
	            			+"删除"+"</a>"
	            			+"<a class='layui-btn layui-btn-sm layui-btn-danger' data-toggle='modal' data-target='#editVoince' data-id='edit'>编辑</a>"
	            			 +"</td>"
	            			 +"<td>"+e.userId+"</td>"
	            			 +"</tr>");
	             }else if(e.stateId==2){
	            	 $("#ddd").append("<tr><td>"+e.userName+"</td>"
	            			 +"<td>"+e.userTel+"</td>"
	            			 +"<td>"+e.userAccount+"</td>"
	            			 +"<td>"+e.userSex+"</td>"
	            			 +"<td>"+e.userAccount+"</td>"
	            			 +"<td>"+e.userIdentity+"</td>"
	            			 +"<td>"+e.userAddress+"</td>"
	            			 +"<td>"+e.userCredit+"</td>"
	            			 +"<td>"+e.userMoney+"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+","+e.stateId+","+num+");return false;'>"
	            			 +e.stateName+"</a>"
	            			 +"</td>"
	            			 +"<td>"+e.characterName+"</td>"
	            			 +"<td>"+e.userRegisterTime+"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+",3,"+num+");return false;'>"
	            			+"删除"+"</a>"
	            			+"<a class='layui-btn layui-btn-sm layui-btn-danger' data-toggle='modal' data-target='#editVoince' data-id='edit'>编辑</a>"
	            			 +"</td>"
	            			 +"<td>"+e.userId+"</td>"
	            			 +"</tr>");
	             }
	             
	             
	         }
	      
			  
			 
		 }
	 
	})
}	

function nextPage(){
	var userName=document.getElementById("query").value;
	
	number = $("#aaa").html();
	$("#ccc").empty();
	$("#ddd").empty();
	var page="npage";
	$.ajax({	
		
		 url:"<%=path%>facilitator/selectPage.action",
		 data:"number="+number+"&page="+page+"&userName="+userName,
		 dataType:"json",
		 type:"post",
		 success:function(data){ 
		number=data[1];
		allPage=data[2];
		$("#aaa").html(number);
		$("#eee").html(allPage);
		 var list=data[0];
         var len = list.length;
         
         for(var i=0;i<len;i++){  
        	
             var e = list[i];
             if(e.stateId==1){
            	 $("#ccc").append("<tr><td>"+e.userName+"</td>"
            			 +"<td>"+e.userTel+"</td>"
            			 +"<td>"+e.userAccount+"</td>"
            			 +"<td>"+e.userSex+"</td>"
            			 +"<td>"+e.userAccount+"</td>"
            			 +"<td>"+e.userIdentity+"</td>"
            			 +"<td>"+e.userAddress+"</td>"
            			 +"<td>"+e.userCredit+"</td>"
            			 +"<td>"+e.userMoney+"</td>"
            			 +"<td>"
            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+","+e.stateId+","+number+");return false;'>"
            			 +e.stateName+"</a>"
            			 +"</td>"
            			 +"<td>"+e.characterName+"</td>"
            			 +"<td>"+e.userRegisterTime+"</td>"
            			 +"<td>"
            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+",3,"+number+");return false;'>"
            			+"删除"+"</a>"
            			+"<a class='layui-btn layui-btn-sm layui-btn-danger' data-toggle='modal' data-target='#editVoince' data-id='edit'>编辑</a>"
            			 +"</td>"
            			 +"<td>"+e.userId+"</td>"
            			 +"</tr>");
             }else if(e.stateId==2){
            	 $("#ddd").append("<tr><td>"+e.userName+"</td>"
            			 +"<td>"+e.userTel+"</td>"
            			 +"<td>"+e.userAccount+"</td>"
            			 +"<td>"+e.userSex+"</td>"
            			 +"<td>"+e.userAccount+"</td>"
            			 +"<td>"+e.userIdentity+"</td>"
            			 +"<td>"+e.userAddress+"</td>"
            			 +"<td>"+e.userCredit+"</td>"
            			 +"<td>"+e.userMoney+"</td>"
            			 +"<td>"
            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+","+e.stateId+","+number+");return false;'>"
            			 +e.stateName+"</a>"
            			 +"</td>"
            			 +"<td>"+e.characterName+"</td>"
            			 +"<td>"+e.userRegisterTime+"</td>"
            			 +"<td>"
            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+",3,"+number+");return false;'>"
            			+"删除"+"</a>"
            			+"<a class='layui-btn layui-btn-sm layui-btn-danger' data-toggle='modal' data-target='#editVoince' data-id='edit'>编辑</a>"
            			 +"</td>"
            			 +"<td>"+e.userId+"</td>"
            			 +"</tr>");
             }
             
             
         } 	
		 }
	 });
	
		$("#last").attr("onclick","lastPage();return false;");
		if(number==allPage-1){
			
			$("#next").removeAttr("onclick");
		}
	
}
	function lastPage(){
		var userName=document.getElementById("query").value;
		number = $("#aaa").html();
		$("#ccc").empty();
		$("#ddd").empty();
		var page="tpage";
		$.ajax({	
			
			 url:"<%=path%>facilitator/selectPage.action",
			 data:"number="+number+"&page="+page+"&userName="+userName,
			 dataType:"json",
			 type:"post",
			 success:function(data){ 
			number=data[1];
		
			allPage=data[2];
			$("#aaa").html(number);
			$("#eee").html(allPage);
			 var list=data[0];
	         var len = list.length;
	         
	         for(var i=0;i<len;i++){  
	        
	             var e = list[i];
	             if(e.stateId==1){
	            	 $("#ccc").append("<tr><td>"+e.userName+"</td>"
	            			 +"<td>"+e.userTel+"</td>"
	            			 +"<td>"+e.userAccount+"</td>"
	            			 +"<td>"+e.userSex+"</td>"
	            			 +"<td>"+e.userAccount+"</td>"
	            			 +"<td>"+e.userIdentity+"</td>"
	            			 +"<td>"+e.userAddress+"</td>"
	            			 +"<td>"+e.userCredit+"</td>"
	            			 +"<td>"+e.userMoney+"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+","+e.stateId+","+number+");return false;'>"
	            			 +e.stateName+"</a>"
	            			 +"</td>"
	            			 +"<td>"+e.characterName+"</td>"
	            			 +"<td>"+e.userRegisterTime+"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+",3,"+number+");return false;'>"
	            			+"删除"+"</a>"
	            			 +"<td>"+e.userId+"</td>"
	            			 +"</td>"
	            			 +"</tr>");
	             }else if(e.stateId==2){
	            	 $("#ddd").append("<tr><td>"+e.userName+"</td>"
	            			 +"<td>"+e.userTel+"</td>"
	            			 +"<td>"+e.userAccount+"</td>"
	            			 +"<td>"+e.userSex+"</td>"
	            			 +"<td>"+e.userAccount+"</td>"
	            			 +"<td>"+e.userIdentity+"</td>"
	            			 +"<td>"+e.userAddress+"</td>"
	            			 +"<td>"+e.userCredit+"</td>"
	            			 +"<td>"+e.userMoney+"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+","+e.stateId+","+number+");return false;'>"
	            			 +e.stateName+"</a>"
	            			 +"</td>"
	            			 +"<td>"+e.characterName+"</td>"
	            			 +"<td>"+e.userRegisterTime+"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+",3,"+number+");return false;'>"
	            			+"删除"+"</a>"
	            			 +"<td>"+e.userId+"</td>"
	            			 +"</td>"
	            			 +"</tr>");
	             }
	             
	             
	         } 	
			
			
			
			
			 }
		 });
		if(number==2){
			
			
			$("#last").removeAttr("onclick");


	   	 
	    }
		$("#next").attr("onclick","nextPage();return false;");
	    	
	    	
	    
	}
	function selectPage() {
		var userName=document.getElementById("query").value;
		 number=$("#btn").val();
		 var page="page";
		 $("#ccc").empty();
		 $("#ddd").empty();
		 $.ajax({	
			 url:"<%=path%>facilitator/selectPage.action",
			 data:"number="+number+"&page="+page+"&userName="+userName,
			 dataType:"json",
			 type:"post",
			 success:function(data){
				 number=data[1];
					
					allPage=data[2];
					$("#aaa").html(number);
					$("#eee").html(allPage);
					 var list=data[0];
			         var len = list.length;
			         
			         for(var i=0;i<len;i++){  
			        
			             var e = list[i];
			             if(e.stateId==1){
			            	 $("#ccc").append("<tr><td>"+e.userName+"</td>"
			            			 +"<td>"+e.userTel+"</td>"
			            			 +"<td>"+e.userAccount+"</td>"
			            			 +"<td>"+e.userSex+"</td>"
			            			 +"<td>"+e.userAccount+"</td>"
			            			 +"<td>"+e.userIdentity+"</td>"
			            			 +"<td>"+e.userAddress+"</td>"
			            			 +"<td>"+e.userCredit+"</td>"
			            			 +"<td>"+e.userMoney+"</td>"
			            			 +"<td>"
			            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+","+e.stateId+","+number+");return false;'>"
			            			 +e.stateName+"</a>"
			            			 +"</td>"
			            			 +"<td>"+e.characterName+"</td>"
			            			 +"<td>"+e.userRegisterTime+"</td>"
			            			 +"<td>"
			            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+",3,"+number+");return false;'>"
			            			+"删除"+"</a>"
			            			+"<td>"+e.userId+"</td>"
			            			 +"</td>"
			            			 +"</tr>");
			             }else if(e.stateId==2){
			            	 $("#ddd").append("<tr><td>"+e.userName+"</td>"
			            			 +"<td>"+e.userTel+"</td>"
			            			 +"<td>"+e.userAccount+"</td>"
			            			 +"<td>"+e.userSex+"</td>"
			            			 +"<td>"+e.userAccount+"</td>"
			            			 +"<td>"+e.userIdentity+"</td>"
			            			 +"<td>"+e.userAddress+"</td>"
			            			 +"<td>"+e.userCredit+"</td>"
			            			 +"<td>"+e.userMoney+"</td>"
			            			 +"<td>"
			            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+","+e.stateId+","+number+");return false;'>"
			            			 +e.stateName+"</a>"
			            			 +"</td>"
			            			 +"<td>"+e.characterName+"</td>"
			            			 +"<td>"+e.userRegisterTime+"</td>"
			            			 +"<td>"
			            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+",3,"+number+");return false;'>"
			            			+"删除"+"</a>"
			            			+"<td>"+e.userId+"</td>"
			            			 +"</td>"
			            			 +"</tr>");
			             }
			             
			             
			         } 	
					
					
					
					
					 }
				 });
	}

function query(){
	
	  var userName=$("#query").val();
	 number=1;
	 var page="page";
	 $("#ccc").empty();
	 $("#ddd").empty();
	 $.ajax({	
		 url:"<%=path%>facilitator/selectPage.action",
		 data:"number="+number+"&page="+page+"&userName="+userName,
		 dataType:"json",
		 type:"post",
		 success:function(data){
			 number=data[1];
				
				allPage=data[2];
				$("#aaa").html(number);
				$("#eee").html(allPage);
				 var list=data[0];
		         var len = list.length;
		         
		         for(var i=0;i<len;i++){  
		        
		             var e = list[i];
		             if(e.stateId==1){
		            	 $("#ccc").append("<tr><td>"+e.userName+"</td>"
		            			 +"<td>"+e.userTel+"</td>"
		            			 +"<td>"+e.userAccount+"</td>"
		            			 +"<td>"+e.userSex+"</td>"
		            			 +"<td>"+e.userAccount+"</td>"
		            			 +"<td>"+e.userIdentity+"</td>"
		            			 +"<td>"+e.userAddress+"</td>"
		            			 +"<td>"+e.userCredit+"</td>"
		            			 +"<td>"+e.userMoney+"</td>"
		            			 +"<td>"
		            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+","+e.stateId+","+number+");return false;'>"
		            			 +e.stateName+"</a>"
		            			 +"</td>"
		            			 +"<td>"+e.characterName+"</td>"
		            			 +"<td>"+e.userRegisterTime+"</td>"
		            			 +"<td>"
		            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+",3,"+number+");return false;'>"
		            			+"删除"+"</a>"
		            			+"<td>"+e.userId+"</td>"
		            			 +"</td>"
		            			 +"</tr>");
		             }else if(e.stateId==2){
		            	 $("#ddd").append("<tr><td>"+e.userName+"</td>"
		            			 +"<td>"+e.userTel+"</td>"
		            			 +"<td>"+e.userAccount+"</td>"
		            			 +"<td>"+e.userSex+"</td>"
		            			 +"<td>"+e.userAccount+"</td>"
		            			 +"<td>"+e.userIdentity+"</td>"
		            			 +"<td>"+e.userAddress+"</td>"
		            			 +"<td>"+e.userCredit+"</td>"
		            			 +"<td>"+e.userMoney+"</td>"
		            			 +"<td>"
		            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+","+e.stateId+","+number+");return false;'>"
		            			 +e.stateName+"</a>"
		            			 +"</td>"
		            			 +"<td>"+e.characterName+"</td>"
		            			 +"<td>"+e.userRegisterTime+"</td>"
		            			 +"<td>"
		            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+",3,"+number+");return false;'>"
		            			+"删除"+"</a>"
		            			+"<td>"+e.userId+"</td>"
		            			 +"</td>"
		            			 +"</tr>");
		             }
		             
		             
		         } 	
				
				
				
				
				 }
			 });
}


</script>
<script type="text/javascript">
$('#editVoince').on('show.bs.modal', function (event) {     
	var btnThis = $(event.relatedTarget); //触发事件的按钮     
	var modal = $(this);  //当前模态框      
	var modalId = btnThis.data('id');   //解析出data-id的内容     
	var userName = btnThis.closest('tr').find('td').eq(0).text();
	var userTel = btnThis.closest('tr').find('td').eq(1).text(); 
	var userAccount = btnThis.closest('tr').find('td').eq(2).text(); 
	var userSex = btnThis.closest('tr').find('td').eq(3).text(); 
	var userMail = btnThis.closest('tr').find('td').eq(4).text(); 
	var userIdentity = btnThis.closest('tr').find('td').eq(5).text(); 
	var userAddress = btnThis.closest('tr').find('td').eq(6).text(); 
	var userCredit = btnThis.closest('tr').find('td').eq(7).text(); 
	var userMoney = btnThis.closest('tr').find('td').eq(8).text(); 
	var userRegisterTime = btnThis.closest('tr').find('td').eq(11).text(); 
	var userId = btnThis.closest('tr').find('td').eq(13).text(); 
	modal.find('.userName').val(userName); 
	modal.find('.userTel').val(userTel);
	modal.find('.userAccount').val(userAccount);
	modal.find('.userSex').val(userSex);
	modal.find('.userMail').val(userMail);
	modal.find('.userIdentity').val(userIdentity);
	modal.find('.userAddress').val(userAddress);
	modal.find('.userCredit').val(userCredit);
	modal.find('.userMoney').val(userMoney);
	modal.find('.userRegisterTime').val(userRegisterTime);
	modal.find('.userId').val(userId);
	});


</script>
</body>
</html>