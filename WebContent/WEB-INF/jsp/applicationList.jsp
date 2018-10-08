<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
	<title>申请成为顾问</title>
		<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/core.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/icon.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/home.css">
        <script type="text/javascript" src="<%=path%>admin/js/jquery-1.5.2.min.js"></script>
  <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/plugins/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=path%>css/oindex.css">
    <link rel="stylesheet" href="<%=path %>/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path %>/css/global.css" media="all">
    <link rel="stylesheet" href="<%=path %>/laydate/theme/default/laydate.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<style type="text/css">
#footer {
    text-align: center;
}
#footer ul {
    display: inline-block;
    overflow: auto;
}

#footer ul li {
    display: inline;
    float: left;
}
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

<!-- content YDC begin -->
	<section>
		<div class="ydc-content-slide ydc-body">
			<div class="ydc-flex">
				<!-- left begin -->
				<div class="ydc-column ydc-column-2">
					<div class="ydc-menu">
						<ul>
							<li class="ydc-menu-item">
								<a href=""  ><i class="ydc-icon ydc-icon-home fl"></i>首页</a>
								<a href="" class="active"><i class="ydc-icon ydc-icon-find fl"></i>申请成为顾问</a>
							</li>
							
							<li class="ydc-menu-item">
								<span class="ydc-menu-sub-title">
									<i class="ydc-icon ydc-icon-file fl"></i>管理
								</span>
								<ul>
									<li>
										<a href="content.html">咨询管理</a>
									</li>
									<li>
										<a href="related.html">内容同步</a>
									</li>
									<li>
										<a href="asset.html">素材中心</a>
									</li>
								</ul>
							</li>
							
					</div>
				</div>
				<!-- left end -->
			<!-- right begin -->
				<div class="ydc-column ydc-column-10">
					<div class="ydc-release-content">
						<div class="ydc-tabPanel ydc-tabPanel-release">
							<div class="ydc-release-tab-head"  id="footer">
								<a  style="width: 100%;font-size: 20px;color: red;"  >
									申请成为顾问
								</a>
								<hr class="layui-bg-blue">
							</div>
							<div class="ydc-panes">
								<div class="ydc-pane"  style="display:block;">
									<div class="clearfix">
	<div align="center" style="height: 70%;width: 50%;margin:0 auto;background-color: #eff4d8; text-align: left"  >
<table class="layui-table">
 
  <thead>
    <tr>
      <th>申请人账号</th>
      <th>申请标题</th>
      <th>申请内容</th>
       <th>申请类型</th>
       <th>服务商id</th>
         <th width="150">操作</th>
    </tr> 
  </thead>
  <tbody>
 <c:forEach items="${list}"  var="list">
 <tr>
 <td>${list.fromUserId}</td>
 <td>${list.demandTitle}</td>
  <td>${list.demandDetaIlinformation}</td>
   <td>${list.parameterId}</td>
    <td>${list.toUserId}</td>
       <td><a class="layui-btn layui-btn-sm layui-btn-danger" href="" >同意</a>
       <a class="layui-btn layui-btn-sm">拒绝</a>
      </td>
 </tr>
 </c:forEach>
<tr>
 
   <td colspan="7"><a>当前页：${num}&nbsp;&nbsp;&nbsp;总页数：${countPage}</a>
   <input type="text" name="skip" id="skip" style="width: 30px"  onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">&nbsp;&nbsp;<a onclick="skip()"  class="layui-btn layui-btn-xs">转</a>
     <a class="layui-btn layui-btn-sm" >上一页</a>
    <a class="layui-btn layui-btn-sm" >下一页</a></td>
   </tr>
</tbody>
</table>
</div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                   <button  class="layui-btn layui-btn-primary" style="margin-left: 80%" onclick="deploy()">返回</button>
            </div>
        </div>
 </div>	
							
							</div>
						</div>
					</div>
				</div>
				<!-- right end -->
			</div>
		</div>

	</section>
<!-- content YDC end -->

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