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
<title>已购买作品</title>

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

 <form  method="post" action="<%=path%>production/findBuyProduction.action">
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
         
     <td >
     <a class="btn btn-info" id="yyy" href="<%=path%>production/adminProductionDetal.action?proId=${list.productionId}"   >查看详情</a> 
  <a href="<%=path %>download.action?upUrl=${list.productionImage }"   class=" btn btn-success   passBtn rightSize"  type="button"  data-id=${list.productionId } id="pass">下载封面</a>
 <a href="<%=path %>download.action?upUrl=${list.productionFile }"   class=" btn btn-warning illegalBtn rightSize"  type="button"  data-id=${list.productionId } id="illegal">下载文件</a>
  
       
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
  
    
   
  <!-- ------------------------------------     -->
<!-- 下架作品 -->
 
   
<!-- ------------------------------------     -->
      <!-- 审核作品 -->
  
<!-- ---------------------------------- -->
</table>
当前页<span id="currentPage" >${currentPage}</span>  
											总页数<span id="totalPages"  >${totalPages } </span>  
                                                    <button class="ydc-previous-item-btn-medium" onclick="addPages('last')"  >
                                                        <span>上一页</span>
                                                    </button>
                                                
                                                    <button class="ydc-previous-item-btn-medium"  onclick="addPages('next')"  >
                                                        <span>下一页</span>
                                                    </button>
</div>
  
 <script type="text/javascript">
    
    function addPages(state){
   	 

    	$("#ddd").empty();
    	//alert("currentPage="+$("#currentPage").text());
    	$.ajax({	
    		 url:"<%=path %>production/buyProductionAddPages.action",
    		 data:"currentPage="+$("#currentPage").text()+"&state="+state+"&totalPages="+$("#totalPages").text()+"&conditionName="+$("#conditionName").val()+"&fieldName="+$("#fieldName").val(),
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
	            			  
	            			
	            			 +"<td>"
	            			 +"<a class='btn btn-info btn btn-primary  ' id='yyy' href='<%=path%>production/adminProductionDetal.action?proId="+e.productionId+"' >查看详情</a>"
	            		 
	             			 +" <a href='<%=path %>download.action?upUrl="+e.productionImage+" '  class='btn btn-success   passBtn rightSize'  type='button'  data-id='"+e.productionId+"' id='pass'>下载封面</a>"
	             			
	             			 +" <a href='<%=path %>download.action?upUrl="+e.productionFile+" '  class='btn btn-warning illegalBtn rightSize'  type='button'  data-id='"+e.productionId+"' id='illegal'>下载文件</a>"
	             	 
	            			 
 
	            			 +"</td>"
	            			 +"</tr>");
    	     //------------
 
  
    	     //----------
    			 
    			 } 	 
    			
    		 }
    	})
    	
    }
    
    
    
    </script>


</body>
</html>