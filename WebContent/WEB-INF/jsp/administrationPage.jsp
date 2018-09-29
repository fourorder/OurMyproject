<%--
  Created by IntelliJ IDEA.
  User: ivc
  Date: 2018/9/18
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>

<head>
    <meta charset="utf-8">
    <title>后台管理模板</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=basePath%>css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">


    <style type="text/css">
        #bg {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            background-color: black;
            z-index: 1001;
            -moz-opacity: 0.7;
            opacity: .70;
            filter: alpha(opacity=70);
        }
        #show {
            display: none;
            position: absolute;
            top: 25%;
            left: 40%;
            width: 30%;
            height: 35%;
            padding: 8px;
            border: 8px solid #E8E9F7;
            background-color: white;
            z-index: 1002;
            overflow: hidden;
        }

    </style>
</head>

<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header header header-demo">
        <div class="layui-main">
            <div class="admin-login-box">
                <a class="logo" style="left: 0;" href="#">
                    <span style="font-size: 22px;">后台管理</span>
                </a>
                <%--<div class="admin-side-toggle">--%>
                    <%--<i class="fa fa-bars" aria-hidden="true"></i>--%>
                <%--</div>--%>
            </div>
            <ul class="layui-nav admin-header-item">

                <li class="layui-nav-item">
                    <a href="javascript:;" class="admin-header-user">
                        <img src="<%=basePath%>images/0.jpg" />
                        <span>用户名</span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i> 个人信息</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-gear" aria-hidden="true"></i> 设置</a>
                        </dd>
                        <dd id="lock">
                                <i class="fa fa-lock" aria-hidden="true" style="padding-right: 3px;padding-left: 1px;"></i>
                            <input  type="button" value="锁屏" onclick="showdiv();"/>
                        </dd>
                        <dd>
                            <a href="login.html"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <%--左侧菜单--%>
    <div class="layui-side layui-bg-black layui-side-scroll" id="admin-side">

        <%--<div class="layui-side-scroll" id="admin-navbar-side" lay-filter="side"></div>--%>
            <fieldset class="layui-elem-field layui-field-title " style="margin-top: 30px;" lay-filter="side"  >
                <legend style="font-size: 20px"> 管&nbsp;理&nbsp;菜&nbsp;单</legend>
            </fieldset>

            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item ">
                    <a href="javascript:;" style="font-size: 15px;">账号管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="<%=basePath%>employers/page.action?page=tpage&number=1" target="menuFrame" id="aa" onclick="anr()">雇主管理</a>
                        </dd>
                        <dd>
                            <a href="<%=basePath%>facilitator/page.action?page=tpage&number=1" target="menuFrame" >服务商管理</a>
                        </dd>
                        <dd>
                            <a href="" target="menuFrame">顾问管理</a>
                        </dd>
                        <dd>
                            <a href="" target="menuFrame">管理员管理</a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;" style="font-size: 15px;">业务管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="<%=basePath%>demand/page.action?page=tpage&number=1" target="menuFrame">需求管理</a>
                        </dd>
                        <dd>
                            <a href="">作品管理</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" style="font-size: 15px;">参数配置</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="">参数配置</a>
                        </dd>
                        <dd>
                            <a href="">需求类型配置</a>
                        </dd>
                        <dd>
                            <a href="">服务商类型配置</a>
                        </dd>
                        <dd>
                            <a href="">服务类型管理</a>
                        </dd>
                        <dd>
                            <a href="">服务商故事配置</a>
                        </dd>
                        <dd>
                            <a href="">曝光台配置</a>
                        </dd>
                        <dd>
                            <a href="<%=basePath%>rule/page.action?page=tpage&number=1" target="menuFrame">规则中心配置</a>
                        </dd>
                        <dd>
                            <a href="<%=basePath%>line/page.action?page=tpage&number=1" target="menuFrame">友情链接配置</a>
                        </dd>
                        <dd>
                            <a href="">行业动态配置</a>
                        </dd>
                        <dd>
                        <a href="<%=basePath%>infor/page.action" target="menuFrame">最新资讯配置</a>
                    </dd>
                        <dd>
                            <a href="<%=basePath%>adver/page.action" target="menuFrame">广告设置</a>
                        </dd>
                    </dl>
                </li>

            </ul>
    </div>

    <%--中间页面--%>
    <div class="layui-body" style="bottom: 0;border-left: solid 2px #1AA094;" id="admin-body">
        <div class="layui-tab admin-nav-card layui-tab-brief" lay-filter="admin-tab">
            <ul class="layui-tab-title">
                <li class="layui-this">
                    <i class="fa fa-dashboard" aria-hidden="true"></i>
                    <span id="cn">主页</span>
                </li>
            </ul>
            <div class="layui-tab-content" style="min-height: 150px; padding: 5px 0 0 0;">
                <div class="layui-tab-item layui-show">
                    <!--欢迎页 -->
                    <iframe id="menuFrame" name="menuFrame" src="<%=basePath%>welcome.jsp" style="overflow:visible;"
                            scrolling="yes" frameborder="no" width="100%" height="100%"></iframe>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-footer footer footer-demo" id="admin-footer">
        <div class="layui-main">
            <p>2016 &copy;
                <a href="#">一站式服务平台</a> LGPL license
            </p>
        </div>
    </div>
    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>

    <!-- -->

    <div id="bg"></div>
    <div id="show" style="text-align: center">
        <!--头像-->
        <img src="<%=basePath%>images/0.jpg"/>
        <p>显示用户名</p>
        <input type="text" class="admin-header-lock-input" value="输入密码解锁.." name="lockPwd" id="lockPwd" /><br /><br />
        <input id="btnclose" type="button" value="解锁" onclick="hidediv();" style="width: 70px;height: 30px;background-color: #ff9d33;border: none;"/>

    </div>





<!--script -->
<script type="text/javascript" src="<%=basePath%>plugins/layui/layui.js"></script>

    <script>
    
        layui.use('element', function() {
            var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块

            element.on('tab(demo)', function(data){
                console.log(data);
            });
        });
        layui.use(['layer', 'form'], function(){
            var layer = layui.layer
                ,form = layui.form;
            layer.msg('Hello Administrator');
        });
        $(function(){
            $('a').click(function(){
                $(this).parent().each(function () {//移除其余非点中状态
                    $('.layui-nav-child a').removeClass("special_color");
                });
                $(this).addClass("special_color");//给所点中的增加样式
              var menuNmae=  $(this).text();//输出所点的a的内容
                $('#cn').html(menuNmae);
            })
        })
        function showdiv() {
            document.getElementById("bg").style.display ="block";
            document.getElementById("show").style.display ="block";

            $('body').css("overflow", "hidden")
        }
        function hidediv() {
            document.getElementById("bg").style.display = 'none';
            document.getElementById("show").style.display = 'none';
            $('body').css("overflow", "auto")
        }
    </script>
</div>
</body>

</html>
