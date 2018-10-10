<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	
	
	<link rel="stylesheet" href="<%=basePath%>css/oindex.css">
	<link rel="icon" type="image/x-icon" href="favicon.ico">
	<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>admin/css/core.css">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>admin/css/icon.css">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>admin/css/home.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>解绑手机页</title>

</head>
<body>
<!-- head YDC begin -->
<section>
	<div class="o-top">
				<div class="width1180">
					
					<span class="fr" id="fr1">
						<!-- <a href="#" title="登录">登录</a>
						<a href="#" title="注册">注册</a> -->
						<a href="<%=basePath%>user/home.action" title="众包首页"><i class="o-home"></i>众包首页</a>
						
						<!--登录后
						<a title="管理员" href="http://www.yizhihou.com/member/" target="_blank" rel="nofollow">嘉客</a>
						<a href="http://www.yizhihou.com/member/logout.php" rel="nofollow">退出</a>
						-->
					</span>
				</div>
</div>
<!-- head YDC end -->
<form action="<%=basePath%>user/deleteTel.action" name="myform" id="myform" method="post">
<div class="ydc-column ydc-column-8" style="width:800px;height: 500px;margin: auto;position: absolute;text-align: center;top: 0;left: 0;right: 0;bottom: 0;">
					<div class="ydc-release-content">
						<div class="ydc-tabPanel ydc-tabPanel-release">
							
							<div class="ydc-panes" >
							<div class="ydc-reg-form-group clearfix">
								<label>请输入绑定手机号:</label>
								<div class="ydc-reg-form-input">
									<input type="text" id="userTel" name="userTel" onblur="checkTel()" class="ydc-form-control" autocomplete="off" placeholder="">
								 	<span id="telspan"></span> 
								</div>
							</div>
							<div class="ydc-reg-form-group clearfix">
								<label>请输入短信校验码:</label>
								<div class="ydc-reg-form-input">
									<input type="text" id="userTelCode" name="userTelCode" onblur="checkTelCode()" class="ydc-form-control" autocomplete="off" placeholder="请先输入正确的手机号" disabled="disabled">
								 	<span id="telCodespan"></span> 	
								</div>
								
								<div class="ydc-reg-yzm" style="position:absolute; left:498px;top:71px; ">
									<button type="button" id="code" name="code" onclick="getPhoneCode()" disabled="disabled">获取校验码</button> 
								</div>
							</div>
							
								
							</div>
						</div>
					</div>
					<div class="ydc-reg-form-group">
							<div class="ydc-reg-form-button" style="margin-left:255px;">
								<a class="btn fl" href="javascript:document.myform.submit();" id="sss"  onclick="return checkForm()">解绑手机</a>
							</div>
						</div>
				</div>
				</form>
				<!-- right end -->
			</div>
		</div>

	</section>

							
</body>
<script type="text/javascript" src="<%=basePath%>admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>admin/js/choice.min.js"></script>
<script type="text/javascript">
	var list=KakutaYuka;
	function checkTel(){
         
        var  userTel  = document.getElementById("userTel").value;

       var tel = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;  // .com .com.cn
    
       var telspan = document.getElementById("telspan");
       var reUserTel=${userTel};
    
       if(userTel==reUserTel){
    	   telspan.innerHTML="手机号验证正确".fontcolor("green"); 
    	   /* $("#userTelCode").removeAttr("disabled"); */
    	   $("#code").removeAttr("disabled");
    	   return true;
    	   
       }else{
    	   telspan.innerHTML="手机号输入有误".fontcolor("red");
    	   $("#code").attr("disabled",true);
    	   
    	   return false;
       }
    } 
	function getPhoneCode(){
		  var  userTel  = document.getElementById("userTel").value;
		  
		  
          
	       var tel = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;  // .com .com.cn
	    
	       var telCodespan = document.getElementById("telCodespan");
	      
	       if(tel.test(userTel)){

	           //符合规则 
               
	           $.ajax({	
					
					 url:"<%=basePath%>user/sendCode2.action",
					 data:{"userTel":userTel},
					 dataType:"json",
					 type:"post",
					 async: false,
					 success:function(data){
						 list=data[0];
				        
				         
				          
				             
				          
				             
				             telCodespan.innerHTML="手机验证码已发送".fontcolor("green");
				             $("#userTelCode").removeAttr("disabled");
				             
	 
					 }
				 });
	           
               return false;
	          

	          

	       }else{

	           //不符合规则

	           alert("请输入正确的手机号");
                return false;
	           

	       } 
	}
	function checkForm(){

    
        
        var userTel= checkTel();
        
         
         
        
         var  userTelCode  = document.getElementById("userTelCode").value; 
        
     
        if(userTel){
    	       
    	        	  if(userTelCode==list){
    		        		
    		        		return true;
    		        	}else{
    		        		alert("短信校验码输入有误，请重新输入！");
    		        		return false;
    		        	} 
    	     	    
    	            
    	        
    	        
    	      

        }else{

            return false;

        } 
        
	 }
	
	</script>
</html>