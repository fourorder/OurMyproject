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
<title>服务商类型管理页</title>

    <script type="text/javascript" src="<%=path%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>plugins/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=path%>plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path%>css/global.css" media="all">
    <link rel="stylesheet" href="<%=path%>laydate/theme/default/laydate.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <%-- <link rel="stylesheet" href="<%=path%>css/bootstrap.css">
	<script type="text/javascript" src="<%=path%>js/jquery.min.js"></script>
    <script type="text/javascript"   src="<%=path%>js/bootstrap.min.js"></script> --%>
    <script type="text/javascript" src="<%=path%>js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript"   src="<%=path%>js/bootstrap-3.3.7.min.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=path%>css/bootstrap-3.3.7.min.css">
    


 <style type="text/css">

        body{TEXT-ALIGN: center;}

    </style>
</head>
<body>
<div style="height: 50%;width: 95%; margin:0 auto;">
<input type="text" id="query" placeholder="请输入服务商类型进行搜索" style="width:30.333%" />&nbsp;&nbsp;&nbsp;<button onclick="query()" class="layui-btn layui-btn-normal" style="width:10.333%" ><span class="layui-btn layui-btn-normal">搜索</span></button>
   <input type="button" class="btn btn-primary" data-toggle="modal" data-target="#Revert3" onClick="Values2(0)" value="添加服务商类型"/>	
<table class="layui-table" style="border-collapse:collapse;table-layout:fixed;width:500px;margin:auto;"   border="1">
<%--   <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup> --%>
  <thead>
    <tr>   
      <th width="150px">服务商类型ID</th>
      <th width="150px">服务商类型名字</th>
   <!--    <th>服务商类型父ID</th> -->
      <th width="150px">操作</th>        
    </tr> 
  </thead>
  <tr>        
  <tbody id="ccc">
   <c:forEach items="${Flist}"  var="serviceProviderType">     
  <tr>
  <td>${serviceProviderType.parameterId}</td>
  <td>${serviceProviderType.parameterName}</td>
<%--   <td>${serviceProviderType.pId}</td> --%>
  <td><a class="layui-btn layui-btn-sm layui-btn-danger" id="yyy" href="#"  onclick="changeState(${serviceProviderType.parameterId},${num});return false;" >删除</a></td>
  </tr>
  </c:forEach>
  </tbody>

   
  <form action="<%=path%>serviceProviderType/addServiceProviderType.action" method="POST">
 <div class="modal fade" id="Revert3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
                                <div class="modal-dialog">    
                                    <div class="modal-content">          
                                      <div class="modal-header" style="text-align:center;"> 
                                       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>         
                                            <h4 class="modal-title" id="myModalLabel">    添加服务商类型  </h4>
                                      </div>                                        
                                 <div class="modal-body" align="center">           
                                   <input type="hidden" name="parameterId3" id="parameterId3" value="" /></br>
                                    <label>服务商类型：</label>        
                                  <input type="text" name="parameterName3" id="parameterName3" value="" />     
                                 </div>        
                          <div class="modal-footer text-center">       
                    <input type="submit" class="btn btn-default btn_blue" value="保存">        
                       <button type="button" class="btn btn-default btn_red" data-dismiss="modal">取消</button>    
                           </div>               
                           </div>  
                           </div>
                           </div>
                            </form>
</table>
<a class="btn btn-primary" href="#" onclick="lastPage();return false;" id="last">上一页</a>
  当前页：<a id="aaa">${num}</a>
          总页数：<a id="eee">${countPage}</a>
     第<input type="text" id="btn" size=2/>页<button onclick="selectPage()" class="layui-btn layui-btn-normal"><span >跳转</span></button>  
   <a class="btn btn-primary" href="#"  onclick="nextPage();return false;" id="next">下一页</a>
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
function changeState(parameterId,number){
	
	 number = $("#aaa").html();
	var parameterName=document.getElementById("query").value;
	var page="page";
	
	$.ajax({
		url:"<%=path%>serviceProviderType/changeState.action",
		 data:"parameterId="+parameterId+"&number="+number+"&parameterName="+parameterName+"&page="+page,
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
	            	 $("#ccc").append("<tr><td>"+e.parameterId+"</td>"
	            			 +"<td>"+e.parameterName+"</td>"
	            			/*  +"<td>"+e.pId+"</td>" */
	            			 +"<td>"
	            			 +"<a class='btn btn-danger'id='yyy' href='#' onclick='changeState("+e.parameterId+","+number+");return false;'>"
	             			+"删除"+"</a>"
	            			 +"</td>"
	            			 +"</tr>");
	         } 
		 }
			  
			 
	 
	}) 
}	

function nextPage(){
	$("#next").attr("onclick","nextPage();return false;");
	$("#last").attr("onclick","lastPage();return false;");
	var parameterName=document.getElementById("query").value;
	
	number = $("#aaa").html();
	$("#ccc").empty();
	var page="npage";
	$.ajax({	
		
		 url:"<%=path%>serviceProviderType/selectPage.action",
		 data:"number="+number+"&page="+page+"&parameterName="+parameterName,
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
             $("#ccc").append("<tr><td>"+e.parameterId+"</td>"
        			 +"<td>"+e.parameterName+"</td>"
        			 /* +"<td>"+e.pId+"</td>" */
        			 +"<td>"
        			 +"<a class='btn btn-danger'id='yyy' href='#' onclick='changeState("+e.parameterId+","+number+");return false;'>"
         			+"删除"+"</a>"
        			 +"</td>"
        			 +"</tr>");
             if(number==allPage){
            	 $("#next").removeAttr("onclick");	
        	    }else if(number==1){
        	    	$("#last").removeAttr("onclick");
        	    }
             
         } 	
		 }
	 });
	
		
	
}
	function lastPage(){
		$("#next").attr("onclick","nextPage();return false;");
		$("#last").attr("onclick","lastPage();return false;");
		var parameterName=document.getElementById("query").value;
		number = $("#aaa").html();
		
		
		$("#ccc").empty();
		var page="tpage";
		$.ajax({	
			
			 url:"<%=path%>serviceProviderType/selectPage.action",
			 data:"number="+number+"&page="+page+"&parameterName="+parameterName,
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
	         
	             $("#ccc").append("<tr><td>"+e.parameterId+"</td>"
	        			 +"<td>"+e.parameterName+"</td>"
	        			/*  +"<td>"+e.pId+"</td>" */
	        			 +"<td>"
	        			 +"<a class='btn btn-danger'id='yyy' href='#' onclick='changeState("+e.parameterId+","+number+");return false;'>"
	         			+"删除"+"</a>"
	        			 +"</td>"
	        			 +"</tr>");
	         } 	
			
	         if(number==allPage){
            	 $("#next").removeAttr("onclick");	
        	    }else if(number==1){
        	    	$("#last").removeAttr("onclick");
        	    }
			
			
			 }
		 });
		
	    	
	    
	}
	function selectPage() {
		$("#next").attr("onclick","nextPage();return false;");
		$("#last").attr("onclick","lastPage();return false;");
		var parameterName=document.getElementById("query").value;
	
		 number=$("#btn").val();
	
		 var page="page";
	
		 $("#ccc").empty();
		 $.ajax({	
			 url:"<%=path%>serviceProviderType/selectPage.action",
			 data:"number="+number+"&page="+page+"&parameterName="+parameterName,
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
			           
			             $("#ccc").append("<tr><td>"+e.parameterId+"</td>"
			        			 +"<td>"+e.parameterName+"</td>"
			        			 /* +"<td>"+e.pId+"</td>" */
			        			 +"<td>"
			        			 +"<a class='btn btn-danger'id='yyy' href='#' onclick='changeState("+e.parameterId+","+number+");return false;'>"
			         			+"删除"+"</a>"
			        			 +"</td>"
			        			 +"</tr>");
			             
			             
			             
			         } 	
					
					
					
					
					 }
				 }); 
		 if(number>=allPage){
	    	 $("#next").removeAttr("onclick");	
		    }else if(number==1){
		    	$("#last").removeAttr("onclick");
		    }
	}
function query(){
	$("#next").attr("onclick","nextPage();return false;");
	$("#last").attr("onclick","lastPage();return false;");
	  var parameterName=$("#query").val();
	 number=1;
	 var page="page";
	
	 $("#ccc").empty();
	 $.ajax({	
		 url:"<%=path%>serviceProviderType/selectPage.action",
		 data:"number="+number+"&page="+page+"&parameterName="+parameterName,
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
		            
		             $("#ccc").append("<tr><td>"+e.parameterId+"</td>"
		        			 +"<td>"+e.parameterName+"</td>"
		        			/*  +"<td>"+e.pId+"</td>" */
		        			 +"<td>"
		        			 +"<a class='btn btn-danger'id='yyy' href='#' onclick='changeState("+e.parameterId+","+number+");return false;'>"
		         			+"删除"+"</a>"
		        			 +"</td>"
		        			 +"</tr>");
		           
		             if(number>=allPage){
		            	 $("#next").removeAttr("onclick");	
		        	    }
		             if(number==1){	
		        	    	$("#last").removeAttr("onclick");
		        	    }   
		         } 		
				 }
			 });
}
</script>
<script type="text/javascript">   
$("#Revert3").modal("hide");
function Values3(parameterId3){       
	 $("#parameterId3").val(parameterId3); 
}	   
</script>
</body>
</html>