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
<title>个人信息修改</title>

	
	<title>修改资料</title>
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
	<link rel="stylesheet" href="<%=path%>css/oindex.css">
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

</head>
<body>
<!-- head YDC begin -->
	<div class="o-top">
				<div class="width1180">
					
					<span class="fr" id="fr1">
						
						<a href="<%=path %>user/home.action" title="众包首页"><i class="o-home"></i>众包首页</a>
						
						
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
									<li class="hit">需求修改</li>
								</ul>
							</div>
							<div class="ydc-panes">
	
									
			
						<form  method="post" action="<%=path%>demand/updateDemandInfo.action" onSubmit="return check()" enctype="multipart/form-data">
								 <div class="aui-card-form-item preview  aui-news" style="margin-top:20px;">
                                                <label class="aui-card-form-label">图标:</label>
                                                <div class="aui-file-up-img" id="preview_0">
                                                   <img class="" id="imghead_0" border="0" src="<%=path%>picture/findPicture.action?url=${demandInfo.demandHead}">
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
											<label class="aui-card-form-label">需求名称:</label>
											<div class="ydc-reg-form-input">
												<input type="text" id="demandTitle" name="demandTitle" class="ydc-form-control"  autocomplete="off" value="${demandInfo.demandTitle}">							
											 <div class="aui-remarks">
												<p>需求的标题</p>
												</div>
											</div>
								</div>
                                  
                                  
									
								<div class="aui-card-form-item"></div>
								
								
								<div class="aui-card-form-item">
									<label class="aui-card-form-label">需求详情:</label>
										<div class="ydc-reg-form-input ydc-reg-form-input-width">
												<textarea id="demandDetaIlinformation" name="demandDetaIlinformation">${demandInfo.demandDetaIlinformation}</textarea>
												
										</div>	
								</div>
								<div class="aui-card-form-item"></div>
								
								<div class="aui-card-form-item">
											<label class="aui-card-form-label">需求类型:</label>
											<div class="aui-card-form-input">

												<select id="parameterId" name="parameterId">
													<c:forEach items="${parameterBeans}" var="Parameter">
														<option value="${Parameter.parameterId}">${Parameter.parameterName}</option>
													</c:forEach>
												</select>

											</div>
								</div>
								<div class="aui-card-form-item"></div>
								<div class="aui-card-form-item">
											<label class="aui-card-form-label">佣金：</label>
											<div class="ydc-reg-form-input">
												<input type="text" id="dealMoney" name="dealMoney"  onclick="dealMoneyJudge()" class="ydc-form-control"  autocomplete="off" value="${demandInfo.dealMoney}">
											 <div class="aui-remarks">
												<div id="dealMoneyDiv" style="color: red; display: inline;"></div>
												</div>
											</div>
								</div>
									<br><br>	
								<div class="aui-card-form-item">
											<label class="aui-card-form-label">押金：</label>
											<div class="ydc-reg-form-input">
												<input type="text" id="securityMoney" onclick="securityMoneyJudge()" name="securityMoney" class="ydc-form-control"  autocomplete="off" value="${demandInfo.securityMoney}">
											 <div class="aui-remarks">
															<div id="securityMoneyDiv" style="color: red; display: inline;"></div>	
												</div>
											</div>
								</div>
								<br><br><br><br>
									
									  <div class="ydc-btn" style="margin-top:20px;">
									  <input type="hidden" id="demandid" name="demandid" value="${demandInfo.demandId}">
                                            <button class="btn">修改</button>
                                           
                                       </div>
									
								</form>
								<div class="ydc-btn" style="margin-top:20px;">
								<button class="btn" onClick="location.href='<%=path%>demand/returnDemand.action'">返回</button>
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

	 <!-- content YDC end -->
       <script type="text/javascript" src="<%=path%>admin/js/jquery.min.js"></script>
       <script type="text/javascript" src="<%=path%>admin/js/nicEdit.js"></script>
        <script type="text/javascript" src="<%=path%>admin/js/upImg.js"></script>
   <script type="text/javascript">  
   /* 判断佣金格式 */
	function dealMoneyJudge() {
		var inpEle = document.getElementById("dealMoney");
		var myreg = /^[1-9]\d*$/;
		var x = document.getElementById("dealMoneyDiv");
		inpEle.onblur = function() {
			var inpVal = this.value;
			if (!myreg.exec(inpVal)) {
				x.innerHTML = "<font color='red'>请输入正确佣金（非负整数）</font>";

				inpEle.value = "";
				
			} else {
				x.innerHTML = "<font color='green'>完美</font>";
			}
		}
	}
	//判断押金格式
	function securityMoneyJudge() {
		var inpEle = document.getElementById("securityMoney");
		var myreg = /^[1-9]\d*$/;
		var x = document.getElementById("securityMoneyDiv");
		inpEle.onblur = function() {
			var inpVal = this.value;
			if (!myreg.exec(inpVal)) {
				x.innerHTML = "<font color='red'>请输入正确佣金（非负整数）</font>";

				inpEle.value = "";
				
			} else {
				x.innerHTML = "<font color='green'>完美</font>";
			}
		}
	}
   
   
		function check() {
		
		var demandTitle = document.getElementById("demandTitle").value;
		var demandDetaIlinformation = document.getElementById("demandDetaIlinformation").value;
		var dealMoney = document.getElementById("dealMoney").value;
		var securityMoney = document.getElementById("securityMoney").value;
		
		
		if (demandTitle!=null&&demandTitle != "" && demandDetaIlinformation!=null&&demandDetaIlinformation != "" && dealMoney!=null&&dealMoney != "" && securityMoney!=null&&securityMoney != "") {

			var r = confirm("是否提交本次修改");
			if (r == true) {
				return true;
			} else {
				return false;
			}

		} else {
			alert("文本框不能留空");
			return false;
		}
	}
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
	        setTimeout(showSlides, 3000); // 滚动时间
	    }
	</script>

	<script type="text/javascript">
	    $(function(){
	        $('.ydc-tabPanel ul li').click(function(){
	            $(this).addClass('hit').siblings().removeClass('hit');
	            $('.ydc-panes>div:eq('+$(this).index()+')').show().siblings().hide();
	        })
	    })
	</script> 
	<script>
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
     
    

</body>
</html>