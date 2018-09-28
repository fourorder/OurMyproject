<%--
  Created by IntelliJ IDEA.
  User: ivc
  Date: 2018/9/19
  Time: 0:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<html>
<head>
    <title>故事设置</title>
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/plugins/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=path %>/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path %>/css/global.css" media="all">
    <link rel="stylesheet" href="<%=path %>/laydate/theme/default/laydate.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">

    <style type="text/css">

        body{TEXT-ALIGN: center;}

        .demo-input{padding-left: 10px; height: 38px; min-width: 262px; line-height: 38px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;}
    </style>
<script type="text/javascript">
</script>
</head>
<body>
<div align="center" style="height: 90%;width: 50%;margin:0 auto;background-color: #eff4d8; text-align: left"  >
    <form class="layui-form" action="<%=path %>employers/updateStory.action" method="post" enctype="multipart/form-data">
      <div class="layui-form-item">
            <label class="layui-form-label">请选择雇主</label>
            <div class="layui-input-block">
          <select name="userAccount"  id="num" >
        <option value="0" >请选择</option>
        <c:forEach items="${Slist}"  var="fund">
        <option value="${fund.userAccount}" >${fund.userAccount}</option>
        </c:forEach>
      </select>
        </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-block">
                <input type="text" name="userStoryTitle"  required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容</label>
            <div class="layui-input-block">
                <textarea name="userStoryContent" required placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
        <label class="layui-form-label">日期</label>
        <div class="layui-input-block">
       <input type="text" class="layui-input" onblur="check()" id="test1" name="userStoryTime">
        </div><br />
        <div class="layui-form-item">
            <label class="layui-form-label">地址</label>
            <div class="layui-input-block">
                <input type="text" name="userStoryUrl" onblur="CheckUrl()" required  lay-verify="required" placeholder="请输入地址" autocomplete="off" class="layui-input">
            </div>
        </div>
        <label class="layui-form-label">图片</label>
     <div class="layui-upload">
 <input type="file" name="file"   id="1" class="file_photo aui-file-new-up" style="margin:0;"/>                                                    
</div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="submit" class="layui-btn" lay-submit lay-filter="formDemo"  value="立即提交">
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                
            </div>
        </div>
    </form>
 <button  class="layui-btn layui-btn-primary" style="margin-left: 80%" onclick="deploy()">返回</button>
 </div>

<script type="text/javascript" src="<%=path %>layui/layui.js"></script>
<script>
    function CheckUrl(){
        var url=document.getElementById("url").value;
        var reg=/^([hH][tT]{2}[pP]:\/\/|[hH][tT]{2}[pP][sS]:\/\/)(([A-Za-z0-9-~]+)\.)+([A-Za-z0-9-~\/])+$/;
        if(!reg.test(url)){
            alert("这网址不是以http://https://开头，或者不是网址！");
        }
        else{
            alert("输入成功");
        }
    }
    layui.use(['form','layer','laydte'], function(){
  	  var form = layui.form;
  	  var layer=layui.layer;
  	  var laydate=layui.laydate;
  	  
  	
  	});
  
    layui.use('laydate', function(){
    	  var laydate = layui.laydate;
    	  
    	  laydate.render({
    	    elem: '#test1' //指定元素
    	  });
    	});
    	 function deploy() {
		window.location.href = "<%=path %>employers/list.action?page=tpage&number=1";
	};
	 <!--日期格式验证 -->
	    function check(){
	    	var a = /^(\d{4})-(\d{2})-(\d{2})$/
	    	if (!a.test(document.getElementById("test1").value)) { 
	    	alert("日期格式不正确!") 
	    	return false 
	    	} 
	    	else 
	    	return true 
	    	} 
	    function CheckUrl(){
	        var url=document.getElementById("url").value;
	        var reg=/^([hH][tT]{2}[pP]:\/\/|[hH][tT]{2}[pP][sS]:\/\/)(([A-Za-z0-9-~]+)\.)+([A-Za-z0-9-~\/])+$/;
	        if(!reg.test(url)){
	            alert("这网址不是以http://https://开头，或者不是网址！");
	        }
	        else{
	          
	        }
	        
	    }

</script>
</body>
</html>
