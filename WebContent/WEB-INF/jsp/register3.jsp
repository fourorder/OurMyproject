<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
	<title>入驻选择帐号类别-- 一点车 -  让您多懂一点车</title>
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>admin/css/core.css">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>admin/css/icon.css">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>admin/css/home.css">


</head>
<body>

<!-- head YDC begin -->
	<header class="ydc-header">
		<div class="ydc-entered">
			<div class="ydc-header-content ydc-flex">
				<div class="ydc-column">
					<a href="index.html" class="ydc-column-ydc-logo">
						<img src="<%=basePath%>admin/images/icon/ydc-logo.png" title="" about="" alt="">
					</a>
				</div>
				<div class="ydc-column">
					<div class="ydc-column-user">
						<div class="ydc-user-photo">
							<!--<a href="javascript:;">-->
								<!--<img src="admin/images/icon/photo.png" title="" about="" alt="">-->
							<!--</a>-->
						</div>
						<div class="ydc-user-info">
							<div class="ydc-user-info-name">
								<!--<a href="javascript:;">一点车</a>-->
							</div>
							<div class="ydc-user-info-func ydc-flex">
								<!--<span class="ydc-tag">新手期</span>-->
								<!--<span class="ydc-mal"><i class="ydc-icon ydc-icon-mail fl"></i><em>12</em></span>-->
								<a href="<%=basePath%>user/show.action">退出</a>
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
			<div class="ydc-page-content">
				<div class="ydc-reg-title">
					<ul class="clearfix">
						<li class="ydc-reg-step active">
							<em></em>
							<h3>登录邮箱账号</h3>
						</li>
						<li class="ydc-reg-step active">
							<em></em>
							<h3>选择帐号类别</h3>
						</li>
						<li class="ydc-reg-step active">
							<em></em>
							<h3>填写媒体信息</h3>
						</li>
					</ul>
				</div>
				<div class="ydc-reg-form clearfix">
					<form action="<%=basePath%>register/register.action?userAccount=${userAccount}&userPwd=${userPwd}&stateId=1&characterId=${characterId}"name="myform" id="myform" method="post" >
						<div class="ydc-reg-form-class ydc-reg-form-reg">
							<div class="ydc-reg-form-group clearfix">
								<label>姓名:</label>
								<div class="ydc-reg-form-input">
									<input type="text" id="userName" name="userName" class="ydc-form-control" onblur="checkName()" autocomplete="off" placeholder="">
								<span id="namespan"></span> 
								</div>
							</div>
							<div class="ydc-reg-form-group clearfix">
								<label>身份证号:</label>
								<div class="ydc-reg-form-input clearfix">
									<input type="text" id="userIdentity" name="userIdentity"  onblur="checkIdentity()" class="ydc-form-control" autocomplete="off" placeholder="">
									<span id="identityspan"></span> 
									<div class="ydc-reg-form-text">
										<p>帐号信息填写需真实有效，如发现虚假以及非个人真实信息导致帐号收益无法提取，责任由帐号个人承担</p>
									</div>
									<div class="ydc-warning-default fl" style="height:auto; font-size:12px;">
										<p>提交本页信息后，使用当前账号登录客户端<br>点击「我的」-「实名认证」进行实名认证。</p>
									</div>
								</div>

							</div>
							
							<div class="ydc-reg-form-group clearfix">
								<label>联系手机:</label>
								<div class="ydc-reg-form-input">
									<input type="text" id="userTel" name="userTel" onblur="checkTel()" class="ydc-form-control" autocomplete="off" placeholder="">
								 	<span id="telspan"></span> 
						
									<div class="ydc-reg-form-text">
										<p>请输入手机号并验证</p>
									</div>
								</div>
								
								<div class="ydc-reg-yzm" style="position:absolute; left:628px;top:473px; ">
									<button>获取验证码</button> 
								</div>

							</div>
							<div class="ydc-reg-form-group clearfix">
								<label></label>
								<div class="ydc-reg-form-input ydc-reg-form-input-agreement">
									<label><input type="checkbox" value="yes" id="agreement" checked="checked" name="agreement"> 我已经阅读并同意 <a href="<%=basePath%>agreement.jsp" target="_blank">《众包平台注册协议》</a>。</label>
								</div>
							</div>
						</div>
						<div class="ydc-reg-form-group">
							<div class="ydc-reg-form-button" style="margin-left:255px;">
								<a class="btn fl" href="javascript:document.myform.submit();" id="sss"  onclick="return checkForm()">提交申请</a>
							</div>
						</div>
					</form>
				</div>
				<div class="ydc-right-banner" style="margin-top:80px;">
					<div class="slideshow-container">
						<a href="https://xihazahuopu.taobao.com/" target="_blank" class="mySlides fade">
							<img src="<%=basePath%>admin/images/ad/ad1.jpg" style="width:100%">
						</a>
						<a href="https://weibo.com/525135676" target="_blank" class="mySlides fade">
							<img src="<%=basePath%>admin/images/ad/ad2.jpg" style="width:100%">
						</a>
						<a href="http://www.a-ui.cn/" target="_blank" class="mySlides fade">
							<img src="<%=basePath%>admin/images/ad/ad3.jpg" style="width:100%">
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="ydc-footer">
			<div>
				<p>©2018 一站式服务众包平台版权所有About 公司简介  联系方法  招聘信息  客户服务  隐私政策  广告服务  网站地图  意见反馈  不良信息举报</p>
			</div>
		</div>
	</section>
<!-- content YDC end -->

	<script type="text/javascript" src="<%=basePath%>admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>admin/js/choice.min.js"></script>

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

        $(document).ready(function() {

            //参数{input类名，选择类型(单选or多选)}

            $(".rdolist").labelauty("rdolist", "rdo");

            $(".chklist").labelauty("chklist", "check");

        });
	</script>

	<script type="text/javascript">
	    $(function(){
	        $('.ydc-tabPanel ul li').click(function(){
	            $(this).addClass('hit').siblings().removeClass('hit');
	            $('.ydc-panes>div:eq('+$(this).index()+')').show().siblings().hide();
	        })
	    })
	</script>
	<script type="text/javascript">
	
	function checkTel(){
         
        var  userTel  = document.getElementById("userTel").value;

       var tel = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;  // .com .com.cn
    
       var telspan = document.getElementById("telspan");
      
       if(tel.test(userTel)){

           //符合规则 

           telspan.innerHTML="手机号可以使用".fontcolor("green");

          

           return true;

       }else{

           //不符合规则

           telspan.innerHTML="手机号格式输入错误".fontcolor("red");

           return false;

       }  
 	  

    } 
	
	</script>
	<script type="text/javascript">
	function checkIdentity(){
        var  userIdentity  = document.getElementById("userIdentity").value;

       var identity = /^\d{6}(18|19|20)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|[xX])$/;  // .com .com.cn
       var identityspan = document.getElementById("identityspan");
      
       if(identity.test(userIdentity)){

           //符合规则 

           identityspan.innerHTML="身份证可以使用".fontcolor("green");

          

           return true;

       }else{

           //不符合规则

           identityspan.innerHTML="身份证格式输入错误".fontcolor("red");

           return false;

       }  
 	  

    } 
	
	</script>
<script type="text/javascript">
	
	 
	 function checkName(){

	        var  userName  = document.getElementById("userName").value;

	       var name =  /^[\u4E00-\u9FA5A-Za-z]+$/;  // .com .com.cn
     
	       var namespan = document.getElementById("namespan");
	      
	       if(name.test(userName)){

	           //符合规则 

	           namespan.innerHTML="姓名可以使用".fontcolor("green");

	          

	           return true;

	       }else{

	           //不符合规则

	           namespan.innerHTML="姓名格式输入错误".fontcolor("red");

	           return false;

	       }  
	 	  

	    }

	 </script >
	 <script type="text/javascript">
	 function checkForm(){

         var userIdentity = checkIdentity();

         var userName  = checkName();
         
         var userTel= checkTel();
         
         

         if(userIdentity&&userName&&userTel){
        	 
        	
     	    	
     	        if($("#agreement").prop("checked")==true){
     	            return true;
     	        } else{
     	           alert("请勾选按钮!");
     	           return false;
     	        }
     	    

         }else{

             return false;

         }
         
	 }

	 </script>
	
	 /* window.onload=function(){

	        
	        var submitBtn = document.getElementById("myform");

	        submitBtn.onsubmit = function () {
	            if(!document.getElementById("agreement").checked) {
	                alert("请勾选按钮!");
	                return false;
	            }
	            return true;
	        };
	    } */
	 
	<script type="text/javascript">
	    
	    /* $(function(){
   		 
    	    $("#agreement").click(function(){
    	    	
    	        if($("#agreement").prop("checked")==true){
    	            alert("11111");
    	            return true;
    	        } else{
    	           alert("请勾选按钮!");
    	           return false;
    	        }
    	    });
    	}) */
/* function check(){
	    	if($("#agreement").prop("checked")==true){
	            alert("11111");
	            return true;
	        } else{
	           alert("请勾选按钮!");
	           return false;
	        }	    		    	
	    } */
	    </script>

</body>
</html>