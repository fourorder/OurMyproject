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
<title>申请成为顾问</title>

 <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
   
</head>
<body>
<div align="center" style="height: 90%;width: 50%;margin:0 auto;background-color: #eff4d8; text-align: center"  >
   <form id="uploadForm" enctype="multipart/form-data">
   <table  style="margin:0 auto;" cellspacing="10">
     <tr>
           <td> 申请人</td>
          <td> <input type="text" name="userAccount" id="userAccount"   value="${account}"  ></td>
</tr>
    <tr>
    <td>服务类型</td>
     <td><select id="type">
     <c:forEach items="${list}"  var="fund">
     <option value="${fund} ">${fund}</option>
     <c:out value="${fund}" />
     </c:forEach>
     </select></td>
    </tr>
<tr>
         <td>内容</td>
         <td><textarea name="CounselorIntroduction"  id="CounselorIntroduction"  placeholder="请输入内容"></textarea></td>
 </tr>
 <tr>
       <td>服务费用</td>
       <td>   <input type="text" name="CounselorMoney" id="CounselorMoney" placeholder="请输入服务费用" ></td>
  </tr>  
  <tr>
  <td> 图片</td>
  <td>
 <input type="file" name="file"   id="1" class="file_photo aui-file-new-up" style="margin:0;"/>                                                    
 </td>
  </tr>
  <tr>
       <td colspan="2"><button   onclick="commit()" style="width: 70px;height: 30px;" >提交</button></td>
  </tr>
    </table>
    </form>
        </div>
<script type="text/javascript">
function commit(){

	$.ajax({	
		 url:"<%=path %>counselor/affirm.action",
		 data:"userAccount="+$("#userAccount").val()+"&CounselorIntroduction="+$("#CounselorIntroduction").val()+"&CounselorMoney="+$("#CounselorMoney").val()+"&serviceType="+$("#type").text()+"&file=",
		 dataType:"json",
		 type:"post",
		 data: new FormData($("#uploadForm")[0]),
		 processData: false,
		 contentType: false,
		 success:function(a){
            if(a==0){
            alert("已申请，请等待审核结果！");	
            }else if(a==1){
            	 alert("您就已经是顾问,请勿重复提交！");
            }else if(a==2){
            	 alert("提交成功，请等待结果！");
            }
 
		 }
	});
	
}

</script>
</body>
</html>