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
        <link rel="stylesheet" href="<%=path%>css/oindex.css">
        <link rel="icon" type="image/x-icon" href="favicon.ico">
        <link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
        <link type="text/css" rel="stylesheet" href="<%=path%>css/core.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>css/icon.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>css/home.css">
        <script type="text/javascript" src="<%=path%>js/jquery-1.5.2.min.js"></script>
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
                        <div class="ydc-release-content">
                            <div class="ydc-tabPanel ydc-tabPanel-release">
                                <div class="ydc-release-tab-head">
                                    <ul>
                                        <li class="hit">作品中心</li>
                                       
                                    </ul>
                                </div>
                                <div class="ydc-panes">
                                    <div class="ydc-pane" style="display:block;">
                                        <div class="ydc-release-form-group ">
                                            <div class="ydc-warning-default">
                                                <p>搜索作品名称</p>
                                            </div>
                                            <div class="ydc-group-input clearfix" style="width:100%; margin-bottom:20px;">
                                                 <form  method="post" action="<%=path%>production/productionToManage.action" >
                                                <input type="text"  name="fieldName" id="fieldName"  placeholder="请输入关键词进行搜索"  style="width:91.333%"  value=${fieldName }>
                                                <button  type="submit"  class="ydc-group-button">搜 索</button>
                                          </form>
                                            </div>
                                        </div>
                                        <div class="ydc-assetStyle">
                                           
                                          
                                        </div>
                                        <div class="ydc-asset-img clearfix">
                                      
                                            
                                          
                       
   
                                        <div class="ydc-asset-img clearfix"   id="proList">                 
             								<c:forEach items="${list}"  var="list" >	  
                         									<div class="ydc-asset-img-list"  >
                                                <div class="ydc-asset-img-list-img"  ><img src="<%=path%>picture/findPicture.action?url=${list.productionImage}"  alt=""></div>
                                               <br>
                                                <div class="ydc-asset-img-list-til">${list.productionName }&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color:#ff0000">${list.auditName}</span></div>
                                                <div class="ydc-asset-img-list-del">
                                                   <form   style="margin:0px; padding:0px;"  method="post" action="<%=path%>production/toEditProduction.action?proId=${list.productionId }"   enctype="multipart/form-data" >         
                                                    <button  style="height:38px;" <%-- onclick="toEditProduction( ${list.productionId })" --%>  type="submit" >编辑</button>
                                                  </form>
                                                      <form style="margin:0px; padding:0px;"   method="post" action="<%=path%>production/toDelProduction.action?proId=${list.productionId }"   enctype="multipart/form-data"  onsubmit="return del()">
                                                    <button style="height:38px;"       type="submit" >删除</button>
                                               </form>
                                                </div>
                                            </div> 
              
											</c:forEach>                               
              </div>                               
        
                                           
                                          
                                        </div>
                                      
                                    </div>
                                    <div class="ydc-pane">
                                      
                                       
                                       
                                            
                                            
                                            
                                             
                                            
                                            
                                            
                                           
                                            
                                           
                                           
                                            
                                            
                                             
                                        </div>
                                        <div class="ydc-pagination">
                                 
                                            <ol>
                                            <li>
                                             当前页<span id="currentPage" >${currentPage}</span>  
											总页数<span id="totalPages"  >${totalPages } </span>        
                                        
                                            </li>
                                            
                                                <li class="ydc-previous-item">
                                                    <button class="ydc-previous-item-btn-medium "  onclick="addPages('last')">
                                                        <span>上一页</span>
                                                    </button>
                                                </li>
                                                
                                                <li class="ydc-previous-item">
                                                    <button class="ydc-previous-item-btn-medium" onclick="addPages('next')" >
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
