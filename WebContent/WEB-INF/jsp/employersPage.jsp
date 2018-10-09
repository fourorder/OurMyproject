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
<title>雇主管理页</title>

    <script type="text/javascript" src="<%=path %>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>js/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="<%=path %>layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path %>css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
  <link rel="stylesheet" href="<%=path%>css/bootstrap.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 <style type="text/css">

        body{TEXT-ALIGN: center;}

    </style>
 
</head>
<body >

<div style="height: 45%;width: 100%; margin:0 auto;">

<form action="<%=path %>employers/page.action?page=tpage&number=1" method="post" >
用户名：<input type="text" name="name"  placeholder="请输入内容" value="<%= request.getAttribute("username")==null?"":request.getAttribute("username")%>" style="width: 100px;height: 20px" >  
      <select name="ordinal" lay-filter="aihao">
       <option value="0" >请选择状态</option>
        <option value="1">启用</option>
        <option value="2">禁用</option>
        <option value="3">删除</option>
      </select>
<input type="submit" value="查询" 	class="layui-btn layui-btn-normal" /> 
</form>
<table class="layui-table">

  <thead>
    <tr>
      <th>用户名</th>
      <th>账号</th>
      <th>信用分</th>
      <th>详细信息</th>
      <th>启用/禁用</th>
      <th>操作</th>
    </tr> 
  </thead>
  <tbody>
  <c:forEach items="${Elist}"  var="fund">
  <tr>
  <td>${fund.userName}</td>
  <td>${fund.userAccount}</td>
    <td>${fund.userCredit}</td>
     <td><a class="btn btn-info" onclick="details('${fund.userAccount}')" data-toggle='modal' data-target='#myModal'>查看详情</a></td>
       <c:if test="${fund.stateId  eq 1}">
      
       <td><a class="layui-btn layui-btn-sm layui-btn-radius layui-btn-danger" href="<%=path %>employers/operation.action?operation=forbidden&account=${fund.userAccount}&number=1">禁用</a></td>
       <td> <a class="btn btn-danger  deleteBtn rightSize" onclick="firm()">删除</a>
       <a class="btn btn-info"  href="<%=path %>employers/update.action?account=${fund.userAccount}" >修改</a>
       </td>
       </c:if>
       <c:if test="${fund.stateId  eq 2}">
       <td><a class="layui-btn layui-btn-sm layui-btn-radius " href="<%=path %>employers/operation.action?operation=start&account=${fund.userAccount}&number=1" >启用</a></td>
      <td><a class="btn btn-danger  deleteBtn rightSize"  id="test">删除</a>
       <a class="btn btn-info"  href="<%=path %>employers/update.action?account=${fund.userAccount}" >修改</a>
       </td>
       </c:if>
        <c:if test="${fund.stateId  eq 3}">
       <td><a class="layui-btn layui-btn-sm layui-btn-radius  layui-btn-disabled" name="state">已删除</a></td>
        <td><a class="layui-btn layui-btn-sm layui-btn-disabled "  id="test">删除</a>
       <a class="layui-btn layui-btn-sm layui-btn-disabled" >修改</a>
       </td>
       </c:if>
      
  </tr>
  </c:forEach>
   </tbody>
</table>
    
  <a class="layui-btn layui-btn-sm" href="<%=path %>employers/page.action?page=tpage&number=${num}&name=${username}&ordinal=${state}">上一页</a>
  <a>当前页：${num}&nbsp;&nbsp;&nbsp;总页数：${countPage}</a>
  <input type="text" name="skip" id="skip" style="width: 30px"  onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">&nbsp;&nbsp;<a onclick="skip()"  class="layui-btn layui-btn-xs">转</a>
   <a class="layui-btn layui-btn-sm" href="<%=path %>employers/page.action?page=npage&number=${num}&name=${username}&ordinal=${state}"  id="npage">下一页</a>
</div>


<!-- 模态框（详细信息） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					详细信息
				</h4>
			</div>
			<div class="layui-form-item">
    <label class="layui-form-label">头像</label>
    <div class="ydc-reg-form-input">
	<div class="ydc-reg-form-text ydc-reg-form-user-logo" id="head">
		</div>
		</div>
  </div>
			<div class="layui-form-item">
    <label class="layui-form-label">用户名</label>
    <div class="layui-input-block">
      <input type="text"  id="userName"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-block">
      <input type="text"  id="userPwd"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">手机号</label>
    <div class="layui-input-block">
      <input type="text"  id="userTel"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
  	<div class="layui-form-item">
    <label class="layui-form-label">账户</label>
    <div class="layui-input-block">
      <input type="text"  id="userAccount"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
  	<div class="layui-form-item">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block">
      <input type="text"  id="userSex"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
  	<div class="layui-form-item">
    <label class="layui-form-label">邮箱</label>
    <div class="layui-input-block">
      <input type="text"  id="userMail"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
  	<div class="layui-form-item">
    <label class="layui-form-label">身份证</label>
    <div class="layui-input-block">
      <input type="text"  id="userIdentity"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
  	<div class="layui-form-item">
    <label class="layui-form-label">地址</label>
    <div class="layui-input-block">
      <input type="text"  id="userAddress"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
  	
  	<div class="layui-form-item">
    <label class="layui-form-label">信用分</label>
    <div class="layui-input-block">
      <input type="text"  id="userCredit"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
  	<div class="layui-form-item">
    <label class="layui-form-label">余额</label>
    <div class="layui-input-block">
      <input type="text"  id="userMoney"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
  	<div class="layui-form-item">
    <label class="layui-form-label">状态</label>
    <div class="layui-input-block">
      <input type="text"  id="stateId"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
  	<div class="layui-form-item">
    <label class="layui-form-label">角色</label>
    <div class="layui-input-block">
      <input type="text"  id="characterId"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
  	<div class="layui-form-item">
    <label class="layui-form-label">注册时间</label>
    <div class="layui-input-block">
      <input type="text"  id="userRegisterTime"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
  	<div class="layui-form-item">
    <label class="layui-form-label">简介</label>
    <div class="layui-input-block">
      <input type="text"  id="userProfile"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
 <script  src="<%=path %>layui/layui.js"></script>
<script >
layui.use(['form','layer','laydte'], function(){
	  var form = layui.form;
	  var layer=layui.layer;
	  var laydate=layui.laydate;
	  
	  layer.open({     
		  type:1,     
		  content:$("#test"),    
		  btn:['确定','取消'],    
		  yes:function(index,layero)      
		  {         
			  //index为当前层索引           
			  //layero 为 弹出层对象      
			  //在回调函数末尾添加 “return false”可以禁止点击该按钮关闭弹出层         
			  return false;     
			  },         
			  btn2:function(index,layero){
				  //按钮二回到          
				  return false;    
				  },       
				 
					  cancel:function(){
						  //右上角关闭毁回调       
						  //return false;   
						  }   
					  })

	});
function skip() {
    var number=$("#skip").val();
    if(number==""){
		alert("不能为空！");
	}else {
		 window.location.href = "<%=path %>employers/page.action?page=skip&name=${username}&ordinal=${state}&number="+number;	
			  
	}
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

function details(account) {
	$.ajax({
		 url:"<%=path%>employers/details.action",
		 data:"account="+account,
		 dataType:"json",
		 type:"post",
		 success:function(redata){
			
			 var len = redata.length
  			 for(var i=0;i<len;i++){ 
				 var e = redata[i];
				 $("#userName").val(e.userName);
				 $("#userPwd").val(e.userPwd);
				 $("#userTel").val(e.userTel);
				 $("#userAccount").val(e.userAccount);
				 $("#userSex").val(e.userSex);
				 $("#userMail").val(e.userMail);
				 $("#userIdentity").val(e.userIdentity);
				 $("#userAddress").val(e.userAddress);
				 $("#head").html(
						 "<img src='<%=path%>picture/findPicture.action?url="+e.userHead+"' alt=''>"	 
				 );
				 
				 $("#userCredit").val(e.userCredit);
				 if(e.stateId==1){
					 $("#stateId").val("启用");
				 }else if(e.stateId==2){
					 $("#stateId").val("禁用");
				 }else if(e.stateId==3){
					 $("#stateId").val("已删除");
				 }
				 $("#characterId").val("雇主");
				 $("#userRegisterTime").val(e.userRegisterTime);
				 $("#userProfile").val(e.userProfile);
  			 }
			 
			 }
	})
		 }
	

</script>

</body>
</html>