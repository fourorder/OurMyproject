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
<title>需求管理</title>
<link rel="stylesheet" href="<%=path%>css/oindex.css">
<style type="text/css">

.grouptable{
    position: relative;
    font-size: 16px;
    border: 1px solid #ddd;
    border-top: 0;
    width: 100%;
    height: 140px;
}
.table-item-img{
    overflow: hidden;
    background-color: #eee;
    position: relative;
    float: left;
    height: 95px;
    width: 133px;
    margin: 20px;
    background:#FFFFFF;
}
.ydcactions{
    font-size: 12px;
    float: right;
    margin-right: 40px;
    height: 100%;
    line-height: 140px;
}
.actions-trigger{
    font-size: 14px;
    color: #3b77be;
    margin-left: 20px;
    cursor:pointer;
    background: none;
    border: none;
}
.item-text{
    word-break: break-all;
    padding-top: 40px;
    margin-left: 20px;
    margin-bottom: 20px;
}
.table-item-tag{
    display: inline-block;
    border-radius: 2px;
    margin-left: 6px;
    padding: 1px 6px;
    font-size: 12px;
    color: #3b77be;
    border: 1px solid #3b77be;
    margin-right: 6px;
}
.group-table-item-info{
    margin-left: 20px;
    font-size: 12px;
    color: #a5a5a5;
}
</style>
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
        <script type="text/javascript" src="<%=path%>admin/js/jquery.min.js"></script>
       
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
						<c:forEach items="${menuList}"  var="menuList">
							<li class="ydc-menu-item">
								<a href="<%=path %>${menuList.pathName}" class="">
									<i class="${menuList.divClass}"></i>
									${menuList.authorityName}
								</a>
							</li>
						</c:forEach>
							
							<!-- <li class="ydc-menu-item">
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
										<a href="asset.html">素材中心</a>
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
										<a href="info.html" class="active">账号信息</a>
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
										<a href="customer.html">在线咨询</a>
									</li>
								</ul>
							</li> -->
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
									<li class="hit">内容管理</li>
								</ul>
								
							</div>
							<div class="ydc-panes">
								<div class="ydc-pane" style="display:block;">
									<div class="clearfix">
										<div class="fl ydc-group-sel">
											<select name="parameter" id="parameter">
												<option value="0">全部类型</option>
												<c:forEach items="${parameterBeans}"  var="parameterBeans" >
												<option value="${parameterBeans.parameterId}">${parameterBeans.parameterName}</option>
												</c:forEach>
											</select>
										</div>
										<div class="fl ydc-group-sel">
											<select name="parameterState" id="parameterState">
												<option value="0">全部类型</option>
												<c:forEach items="${stateParmeter}"  var="stateParmeter" >
												<option value="${stateParmeter.parameterId}">${stateParmeter.parameterName}</option>
												</c:forEach>
											</select>
										</div>
										<div class="fl ydc-group-input">
											<input input type="text" name="searchName" id="searchName" placeholder="请输入关键词进行搜索" value="${requestScope.searchName}">
											<button class="ydc-group-button" onclick="selectDemand('query')">搜 索</button>
										</div>
									</div>
									<div class="ydc-group-altogether">共<span id="counts">${requestScope.count}</span>个需求</div>
									
									
									
									
									
									
									<div class="ydc-group-table" id="demandDateList">    <!-- 这个是主标签 -->
									 <c:forEach items="${demandInfo}"  var="demandInfo" >
	 
									 <!-- 审核中，查看详情，可编辑 -->
									 	<c:if test="${demandInfo.stateParameterBean.parameterId == 21}">
									 	<div class="ydc-group-table-item">
											<div class="ydc-group-table-item-img">
												<img src="<%=path%>picture/findPicture.action?url=${demandInfo.demandHead}">
											</div>
											<div class="ydc-actions">
												<div>
													<button class="ydc-actions-trigger">需求详情</button>
													<button class="ydc-actions-trigger">删除</button>
													<button class="ydc-actions-trigger">编辑</button>
													<button class="ydc-actions-trigger">重新申请</button>
												</div>
											</div>
											<div class="ydc-group-table-item-text">
												<span>
													<a href="#">标题：${demandInfo.demandTitle}</a>
												</span>
												<span class="ydc-group-table-item-tag">${demandInfo.stateParameterBean.parameterName}</span>
											</div>
											<div class="ydc-group-table-item-info">
												<span>发布时间：${demandInfo.publishTime}</span>
												<span>| 押金：${demandInfo.securityMoney} | 佣金：${demandInfo.dealMoney} | 类型：${demandInfo.parameterBean.parameterName}</span>
											</div>
										</div>
									 	</c:if>
									 	
									 	<!-- 审核通过 -->
									 	<c:if test="${demandInfo.stateParameterBean.parameterId == 22}">
									 	<div class="ydc-group-table-item">
											<div class="ydc-group-table-item-img">
												<img src="<%=path%>picture/findPicture.action?url=${demandInfo.demandHead}">
											</div>
											<div class="ydc-actions">
												<div>
													<button class="ydc-actions-trigger">需求详情</button>
													<button class="ydc-actions-trigger">找顾问</button>
													<button class="ydc-actions-trigger">发布</button>
													<button class="ydc-actions-trigger">下线</button>
												</div>
											</div>
											<div class="ydc-group-table-item-text">
												<span>
													<a href="#">标题：${demandInfo.demandTitle}</a>
												</span>
												<span class="ydc-group-table-item-tag">${demandInfo.stateParameterBean.parameterName}</span>
											</div>
											<div class="ydc-group-table-item-info">
												<span>发布时间：${demandInfo.publishTime}</span>
												<span>| 押金：${demandInfo.securityMoney} | 佣金：${demandInfo.dealMoney} | 类型：${demandInfo.parameterBean.parameterName}</span>
											</div>
										</div>
									 	</c:if>
									 	
									 	<!-- 审核不通过 -->
									 	<c:if test="${demandInfo.stateParameterBean.parameterId == 23}">
									 	<div class="ydc-group-table-item">
											<div class="ydc-group-table-item-img">
												<img src="<%=path%>picture/findPicture.action?url=${demandInfo.demandHead}">
											</div>
											<div class="ydc-actions">
												<div>
													<button class="ydc-actions-trigger">需求详情</button>
													<button class="ydc-actions-trigger">删除</button>
													<button class="ydc-actions-trigger">编辑</button>
													<button class="ydc-actions-trigger">重新申请</button>
												</div>
											</div>
											<div class="ydc-group-table-item-text">
												<span>
													<a href="#">标题：${demandInfo.demandTitle}</a>
												</span>
												<span class="ydc-group-table-item-tag">${demandInfo.stateParameterBean.parameterName}</span>
											</div>
											<div class="ydc-group-table-item-info">
												<span>发布时间：${demandInfo.publishTime}</span>
												<span>| 押金：${demandInfo.securityMoney} | 佣金：${demandInfo.dealMoney} | 类型：${demandInfo.parameterBean.parameterName}</span>
											</div>
										</div>						 	
									 	</c:if>
									 	
														 	
									 	
									 	<!-- 竞拍中 -->
									 	<c:if test="${demandInfo.stateParameterBean.parameterId == 9}">
									 	<div class="ydc-group-table-item">
											<div class="ydc-group-table-item-img">
												<img src="<%=path%>picture/findPicture.action?url=${demandInfo.demandHead}">
											</div>
											<div class="ydc-actions">
												<div>
													<button class="ydc-actions-trigger" >需求详情</button>
													<button class="ydc-actions-trigger" onClick="location.href='<%=path%>demand/gobidControl.action?demandid=${demandInfo.demandId}'">投标详情</button>
													<button class="ydc-actions-trigger">下线</button>
												</div>
											</div>
											<div class="ydc-group-table-item-text">
												<span>
													<a href="#">标题：${demandInfo.demandTitle}</a>
												</span>
												<span class="ydc-group-table-item-tag">${demandInfo.stateParameterBean.parameterName}</span>
											</div>
											<div class="ydc-group-table-item-info">
												<span>发布时间：${demandInfo.publishTime}</span>
												<span>| 押金：${demandInfo.securityMoney} | 佣金：${demandInfo.dealMoney} | 类型：${demandInfo.parameterBean.parameterName}</span>
											</div>
										</div>
									 	
									 	
									 	</c:if>
									 	<!-- 竞拍结束 -->
									 	<c:if test="${demandInfo.stateParameterBean.parameterId == 10}">
									 	<div class="ydc-group-table-item">
											<div class="ydc-group-table-item-img">
												<img src="<%=path%>picture/findPicture.action?url=${demandInfo.demandHead}">
											</div>
											<div class="ydc-actions">
												<div>
													<button class="ydc-actions-trigger">需求详情</button>
												</div>
											</div>
											<div class="ydc-group-table-item-text">
												<span>
													<a href="#">标题：${demandInfo.demandTitle}</a>
												</span>
												<span class="ydc-group-table-item-tag">${demandInfo.stateParameterBean.parameterName}</span>
											</div>
											<div class="ydc-group-table-item-info">
												<span>发布时间：${demandInfo.publishTime}</span>
												<span>| 押金：${demandInfo.securityMoney} | 佣金：${demandInfo.dealMoney} | 类型：${demandInfo.parameterBean.parameterName}</span>
											</div>
										</div>
									 	
									 	</c:if>
									 	
									 </c:forEach>
									
						
										
									</div>
								</div>
                                       
                                           
                                     
                                    <div class="ydc-pagination">
									<ol>
										<li class="ydc-previous-item">
											<button class="ydc-previous-item-btn-medium" onclick="selectDemand('last')" id="last">
												<span>上一页</span>
											</button>
										</li>
										<li id="pages">${requestScope.page}/${requestScope.countpage}</li>
										<li class="ydc-previous-item">
											<button class="ydc-previous-item-btn-medium" onclick="selectDemand('next')" id="next">
												<span>下一页</span>
											</button>
											
										</li>
										<li class="ydc-item-quick">
											第<div class="ydc-item-quick-kun"><input type="number" aria-invalid="false" class="" id="btnjump"></div>页
											<button style="margin-left:5px;" class="ydc-previous-item-btn-medium"  onclick="selectDemand('jump')" >
												<span>跳转</span>
											</button>
										</li>
									</ol>
								
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
        <script type="text/javascript">
            
	    bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });//编辑器
	
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
     <script type="text/javascript">
      
      
        var page = ${requestScope.page}
        var userid = ${user.userId}
        function selectDemand(state){
        	
        	$("#demandDateList").empty();
        	var num=$("#btnjump").val();
        	if(num!=""){
        		page=num;		
        	}
        	$.ajax({
        	 url:"<%=path%>demand/selectDemandEmployer.action",
       		 data:"userid="+userid+"&state="+state+"&page="+page+"&searchName="+$('#searchName').val()+"&parameterid="+$('#parameter').val()+"&stateid="+$('#parameterState').val(),
       		 dataType:"json",
       		 type:"post",
       		 success:function(redata){
       			page=redata[0];
       			var countpage = redata[1];
       			var count = redata[2];
			   	var list=redata[3];
		        var len = list.length;
	    
		        for(var i=0;i<len;i++){    
		        	
		            var e = list[i];
		          
		           
		            	
		            if(e.stateParameterBean.parameterId == 21){
		            	
		            	$("#demandDateList").append(
		            			"<div class='grouptable'>"
			            		+"<div class='table-item-img'>"
			            		+"<img src='<%=path%>picture/findPicture.action?url="+e.demandHead+"' width='133' height='133'>"
			            		+"</div>"	            		
				            	+"<div class='ydcactions'>"
				            	+"<div>"
				            	+"<button class='actions-trigger'>需求详情</button>"
				            	+"<button class='actions-trigger'>删除</button>"
				            	+"<button class='actions-trigger'>编辑</button>"
				            	+"<button class='actions-trigger'>重新申请</button>"
								+"</div>"							
							+"</div>"							
							+"<div class='item-text'>"
							+"<span><a href='#'>标题："+e.demandTitle+"</a></span>"
							+"<span class='table-item-tag'>"+e.stateParameterBean.parameterName+"</span>"
							+"</div>"
							
							+"<div class='group-table-item-info'>"
							+"<span>发布时间："+e.publishTime+"</span>"
							+"<span>| 押金："+e.securityMoney+" | 佣金："+e.dealMoney+" | 类型："+e.parameterBean.parameterName+"</span>"
							+"</div>"			
							+"</div>"			            	
		            	);
		            }else if(e.stateParameterBean.parameterId == 23){
		            	$("#demandDateList").append(
		            			"<div class='grouptable'>"
			            		+"<div class='table-item-img'>"
			            		+"<img src='<%=path%>picture/findPicture.action?url="+e.demandHead+"' width='133' height='133'>"
			            		+"</div>"	            		
				            	+"<div class='ydcactions'>"
				            	+"<div>"
				            	+"<button class='actions-trigger'>需求详情</button>"
				            	+"<button class='actions-trigger'>删除</button>"
				            	+"<button class='actions-trigger'>编辑</button>"
				            	+"<button class='actions-trigger'>重新申请</button>"
								+"</div>"							
							+"</div>"							
							+"<div class='item-text'>"
							+"<span><a href='#'>标题："+e.demandTitle+"</a></span>"
							+"<span class='table-item-tag'>"+e.stateParameterBean.parameterName+"</span>"
							+"</div>"
							
							+"<div class='group-table-item-info'>"
							+"<span>发布时间："+e.publishTime+"</span>"
							+"<span>| 押金："+e.securityMoney+" | 佣金："+e.dealMoney+" | 类型："+e.parameterBean.parameterName+"</span>"
							+"</div>"			
							+"</div>"		            	
		            	);
		            }
		            
					else if(e.stateParameterBean.parameterId == 9){
						$("#demandDateList").append(
								"<div class='grouptable'>"
			            		+"<div class='table-item-img'>"
			            		+"<img src='<%=path%>picture/findPicture.action?url="+e.demandHead+"' width='133' height='133'>"
			            		+"</div>"	            		
				            	+"<div class='ydcactions'>"
				            	+"<div>"
				            	+"<button class='actions-trigger'>需求详情</button>"
				            	+"<button class='actions-trigger' "+"onClick=\"location.href='<%=path%>demand/gobidControl.action?demandid="+e.demandId+"'\">投标详情</button>"
								+"<button class='actions-trigger'>下线</button>"							
							+"</div>"							
							+"</div>"							
							+"<div class='item-text'>"
							+"<span><a href='#'>标题："+e.demandTitle+"</a></span>"
							+"<span class='table-item-tag'>"+e.stateParameterBean.parameterName+"</span>"
							+"</div>"
							
							+"<div class='group-table-item-info'>"
							+"<span>发布时间："+e.publishTime+"</span>"
							+"<span>| 押金："+e.securityMoney+" | 佣金："+e.dealMoney+" | 类型："+e.parameterBean.parameterName+"</span>"
							+"</div>"			
							+"</div>"
								
						
		            	
		            	);
		            }else if(e.stateParameterBean.parameterId == 10){
		            	$("#demandDateList").append(
		            			"<div class='grouptable'>"
			            		+"<div class='table-item-img'>"
			            		+"<img src='<%=path%>picture/findPicture.action?url="+e.demandHead+"' width='133' height='133'>"
			            		+"</div>"	            		
				            	+"<div class='ydcactions'>"
				            	+"<div>"
				            	+"<button class='actions-trigger'>需求详情</button>"
								+"</div>"							
								+"</div>"													
								+"<div class='item-text'>"
								+"<span><a href='#'>标题："+e.demandTitle+"</a></span>"
								+"<span class='table-item-tag'>"+e.stateParameterBean.parameterName+"</span>"
								+"</div>"
								
								+"<div class='group-table-item-info'>"
								+"<span>发布时间："+e.publishTime+"</span>"
								+"<span>| 押金："+e.securityMoney+" | 佣金："+e.dealMoney+" | 类型："+e.parameterBean.parameterName+"</span>"
								+"</div>"			
								+"</div>"        	
		            	);
		            
		            
		            
		         }else if(e.stateParameterBean.parameterId == 22){
		            	$("#demandDateList").append(
		            			"<div class='grouptable'>"
			            		+"<div class='table-item-img'>"
			            		+"<img src='<%=path%>picture/findPicture.action?url="+e.demandHead+"' width='133' height='133'>"
			            		+"</div>"	            		
				            	+"<div class='ydcactions'>"
				            	+"<div>"
				            	+"<button class='actions-trigger'>需求详情</button>"
				            	+"<button class='actions-trigger'>找顾问</button>"
				            	+"<button class='actions-trigger'>下线</button>"
				            	+"<button class='actions-trigger'>发布需求</button>"
								+"</div>"							
								+"</div>"													
								+"<div class='item-text'>"
								+"<span><a href='#'>标题："+e.demandTitle+"</a></span>"
								+"<span class='table-item-tag'>"+e.stateParameterBean.parameterName+"</span>"
								+"</div>"
								
								+"<div class='group-table-item-info'>"
								+"<span>发布时间："+e.publishTime+"</span>"
								+"<span>| 押金："+e.securityMoney+" | 佣金："+e.dealMoney+" | 类型："+e.parameterBean.parameterName+"</span>"
								+"</div>"			
								+"</div>"        	
		            	);
		            
		            
		            
		         } 	 	
		            }
		        $("#pages").html(page+"/"+countpage);
		        $("#counts").html(count);
       		 }
        	})
        	
        	
        	
        	
        	
        	
        }
        
        
        
        </script>
</body>
</html>