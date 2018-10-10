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
<title>作品管理页</title>

    <script type="text/javascript" src="<%=path%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>plugins/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=path%>plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path%>css/global.css" media="all">
    <link rel="stylesheet" href="<%=path%>laydate/theme/default/laydate.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
 <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
	 <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script> 
	 <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
     <%-- <script type="text/javascript"   src="<%=path%>js/bootstrap.min.js"></script>
          <script type="text/javascript" src="<%=path%>js/jquery.min.js"></script> --%>
        <link type="text/css" rel="stylesheet" href="<%=path%>css/home.css">
<%-- <link type="text/css" rel="stylesheet" href="<%=path%>css/bootstrap.min.css">   --%>

 <style type="text/css">

        body{TEXT-ALIGN: center;}

    </style>
</head>
<body>
<div style="height: 50%;width: 95%; margin:0 auto;">
<%-- <form action="<%=path%>employers/page.action?page=tpage&number=1" method="post"> --%>
<!-- 姓名：<input type="text" name="name"  placeholder="请输入内容"  >  
<input type="submit" value="查询" id="query"	class="layui-btn layui-btn-normal" />  --> 

 <form  method="post" action="<%=path%>production/toAdminProductionManage.action?currentPage=1"">
                                                <input type="text" name="fieldName" id="fieldName" placeholder="请输入作品名字进行搜索" style="width:30.333%" value="${fieldName }">
                                                <input type="text" name="conditionName" id="conditionName" placeholder="请输入服务商名字进行搜索" style="width:30.333%"   value="${conditionName }">
                                               <input type="submit"  value="搜索"  class="layui-btn layui-btn-normal" style="width:10.333%" />
        							    </form>

<!-- 作品标题：<input type="text" id="query" /><button onclick="query()"><span class="layui-btn layui-btn-normal">查询</span></button> -->
<!-- </form> -->
<table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
    
      <th>作品ID</th>
      <th>作品名称</th>
      <th>作品分类</th>
      <th>审核状态</th>
      <th>操作</th>
             
    </tr> 
  </thead>
 
  <tr> 
  <tbody id="ddd">
   <c:forEach items="${list}"  var="list"> 
     
      
   <tr>

  <td>${list.productionId}</td>
  <td>${list.productionName}</td>
  

       <td> 

      <!--  <a class="layui-btn layui-btn-sm layui-btn-danger" data-toggle="modal" data-target="#editVoince" data-id="edit">查看详情</a></td> -->
      <%-- <input type="text"  id="demandDetailInformation2" value="${demand.demandDetailInformation}"/> --%>
     <%--  <input type="button" class="btn btn-primary" data-toggle="modal" data-target="#Revert" onClick="Values(${demand.demandId})" value="查看详情"/> --%>
      ${list.className} 
         <td>${list.auditName}</td>
     <td >
     <a class="btn btn-info" id="yyy" href="<%=path%>production/adminProductionDetal.action?proId=${list.productionId}" target="_blank"  >查看详情</a> 
 <button class="btn btn-success   passBtn rightSize" type="button" data-id=${list.productionId } id="pass">审核通过</button>
<button class=" btn btn-warning illegalBtn rightSize" type="button" data-id=${list.productionId } id="illegal">违规下架</button>
<button class="btn btn-danger  deleteBtn rightSize" type="button" data-id=${list.productionId } id="delmymodal">删除</button>
  
       
       </td>
       
        </tr>
        </c:forEach>
  </tbody>
        
         <tr>
   <%-- <td colspan="2"><a class="layui-btn layui-btn-sm" href="#" onclick="lastPage();return false;" id="last">上一页</a></td>
   <td >
   
   
   
   当前页：<a id="aaa">${num}</a><br>
          总页数：<a id="eee">${countPage}</a><br>
     第<input type="text" id="btn" size=2/>页<button onclick="selectPage()"><span class="layui-btn layui-btn-normal">跳转</span></button>
   
   
   </td>
   <td colspan="2"><a class="layui-btn layui-btn-sm" href="#"  onclick="nextPage();return false;" id="next">下一页</a></td>
   </tr> --%>
   <!-- ----------------------------------------- -->
  
   <div class="modal fade" id="delmymodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
                                <div class="modal-dialog">    
                                   <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">确认删除</h4>
            </div>
            <div class="modal-body">
                <p>确认删除该作品吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="confirmDelRole">删除</button>
            </div>
        </div><!-- /.modal-content -->
                           </div><!-- /.modal -->
                           </div>
   
  <!-- ------------------------------------     -->
<!-- 下架作品 -->
 <div class="modal fade" id="illegal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
                                <div class="modal-dialog">    
                                   <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">确认下架作品</h4>
            </div>
            <div class="modal-body">
                <p>确定要下架该作品吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="IllegalProduction">下架</button>
            </div>
        </div><!-- /.modal-content -->
                           </div><!-- /.modal -->
                           </div>
   
<!-- ------------------------------------     -->
      <!-- 审核作品 -->
 <div class="modal fade" id="pass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
                                <div class="modal-dialog">    
                                   <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">确认通过审核</h4>
            </div>
            <div class="modal-body">
                <p>确认该作品通过审核吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="passProduction">通过审核</button>
            </div>
        </div><!-- /.modal-content -->
                           </div><!-- /.modal -->
                           </div>
<!-- ---------------------------------- -->
</table>
当前页<span id="currentPage" >${currentPage}</span>  
											总页数<span id="totalPages"  >${totalPages } </span>  
                                                  	<c:if test="${currentPage=='1'}">
										<button class="ydc-previous-item-btn-medium" onclick="addPages('last')"  disabled="disabled"  id="last" >
                                                        <span>上一页</span>
                                                    </button>
										</c:if>
											<c:if test="${currentPage!='1'}">
										<button class="ydc-previous-item-btn-medium" onclick="addPages('last')"   id="last">
                                                        <span>上一页</span>
                                                    </button>
										</c:if>  
                                                      <!--  <button class="ydc-previous-item-btn-medium" onclick="addPages('last')"  >
                                                        <span>上一页</span>
                                                    </button> -->  
                                                <c:if test="${totalPages=='1'}">
                                                <button class="ydc-previous-item-btn-medium"  onclick="addPages('next')"  disabled="disabled"  id="next">
                                                        <span>下一页</span>
                                                    </button>
                                                </c:if>
                                                  <c:if test="${totalPages!='1'}">
                                                <button class="ydc-previous-item-btn-medium"  onclick="addPages('next')"  id="next"  >
                                                        <span>下一页</span>
                                                    </button>
                                                </c:if>
                                                    
                                                       第<div class="ydc-item-quick-kun"><input type="number" aria-invalid="false" class=""  name="toNumber"   id="toNumber"  ></div>页
                                                    <button style="margin-left:5px;" class="layui-btn layui-btn-normal"  onclick="addPages('toNumber')" >
                                                        <span>跳转</span>
                                                    </button>  
</div>
  
 <script type="text/javascript">
    
    function addPages(state){
    	var toNumber=$("#toNumber").val();
    	//alert("跳转页数="+toNumber);
    //	if(state==toNumber){
    	//	alert("toNumber="+toNumber);
    	if(state=="toNumber"){
    		if(toNumber<=0){
        		alert("页数过小");
        		return false;
        	}
        	if(toNumber>$("#totalPages").text()){
        		alert("页数过大");
        		return false;
        	}
   	}
    	
//alert("admin翻页");
    	$("#ddd").empty();
    	//alert("currentPage="+$("#currentPage").text());
    	$.ajax({	
    		 url:"<%=path %>production/AddPages.action",
    		 data:"currentPage="+$("#currentPage").text()+"&state="+state+"&totalPages="+$("#totalPages").text()+"&conditionName="+$("#conditionName").val()+"&fieldName="+$("#fieldName").val()+"&toNumber="+toNumber,
    		 dataType:"json",
    		 type:"post",
    		 success:function(redata){
    			 $("#currentPage").empty();
    			 $("#totalPages").empty();
    			 $("#currentPage").html(redata.currentPage);
    			 $("#totalPages").html(redata.totalPages);
    			 
    			 var list=redata.proList;
    			 var len = list.length;
    			
    			 for(var i=0;i<len;i++){    			        	 
    	             var e = list[i];
    	           
    	             $("#ddd").append("<tr><td>"+e.productionId+"</td>"
	            			 +"<td>"+e.productionName+"</td>"
	            			 +"<td>"
	            			 +e.className
	            			  
	            			 +"<td>"+e.auditName+"</td>"
	            			 +"<td>"
	            			 +"<a class='btn btn-info btn btn-primary  ' id='yyy' href='<%=path%>production/adminProductionDetal.action?proId="+e.productionId+"'  target='_blank'>查看详情</a>"
	            			 +"<button class='btn btn-success btn btn-primary passBtn rightSize' type='button' data-id='"+e.productionId+"' id='pass'>审核通过</button>"
	             			 
	             			 +"<button class='btn btn-warning btn btn-primary illegalBtn rightSize' type='button' data-id='"+e.productionId+"' id='illegal'>违规下架</button>"
	             			 
	             			+"<button class='btn btn-danger  btn btn-primary deleteBtn rightSize' type='button' data-id='"+e.productionId+"' id='delmymodal'>删除作品</button>"
	            			 
 
	            			 +"</td>"
	            			 +"</tr>");
    	     //------------
   
    	     //----------
    			 
    			 } 	 
    			 if(redata.currentPage==1){
		        	 $("#last").attr("class","ydc-previous-item-btn-medium"); 
		        	 $("#last").attr("disabled",true);
		         }else{
		        	 $("#last").attr("class","ydc-previous-item-btn-medium");
		        	 $("#last").attr("disabled",false);
		         }
		         if(redata.currentPage==redata.totalPages){
		        	 $("#next").attr("class","ydc-previous-item-btn-medium");
		        	 $("#next").attr("disabled",true);
		         }else{
		        	 $("#next").attr("class","ydc-previous-item-btn-medium");
		        	 $("#next").attr("disabled",false);
		         }	 
    		 }
    	})
    	
    }
    
    
    
    </script>
<script type="text/javascript">

var  delProId;
$("#ddd").on('click', '.deleteBtn', function () {
	delProId= $(this).parents('tr').find('button').eq(2).data("id");
	 $("#delmymodal").modal();
}) 

$('#confirmDelRole').click(function(){
$.ajax({
    url: "<%=path%>production/adminToDelProduction.action",
    data:"delProId="+delProId+"&currentPage="+$("#currentPage").text()+"&conditionName="+$("#conditionName").val()+"&fieldName="+$("#fieldName").val(),
    dataType:"json",
	 type:"post",
    success: function (redata) {
    	
    	//-----------
    	$("#ddd").empty();
    	 $("#currentPage").empty();
		 $("#totalPages").empty();
		 $("#currentPage").html(redata.currentPage);
		 $("#totalPages").html(redata.totalPages);
		 
		 var list=redata.proList;
		    			    	 var len = list.length;
		    			    	//----------
		    			    	 
		    			    	 for(var i=0;i<len;i++){  
		    			    		 var e = list[i];
		    			    		  $("#ddd").append("<tr><td>"+e.productionId+"</td>"
		    			            			 +"<td>"+e.productionName+"</td>"
		    			            			 +"<td>"
		    			            			 +e.className
		    			            			 +"</td>"
		    			            			 +"<td>"+e.auditName+"</td>"
		    			            			 +"<td>"
		    			            			 +"<a class='btn btn-info  btn btn-primary ' id='yyy' href='<%=path%>production/adminProductionDetal.action?proId="+e.productionId+"' >查看详情</a>"
		    			            			 +"<button class='btn btn-success btn btn-primary passBtn rightSize' type='button' data-id='"+e.productionId+"' id='pass'>审核通过</button>"
		    			             			 
		    			             			 +"<button class='btn btn-warning  btn btn-primary illegalBtn rightSize' type='button' data-id='"+e.productionId+"' id='illegal'>违规下架</button>"
		    			             			 
		    			             			+"<button class='btn btn-danger  btn btn-primary deleteBtn rightSize' type='button' data-id='"+e.productionId+"' id='delmymodal'>删除作品</button>"
		    			            			 
		    			            		 
		    			            			 +"</td>"
		    			            			 +"</tr>");
		    			    		 
		    			    	 }
		    			    	 $("#delmymodal").modal('hide');
		    			    	 if(redata.currentPage==1){
		    			        	 $("#last").attr("class","ydc-previous-item-btn-medium"); 
		    			        	 $("#last").attr("disabled",true);
		    			         }else{
		    			        	 $("#last").attr("class","ydc-previous-item-btn-medium");
		    			        	 $("#last").attr("disabled",false);
		    			         }
		    			         if(redata.currentPage==redata.totalPages){
		    			        	 $("#next").attr("class","ydc-previous-item-btn-medium");
		    			        	 $("#next").attr("disabled",true);
		    			         }else{
		    			        	 $("#next").attr("class","ydc-previous-item-btn-medium");
		    			        	 $("#next").attr("disabled",false);
		    			         }
    	//----------
    }
});
})

</script>
<script type="text/javascript">

var  delProId;
$("#ddd").on('click', '.illegalBtn', function () {
	delProId= $(this).parents('tr').find('button').eq(2).data("id");
	 $("#illegal").modal();
}) 

$('#IllegalProduction').click(function(){
$.ajax({
    url: "<%=path%>production/adminToIllegalProduction.action",
    data:"delProId="+delProId+"&currentPage="+$("#currentPage").text()+"&conditionName="+$("#conditionName").val()+"&fieldName="+$("#fieldName").val(),
    dataType:"json",
	 type:"post",
    success: function (redata) {
    	
    	//-----------
    	$("#ddd").empty();
    	 $("#currentPage").empty();
		 $("#totalPages").empty();
		 $("#currentPage").html(redata.currentPage);
		 $("#totalPages").html(redata.totalPages);
		 
		 var list=redata.proList;
		    			    	 var len = list.length;
		    			    	//----------
		    			    	 
		    			    	 for(var i=0;i<len;i++){  
		    			    		 var e = list[i];
		    			    		  $("#ddd").append("<tr><td>"+e.productionId+"</td>"
		    			            			 +"<td>"+e.productionName+"</td>"
		    			            			 +"<td>"
		    			            			 +e.className
		    			            			 +"</td>"
		    			            			 +"<td>"+e.auditName+"</td>"
		    			            			 +"<td>"
		    			            			 +"<a class='btn btn-info  ' id='yyy' href='<%=path%>production/adminProductionDetal.action?proId="+e.productionId+"' >查看详情</a>"
		    			            			 +"<button class='btn btn-success passBtn rightSize' type='button' data-id='"+e.productionId+"' id='pass'>审核通过</button>"
		    			             			 
		    			             			 +"<button class='btn btn-warning illegalBtn rightSize' type='button' data-id='"+e.productionId+"' id='illegal'>违规下架</button>"
		    			             			 
		    			             			+"<button class='btn btn-danger deleteBtn rightSize' type='button' data-id='"+e.productionId+"' id='delmymodal'>删除作品</button>"
		    			            			 
		    			            		 
		    			            			 +"</td>"
		    			            			 +"</tr>");
		    			    		 
		    			    	 }
    	//----
    			     $("#illegal").modal('hide');			
    				
    	if(redata.currentPage==1){
    		        	 $("#last").attr("class","ydc-previous-item-btn-medium"); 
    		        	 $("#last").attr("disabled",true);
    		         }else{
    		        	 $("#last").attr("class","ydc-previous-item-btn-medium");
    		        	 $("#last").attr("disabled",false);
    		         }
    		         if(redata.currentPage==redata.totalPages){
    		        	 $("#next").attr("class","ydc-previous-item-btn-medium");
    		        	 $("#next").attr("disabled",true);
    		         }else{
    		        	 $("#next").attr("class","ydc-previous-item-btn-medium");
    		        	 $("#next").attr("disabled",false);
    		         }
    	//----------
    }
});
})

</script>
<script type="text/javascript">

var  delProId;
$("#ddd").on('click', '.passBtn', function () {
	delProId= $(this).parents('tr').find('button').eq(2).data("id");
	 $("#pass").modal();
}) 

$('#passProduction').click(function(){
$.ajax({
    url: "<%=path%>production/adminToPsaaProduction.action",
    data:"delProId="+delProId+"&currentPage="+$("#currentPage").text()+"&conditionName="+$("#conditionName").val()+"&fieldName="+$("#fieldName").val(),
    dataType:"json",
	 type:"post",
    success: function (redata) {
    	
    	//-----------
    	$("#ddd").empty();
    	 $("#currentPage").empty();
		 $("#totalPages").empty();
		 $("#currentPage").html(redata.currentPage);
		 $("#totalPages").html(redata.totalPages);
		 
		 var list=redata.proList;
		    			    	 var len = list.length;
		    			    	//----------
		    			    	 
		    			    	 for(var i=0;i<len;i++){  
		    			    		 var e = list[i];
		    			    		  $("#ddd").append("<tr><td>"+e.productionId+"</td>"
		    			            			 +"<td>"+e.productionName+"</td>"
		    			            			 +"<td>"
		    			            			 +e.className
		    			            			 +"</td>"
		    			            			 +"<td>"+e.auditName+"</td>"
		    			            			 +"<td>"
		    			            			 +"<a class='btn btn-info  ' id='yyy' href='<%=path%>production/adminProductionDetal.action?proId="+e.productionId+"' >查看详情</a>"
		    			            			 +"<button class='btn btn-success passBtn rightSize' type='button' data-id='"+e.productionId+"' id='pass'>审核通过</button>"
		    			             			 
		    			             			 +"<button class='btn btn-warning illegalBtn rightSize' type='button' data-id='"+e.productionId+"' id='illegal'>违规下架</button>"
		    			             			 
		    			             			+"<button class='btn btn-danger deleteBtn rightSize' type='button' data-id='"+e.productionId+"' id='delmymodal'>删除作品</button>"
		    			            			 
		    			            		 
		    			            			 +"</td>"
		    			            			 +"</tr>");
		    			    		 
		    			    	 }
		    			    	 $("#pass").modal('hide');
		    			    	 if(redata.currentPage==1){
		    			        	 $("#last").attr("class","ydc-previous-item-btn-medium"); 
		    			        	 $("#last").attr("disabled",true);
		    			         }else{
		    			        	 $("#last").attr("class","ydc-previous-item-btn-medium");
		    			        	 $("#last").attr("disabled",false);
		    			         }
		    			         if(redata.currentPage==redata.totalPages){
		    			        	 $("#next").attr("class","ydc-previous-item-btn-medium");
		    			        	 $("#next").attr("disabled",true);
		    			         }else{
		    			        	 $("#next").attr("class","ydc-previous-item-btn-medium");
		    			        	 $("#next").attr("disabled",false);
		    			         }
    	//----------
    }
});
})

</script>
</body>
</html>