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
<title>友情链接配置页</title>

    <script type="text/javascript" src="<%=path%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>plugins/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=path%>plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path%>css/global.css" media="all">
    <link rel="stylesheet" href="<%=path%>laydate/theme/default/laydate.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
  友情链接名字：<input type="text" id="query" /><button onclick="query()"><span class="layui-btn layui-btn-normal">查询</span></button>
   <input type="button" class="btn btn-primary" data-toggle="modal" data-target="#Revert3" onClick="Values2(0)" value="添加友情链接"/>	
<!-- </form> -->
<table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
    
      <th>友情链接ID</th>
      <th>友情链接状态</th>
      <th>友情链接详情</th>
      <th>操作</th>
             
    </tr> 
  </thead>
 
  <tr> 
 
        
         
        
  <tbody id="ccc">
   <c:forEach items="${Flist}"  var="line"> 

      
  <tr>
  <td>${line.lineId}</td>
  <td><a class="layui-btn layui-btn-sm layui-btn-danger" id="yyy" href="#"  onclick="changeState(${line.lineId},${line.lineState},${num});return false;" >${line.parameterName}</a></td>
  <td><input type="button" class="btn btn-primary" data-toggle="modal" data-target="#Revert" onClick="Values(${line.lineId})" value="查看详情"/></td>
  <td><a class="layui-btn layui-btn-sm layui-btn-danger" id="yyy" href="#"  onclick="changeState(${line.lineId},3,${num});return false;" >删除友情链接</a>
      <input type="button" class="btn btn-primary" data-toggle="modal" data-target="#Revert2" onClick="Values2(${line.lineId})" value="编辑友情链接"/>	
  </td>     
  </tr>
        </c:forEach>
  </tbody>
        
         <tr>
   <td colspan="2"><a class="layui-btn layui-btn-sm" href="#" onclick="lastPage();return false;" id="last">上一页</a></td>
   <td >当前页：<a id="aaa">${num}</a><br>
          总页数：<a id="eee">${countPage}</a><br>
     第<input type="text" id="btn" size=2/>页<button onclick="selectPage()"><span class="layui-btn layui-btn-normal">跳转</span></button>
   
   
   </td>
   <td colspan="2"><a class="layui-btn layui-btn-sm" href="#"  onclick="nextPage();return false;" id="next">下一页</a></td>
   </tr>
      
   <div class="modal fade" id="Revert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
                                <div class="modal-dialog">    
                                    <div class="modal-content">          
                                      <div class="modal-header" style="text-align:center;"> 
                                       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>         
                                            <h4 class="modal-title" id="myModalLabel">    查看友情链接详情  </h4>
                                      </div>          
                               
                                 <div class="modal-body" align="center">          
                                 <label>友情链接ID：</label>        
                                   <input type="text" name="lineId" id="lineId" value="" readonly="readonly"/></br>
                                    <label>友情链接名字：</label> 
                                    <input type="text" name="lineName" id="lineName" value="" readonly="readonly" /> </br>  
                                    <label>友情链接地址：</label> 
                                    <input type="text" name="lineAddress" id="lineAddress" value="" readonly="readonly" /> </br>    
                                 
                                     <label>友情链接状态状态：</label>        
                                   <input type="text" name="lineState" id="lineState" value="" readonly="readonly"/>  </br>  
                                 </div>        
                                  
                                 
                          </div><!-- /.modal-content -->  
                           </div><!-- /.modal -->
                           </div>


<form action="<%=path%>line/changeInfo.action" method="POST">
 <div class="modal fade" id="Revert2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
                                <div class="modal-dialog">    
                                    <div class="modal-content">          
                                      <div class="modal-header" style="text-align:center;"> 
                                       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>         
                                            <h4 class="modal-title" id="myModalLabel">    编辑友情链接  </h4>
                                      </div>          
                               
                                 <div class="modal-body" align="center">          
                                 <label>友情链接ID：</label>        
                                   <input type="text" name="lineId2" id="lineId2" value="" readonly="readonly"/></br>
                                    <label>友情链接名字：</label> 
                                    <input type="text" name="lineName2" id="lineName2" value=""  /> </br>  
                                    <label>友情链接地址：</label> 
                                    <input type="text" name="lineAddress2" id="lineAddress2" value=""  /> </br>    
                                 
                                     <label>友情链接状态状态：</label>        
                                   <input type="text" name="lineState2" id="lineState2" value="" readonly="readonly"/>  </br>  
                                   <input type="hidden" name="state2" id="state2" value="">    
                                   
                                   
                                         
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

  
  <form action="<%=path%>line/addRule.action" method="POST">
 <div class="modal fade" id="Revert3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
                                <div class="modal-dialog">    
                                    <div class="modal-content">          
                                      <div class="modal-header" style="text-align:center;"> 
                                       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>         
                                            <h4 class="modal-title" id="myModalLabel">    添加友情链接  </h4>
                                      </div>          
                               
                                 <div class="modal-body" align="center">          
                                    
                                   
                                    
                                   <input type="hidden" name="introductionId3" id="introductionId3" value="" /></br>
                                    <label>友情链接名字：</label> 
                                    <input type="text" name="lineName3" id="lineName3" value=""  /> </br>  
                                    <label>友情链接地址：</label> 
                                    <input type="text" name="lineAddress3" id="lineAddress3" value=""  /> </br>    
                                      
                                     
                                   
                                   
                                         
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
function changeState(lineId,lineState,number){
	
	 number = $("#aaa").html();
	var lineName=document.getElementById("query").value;
	var page="page";
	
	$.ajax({
		url:"<%=path%>line/changeState.action",
		 data:"lineId="+lineId+"&lineState="+lineState+"&number="+number+"&lineName="+lineName+"&page="+page,
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
	             
	            	 $("#ccc").append("<tr><td>"+e.lineId+"</td>"
	            			 
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.lineId+","+e.lineState+","+number+");return false;'>"
	            			                                                                       
	              			 +e.parameterName+"</a>"
	            			 +"<td>"
	            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.lineId+")'value='查看详情'>"
	            			 +"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.lineId+",3,"+number+");return false;'>"
	             			+"删除友情链接"+"</a>"
	            			+"<input type='button' class='btn btn-primary' data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.lineId+")'value='编辑友情链接'>"
	            			 +"</td>"
	            			 +"</tr>");
	         } 
		 }
			  
			 
	 
	}) 
}	

function nextPage(){
	$("#next").attr("onclick","nextPage();return false;");
	$("#last").attr("onclick","lastPage();return false;");
	var lineName=document.getElementById("query").value;
	
	number = $("#aaa").html();
	$("#ccc").empty();
	var page="npage";
	$.ajax({	
		
		 url:"<%=path%>line/selectPage.action",
		 data:"number="+number+"&page="+page+"&lineName="+lineName,
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
             $("#ccc").append("<tr><td>"+e.lineId+"</td>"
        			 
        			 +"<td>"
        			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.lineId+","+e.lineState+","+number+");return false;'>"
        			                                                                       
          			 +e.parameterName+"</a>"
        			 +"<td>"
        			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.lineId+")'value='查看详情'>"
        			 +"</td>"
        			 +"<td>"
        			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.lineId+",3,"+number+");return false;'>"
         			+"删除友情链接"+"</a>"
        			+"<input type='button' class='btn btn-primary' data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.lineId+")'value='编辑友情链接'>"
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
		var lineName=document.getElementById("query").value;
		number = $("#aaa").html();
		
		
		$("#ccc").empty();
		var page="tpage";
		$.ajax({	
			
			 url:"<%=path%>line/selectPage.action",
			 data:"number="+number+"&page="+page+"&lineName="+lineName,
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
	         
	             $("#ccc").append("<tr><td>"+e.lineId+"</td>"
            			 
            			 +"<td>"
            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.lineId+","+e.lineState+","+number+");return false;'>"
            			                                                                       
              			 +e.parameterName+"</a>"
            			 +"<td>"
            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.lineId+")'value='查看详情'>"
            			 +"</td>"
            			 +"<td>"
            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.lineId+",3,"+number+");return false;'>"
             			+"删除友情链接"+"</a>"
            			+"<input type='button' class='btn btn-primary' data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.lineId+")'value='编辑友情链接'>"
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
		var lineName=document.getElementById("query").value;
	
		 number=$("#btn").val();
	
		 var page="page";
	
		 $("#ccc").empty();
		 $.ajax({	
			 url:"<%=path%>line/selectPage.action",
			 data:"number="+number+"&page="+page+"&lineName="+lineName,
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
			           
			             $("#ccc").append("<tr><td>"+e.lineId+"</td>"
		            			 
		            			 +"<td>"
		            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.lineId+","+e.lineState+","+number+");return false;'>"
		            			                                                                       
		              			 +e.parameterName+"</a>"
		            			 +"<td>"
		            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.lineId+")'value='查看详情'>"
		            			 +"</td>"
		            			 +"<td>"
		            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.lineId+",3,"+number+");return false;'>"
		             			+"删除友情链接"+"</a>"
		            			+"<input type='button' class='btn btn-primary' data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.lineId+")'value='编辑友情链接'>"
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
	  var lineName=$("#query").val();
	 number=1;
	 var page="page";
	
	 $("#ccc").empty();
	 $.ajax({	
		 url:"<%=path%>line/selectPage.action",
		 data:"number="+number+"&page="+page+"&lineName="+lineName,
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
		            
		             $("#ccc").append("<tr><td>"+e.lineId+"</td>"
	            			 
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.lineId+","+e.lineState+","+number+");return false;'>"
	            			                                                                       
	              			 +e.parameterName+"</a>"
	            			 +"<td>"
	            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.lineId+")'value='查看详情'>"
	            			 +"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.lineId+",3,"+number+");return false;'>"
	             			+"删除友情链接"+"</a>"
	            			+"<input type='button' class='btn btn-primary' data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.lineId+")'value='编辑友情链接'>"
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
$("#Revert").modal("hide");
function Values(lineId){       
	$("#lineId").val(lineId);
	 $.ajax({	
		 url:"<%=path%>line/findById.action",
		 data:"lineId="+lineId,
		 dataType:"json",
		 type:"post",
		 success:function(data){
			 var list=data[0];
	         var len = list.length;
	         
	         for(var i=0;i<len;i++){  
	        
	             var e = list[i];
	             $('#lineName ').val(e.lineName );
	             $('#lineAddress ').val(e.lineAddress );
	             $('#lineState').val(e.parameterName );
	            
	             
	             
	            
	             
                 
                         
                     
                 
	         }
		 }
	 }); 
}
	   
</script>
<script type="text/javascript">   
$("#Revert2").modal("hide");
function Values2(lineId){       
	$("#lineId2").val(lineId);
	 $.ajax({	
		 url:"<%=path%>line/findById.action",
		 data:"lineId="+lineId,
		 dataType:"json",
		 type:"post",
		 success:function(data){
			 var list=data[0];
	         var len = list.length;
	         
	         for(var i=0;i<len;i++){  
	        
	             var e = list[i];
	             $('#lineName2 ').val(e.lineName );
	             $('#lineAddress2 ').val(e.lineAddress );
	             $('#lineState2').val(e.parameterName );
	             $('#state2').val(e.lineState);
	             
	             
	            
	             
	            
	             
                 
                         
                     
                 
	         }
		 }
	 }); 
}
	   
</script>

<script type="text/javascript">   
$("#Revert3").modal("hide");
function Values3(lineId){       
	 $("#lineId3").val(lineId); 
	 <%-- $.ajax({	
		 url:"<%=path%>rule/findById.action",
		 data:"ruleId="+ruleId,
		 dataType:"json",
		 type:"post",
		 success:function(data){
			 var list=data[0];
	         var len = list.length;
	         
	         for(var i=0;i<len;i++){  
	        
	             var e = list[i];
	             $('#ruleName2 ').val(e.ruleName );
	             $('#securityMoney2 ').val(e.securityMoney );
	             $('#dealMoney2 ').val(e.dealMoney );
	             $('#auctionTime2 ').val(e.auctionTime );
	             $('#completeTime2').val(e.completeTime );
	             $('#parameterName2').val(e.parameterName);
	            
	             
                 
                         
                     
                 
	         }
		 }
	 });  --%>
}
	   
</script>




</body>
</html>