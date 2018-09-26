<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        
        <meta name='TTUNION_verify' content='b846c3c2b85efabc496d2a2b8399cd62'>
        <meta name="sogou_site_verification" content="gI1bINaJcL"/>
        <meta name="360-site-verification" content="37ae9186443cc6e270d8a52943cd3c5a"/>
        <meta name="baidu_union_verify" content="99203948fbfbb64534dbe0f030cbe817">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="apple-touch-fullscreen" content="yes">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE;chrome=1">
        <meta name="format-detection" content="telephone=no">
        <meta name="keywords" content="一点车 -  让您多懂一点车,一点车，让您多懂一点车的常识，在这里，您会看到汽车相关的知识，汽车日常保养，汽车多用小知识，汽车简单维修以及清洗保养等等。">
        <meta name="description" content="一点车 -  让您多懂一点车,一点车，让您多懂一点车的常识，在这里，您会看到汽车相关的知识，汽车日常保养，汽车多用小知识，汽车简单维修以及清洗保养等等。。">
        <meta name="author" content="AUI, a-ui.com">
        <meta name="baidu-site-verification" content="ZVPGgtpUfW"/>
        <title>素材中心--  媒体开放平台 一点车 -  让您多懂一点车</title>
        <link rel="icon" type="image/x-icon" href="favicon.ico">
        <link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
        <link type="text/css" rel="stylesheet" href="<%=path%>css/core.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>css/icon.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>css/home.css">
        <script type="text/javascript" src="<%=path%>js/jquery-1.5.2.min.js"></script>
        <script type="text/javascript">
        var currentShowCity=0;
        $(document).ready(function(){
            $("#province").change(function(){
                $("#province option").each(function(i,o){
                    if($(this).attr("selected"))
                    {
                        $(".city").hide();
                        $(".city").eq(i).show();
                        currentShowCity=i;
                    }
                });
            });

            $("#province").change();
        });

        function getSelectValue(){
            alert("1级="+$("#province").val());
            $(".city").each(function(i,o){
                if(i == currentShowCity){

                    alert("2级="+$(".city").eq(i).val());
                }
            });
        }
	
        </script>
        <style type="text/css">
        
 .ydc-asset-img-list-img img { width: 100%; height: 240px;}       
        </style>
        
    </head>
    <body>
        <!-- head YDC begin -->
        <header class="ydc-header">
            <div class="ydc-entered">
                <div class="ydc-header-content ydc-flex">
                    <div class="ydc-column">
                        <a href="index.html" class="ydc-column-ydc-logo">
                            <img src="<%=path%>images/icon/ydc-logo.png" title="" about="" alt="">
                        </a>
                    </div>
                    <div class="ydc-column">
                        <div class="ydc-column-user">
                            <div class="ydc-user-photo">
                                <a href="javascript:;">
                                    <img src="<%=path%>mages/icon/photo.png" title="" about="" alt="">
                                </a>
                            </div>
                            <div class="ydc-user-info">
                                <div class="ydc-user-info-name">
                                    <a href="javascript:;">一点车</a>
                                </div>
                                <div class="ydc-user-info-func ydc-flex">
                                    <span class="ydc-tag">账号审核中</span>
                                    <span class="ydc-mal">
                                        <i class="ydc-icon ydc-icon-mail fl"></i>
                                        <em>12</em>
                                    </span>
                                    <a href="javascript:;">退出</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- head YDC end -->
        <!-- content YDC begin -->
        <section>
            <div class="ydc-content-slide ydc-body">
                <div class="ydc-flex">
                    <!-- left begin -->
                    <div class="ydc-column ydc-column-2">
                        <div class="ydc-menu">
                            <ul>
                                <li class="ydc-menu-item">
                                    <a href="index.html" class="">
                                        <i class="ydc-icon ydc-icon-home fl"></i>
                                        首页
                                    </a>
                                </li>
                                <li class="ydc-menu-item">
                                    <a href="release.html" class="">
                                        <i class="ydc-icon ydc-icon-find fl"></i>
                                        发布
                                    </a>
                                </li>
                                <li class="ydc-menu-item">
                                    <span class="ydc-menu-sub-title">
                                        <i class="ydc-icon ydc-icon-file fl"></i>
                                        管理
                                    </span>
                                    <ul>
                                        <li>
                                            <a href="content.html">内容管理</a>
                                        </li>
                                        <li>
                                            <a href="related.html">内容同步</a>
                                        </li>
                                        <li>
                                            <a href="asset.html" class="active">素材中心</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="ydc-menu-item">
                                    <span class="ydc-menu-sub-title">
                                        <i class="ydc-icon ydc-icon-record fl"></i>
                                        数据
								
                                    </span>
                                    <ul>
                                        <li>
                                            <a href="subscribe.html">订阅数据</a>
                                        </li>
                                        <li>
                                            <a href="content-data.html">内容数据</a>
                                        </li>
                                        <li>
                                            <a href="index-starLevel.html">指数星级</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="ydc-menu-item">
                                    <span class="ydc-menu-sub-title">
                                        <i class="ydc-icon ydc-icon-set fl"></i>
                                        设置
								
                                    </span>
                                    <ul>
                                        <li>
                                            <a href="info.html">账号信息</a>
                                        </li>
                                        <li>
                                            <a href="account.html">账号状态</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="ydc-menu-item">
                                    <span class="ydc-menu-sub-title">
                                        <i class="ydc-icon ydc-icon-customer fl"></i>
                                        客服
								
                                    </span>
                                    <ul>
                                        <li>
                                            <a href="#">在线咨询</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- left end -->
                    <!-- right begin -->
                    <div class="ydc-column ydc-column-8">
                        <div class="ydc-release-content">
                            <div class="ydc-tabPanel ydc-tabPanel-release">
                                <div class="ydc-release-tab-head">
                                    <ul>
                                        <li class="hit">图片素材</li>
                                       
                                    </ul>
                                </div>
                                <div class="ydc-panes">
                                    <div class="ydc-pane" style="display:block;">
                                        <div class="ydc-release-form-group ">
                                            <div class="ydc-warning-default">
                                                <p>搜索标题以及描述</p>
                                            </div>
                                            <div class="ydc-group-input clearfix" style="width:100%; margin-bottom:20px;">
                                                <input type="text" placeholder="请输入关键词进行搜索" style="width:91.333%">
                                                <button class="ydc-group-button">搜 索</button>
                                            </div>
                                        </div>
                                        <div class="ydc-assetStyle">
                                            <span>共<span class="ydc-assetStyle-span">28</span>条内容</span>
                                          
                                        </div>
                                        <div class="ydc-asset-img clearfix">
                                      
                                            
                                          
                                        
             <c:forEach items="${list}"  var="list" >	  
             
             
            <div class="ydc-asset-img-list">
                                                <div class="ydc-asset-img-list-img"  ><img src="<%=path%>picture/findPicture.action?url=${list.productionImage}"  alt=""></div>
                                               <br>
                                                <div class="ydc-asset-img-list-til">${list.productionName }</div>
                                                <div class="ydc-asset-img-list-del">
                                                    <button>编辑</button>
                                                    <button>删除</button>
                                                </div>
                                            </div> 
             
             
                         
	            
</c:forEach>                               
                                            
        
                                           
                                          
                                        </div>
                                      
                                    </div>
                                    <div class="ydc-pane">
                                      
                                       
                                       
                                            
                                            
                                            
                                             
                                            
                                            
                                            
                                           
                                            
                                           
                                           
                                            
                                            
                                             
                                        </div>
                                        <div class="ydc-pagination">
                                            <ol>
                                                <li class="ydc-previous-item">
                                                    <button class="ydc-previous-item-btn-medium ydc-disabled">
                                                        <span>上一页</span>
                                                    </button>
                                                </li>
                                                <li>
                                                    <button class="ydc-previous-item-btn-medium cur">1</button>
                                                </li>
                                                <li>
                                                    <button class="ydc-previous-item-btn-medium">2</button>
                                                </li>
                                                <li>
                                                    <button class="ydc-previous-item-btn-medium">3</button>
                                                </li>
                                                <li class="ydc-previous-item">
                                                    <button class="ydc-previous-item-btn-medium">
                                                        <span>下一页</span>
                                                    </button>
                                                </li>
                                                <li class="ydc-item-quick">
                                                    第<div class="ydc-item-quick-kun"><input type="number" aria-invalid="false" class=""></div>页
                                                    <button style="margin-left:5px;" class="ydc-previous-item-btn-medium">
                                                        <span>跳转</span>
                                                    </button>
                                                </li>
                                            </ol>
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
        <script type="text/javascript" src="<%=path%>js/nicEdit.js"></script>
        <script type="text/javascript" src="<%=path%>js/upImg.js"></script>
        <script type="text/javascript">
            
	    jQuery(function(){
	        upload_start();
	    });
	    //tab切换
	    $(function(){
	        $('.aui-ad-tab-title ul li').click(function(){
	            $(this).addClass('aui-current').siblings().removeClass('aui-current');
	            $('.aui-ad-tab-body>div:eq('+$(this).index()+')').show().siblings().hide();
	        })
	    });
	
        </script>
        <script type="text/javascript">
            
	    bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });//编辑器
	
        </script>
        <script type="text/javascript">
            
	    var slideIndex = 0;
	    showSlides();

	    function showSlides() {
	        var i;
	        var slides = document.getElementsByClassName("mySlides");
	        for (i = 0; i < slides.length; i++) {
	            slides[i].style.display = "none";
	        }
	        slideIndex++;
	        if (slideIndex> slides.length) {slideIndex = 1}
	        slides[slideIndex-1].style.display = "block";
	        setTimeout(showSlides, 3000); // AD滚动时间
	    }
	
        </script>
        <script type="text/javascript">
            
	    $(function(){
	        $('.ydc-tabPanel ul li').click(function(){
	            $(this).addClass('hit').siblings().removeClass('hit');
	            $('.ydc-panes>div:eq('+$(this).index()+')').show().siblings().hide();
	        })
	    })//tab
	
        </script>
        <script type="text/javascript">
            
	    function textLimitCheck(thisArea, maxLength){
	        if (thisArea.value.length > maxLength){
	            alert(maxLength + ' 个字限制. \r超出的将自动清除.');
	            thisArea.value = thisArea.value.substring(0, 30);
	            thisArea.focus();    }
	        messageCount.innerText = thisArea.value.length;
	        messageCount1.innerText = thisArea.value.length;
	        messageCount2.innerText = thisArea.value.length;
	    }//标题输入框字数限制
	
        </script>
        
        
    </body>
</html>
