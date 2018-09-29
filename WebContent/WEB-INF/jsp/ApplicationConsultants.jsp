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
    <title>顾问申请页</title>
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/plugins/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=path%>css/oindex.css">
    <link rel="stylesheet" href="<%=path %>/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path %>/css/global.css" media="all">
    <link rel="stylesheet" href="<%=path %>/laydate/theme/default/laydate.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">

    <style type="text/css">

        body{TEXT-ALIGN: center;}

        .demo-input{padding-left: 10px; height: 38px; min-width: 262px; line-height: 38px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;}
    </style>

</head>
<body>
<div class="o-top">
				<div class="width1180">
					
					<span class="fr">
						<!-- <a href="#" title="登录">登录</a>
						<a href="#" title="注册">注册</a> -->
						<a href="<%=path %>user/home.action" title="众包首页"><i class="o-home"></i>众包首页</a>
						<a href="#" title="联系我们" ><i class="o-contract"></i>联系我们</a>
						<!--登录后
						<a title="管理员" href="http://www.yizhihou.com/member/" target="_blank" rel="nofollow">嘉客</a>
						<a href="http://www.yizhihou.com/member/logout.php" rel="nofollow">退出</a>
						-->
					</span>
				</div>
</div>
<div align="center" style="height: 90%;width: 50%;margin:0 auto;background-color: #eff4d8; text-align: left"  >
    <form class="layui-form" action="<%=path %>counselor/affirm.action" method="post" onsubmit="return CheckPost()" enctype="multipart/form-data" >
   
        <div class="layui-form-item">
            <label class="layui-form-label">申请人</label>
            <div class="layui-input-block">
                <input type="text" name="userAccount"  required  lay-verify="required" value="${account}" autocomplete="off" class="layui-input">
                <input type="hidden" name="userId" value="${userId}">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容</label>
            <div class="layui-input-block">
                <textarea name="counselorIntroduction" required placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
          <div class="layui-form-item">
            <label class="layui-form-label">服务类型</label>
            <div class="layui-input-block">
          <select name="serviceType">
     <c:forEach items="${list}"  var="fund">
     <option value="${fund} ">${fund}</option>
     <c:out value="${fund}" />
     </c:forEach>
     </select>
        </div>
        </div>
        <label class="layui-form-label">服务价格</label>
        <div class="layui-input-block">
        <input type="text" name="counselorMoney"  required  lay-verify="required" placeholder="请输入价格" autocomplete="off" class="layui-input" id="url">
        </div><br />
        <label class="layui-form-label">图片</label>
     <div class="layui-upload">
 <input type="file" name="file"   id="1" class="file_photo aui-file-new-up" style="margin:0;"/>                                                    
</div>
        <br />
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="submit" class="layui-btn" id="test9" lay-submit lay-filter="formDemo"  value="立即提交">
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                
            </div>
        </div>
    </form>
 <button  class="layui-btn layui-btn-primary" style="margin-left: 80%" onclick="deploy()">返回</button>
</div>

 <script  src="<%=path %>layui/layui.js"></script>
<script >
layui.use(['form','layer','laydte'], function(){
	  var form = layui.form;
	  var layer=layui.layer;
	  var laydate=layui.laydate;
	  
	});

</script>
</body>
</html>