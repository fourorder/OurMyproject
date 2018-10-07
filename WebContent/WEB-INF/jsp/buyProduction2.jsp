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
         <script type="text/javascript" src="<%=path%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>plugins/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=path%>css/oindex.css">
    <link rel="stylesheet" href="<%=path%>plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path%>css/global.css" media="all">
    <link rel="stylesheet" href="<%=path%>laydate/theme/default/laydate.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
        
        
        
        <script type="text/javascript">
        function del(){
        	
       	 var msg="确定要删除嘛";
       	if(confirm(msg)==true){
       		return true;
       	}else{
       		return false;
       	}
       	
       }
        </script>
        <style type="text/css">
        
 .ydc-asset-img-list-img img { width: 100%; height: 240px;}       
  .ydc-asset-img-list img { width: 100%; height: 240px;}   
        </style>
        
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
                   
                       <c:forEach items="${menuList}"  var="menuList" >	          
                               
                               <li class="ydc-menu-item">
                                    <a href="<%=path%>${menuList.pathName }" class="">
                                        <i class="${menuList.divClass }"></i>
                                        ${menuList.authorityName }
                                    </a>
                                </li>
                               
                               
                               
                               	</c:forEach>    
                               
                               
                               
                        
                            
                            
                            
                            </ul>
                        </div>
                    </div>
                    <!-- left end -->
                    <!-- right begin -->
                      <div class="ydc-column ydc-column-8">
                    <form  method="post" action="<%=path%>production/findBuyProduction.action">
                                                <input type="text" name="fieldName" id="fieldName" placeholder="请输入作品名字进行搜索" style="width:30.333%" value="${fieldName }">
                                                <input type="text" name="conditionName" id="conditionName" placeholder="请输入服务商名字进行搜索" style="width:30.333%"   value="${conditionName }">
                                               <input type="submit"  value="搜索"  class="layui-btn layui-btn-normal" style="width:10.333%" />
        							    </form>

<!-- 作品标题：<input type="text" id="query" /><button onclick="query()"><span class="layui-btn layui-btn-normal">查询</span></button> -->
<!-- </form> -->
<table class="layui-table"   >
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
    
      <th>作品ID</th>
      <th>作品名称</th>
      <th>作品分类</th>
      
      <th>操作</th>
             
    </tr> 
  </thead>
 
  <tr> 
  <tbody id="ddd">
   <c:forEach items="${list}"  var="list"> 
     
      
   <tr>

  <td>${list.productionId}</td>
  <td>${list.productionName}</td>
  

       <td> 

      <!--  <a class="layui-btn layui-btn-sm layui-btn-danger" data-toggle="modal" data-target="#editVoince" data-id="edit">查看详情</a></td> -->
      <%-- <input type="text"  id="demandDetailInformation2" value="${demand.demandDetailInformation}"/> --%>
     <%--  <input type="button" class="btn btn-primary" data-toggle="modal" data-target="#Revert" onClick="Values(${demand.demandId})" value="查看详情"/> --%>
      ${list.className} 
         
     <td >
     <a class="btn btn-info" id="yyy" href="<%=path%>production/adminProductionDetal.action?proId=${list.productionId}" target="_blank"  >查看详情</a> 
  <a href="<%=path %>download.action?upUrl=${list.productionImage }"   class=" btn btn-success   passBtn rightSize"  type="button"  data-id=${list.productionId } id="pass">下载封面</a>
 <a href="<%=path %>download.action?upUrl=${list.productionFile }"   class=" btn btn-warning illegalBtn rightSize"  type="button"  data-id=${list.productionId } id="illegal">下载文件</a>
  <%--  <button class="btn btn-danger  deleteBtn rightSize" type="button" data-id=${list.productionId } id="example">评价</button> --%>
        <a class="btn btn-danger" id="yyy" href="<%=path%>production/productionEvaluate.action?proId=${list.productionId}"   >评价</a> 
       </td>
       
        </tr>
        </c:forEach>
  </tbody>
        
         <tr>
   <%-- <td colspan="2"><a class="layui-btn layui-btn-sm" href="#" onclick="lastPage();return false;" id="last">上一页</a></td>
   <td >
   
   
   
   当前页：<a id="aaa">${num}</a><br>
          总页数：<a id="eee">${countPage}</a><br>
     第<input type="text" id="btn" size=2/>页<button onclick="selectPage()"><span class="layui-btn layui-btn-normal">跳转</span></button>
   
   
   </td>
   <td colspan="2"><a class="layui-btn layui-btn-sm" href="#"  onclick="nextPage();return false;" id="next">下一页</a></td>
   </tr> --%>
   <!-- ----------------------------------------- -->
  
    
   
  <!-- ------------------------------------     -->
<!-- 下架作品 -->
 
   
<!-- ------------------------------------     -->
      <!-- 审核作品 -->
  
<!-- ---------------------------------- -->
</table>
当前页<span id="currentPage" >${currentPage}</span>  
											总页数<span id="totalPages"  >${totalPages } </span>  
                                                    <button class="ydc-previous-item-btn-medium" onclick="addPages('last')"  >
                                                        <span>上一页</span>
                                                    </button>
                                                
                                                    <button class="ydc-previous-item-btn-medium"  onclick="addPages('next')"  >
                                                        <span>下一页</span>
                                                    </button>
                                                     第<div class="ydc-item-quick-kun"><input type="number" aria-invalid="false" class=""  name="toNumber"   id="toNumber"  ></div>页
                                                    <button style="margin-left:5px;" class="ydc-previous-item-btn-medium"  onclick="addPages('toNumber')" >
                                                        <span>跳转</span>
                                                    </button>  
</div>
 

 <script type="text/javascript">
    
    function addPages(state){
   	 
    	var toNumber=$("#toNumber").val();
    	//alert("跳转页数="+toNumber);
    //	if(state==toNumber){
    	//	alert("toNumber="+toNumber);
    	if(state=="toNumber"){
    		if(toNumber<=0){
        		alert("页数过小");
        		return false;
        	}
        	if(toNumber>$("#totalPages").text()){
        		alert("页数过大");
        		return false;
        	}
   	}
    	$("#ddd").empty();
    	//alert("currentPage="+$("#currentPage").text());
    	$.ajax({	
    		 url:"<%=path %>production/buyProductionAddPages.action",
    		 data:"currentPage="+$("#currentPage").text()+"&state="+state+"&totalPages="+$("#totalPages").text()+"&conditionName="+$("#conditionName").val()+"&fieldName="+$("#fieldName").val()+"&toNumber="+toNumber,
    		 dataType:"json",
    		 type:"post",
    		 success:function(redata){
    			 $("#currentPage").empty();
    			 $("#totalPages").empty();
    			 $("#currentPage").html(redata.currentPage);
    			 $("#totalPages").html(redata.totalPages);
    			 
    			 var list=redata.proList;
    			 var len = list.length;
    			
    			 for(var i=0;i<len;i++){    			        	 
    	             var e = list[i];
    	           
    	             $("#ddd").append("<tr><td>"+e.productionId+"</td>"
	            			 +"<td>"+e.productionName+"</td>"
	            			 +"<td>"
	            			 +e.className
	            			  
	            			
	            			 +"<td>"
	            			 +"<a class='btn btn-info btn btn-primary  ' id='yyy' href='<%=path%>production/adminProductionDetal.action?proId="+e.productionId+"'  target='_blank'>查看详情</a>"
	            		 
	             			 +" <a href='<%=path %>download.action?upUrl="+e.productionImage+" '  class='btn btn-success   passBtn rightSize'  type='button'  data-id='"+e.productionId+"' id='pass'>下载封面</a>"
	             			
	             			 +" <a href='<%=path %>download.action?upUrl="+e.productionFile+" '  class='btn btn-warning illegalBtn rightSize'  type='button'  data-id='"+e.productionId+"' id='illegal'>下载文件</a>"
	             	 
	            			 
 
	            			 +"</td>"
	            			 +"</tr>");
    	     //------------
 
  
    	     //----------
    			 
    			 } 	 
    			
    		 }
    	})
    	
    }
    
    
    
    </script>
    
    
    <script type="text/javascript">
    var  delProId;
    
    $("#ddd").on('click', '.deleteBtn', function () {
    	delProId= $(this).parents('tr').find('button').eq(0).data("id");
     	 $("#example").modal();
    }) 
   /*  $('#confirmDelRole').click(function(){
    	
    	alert("确认评价"+ $("#content3").val);
    }); */
    
    
    
    </script>
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
        
        <script type="text/javascript">
        function toEditProduction(proId){
        	
        	
        //	alert("要编辑的作品ID="+proId);        	
        		$.ajax({	
        		 url:"<%=path %>production/toEditProduction.action",
        		 data:"proId="+proId,
        		 dataType:"json",
        		 type:"post",
        		 success:function(redata){
        			 
        			 
        		 }
        		});
        	
        }
        
        
        
        </script>
        
    </body>
</html>
