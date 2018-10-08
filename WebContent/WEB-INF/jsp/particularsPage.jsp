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
<title>需求详情页</title>
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
<div class="ydc-column ydc-column-10">
					<div class="ydc-release-content">
						<div class="ydc-tabPanel ydc-tabPanel-release">
							<div class="ydc-release-tab-head"  id="footer">
								<a  style="width: 100%;font-size: 20px;color: red;"  >
									需求详情
								</a>
								<hr class="layui-bg-blue">
							</div>
							<div class="ydc-panes">
								<div class="ydc-pane"  style="display:block;">
									<div class="clearfix">
	<div align="center" style="height: 70%;width: 30%;margin:0 auto; text-align: left"  >
	  <c:forEach items="${list}"  var="fund">
	   <div class="layui-form-item">
    <label class="layui-form-label">标题</label>
    <div class="layui-input-block">
      <input type="text" name="title"  disabled  lay-verify="required" value="${fund.demandTitle}" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">内容</label>
    <div class="layui-input-block">
      <textarea name="desc" disabled class="layui-textarea">${fund.demandDetaIlinformation}</textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">类型</label>
    <div class="layui-input-block">
      <input type="text" name="title"  disabled  lay-verify="required" value="${type}" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">雇主id</label>
    <div class="layui-input-block">
      <input type="text" name="title"  disabled  lay-verify="required" value="${fund.fromUserId}" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">服务商id</label>
    <div class="layui-input-block">
      <input type="text" name="title"  disabled  lay-verify="required" value="${fund.toUserId}" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">发布时间</label>
    <div class="layui-input-block">
      <input type="text" name="time"  disabled  lay-verify="required" value="${fund.publishTime}" autocomplete="off" class="layui-input">
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">佣金</label>
    <div class="layui-input-block">
      <input type="text" name="title"  disabled  lay-verify="required" value="${fund.dealMoney}" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">项目状态</label>
    <div class="layui-input-block">
      <input type="text" name="title"  disabled  lay-verify="required" value="${state}" autocomplete="off" class="layui-input">
    </div>
  </div>
      <input type="button" value="返回" onclick="fh()"  class="layui-btn layui-btn-danger" />
	  </c:forEach>
 </div>
 </div>
 </div>
 </div>
 </div>
 </div>
 </div>
 <script type="text/javascript">
 function fh() {
	 <!--返回列表 -->
	 window.location.href="<%=path%>counselor/applyForList.action?account=&userId=1022&state=0&page=tpage&number=1"; 
}
 </script>
</body>
</html>