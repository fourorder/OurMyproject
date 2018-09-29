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
     <a class="btn btn-info" id="yyy" href="<%=path%>production/adminProductionDetal.action?proId=${list.productionId}"   >查看详情</a> 
  <a href="<%=path %>download.action?upUrl=${list.productionImage }"   class=" btn btn-success   passBtn rightSize"  type="button"  data-id=${list.productionId } id="pass">下载封面</a>
 <a href="<%=path %>download.action?upUrl=${list.productionFile }"   class=" btn btn-warning illegalBtn rightSize"  type="button"  data-id=${list.productionId } id="illegal">下载文件</a>
  
       
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
</div>
  
 <script type="text/javascript">
    
    function addPages(state){
   	 

    	$("#ddd").empty();
    	//alert("currentPage="+$("#currentPage").text());
    	$.ajax({	
    		 url:"<%=path %>production/buyProductionAddPages.action",
    		 data:"currentPage="+$("#currentPage").text()+"&state="+state+"&totalPages="+$("#totalPages").text()+"&conditionName="+$("#conditionName").val()+"&fieldName="+$("#fieldName").val(),
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
	            			 +"<a class='btn btn-info btn btn-primary  ' id='yyy' href='<%=path%>production/adminProductionDetal.action?proId="+e.productionId+"' >查看详情</a>"
	            		 
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
        function addPages(state){
          	 

        	$("#proList").empty();
        	//alert("currentPage="+$("#currentPage").text());
        	$.ajax({	
        		 url:"<%=path %>production/ManageAddPages.action",
        		 data:"currentPage="+$("#currentPage").text()+"&state="+state+"&totalPages="+$("#totalPages").text()+"&fieldName="+$("#fieldName").val(),
        		 dataType:"json",
        		 type:"post",
        		 success:function(redata){
        			 $("#currentPage").empty();
        			 $("#totalPages").empty();
        			 $("#currentPage").html(redata.currentPage);
        			 $("#totalPages").html(redata.totalPages);
        			/*  $("#fieldName").html(redata.fieldName); */
        			 
        			 var list=redata.proList;
        			 var len = list.length;
        			
        			 for(var i=0;i<len;i++){    			        	 
        	             var e = list[i];
        	           
        	             $("#proList").append( "<div class='ydc-asset-img-list'  ><div class='ydc-asset-img-list-img'>"
        	            		 
        	            +"<img src='<%=path%>picture/findPicture.action?url="+e.productionImage+"' alt=''></div> "
        	            +"<br><div class='ydc-asset-img-list-til'>"+e.productionName +"&nbsp&nbsp&nbsp&nbsp&nbsp<span style='color:#ff0000'>"+e.auditName+"</span></div>"
        	            +" <div class='ydc-asset-img-list-del'> "
        	           +"<form   style='margin:0px; padding:0px;'  method='post' action='<%=path%>production/toEditProduction.action?proId="+e.productionId +"'enctype='multipart/form-data' >  "
        	           +" <button  style='height:38px;' <%-- onclick="toEditProduction( ${list.productionId })" --%>  type='submit' >编辑</button>"
        	         +" </form>"
        	         +"<form style='margin:0px; padding:0px;'   method='post' action='<%=path%>production/toDelProduction.action?proId="+e.productionId +"' enctype='multipart/form-data'  onsubmit='return del()'>"
        	         +"<button style='height:38px;'       type='submit' >删除</button>"
        	        +"</form>"	 
        	            +"</div> </div>"
        	             );
        	     //-----------------
        	        
                                                
                                               
        	     //--------------
        			 
        			 } 	 
        			 
        		 }
        	})
        	
        }
        
        
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
