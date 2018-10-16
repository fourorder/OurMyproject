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
<title>规则配置页</title>

    <script type="text/javascript" src="<%=path%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>plugins/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=path%>plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path%>css/global.css" media="all">
    <link rel="stylesheet" href="<%=path%>laydate/theme/default/laydate.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
   <!--  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
	
	<script type="text/javascript" src="<%=path%>js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript"   src="<%=path%>js/bootstrap-3.3.7.min.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=path%>css/bootstrap-3.3.7.min.css">
    


 <style type="text/css">

        body{TEXT-ALIGN: center;}

    </style>
</head>
<body>
<div style="height: 50%;width: 95%; margin:0 auto;">
<%-- <form action="<%=path%>employers/page.action?page=tpage&number=1" method="post"> --%>
<!-- 姓名：<input type="text" name="name"  placeholder="请输入内容"  >  
<input type="submit" value="查询" id="query"	class="layui-btn layui-btn-normal" />  --> 
  规则名字：<input type="text" id="query" /><button onclick="query()"><span class="layui-btn layui-btn-normal">查询</span></button>
   <input type="button" class="btn btn-primary" data-toggle="modal" data-target="#Revert3" onClick="Values2(0)" value="添加规则"/>	
<!-- </form> -->
<table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
    
      <th>规则ID</th>
      <th>规则名字</th>
      <th>规则状态</th>
      <th>规则详情</th>
      <th>操作</th>
             
    </tr> 
  </thead>
 
  <tr> 
  <tbody id="ddd">
   <c:forEach items="${Flist}"  var="rule"> 
     <c:if test="${rule.stateId==5}">
      
  <tr>
  <td>${rule.ruleId}</td>
  <td>${rule.ruleName}</td>
  <td><a class="layui-btn layui-btn-sm layui-btn-danger" id="yyy" href="#"  onclick="changeState(${rule.ruleId},1,${num});return false;" >${rule.parameterName}</a></td>
  <td><input type="button" class="btn btn-primary" data-toggle="modal" data-target="#Revert" onClick="Values(${rule.ruleId})" value="查看详情"/></td>
  <td><a class="layui-btn layui-btn-sm layui-btn-danger" id="yyy" href="#"  onclick="changeState(${rule.ruleId},3,${num});return false;" >删除规则</a>
      <input type="button" class="btn btn-primary" data-toggle="modal" data-target="#Revert2" onClick="Values2(${rule.ruleId})" value="编辑规则"/>	
  </td>     
  </tr>
  </c:if>
        </c:forEach>
  </tbody>
        
         
        
  <tbody id="ccc">
   <c:forEach items="${Flist}"  var="rule"> 
     <c:if test="${rule.stateId==6}">
      
  <tr>
  <td>${rule.ruleId}</td>
  <td>${rule.ruleName}</td>
  <td><a class="layui-btn layui-btn-sm layui-btn-danger" id="yyy" href="#"  onclick="changeState(${rule.ruleId},2,${num});return false;" >${rule.parameterName}</a></td>
  <td><input type="button" class="btn btn-primary" data-toggle="modal" data-target="#Revert" onClick="Values(${rule.ruleId})" value="查看详情"/></td>
  <td><a class="layui-btn layui-btn-sm layui-btn-danger" id="yyy" href="#"  onclick="changeState(${rule.ruleId},3,${num});return false;" >删除规则</a>
      <input type="button" class="btn btn-primary" data-toggle="modal" data-target="#Revert2" onClick="Values2(${rule.ruleId})" value="编辑规则"/>	
  </td>     
  </tr>
  </c:if>
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
                                            <h4 class="modal-title" id="myModalLabel">    查看规则详情  </h4>
                                      </div>          
                               
                                 <div class="modal-body" align="center">          
                                 <label>规则ID：</label>        
                                   <input type="text" name="ruleId" id="ruleId" value="" readonly="readonly"/></br>
                                  <label>规则名字：</label>        
                                   <input type="text" name="ruleName" id="ruleName" value="" readonly="readonly" /> </br>
                                    <label>交易保障金：</label>        
                                   <input type="text" name="securityMoney" id="securityMoney" value="" readonly="readonly"/>  </br> 
                                    <label>交易金额：</label>        
                                   <input type="text" name="dealMoney" id="dealMoney" value="" readonly="readonly"/> </br>
                                    <label>竞拍时间：</label>        
                                   <input type="text" name="auctionTime" id="auctionTime" value=""readonly="readonly" /> </br>
                                    <label>完成时间：</label>        
                                   <input type="text" name="completeTime" id="completeTime" value="" readonly="readonly"/></br>
                                     <label>规则状态：</label>        
                                   <input type="text" name="parameterName" id="parameterName" value="" readonly="readonly"/>  </br>  
                                 </div>        
                                  
                                 
                          </div><!-- /.modal-content -->  
                           </div><!-- /.modal -->
                           </div>


<form action="<%=path%>rule/changeInfo.action" method="POST">
 <div class="modal fade" id="Revert2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
                                <div class="modal-dialog">    
                                    <div class="modal-content">          
                                      <div class="modal-header" style="text-align:center;"> 
                                       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>         
                                            <h4 class="modal-title" id="myModalLabel">    编辑规则  </h4>
                                      </div>          
                               
                                 <div class="modal-body" align="center">          
                                  <label>规则ID：</label>        
                                   <input type="text" name="ruleId2" id="ruleId2" value="" readonly="readonly"/></br>
                                  <label>规则名字：</label>        
                                   <input type="text" name="ruleName2" id="ruleName2" value=""  /> </br>
                                    <label>交易保障金：</label>        
                                   <input type="text" name="securityMoney2" id="securityMoney2" value="" />  </br> 
                                    <label>交易金额：</label>        
                                   <input type="text" name="dealMoney2" id="dealMoney2" value="" /> </br>
                                    <label>竞拍时间：</label>        
                                   <input type="text" name="auctionTime2" id="auctionTime2" value="" /> </br>
                                    <label>完成时间：</label>        
                                   <input type="text" name="completeTime2" id="completeTime2" value="" /></br>
                                     <label>规则状态：</label>        
                                   <input type="text" name="parameterName2" id="parameterName2" value="" readonly="readonly"/>  </br>   
                                   
                                   
                                         
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

  
  <form action="<%=path%>rule/addRule.action" method="POST">
 <div class="modal fade" id="Revert3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
                                <div class="modal-dialog">    
                                    <div class="modal-content">          
                                      <div class="modal-header" style="text-align:center;"> 
                                       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>         
                                            <h4 class="modal-title" id="myModalLabel">    添加规则  </h4>
                                      </div>          
                               
                                 <div class="modal-body" align="center">          
                                    
                                   <input type="hidden" name="ruleId3" id="ruleId3" value="" /></br>
                                  <label>规则名字：</label>        
                                   <input type="text" name="ruleName3" id="ruleName3" value=""  /> </br>
                                    <label>交易保障金：</label>        
                                   <input type="text" name="securityMoney3" id="securityMoney3" value="" />  </br> 
                                    <label>交易金额：</label>        
                                   <input type="text" name="dealMoney3" id="dealMoney3" value="" /> </br>
                                    <label>竞拍时间：</label>        
                                   <input type="text" name="auctionTime3" id="auctionTime3" value="" /> </br>
                                    <label>完成时间：</label>        
                                   <input type="text" name="completeTime3" id="completeTime3" value="" /></br>
                                        
                                   <input type="hidden" name="parameterName3" id="parameterName3" value="" />  </br>   
                                   
                                   
                                         
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
function changeState(ruleId,stateId,number){
	number = $("#aaa").html();
	$.ajax({
		url:"<%=path%>rule/changeState.action",
		 data:"ruleId="+ruleId+"&stateId="+stateId+"&number="+number,
		 dataType:"json",
		 type:"post",
		 success:function(data){ 
			
			 allPage=data[2];
			 $("#ddd").empty(); 
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
	 
	             
	             
	            
	             
	             if(e.stateId==5){
	            	 $("#ddd").append("<tr><td>"+e.ruleId+"</td>"
	            			 +"<td>"+e.ruleName+"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",1,"+number+");return false;'>"
	              			 +e.parameterName+"</a>"
	            			 +"<td>"
	            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.ruleId+")'value='查看详情'>"
	            			 +"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",3,"+number+");return false;'>"
	             			+"删除规则"+"</a>"
	            			+"<input type='button' class='btn btn-primary' data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.ruleId+")'value='编辑规则'>"
	            			 +"</td>"
	            			 +"</tr>");
	             }else if(e.stateId==6){
	            	 $("#ccc").append("<tr><td>"+e.ruleId+"</td>"
	            			 +"<td>"+e.ruleName+"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",2,"+number+");return false;'>"
	              			 +e.parameterName+"</a>"
	            			 +"<td>"
	            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.ruleId+")'value='查看详情'>"
	            			 +"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",3,"+number+");return false;'>"
	             			+"删除规则"+"</a>"
	            			+"<input type='button' class='btn btn-primary' data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.ruleId+")'value='编辑规则'>"
	            			 +"</td>"
	            			 +"</tr>");
	             }
	             
	             
	             
	             
	
	         }
	      
			  
			 
		 }
	 
	})
}	

function nextPage(){
	var ruleName=document.getElementById("query").value;
	
	number = $("#aaa").html();
	$("#ddd").empty();
	$("#ccc").empty();
	var page="npage";
	$.ajax({	
		
		 url:"<%=path%>rule/selectPage.action",
		 data:"number="+number+"&page="+page+"&ruleName="+ruleName,
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
             
             if(e.stateId==5){
            	 $("#ddd").append("<tr><td>"+e.ruleId+"</td>"
            			 +"<td>"+e.ruleName+"</td>"
            			 +"<td>"
            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",1,"+number+");return false;'>"
              			 +e.parameterName+"</a>"
            			 +"<td>"
            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.ruleId+")'value='查看详情'>"
            			 +"</td>"
            			 +"<td>"
            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",3,"+number+");return false;'>"
             			+"删除规则"+"</a>"
            			+"<input type='button' class='btn btn-primary' data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.ruleId+")'value='编辑规则'>"
            			 +"</td>"
            			 +"</tr>");
             }else if(e.stateId==6){
            	 $("#ccc").append("<tr><td>"+e.ruleId+"</td>"
            			 +"<td>"+e.ruleName+"</td>"
            			 +"<td>"
            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",2,"+number+");return false;'>"
              			 +e.parameterName+"</a>"
            			 +"<td>"
            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.ruleId+")'value='查看详情'>"
            			 +"</td>"
            			 +"<td>"
            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",3,"+number+");return false;'>"
             			+"删除规则"+"</a>"
            			+"<input type='button' class='btn btn-primary' data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.ruleId+")'value='编辑规则'>"
            			 +"</td>"
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
		var ruleName=document.getElementById("query").value;
		number = $("#aaa").html();
		
		$("#ddd").empty();
		$("#ccc").empty();
		var page="tpage";
		$.ajax({	
			
			 url:"<%=path%>rule/selectPage.action",
			 data:"number="+number+"&page="+page+"&ruleName="+ruleName,
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
	         
	             if(e.stateId==5){
	            	 $("#ddd").append("<tr><td>"+e.ruleId+"</td>"
	            			 +"<td>"+e.ruleName+"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",1,"+number+");return false;'>"
	              			 +e.parameterName+"</a>"
	            			 +"<td>"
	            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.ruleId+")'value='查看详情'>"
	            			 +"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",3,"+number+");return false;'>"
	             			+"删除规则"+"</a>"
	            			+"<input type='button' class='btn btn-primary' data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.ruleId+")'value='编辑规则'>"
	            			 +"</td>"
	            			 +"</tr>");
	             }else if(e.stateId==6){
	            	 $("#ccc").append("<tr><td>"+e.ruleId+"</td>"
	            			 +"<td>"+e.ruleName+"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",2,"+number+");return false;'>"
	              			 +e.parameterName+"</a>"
	            			 +"<td>"
	            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.ruleId+")'value='查看详情'>"
	            			 +"</td>"
	            			 +"<td>"
	            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",3,"+number+");return false;'>"
	             			+"删除规则"+"</a>"
	            			+"<input type='button' class='btn btn-primary' data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.ruleId+")'value='编辑规则'>"
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
	
		var ruleName=document.getElementById("query").value;
	
		 number=$("#btn").val();
	
		 var page="page";
		 $("#ddd").empty();
		 $("#ccc").empty();
		 $.ajax({	
			 url:"<%=path%>rule/selectPage.action",
			 data:"number="+number+"&page="+page+"&ruleName="+ruleName,
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
			           
			             if(e.stateId==5){
			            	 $("#ddd").append("<tr><td>"+e.ruleId+"</td>"
			            			 +"<td>"+e.ruleName+"</td>"
			            			 +"<td>"
			            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",1,"+number+");return false;'>"
			              			 +e.parameterName+"</a>"
			            			 +"<td>"
			            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.ruleId+")'value='查看详情'>"
			            			 +"</td>"
			            			 +"<td>"
			            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",3,"+number+");return false;'>"
			             			+"删除规则"+"</a>"
			            			+"<input type='button' class='btn btn-primary' data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.ruleId+")'value='编辑规则'>"
			            			 +"</td>"
			            			 +"</tr>");
			             }else if(e.stateId==6){
			            	 $("#ccc").append("<tr><td>"+e.ruleId+"</td>"
			            			 +"<td>"+e.ruleName+"</td>"
			            			 +"<td>"
			            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",2,"+number+");return false;'>"
			              			 +e.parameterName+"</a>"
			            			 +"<td>"
			            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.ruleId+")'value='查看详情'>"
			            			 +"</td>"
			            			 +"<td>"
			            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",3,"+number+");return false;'>"
			             			+"删除规则"+"</a>"
			            			+"<input type='button' class='btn btn-primary' data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.ruleId+")'value='编辑规则'>"
			            			 +"</td>"
			            			 +"</tr>");
			             }
			             
			             
			             
			         } 	
					
					
					
					
					 }
				 }); 
	}

function query(){
	
	  var ruleName=$("#query").val();
	 number=1;
	 var page="page";
	 $("#ddd").empty();
	 $("#ccc").empty();
	 $.ajax({	
		 url:"<%=path%>rule/selectPage.action",
		 data:"number="+number+"&page="+page+"&ruleName="+ruleName,
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
		            
		             if(e.stateId==5){
		            	 $("#ddd").append("<tr><td>"+e.ruleId+"</td>"
		            			 +"<td>"+e.ruleName+"</td>"
		            			 +"<td>"
		            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",1,"+number+");return false;'>"
		              			 +e.parameterName+"</a>"
		            			 +"<td>"
		            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.ruleId+")'value='查看详情'>"
		            			 +"</td>"
		            			 +"<td>"
		            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",3,"+number+");return false;'>"
		             			+"删除规则"+"</a>"
		            			+"<input type='button' class='btn btn-primary' data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.ruleId+")'value='编辑规则'>"
		            			 +"</td>"
		            			 +"</tr>");
		             }else if(e.stateId==6){
		            	 $("#ccc").append("<tr><td>"+e.ruleId+"</td>"
		            			 +"<td>"+e.ruleName+"</td>"
		            			 +"<td>"
		            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",2,"+number+");return false;'>"
		              			 +e.parameterName+"</a>"
		            			 +"<td>"
		            			 +"<input type='button' class='btn btn-primary'data-toggle='modal' data-target='#Revert' onclick='Values("+e.ruleId+")'value='查看详情'>"
		            			 +"</td>"
		            			 +"<td>"
		            			 +"<a class='layui-btn layui-btn-sm layui-btn-danger'id='yyy' href='#' onclick='changeState("+e.ruleId+",3,"+number+");return false;'>"
		             			+"删除规则"+"</a>"
		            			+"<input type='button' class='btn btn-primary' data-toggle='modal' data-target='#Revert2' onclick='Values2("+e.ruleId+")'value='编辑规则'>"
		            			 +"</td>"
		            			 +"</tr>");
		             }
		             
		             
		         } 	
				
				
				
				
				 }
			 });
}


</script>
 
<script type="text/javascript">   
$("#Revert").modal("hide");
function Values(ruleId){       
	$("#ruleId").val(ruleId);
	 $.ajax({	
		 url:"<%=path%>rule/findById.action",
		 data:"ruleId="+ruleId,
		 dataType:"json",
		 type:"post",
		 success:function(data){
			 var list=data[0];
	         var len = list.length;
	         
	         for(var i=0;i<len;i++){  
	        
	             var e = list[i];
	             $('#ruleName ').val(e.ruleName );
	             $('#securityMoney ').val(e.securityMoney );
	             $('#dealMoney ').val(e.dealMoney );
	             $('#auctionTime ').val(e.auctionTime );
	             $('#completeTime ').val(e.completeTime );
	             $('#parameterName').val(e.parameterName);
	             
	            
	             
                 
                         
                     
                 
	         }
		 }
	 }); 
}
	   
</script>
<script type="text/javascript">   
$("#Revert2").modal("hide");
function Values2(ruleId){       
	$("#ruleId2").val(ruleId);
	 $.ajax({	
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
	 }); 
}
	   
</script>

<script type="text/javascript">   
$("#Revert3").modal("hide");
function Values3(ruleId){       
	 $("#ruleId3").val(ruleId); 
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