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
<style type="text/css">
.aui {
    float: left;
    display: block;
    padding: 9px 10px;
    width: 800px;
    font-weight: 400;
    line-height: 20px;
    text-align: left;
    color: #464545;
}
</style>
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
						
						<a href="<%=path %>user/home.action" title="众包首页"><i class="o-home"></i>众包首页</a>
						<a href="#" title="联系我们" ><i class="o-contract"></i>联系我们</a>
						
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
								<li class="hit">开始投标</li>

							</ul>

						</div>
						<form method="post" action="<%=path%>demand/stateDemandBid.action">

								<div class="ydc-form-city">
										<div class="aui-card-form-item">
											<label class="aui-card-form-label">标题：${demandInfo.demandTitle}</label>
										
										</div>
										<div class="aui-card-form-item">
											<label class="aui">	类型:${demandInfo.parameterBean.parameterName}</label>
										</div>
										<div class="aui-card-form-item">
											<label class="aui">需求信息:${demandInfo.demandDetaIlinformation}</label>
										</div>
										
											 <div class="aui-card-form-item preview  aui-news" style="margin-top:20px;">
                                                <label class="aui">封面:</label>
                                                <div class="aui-file-up-img" id="preview_0">
                                                    <img src="<%=path%>picture/findPicture.action?url=${demandInfo.demandHead}">
                                                </div>
                                               
                                            </div>
										
										<div class="aui-card-form-item">
											<label class="aui">佣金：${demandInfo.dealMoney}</label>
										
										</div>
										
										<div class="aui-card-form-item">
											<label class="aui">押金：${demandInfo.securityMoney}</label>
											
										</div>
										
										<div class="aui-card-form-item">
											<label class="aui">项目工期：</label>
											<div class="ydc-reg-form-input">
												<input type="text" id="completeTime" name="completeTime" class="ydc-form-control"  autocomplete="off">天
												<input type="hidden" id="demandid" name="demandid" value="${demandInfo.demandId}">
											 <div class="aui-remarks">
												<p>完成项目天数</p>
												</div>
											</div>
										</div>
										<br>
										<br>
										<br>
										<br>
										<br>
										
										
										
										
										<div class="ydc-btn">
											<button class="btn">开始投标</button>
											
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
