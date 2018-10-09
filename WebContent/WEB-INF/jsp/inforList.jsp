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
<title>资讯列表</title>
 <link rel="stylesheet" href="<%=path %>plugins/layui/css/layui.css" media="all" />
  <script type="text/javascript" src="<%=path %>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>js/jquery-1.9.1.min.js"></script>
     <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">

        body{TEXT-ALIGN: center;}

    </style>

</head>
<body>
<div align="center" style="height: 90%;width: 98%;margin:0 auto;background-color: #eff4d8; text-align: center"  id="table">
<select id="state1">
<option value="7">请选择</option>
<option value="0">未删除</option>
<option value="1">已删除</option>
</select>
<button  style="width:70px;height: 40px" onClick="sstate()" class="layui-btn layui-btn-normal">查询</button>
<input type="button" value="配置咨询" 	class="layui-btn layui-btn-normal" onClick="deploy()" /> 
<table class="layui-table" >
<thead>
 <tr>
<th>标题</th>
<th>内容</th>
<th>时间</th>
<th>地址</th>
<th>类型id</th>
<th>图片</th>
<th width="80">状态</th>
<th width="160">操作</th>
</tr>
</thead>
<tbody id="ccc">
<c:forEach items="${Clist}"  var="fund">
<tr>
<td>${fund.informationTitle}</td>
<td>${fund.informationContent}</td>
<td>${fund.informationPublishTime}</td>
<td>${fund.informationAddress}</td>
<td>${fund.parameterId}</td>
<td>${fund.informationImg}</td>
<c:if test="${fund.stateId  eq 0}">
       <td>未删除</td>
       <td>
<a onClick="return firm()" class="btn btn-danger  deleteBtn rightSize" href="<%=path%>infor/delInfor.action?inforId=${fund.informationId}">删除</a>&nbsp;&nbsp;
<a class="btn btn-info" href="<%=path%>infor/updateInfor.action?inforId=${fund.informationId}">修改</a>
</td>
      </c:if>
<c:if test="${fund.stateId  eq 1}">
       <td>已删除</td>
       <td class="layui-btn layui-btn-xs layui-btn-disabled">已删除</td>
</c:if>

</tr>
</c:forEach>
</tbody>
<tr>
<td colspan="6">当前页<span id="num">${num}</span>总页数<span id="totalPages">${totalPages}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="上一页" onClick="page('tpage')" class="btn btn-primary">&nbsp;&nbsp;
<input type="button" value="下一页" onClick="page('npage')" class="btn btn-primary">
</td>
</tr>

</table>
</div>

<script type="text/javascript">
	
    function deploy() {
		window.location.href = "<%=path %>infor/page.action";
	}
    function page(page) {
    	var nn=$("#num").text();
    	var state1=$("#state1").val();
    		$.ajax({	
    			 url:"<%=path %>infor/Alist.action",
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
    					 if(e.stateId==0){
    						 $("#ccc").append(
    									"<tr><td>"+e.informationTitle+"</td>"+
    									"<td>"+e.informationContent+"</td>"+
    									"<td>"+e.informationPublishTime+"</td>"+
    									"<td>"+e.informationAddress+"</td>"+
    									"<td>"+e.parameterId+"</td>"+
    									"<td>"+e.informationImg+"</td>"+
    									"<td>未删除</td>"+
    									"<td><a onclick='return firm()' class='btn btn-danger  deleteBtn rightSize'  href='<%=path%>infor/delInfor.action?inforId="+e.informationId+"'>删除</a>"+
    									"<a class='btn btn-info' href='<%=path%>infor/updateInfor.action?inforId="+e.informationId+"'>修改</a>"+
    									"</td>"+
    									"</tr>"
    							 ); 
    					 }else if(e.stateId==1){
    						 $("#ccc").append(
    									"<tr><td>"+e.informationTitle+"</td>"+
    									"<td>"+e.informationContent+"</td>"+
    									"<td>"+e.informationPublishTime+"</td>"+
    									"<td>"+e.informationAddress+"</td>"+
    									"<td>"+e.parameterId+"</td>"+
    									"<td>"+e.informationImg+"</td>"+
    									"<td>已删除</td>"+
    									"<td><a class='layui-btn layui-btn-xs layui-btn-disabled'>已删除</a></td>"+
    									
    									"</tr>"
    							 
    							 );  
    					 }
    					 
    				 }
    					
    				}
    			
    		})
    }
    
    function sstate() {
    	var nn=$("#num").text();
    	var state2=$("#state1").val();
    	state1=state2+"";
    		$.ajax({	
    			 url:"<%=path %>infor/Alist.action",
    			data:"page=tpage"+"&number=1&state1="+state1,
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
    					 if(e.stateId==0){
    						 $("#ccc").append(
    									"<tr><td>"+e.informationTitle+"</td>"+
    									"<td>"+e.informationContent+"</td>"+
    									"<td>"+e.informationPublishTime+"</td>"+
    									"<td>"+e.informationAddress+"</td>"+
    									"<td>"+e.parameterId+"</td>"+
    									"<td>"+e.informationImg+"</td>"+
    									"<td>未删除</td>"+
    									"<td><a onclick='return firm()' class='btn btn-danger  deleteBtn rightSize'  href='<%=path%>infor/delInfor.action?inforId="+e.informationId+"'>删除</a>"+
    									"<a class='btn btn-info'  href='<%=path%>infor/updateInfor.action?inforId="+e.informationId+"'>修改</a>"+
    									"</td>"+
    									"</tr>"
    							 ); 
    					 }else if(e.stateId==1){
    						 $("#ccc").append(
    									"<tr><td>"+e.informationTitle+"</td>"+
    									"<td>"+e.informationContent+"</td>"+
    									"<td>"+e.informationPublishTime+"</td>"+
    									"<td>"+e.informationAddress+"</td>"+
    									"<td>"+e.parameterId+"</td>"+
    									"<td>"+e.informationImg+"</td>"+
    									"<td>已删除</td>"+
    									"<td><a class='layui-btn layui-btn-xs layui-btn-disabled'>已删除</a></td>"+
    									
    									"</tr>"
    							 
    							 );  
    					 }
    					 
    				 }
    					
    				}
    			
    		})
    }
    
    function firm() {
        //利用对话框返回的值 （true 或者 false）
        if (confirm("是否删除")) {
           return true;
        }
        else {
        	 return false;
        }

    }

</script>
</body>
</html>