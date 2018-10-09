<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品详情</title>
<meta name="keywords" content="首页" />
<meta name="description" content="首页" />
 <link rel="stylesheet" type="text/css" href="<%=path%>css/normalize.css"/>
 <script type="text/javascript" src="<%=path%>js/jquery-1.9.1.min.js"></script>
 <script src="<%=path%>js/common.js" type="text/javascript" charset="utf-8"></script>
   <script type="text/javascript">
  $(document).ready(function(){
	  var showproduct = {
		  "boxid":"showbox",
		  "sumid":"showsum",
		  "boxw":400,//宽度,该版本中请把宽高填写成一样
		  "boxh":400,//高度,该版本中请把宽高填写成一样
		  "sumw":60,//列表每个宽度,该版本中请把宽高填写成一样
		  "sumh":60,//列表每个高度,该版本中请把宽高填写成一样
		  "sumi":7,//列表间隔
		  "sums":5,//列表显示个数
		  "sumsel":"sel",
		  "sumborder":1,//列表边框，没有边框填写0，边框在css中修改
		  "lastid":"showlast",
		  "nextid":"shownext"
		  };//参数定义	  
	 $.ljsGlasses.pcGlasses(showproduct);//方法调用，务必在加载完后执行
  });
</script>
<script type="text/javascript">

function checkMoney(proId){
	
	$.ajax({	
		 async: false,
		 url:"<%=path %>production/checkMoney.action",
		 data:"proId="+proId,
		 dataType:"json",
		 type:"post",
		 success:function(redata){
			
			 
			 if(redata==0){
				 alert("余额不足，请充值");
				 return false;
			 }
			 
			 if(redata==1){
				 window.location.href="<%=path%>production/ProductionPay.action?proId="+proId;
				 return true;
			 }
			 if(redata==3){
				 alert("已购买过该作品！");
				 return false;
			 }
		 }
	})
	
}


</script>
</head>
<body>

 <div class="showall">
	                <!--left -->
	                <div class="showbot">
                    <div id="showbox">
                         
                        <img src="<%=path%>picture/findPicture.action?url=${productionBean.productionImage }" width="400" height="400" />
                        
                    </div><!--展示图片盒子-->
                       
                        	<!--展示图片里边-->
                        
                       
                        </div>
                        <!--conet -->
                        <div class="tb-property">
                        	<div class="tr-nobdr">
                        		<h3> ${productionBean.productionName }</h3>
                        	</div>
                        		<div class="txt">
                        			<span class="nowprice">￥<a href=""> ${productionBean.productionMoney }</a></span>
                        			
                        		</div>
                        	<div class="seller-phone">
				  <span class="pop in"> <a href="<%=path%>chat/gotochat.action?account=${demandInfo.fromUserBean.userAccount}" target="_blank" data-name="咨询卖家"><img
						src="<%=path%>demand/images/qq.png" />咨询卖家</a>
				</span>

			</div>
                        	<script>
                        	$(document).ready(function(){
                        	//����ı������
                          	var t = $("#text_box");
                        	//��ʼ������Ϊ1,��ʧЧ��
                        	$('#min').attr('disabled',true);
                            	//�������Ӳ���
                            	$("#add").click(function(){    
                               	 t.val(parseInt(t.val())+1)
                               	 if (parseInt(t.val())!=1){
                                   	 $('#min').attr('disabled',false);
                                	}
      
                           	 }) 
                            	//�������ٲ���
                            	$("#min").click(function(){
                                	t.val(parseInt(t.val())-1);
                                	if (parseInt(t.val())==1){
                                   	 $('#min').attr('disabled',true);
                                	}
      
                            	})  
                        	});
                        	</script>  
                         
                        	<div class="nobdr-btns">
                        		
                        	<a   onclick=" return checkMoney(${productionBean.productionId })"  >	<button class="addcart yh"><img src="<%=path%>images/ht.png" width="25" height="25"/>立即购买</button></a>
                        	</div>
                        	
                        </div>
                        <!--right -->
                      
                    </div>                
<!-- 推荐搭配 -->                
    <!--right -->
		<div class="extInfo">
			<div class="brand-logo">
				<a href="" title="服务商头像"> <img
					src="<%=path%>picture/findPicture.action?url=${userBean.userHead}" width="150px" height="150px" />
				</a>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			
			<div class="seller-pop-box">
				<span class="tr">服务商名称：${userBean.userName}</span> <span
					class="tr">服务商信用分：${userBean.userCredit}</span> <span
					class="tr">服务商电话：${userBean.userTel}</span> <span
					class="tr hoh"> <a title="服务商地址" href="">服务商地址：${userBean.userAddress}</a>
				</span>
			</div>
			<div class="seller-phone">
				  <span class="pop in"> <a href="<%=path%>chat/gotochat.action?account=${userBean.userAccount}" target="_blank" data-name="咨询服务商"><img
						src="<%=path%>demand/images/qq.png" />咨询服务商</a>
				</span>

			</div>

		</div>
	</div>            
                	
                	     
                
<!-- 商品介紹 -->                
                <div class="gdetail">
                	<!-- left -->
                	
                	<!-- right -->
                	 
                	<div class="detail">
                		<div class="active_tab" id="outer">
													<ul class="act_title_left" id="tab">
														<li class="act_active">
															<a href="#">商品详情</a>
														</li>
														
													</ul>
													
													<div class="clear"></div>
												</div>
												<div id="content" class="active_list"> 
													<!--0-->
													<div id="ui-a" class="ui-a">
												        <ul style="display:block;">
												        <li>商品名称：${productionBean.productionName }</li>
												        <li>商品作者：${productionBean.userName }</li>
												        <li>作品类别：${productionBean.className }</li>
												        <li>作品介绍： ${productionBean.productionDetal } </li>
												        <li>上架时间：${productionBean.productionPublishTime }</li>
												       <li><img src="<%=path%>picture/findPicture.action?url=${productionBean.productionImage }"/></li>
												        <!-- <li>商品毛重：0克</li>
												        <li>库存： 999 </li> -->
												        
												       <!--  <li><img src="images/ko-1.jpg"/></li>
												        <li><img src="images/ko-2.jpg"/></li>
												        <li><img src="images/ko.jpg"/></li>
												        <li><img src="images/ko-1.jpg"/></li> -->
												        </ul>
												   </div>
												   <!--商品规格-->
												    	
												       
												 <!--商品评价-->      
												   
												   
												 <!--售后保障-->
												
												</div>
												<script>
													$(function(){
														window.onload = function()
														{
															var $li = $('#tab li');
															var $ul = $('#content ul');
																		
															$li.mouseover(function(){
																var $this = $(this);
																var $t = $this.index();
																$li.removeClass();
																$this.addClass('act_active');
																$ul.css('display','none');
																$ul.eq($t).css('display','block');
															})
														}
													});  
												</script>
                	</div>
                </div>
                
</body>
</html>