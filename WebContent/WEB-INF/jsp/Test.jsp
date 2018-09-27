<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>测试页面</title>
<script src="<%=path%>js/jquery.min.js"></script>
</head>
<body>

<input type="button"   value="上一页"  onclick="addPages('tpage')" />
<input type="button"   value="下一页"  onclick="addPages('npage')" />

<script>

function addPages(page){
	 

	
	$.ajax({	
		 url:"<%=path %>employers/list1.action",
		 data:"page="+page+"&number=1",
		 dataType:"json",
		 type:"post",
		 success:function(a){
			
			 var list=a.list;
			 var len = list.length;
			 alert(len);
			
			
			 
		 }
	});
	
}

</script>
<script type="text/javascript" src="<%=path %>layui/layui.js"></script>
<script>
function desplay(pageNO,pageSize){
	layui.use("layer",function(){ 
		  var layer=layui.layer; 
		  var index=null;  
		  $.ajax({   
			 url : '路径',   
			 data : {	
				"pageNo" : pageNo,		
				"pageSize" : pageSize,		
				},    
				type : 'post',   
				 dataType : 'json',   
					success : function(jsonObject) {
						layer.close(index);         
						                   返回值			
						    }							
					});
		});
	}


</script>
</body>
</html>