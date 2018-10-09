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
<title>需求管理页</title>

    <script type="text/javascript" src="<%=path%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>plugins/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=path%>plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path%>css/global.css" media="all">
    <link rel="stylesheet" href="<%=path%>laydate/theme/default/laydate.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
   <!--  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<%=path%>css/bootstrap.css">
    


 <style type="text/css">

        body{TEXT-ALIGN: center;}

    </style>
</head>
<body>
<div style="height: 50%;width: 95%; margin:0 auto;">
  <input type="text" id="query" placeholder="请输入需求标题进行搜索" style="width:30.333%" />&nbsp;&nbsp;&nbsp;<button onclick="query()" class="layui-btn layui-btn-normal" style="width:10.333%" ><span class="layui-btn layui-btn-normal">搜索</span></button>
<!-- </form> -->
<table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
    
      <th>需求ID</th>
      <th>需求标题</th>
      <th>需求详情</th>
      <th>需求状态</th>
      <th>操作</th>
             
    </tr> 
  </thead>
 
  <tr> 
  <tbody id="ddd">
   <c:forEach items="${Flist}"  var="demand">      
   <tr>
  <td>${demand.demandId}</td>
  <td>${demand.demandTitle}</td>
       <td> 
      <input type="button" class="btn btn-primary" data-toggle="modal" data-target="#Revert" onClick="Values(${demand.demandId})" value="查看详情"/>
      <td>${demand.parameterName}</td>  
     <td>
      <a class="btn btn-info" id="success" href="#"  onclick="changeState(${demand.demandId},1,${num});return false;" >审核通过</a>
       <a class="btn btn-danger" id="fail" href="#"  onclick="changeState(${demand.demandId},2,${num});return false;" >违规下架</a>    
     <a class="btn btn-success" id="delete" href="#"  onclick="changeState(${demand.demandId},3,${num});return false;" >删除需求</a>
      <input type="button" class="btn btn-primary" data-toggle="modal" data-target="#Revert2" onClick="Values2(${demand.demandId})" value="编辑需求"/>	      
       </td>      
        </tr>
        </c:forEach>
  </tbody>  



      
   <div class="modal fade" id="Revert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
                                <div class="modal-dialog">    
                                    <div class="modal-content">          
                                      <div class="modal-header" style="text-align:center;"> 
                                       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>         
                                            <h4 class="modal-title" id="myModalLabel">    查看需求详情  </h4>
                                      </div>          
                               
                                 <div class="modal-body" align="center">          
                                 <label>需求ID：</label>        
                                   <input type="text" name="demandId" id="demandId" value="" readonly="readonly"/></br>
                                  <label>需求详细信息：</label>        
                                   <input type="text" name="demandDetailInformation" id="demandDetailInformation" value="" readonly="readonly" /> </br>
                                    <label>需求类型：</label>        
                                   <input type="text" name="parameterId" id="parameterId" value="" readonly="readonly"/>  </br> 
                                    <label>需求发起人：</label>        
                                   <input type="text" name="fromUserId" id="fromUserId" value="" readonly="readonly"/> </br>
                                    <label>需求接收人：</label>        
                                   <input type="text" name="toUserId" id="toUserId" value=""readonly="readonly" /> </br>
                                    <label>需求发布时间：</label>        
                                   <input type="text" name="publishTime" id="publishTime" value="" readonly="readonly"/></br>
                                     <label>押金：</label>        
                                   <input type="text" name="securityMoney" id="securityMoney" value="" readonly="readonly"/>  </br>
                                    <label>佣金：</label>        
                                   <input type="text" name="dealMoney" id="dealMoney" value="" readonly="readonly"/></br> 
                                    <label>完成时间：</label>        
                                   <input type="text" name="completeTime" id="completeTime" value=""readonly="readonly" /> </br>
                                    <label>拍卖时间：</label>        
                                   <input type="text" name="auctionTime" id="auctionTime" value="" readonly="readonly"/></br>
                                    <label>需求状态：</label>        
                                   <input type="text" name="stateId" id="stateId" value="" readonly="readonly"/> </br>
                                   <label>需求图片：</label>        
                                   <input type="text" name="demandHead" id="demandHead" value="" readonly="readonly"/> </br>    
                                   
                                   
                                         
                                 <!--   <input type="hidden" name="depid" id="depid" value="" />   -->  
                                 </div>        
                                  
                                 
                          </div><!-- /.modal-content -->  
                           </div><!-- /.modal -->
                           </div>


<form action="<%=path%>demand/changeInfo.action" method="POST">
 <div class="modal fade" id="Revert2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
                                <div class="modal-dialog">    
                                    <div class="modal-content">          
                                      <div class="modal-header" style="text-align:center;"> 
                                       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>         
                                            <h4 class="modal-title" id="myModalLabel">    编辑需求  </h4>
                                      </div>          
                               
                                 <div class="modal-body" align="center">          
                                 <label>需求ID：</label>        
                                   <input type="text" name="demandId2" id="demandId2" value="" readonly="readonly"/></br>
                                  <label>需求详细信息：</label>        
                                   <input type="text" name="demandDetailInformation2" id="demandDetailInformation2" value="" /> </br>
                                    <label>需求类型：</label>        
                                   <input type="text" name="parameterId2" id="parameterId2" value="" readonly="readonly"/>  </br> 
                                    <label>需求发起人：</label>        
                                   <input type="text" name="fromUserId2" id="fromUserId2" value="" readonly="readonly"/> </br>
                                    <label>需求接收人：</label>        
                                   <input type="text" name="toUserId2" id="toUserId2" value="" readonly="readonly" /> </br>
                                    <label>需求发布时间：</label>        
                                   <input type="text" name="publishTime2" id="publishTime2" value="" readonly="readonly"/></br>
                                     <label>押金：</label>        
                                   <input type="text" name="securityMoney2" id="securityMoney2" value="" />  </br>
                                    <label>佣金：</label>        
                                   <input type="text" name="dealMoney2" id="dealMoney2" value="" /></br> 
                                    <label>完成时间：</label>        
                                   <input type="text" name="completeTime2" id="completeTime2" value="" /> </br>
                                    <label>拍卖时间：</label>        
                                   <input type="text" name="auctionTime2" id="auctionTime2" value="" /></br>
                                    <label>需求状态：</label>        
                                   <input type="text" name="stateId2" id="stateId2" value="" readonly="readonly"/> </br>
                                   <label>需求图片：</label>        
                                   <input type="text" name="demandHead2" id="demandHead2" value="" /> </br>    
                                   
                                   
                                         
                                 <!--   <input type="hidden" name="depid" id="depid" value="" />   -->  
                                 </div>        
                          <div class="modal-footer text-center">       
                    <input type="submit" class="btn btn-default btn_blue" value="保存">        
                       <button type="button" class="btn btn-default btn_red" data-dismiss="modal">取消</button>    
                           </div>               
                                 
                          </div><!-- /.modal-content -->  
                           </div><!-- /.modal -->
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
function changeState(demandId,stateId,number){
	var page="page";
	var demandTitle=document.getElementById("query").value;
	number = $("#aaa").html();
	 $.ajax({
		url:"<%=path%>demand/changeState.action",
		 data:"demandId="+demandId+"&stateId="+stateId+"&number="+number+"&demandTitle="+demandTitle+"&page="+page,
		 dataType:"json",
		 type:"post",
		 success:function(data){ 
			
			 allPage=data[2];
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
	 
	             $("#ddd").append("<tr><td>"+e.demandId+"</td>"
            			 +"<td>"+e.demandTitle+"</td>"
            			 +"<td>"
            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.demandId+")'value='查看详情'>"
            			 +"</td>"
            			 +"<td>"+e.parameterName+"</td>"
            			 +"<td>"
            			 +"<a class='btn btn-info'id='success' href='#' onclick='changeState("+e.demandId+",1,"+number+");return false;'>"
             			+"审核通过"+"</a>"
             			 +"<a class='btn btn-danger'id='fail' href='#' onclick='changeState("+e.demandId+",2,"+number+");return false;'>"
             			+"违规下架"+"</a>"
            			 +"<a class='btn btn-success'id='zzz' href='#' onclick='changeState("+e.demandId+",3,"+number+");return false;'>"
            			+"删除需求"+"</a>"
            			+"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.demandId+")'value='编辑需求'>"
            			 +"</td>"
            			 +"</tr>");
	             
	             
	
	         }
	      
			  
			 
		 }
	 
	}) 
}	

function nextPage(){
	$("#next").attr("onclick","nextPage();return false;");
	$("#last").attr("onclick","lastPage();return false;");
	var demandTitle=document.getElementById("query").value;
	
	number = $("#aaa").html();
	$("#ddd").empty();
	var page="npage";
	$.ajax({	
		
		 url:"<%=path%>demand/selectPage.action",
		 data:"number="+number+"&page="+page+"&demandTitle="+demandTitle,
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
             
             $("#ddd").append("<tr><td>"+e.demandId+"</td>"
        			 +"<td>"+e.demandTitle+"</td>"
        			 +"<td>"
        			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.demandId+")'value='查看详情'>"
        			 +"</td>"
        			 +"<td>"+e.parameterName+"</td>"
        			 +"<td>"
        			 +"<a class='btn btn-info'id='zzz' href='#' onclick='changeState("+e.demandId+",1,"+number+");return false;'>"
         			+"审核通过"+"</a>"
         			 +"<a class='btn btn-danger'id='zzz' href='#' onclick='changeState("+e.demandId+",2,"+number+");return false;'>"
         			+"违规下架"+"</a>"
        			 +"<a class='btn btn-success'id='zzz' href='#' onclick='changeState("+e.demandId+",3,"+number+");return false;'>"
        			+"删除需求"+"</a>"
        			+"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.demandId+")'value='编辑需求'>"
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
		var demandTitle=document.getElementById("query").value;
		number = $("#aaa").html();
		
		$("#ddd").empty();
		var page="tpage";
		$.ajax({	
			
			 url:"<%=path%>demand/selectPage.action",
			 data:"number="+number+"&page="+page+"&demandTitle="+demandTitle,
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
	         
	             $("#ddd").append("<tr><td>"+e.demandId+"</td>"
            			 +"<td>"+e.demandTitle+"</td>"
            			 +"<td>"
            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.demandId+")'value='查看详情'>"
            			 +"</td>"
            			 +"<td>"+e.parameterName+"</td>"
            			 +"<td>"
            			 +"<a class='btn btn-info'id='zzz' href='#' onclick='changeState("+e.demandId+",1,"+number+");return false;'>"
             			+"审核通过"+"</a>"
             			 +"<a class='btn btn-danger'id='zzz' href='#' onclick='changeState("+e.demandId+",2,"+number+");return false;'>"
             			+"违规下架"+"</a>"
            			 +"<a class='btn btn-success'id='zzz' href='#' onclick='changeState("+e.demandId+",3,"+number+");return false;'>"
            			+"删除需求"+"</a>"
            			+"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.demandId+")'value='编辑需求'>"
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
		
		var demandTitle=document.getElementById("query").value;
		
		 number=$("#btn").val();
		 
		 var page="page";
		 $("#ddd").empty();
		 $.ajax({	
			 url:"<%=path%>demand/selectPage.action",
			 data:"number="+number+"&page="+page+"&demandTitle="+demandTitle,
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
			           
			             $("#ddd").append("<tr><td>"+e.demandId+"</td>"
		            			 +"<td>"+e.demandTitle+"</td>"
		            			 +"<td>"
		            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.demandId+")'value='查看详情'>"
		            			 +"</td>"
		            			 +"<td>"+e.parameterName+"</td>"
		            			 +"<td>"
		            			 +"<a class='btn btn-info'id='zzz' href='#' onclick='changeState("+e.demandId+",1,"+number+");return false;'>"
		             			+"审核通过"+"</a>"
		             			 +"<a class='btn btn-danger'id='zzz' href='#' onclick='changeState("+e.demandId+",2,"+number+");return false;'>"
		             			+"违规下架"+"</a>"
		            			 +"<a class='btn btn-success'id='zzz' href='#' onclick='changeState("+e.demandId+",3,"+number+");return false;'>"
		            			+"删除需求"+"</a>"
		            			+"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.demandId+")'value='编辑需求'>"
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
	  var demandTitle=$("#query").val();
	 number=1;
	 var page="page";
	 $("#ddd").empty();
	 $.ajax({	
		 url:"<%=path%>demand/selectPage.action",
		 data:"number="+number+"&page="+page+"&demandTitle="+demandTitle,
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
		            
		             $("#ddd").append("<tr><td>"+e.demandId+"</td>"
	            			 +"<td>"+e.demandTitle+"</td>"
	            			 +"<td>"
	            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.demandId+")'value='查看详情'>"
	            			 +"</td>"
	            			 +"<td>"+e.parameterName+"</td>"
	            			 +"<td>"
	            			 +"<a class='btn btn-info'id='zzz' href='#' onclick='changeState("+e.demandId+",1,"+number+");return false;'>"
	             			+"审核通过"+"</a>"
	             			 +"<a class='btn btn-danger'id='zzz' href='#' onclick='changeState("+e.demandId+",2,"+number+");return false;'>"
	             			+"违规下架"+"</a>"
	            			 +"<a class='btn btn-success'id='zzz' href='#' onclick='changeState("+e.demandId+",3,"+number+");return false;'>"
	            			+"删除需求"+"</a>"
	            			+"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.demandId+")'value='编辑需求'>"
	            			 +"</td>"
	            			 +"</tr>");
		             
		             
		             if(number>=allPage){
		            	 $("#next").removeAttr("onclick");	
		        	    }else if(number==1){
		        	    	$("#last").removeAttr("onclick");
		        	    }
		         } 	
				
				
				
				
				 }
			 });
}


</script>
 
<script type="text/javascript">   
$("#Revert").modal("hide");
function Values(demandId){       
	$("#demandId").val(demandId);
	 $.ajax({	
		 url:"<%=path%>demand/findById.action",
		 data:"demandId="+demandId,
		 dataType:"json",
		 type:"post",
		 success:function(data){
			 var list=data[4];
			 var fromUserName=data[0];
			 var toUserName=data[1];
			 var parameterName=data[2];
			 var stateName=data[3];
	         var len = list.length;
	         
	         for(var i=0;i<len;i++){  
	     
	             var e = list[i];
	             $('#demandDetailInformation').val(e.demandDetaIlinformation);
	             $('#parameterId').val(parameterName);
	             $('#fromUserId').val(fromUserName);
	             $('#toUserId').val(toUserName);
	             $('#publishTime').val(e.publishTime);
	             $('#securityMoney').val(e.securityMoney);
	             $('#dealMoney').val(e.dealMoney);
	             $('#completeTime').val(e.completeTime);
	             $('#auctionTime').val(e.auctionTime);
	             $('#stateId').val(stateName);
	             $('#demandHead').val(e.demandHead);
	            
	             
                 
                         
                     
                 
	         }
		 }
	 }); 
}
	   
</script>
<script type="text/javascript">   
$("#Revert2").modal("hide");
function Values2(demandId){       
	$("#demandId2").val(demandId);
	 $.ajax({	
		 url:"<%=path%>demand/findById.action",
		 data:"demandId="+demandId,
		 dataType:"json",
		 type:"post",
		 success:function(data){
			 var list=data[4];
			 var fromUserName=data[0];
			 var toUserName=data[1];
			 var parameterName=data[2];
			 var stateName=data[3];
	         var len = list.length;
	         
	         for(var i=0;i<len;i++){  
	        
	             var e = list[i];
	             $('#demandDetailInformation2').val(e.demandDetailInformation);
	             $('#parameterId2').val(parameterName);
	             $('#fromUserId2').val(fromUserName);
	             $('#toUserId2').val(toUserName);
	             $('#publishTime2').val(e.publishTime);
	             $('#securityMoney2').val(e.securityMoney);
	             $('#dealMoney2').val(e.dealMoney);
	             $('#completeTime2').val(e.completeTime);
	             $('#auctionTime2').val(e.auctionTime);
	             $('#stateId2').val(stateName);
	             $('#demandHead2').val(e.demandHead);
	            
	             
                 
                         
                     
                 
	         }
		 }
	 }); 
}
	   
</script>




</body>
</html>