<%--
  Created by IntelliJ IDEA.
  User: ivc
  Date: 2018/9/19
  Time: 0:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<html>
<head>
    <title>广告设置页</title>
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
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
$(document).ready(function () {
    $("#num").click(function(){
    	var num = $("#num").val(); 
         alert(num)
        $.ajax({
            url:"<%=path %>adver/advertising.action?num="+$("#num").val(),
            dataType:"json",
            type:"post",
            success:function(a){
                
            }
        });

    });
</script>
</head>
<body>
<div align="center" style="height: 90%;width: 50%;margin:0 auto;background-color: #eff4d8; text-align: left"  >
    <form class="layui-form" action="<%=path %>adver/advertising.action" method="post" onsubmit="return CheckPost()" enctype="multipart/form-data" >
     <div class="layui-form-item">
            <label class="layui-form-label">请选择位置</label>
            <div class="layui-input-block">
          <select name="advertisementNum"  id="num" >
        <option value="0" >请选择</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
      </select>
        </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-block">
                <input type="text" name="advertisementTitle"  required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容</label>
            <div class="layui-input-block">
                <textarea name="advertisementContent" required placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
        <label class="layui-form-label">日期</label>
        <div class="layui-input-block">
       <input type="text" class="layui-input" onchange="check()" required id="test1" name="advertisementPublishTime">
        </div><br />
        <label class="layui-form-label">地址</label>
        <div class="layui-input-block">
        <input type="text" name="advertisementAddress" onblur="CheckUrl()" required  lay-verify="required" placeholder="请输入地址" autocomplete="off" class="layui-input" id="url">
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

<script type="text/javascript" src="<%=path %>layui/layui.js"></script>
<script>
    function CheckUrl(){
        var url=document.getElementById("url").value;
        var reg=/^([hH][tT]{2}[pP]:\/\/|[hH][tT]{2}[pP][sS]:\/\/)(([A-Za-z0-9-~]+)\.)+([A-Za-z0-9-~\/])+$/;
        if(!reg.test(url)){
            alert("这网址不是以http://https://开头，或者不是网址！");
        }
        else{
          
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
		window.location.href = "<%=path %>adver/list.action?page=tpage&number=1";
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
   
</script>
</body>
</html>
