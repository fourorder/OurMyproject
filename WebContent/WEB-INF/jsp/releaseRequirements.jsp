<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>发布需求</title>

<link rel="stylesheet" href="<%=path%>css/oindex.css">
 <link rel="icon" type="image/x-icon" href="favicon.ico">
        <link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/core.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/icon.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/home.css">
        <script type="text/javascript" src="<%=path%>admin/js/jquery-1.5.2.min.js"></script>
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
        
       
       


</head>
<body>
	<!-- head YDC begin -->
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
	<!-- head YDC end -->
	<!-- content YDC begin -->
	<section>
	<div class="ydc-content-slide ydc-body">
		<div class="ydc-flex">
			<!-- left begin -->
			<div class="ydc-column ydc-column-2">
				<div class="ydc-menu">
					<ul>
						<li class="ydc-menu-item"><a href="index.html" class="">
								<i class="ydc-icon ydc-icon-home fl"></i> 首页
						</a></li>
						<li class="ydc-menu-item"><a href="release.html"
							class="active"> <i class="ydc-icon ydc-icon-find fl"></i>
								发布需求
						</a></li>
						<li class="ydc-menu-item"><span class="ydc-menu-sub-title">
								<i class="ydc-icon ydc-icon-file fl"></i> 管理
						</span>
							<ul>
								<li><a href="<%=path%>demand/goDemandControl.action">需求管理</a></li>
								<li><a href="related.html">内容同步</a></li>
								<li><a href="asset.html">素材中心</a></li>
							</ul></li>
						<li class="ydc-menu-item"><span class="ydc-menu-sub-title">
								<i class="ydc-icon ydc-icon-record fl"></i> 数据

						</span>
							<ul>
								<li><a href="subscribe.html">订阅数据</a></li>
								<li><a href="content-data.html">内容数据</a></li>
								<li><a href="index-starLevel.html">指数星级</a></li>
							</ul></li>
						<li class="ydc-menu-item"><span class="ydc-menu-sub-title">
								<i class="ydc-icon ydc-icon-set fl"></i> 设置

						</span>
							<ul>
								<li><a href="info.html">账号信息</a></li>
								<li><a href="account.html">账号状态</a></li>
							</ul></li>
						<li class="ydc-menu-item"><span class="ydc-menu-sub-title">
								<i class="ydc-icon ydc-icon-customer fl"></i> 客服

						</span>
							<ul>
								<li><a href="#">在线咨询</a></li>
							</ul></li>
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
								<li class="hit">发布需求</li>

							</ul>

						</div>
						<form method="post" action="<%=path%>demand/addDemand.action" enctype="multipart/form-data">
						<div class="ydc-panes">
								<div class="ydc-pane" style="display: block;">
									<div class="ydc-release-form-group ">
										<div class="ydc-warning-default">
											<p>需求标题字数需在11字到30字之间。</p>
										</div>
										<div class="ydc-release-form-group-input">
											<input type="text" class="ydc-form-control"
												name="demandTitle" id="demandTitle" title=""
												placeholder="请输入标题，为了更好的展示效果，建议标题字数在30个汉字以内"
												onkeyUp="textLimitCheck(this, 30);">
											<div class="ydc-form-group-jl">
												<span id="messageCount">0</span> /30
											</div>
										</div>
									</div>
									<div class="ydc-warning-default">
										<p>请输入需求详细信息</p>
									</div>
									<div class="ydc-release-form-text">
										<textarea name="demandInformation" id="demandInformation"
											style="width: 100%;"></textarea>
									</div>
								</div>





								<div class="ydc-form-city">
									
										<div class="aui-card-form-item">
											<label class="aui-card-form-label">分类:</label>
											<div class="aui-card-form-input">

												<select id="parameterId" name="parameterId">
													<c:forEach items="${parameterBeans}" var="Parameter">
														<option value="${Parameter.parameterId}">${Parameter.parameterName}</option>
													</c:forEach>
												</select>

											</div>
										</div>
										
											 <div class="aui-card-form-item preview  aui-news" style="margin-top:20px;">
                                                <label class="aui-card-form-label">封面:</label>
                                                <div class="aui-file-up-img" id="preview_0">
                                                    <img class="" id="imghead_0" border="0" src="<%=path%>admin/images/icon/noimg.gif">
                                                </div>
                                                <div class="aui-file-up-btn clearfix ">
                                                    <div class="idPicFile aui-btn aui-file-new">
                                                        <input type="file" name="file" id="1" class="file_photo aui-file-new-up" style="margin:0;">
                                                        <a>上传图片</a>
                                                    </div>
                                                    <div class="aui-remarks">
                                                        <p>图片尺寸建议：800*400 图片大小不超过1MB</p>
                                                    </div>
                                                </div>
                                            </div>
										
										<div class="aui-card-form-item">
											<label class="aui-card-form-label">佣金：</label>
											<div class="ydc-reg-form-input">
												<input type="text" id="dealMoney" name="dealMoney" class="ydc-form-control"  autocomplete="off" value="${userInfo.userIdentity}">
											 <div class="aui-remarks">
												<p>需求费用</p>
												</div>
											</div>
										</div>
										
										<div class="aui-card-form-item">
											<label class="aui-card-form-label">佣金：</label>
											<div class="ydc-reg-form-input">
												<input type="text" id="securityMoney" name="securityMoney" class="ydc-form-control"  autocomplete="off" value="${userInfo.userIdentity}">
											 <div class="aui-remarks">
												<p>供应商上缴的押金，在需求后返还给供应商。一般设为需求的10%</p>
												</div>
											</div>
										</div>
										<input type="hidden" name="userid" value="${user.userId}">
										
										<br>
										<br>
										<br>
										<br>
										<br>
										
										
										
										
										<div class="ydc-btn">
											<button class="btn">发布</button>
											
										</div>
										</div>
										</div>
									</form>
								
							</div>

						</div>
					</div>
				</div>
			
		</div>
	</section>
	<!-- content YDC end -->
	
	<!-- content YDC end -->
        <script type="text/javascript" src="<%=path%>admin/js/nicEdit.js"></script>
        <script type="text/javascript" src="<%=path%>admin/js/upImg.js"></script>
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
      <!--   <script type="text/javascript">
            
	    bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });//编辑器
	
        </script> -->
        <script type="text/javascript">
            
	   
	
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
