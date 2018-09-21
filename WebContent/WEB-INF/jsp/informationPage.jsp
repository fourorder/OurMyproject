<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>咨询配置页面</title>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../plugins/layui/layui.js"></script>
    <link rel="stylesheet" href="../plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/global.css" media="all">
    <link rel="stylesheet" href="../laydate/theme/default/laydate.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">

    <style type="text/css">

        body{TEXT-ALIGN: center;}

        .demo-input{padding-left: 10px; height: 38px; min-width: 262px; line-height: 38px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;}
    </style>
</head>
<body>
<div align="center" style="height: 90%;width: 90%;margin:0 auto;background-color: #eff4d8; text-align: left" >
<form  class="layui-form" action="<%=path %>infor/mation.action" method="post">
<div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-block">
                <input type="text" name="Title" required  lay-verify="required" placeholder="请输入资讯标题" autocomplete="off" class="layui-input">
            </div>
        </div>
<div class="layui-form-item layui-form-text">
            <label class="layui-form-label">资讯内容</label>
            <div class="layui-input-block">
                <textarea name="Content" placeholder="请输入资讯内容" class="layui-textarea"></textarea>
            </div>
        </div>
<label class="layui-form-label">资讯日期</label>
        <div class="layui-input-block">
        <input type="text" class="demo-input" placeholder="请选择日期" id="test1" name="Time">
        </div><br />
<label class="layui-form-label">资讯地址</label>
        <div class="layui-input-block">
        <input type="text" name="Address" required  lay-verify="required" placeholder="请输入资讯地址" autocomplete="off" class="layui-input" id="url">
        </div><br />

<div class="layui-form-item">
            <div class="layui-input-block">
                <input type="submit" class="layui-btn" lay-submit lay-filter="formDemo" onclick="CheckUrl()" value="提交">
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
</form>

</div>
<script type="text/javascript" src="../plugins/layui/layui.js"></script>
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

</script>
</body>
</html>