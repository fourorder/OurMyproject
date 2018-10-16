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
<title>管理员管理页</title>
   
    <%-- <link rel="stylesheet" href="<%=path%>plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path%>css/global.css" media="all">
    <link rel="stylesheet" href="<%=path%>laydate/theme/default/laydate.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <script type="text/javascript" src="<%=path%>plugins/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=path%>css/bootstrap.css">
    <script type="text/javascript" src="<%=path%>js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript"   src="<%=path%>js/bootstrap-3.3.7.min.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=path%>css/bootstrap-3.3.7.min.css"> --%>
     <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
      <script type="text/javascript" src="<%=path%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>plugins/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=path%>plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path%>css/global.css" media="all">
    <link rel="stylesheet" href="<%=path%>laydate/theme/default/laydate.css" media="all">
   

      
      <script type="text/javascript" src="<%=path%>js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript"   src="<%=path%>js/bootstrap-3.3.7.min.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=path%>css/bootstrap-3.3.7.min.css">
    <style type="text/css">
     body{TEXT-ALIGN: center;}
    </style>
</head>
<body>
<div style="height: 100%;width: 100%; margin:0 auto;">
<input type="text" id="query" placeholder="请输入管理员账号进行搜索" style="width:30.333%" />&nbsp;&nbsp;&nbsp;<button onclick="query()" class="layui-btn layui-btn-normal" style="width:10.333%" ><span class="layui-btn layui-btn-normal">搜索</span></button>


<!-- 按钮触发模态框 -->
<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">添加管理员</button>
<!-- 模态框（Modal） -->
  <form action="<%=path%>admin/addAdmin.action" method="POST">
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加管理员</h4>
            </div>
            <div class="modal-body"><label>管理员账号：</label> 
                                    <input type="text" name="userAccount" id="userAccount" value=""  /> </br> </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <input type="submit" class="btn btn-primary" value="保存">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</form>

<table class="layui-table" style="border-collapse:collapse;table-layout:fixed;"  width="50%" border="1">
  <thead>
    <tr>
      <th width="100px">管理员ID</th>
      <th width="100px">管理员账号</th>
      <th width="100px">状态</th>
      <th width="100px">角色名字</th>
      <th width="100px">操作</th>
      
    </tr> 
  </thead>
  <tbody id="ccc">
   <c:forEach items="${Flist}"  var="admin"> 

      
  <tr> 
  <td>${admin.userId}</td>
  <td >${admin.userAccount}</td>
  <td>
  <a class="btn btn-info" id="zzz" href="#"  onclick="changeState(${admin.userId},${admin.stateId},${num});return false;">${admin.stateName}</a>
  </td>
  <td>${admin.characterName}</td>
  <td>
  <a class="btn btn-danger  deleteBtn rightSize" id="yyy" href="#"  onclick="changeState(${admin.userId},3,${num});return false;" >删除</a>
  </td>
       
      
       
      
  </tr>

  </c:forEach>
  </tbody>


  
</table>
   <a class="btn btn-primary" href="#" onclick="lastPage();return false;" id="last">上一页</a>
     当前页：<a id="aaa">${num}</a>
     总页数：<a id="eee">${countPage}</a>
   <a class="btn btn-primary" href="#"  onclick="nextPage();return false;" id="next">下一页</a>
      第<input type="text" id="btn" size=2/>页<button onclick="selectPage()" class="layui-btn layui-btn-normal"><span >跳转</span></button>


</div>
<script type="text/javascript">
var number="${requestScope.num}"; 
var allPage="${requestScope.countPage}";

		$(window).load(function() {
			$("#last").removeAttr("onclick");   
			if(allPage==1){
				$("#next").removeAttr("onclick"); 
			}//等所有的js和图片加载完毕，才执行的方法
			});
function changeState(userId,stateId,number){
	var userAccount=document.getElementById("query").value;
	var page="page";
	number = $("#aaa").html();
	$.ajax({
		url:"<%=path%>admin/changeState.action",
		 data:"userId="+userId+"&stateId="+stateId+"&number="+number+"&userAccount="+userAccount+"&page="+page,
		 dataType:"json",
		 type:"post",
		 success:function(data){ 
			
			 allPage=data[2];
			 $("#ccc").empty();

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

	            	 $("#ccc").append("<tr><td>"+e.userId+"</td>"
	            			 +"<td>"+e.userAccount+"</td>"
	            			 +"<td>"
	            			 +"<a class='btn btn-info'id='zzz' href='#' onclick='changeState("+e.userId+","+e.stateId+","+num+");return false;'>"
	            			 +e.stateName+"</a>"
	            			 +"</td>"
	            			 +"<td>"+e.characterName+"</td>"
	            			 +"<td>"
	            			 +"<a class='btn btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+",3,"+num+");return false;'>"
	            			+"删除"+"</a>"
	            			 +"</td>"
	            			 +"</tr>");
	
	             
	             
	         }
	         if(number>=allPage-1){
	     		$("#next").removeAttr("onclick");
	     	}
	         if(number<=2){
	 			
	 			
	 			$("#last").removeAttr("onclick");


	 	   	 
	 	    }
	      
			  
			 
		 }
	 
	})
}	

function nextPage(){
	var userAccount=document.getElementById("query").value;
	
	number = $("#aaa").html();
	if(number>=allPage-1){
		$("#next").removeAttr("onclick");
	}
	$("#ccc").empty();

	var page="npage";
	$.ajax({	
		
		 url:"<%=path%>admin/selectPage.action",
		 data:"number="+number+"&page="+page+"&userAccount="+userAccount,
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
        
             $("#ccc").append("<tr><td>"+e.userId+"</td>"
        			 +"<td>"+e.userAccount+"</td>"
        			 +"<td>"
        			 +"<a class='btn btn-info'id='zzz' href='#' onclick='changeState("+e.userId+","+e.stateId+","+number+");return false;'>"
        			 +e.stateName+"</a>"
        			 +"</td>"
        		     +"<td>"+e.characterName+"</td>"
        			 +"<td>"
        			 +"<a class='btn btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+",3,"+number+");return false;'>"
        			+"删除"+"</a>"
        			 +"</td>" 
        			 +"</tr>");

             
         } 	
		 }
	 });
	
		$("#last").attr("onclick","lastPage();return false;");
		
		
	
}
	function lastPage(){
		var userAccount=document.getElementById("query").value;
		number = $("#aaa").html();
		$("#next").attr("onclick","nextPage();return false;");  
        if(number<=2){
			
			
			$("#last").removeAttr("onclick");


	   	 
	    }
		$("#ccc").empty();

		var page="tpage";
		$.ajax({	
			
			 url:"<%=path%>admin/selectPage.action",
			 data:"number="+number+"&page="+page+"&userAccount="+userAccount,
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

	             $("#ccc").append("<tr><td>"+e.userId+"</td>"
	        			 +"<td>"+e.userAccount+"</td>"
	        			 +"<td>"
	        			 +"<a class='btn btn-info'id='zzz' href='#' onclick='changeState("+e.userId+","+e.stateId+","+number+");return false;'>"
	        			 +e.stateName+"</a>"
	        			 +"</td>"
	        		     +"<td>"+e.characterName+"</td>"
	        			 +"<td>"
	        			 +"<a class='btn btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+",3,"+number+");return false;'>"
	        			+"删除"+"</a>"
	        			 +"</td>" 
	        			 +"</tr>");

	             
	             
	         } 	
			
			
			
			
			 }
		 });
		

	  
		
	    	
	    	
	    
	}
	function selectPage() {
	 	$("#next").attr("onclick","nextPage();return false;"); 
		var userAccount=document.getElementById("query").value;
		 number=$("#btn").val();
		 var page="page";
		 $("#ccc").empty();

		 $.ajax({	
			 url:"<%=path%>admin/selectPage.action",
			 data:"number="+number+"&page="+page+"&userAccount="+userAccount,
			 dataType:"json",
			 type:"post",
			 success:function(data){
				 number=data[1];
					
					allPage=data[2];
					 if(number==allPage){
						$("#next").removeAttr("onclick");
					} 
					$("#aaa").html(number);
					$("#eee").html(allPage);
					 var list=data[0];
			         var len = list.length;
			         
			         for(var i=0;i<len;i++){  
			        
			             var e = list[i];
		
			             $("#ccc").append("<tr><td>"+e.userId+"</td>"
			        			 +"<td>"+e.userName+"</td>"
			        			 +"<td>"
			        			 +"<a class='btn btn-info'id='zzz' href='#' onclick='changeState("+e.userId+","+e.stateId+","+number+");return false;'>"
			        			 +e.stateName+"</a>"
			        			 +"</td>"
			        		     +"<td>"+e.characterName+"</td>"
			        			 +"<td>"
			        			 +"<a class='btn btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+",3,"+number+");return false;'>"
			        			+"删除"+"</a>"
			        			 +"</td>" 
			        			 +"</tr>");
			             
			             
			         } 	
					
					
					
					
					 }
				 });
	}

function query(){
	
	 $("#last").removeAttr("onclick"); 
	  var userAccount=$("#query").val();
	 number=1;
	 var page="page";
	 $("#ccc").empty();
	 $.ajax({	
		 url:"<%=path%>admin/selectPage.action",
		 data:"number="+number+"&page="+page+"&userAccount="+userAccount,
		 dataType:"json",
		 type:"post",
		 success:function(data){
			
			 number=data[1];
				allPage=data[2];
				$("#aaa").html(number);
				$("#eee").html(allPage);
				if(number==allPage){
					 $("#next").removeAttr("onclick"); 
				}
			 	 var list=data[0];
		         var len = list.length;
		         
		         for(var i=0;i<len;i++){  
		        
		             var e = list[i];
		 	        
		            
		  
		             $("#ccc").append("<tr><td>"+e.userId+"</td>"
	            			 +"<td>"+e.userAccount+"</td>"
	            			 +"<td>"
	            			 +"<a class='btn btn-info'id='zzz' href='#' onclick='changeState("+e.userId+","+e.stateId+","+number+");return false;'>"
	            			 +e.stateName+"</a>"
	            			 +"</td>"
	            			 +"<td>"+e.characterName+"</td>"
	            			 +"<td>"
	            			 +"<a class='btn btn-danger'id='zzz' href='#' onclick='changeState("+e.userId+",3,"+number+");return false;'>"
	            			+"删除"+"</a>"
	            			 +"</td>"
	            			 +"</tr>");
		     
		             
		             
		         } 	  
				
				
				
				
				 }
			 });
}



</script>


</body>
</html>