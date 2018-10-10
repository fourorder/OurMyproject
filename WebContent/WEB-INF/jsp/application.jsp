<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
	<title>申请顾问</title>
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
										<a href="<%=path%>counselor/applicationList.action?account=${user.userAccount}&userId=${user.userId}">咨询管理</a>
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
                <input type="submit" class="layui-btn  layui-btn-danger" id="test9" lay-submit lay-filter="formDemo"  value="立即提交">
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                
            </div>
        </div>
    </form>
 <button  class="layui-btn layui-btn-primary" style="margin-left: 80%" onclick="deploy()">返回</button>
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