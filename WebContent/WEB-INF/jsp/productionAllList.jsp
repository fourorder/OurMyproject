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
<title>已发布的作品</title>
 <link rel="icon" type="image/x-icon" href="favicon.ico">
 <link rel="stylesheet" href="<%=path%>css/oindex.css">
        <link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/core.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/icon.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/home.css">
        <script type="text/javascript" src="<%=path%>admin/js/jquery-1.5.2.min.js"></script>
        <script type="text/javascript">
    
      
	
        </script>
        <style type="text/css">
         .ydc-asset-img-list-img img { width: 100%; height: 240px;}       </style>
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
                   
                    <!-- right begin -->
                    <div class="ydc-column ydc-column-8" style="position:absolute; left:100px;">
                        <div class="ydc-release-content">
                            <div class="ydc-tabPanel ydc-tabPanel-release">
                                <div class="ydc-release-tab-head">
                                    <ul>
                                        <li class="hit">已发布的作品</li>
                                      
                                    </ul>
                                </div>
                                <div class="ydc-panes">
                                    <div class="ydc-pane" style="display:block;">
                                        <div class="ydc-release-form-group ">
                                            <div class="ydc-warning-default">
                                                <p>搜索标题以及描述</p>
                                            </div>
                                            <div class="ydc-group-input clearfix" style="width:100%; margin-bottom:20px;">
                                           <form  method="post" action="<%=path%>production/toProductionPass.action?currentPage=1">
                                               <input type="text" name="fieldName" id="fieldName" placeholder="请输入作品名字进行搜索" style="width:25.333%" value=${fieldName }>
                                               <input type="text" name="conditionName" id="conditionName" placeholder="请输入服务商名字进行搜索" style="width:25.333%"  value=${conditionName }>
                                               <input type="submit"  value="搜索"  class="ydc-group-button" style="width:10.333%" />
        							    </form>
        							       <!--   <button class="ydc-group-button">搜 索</button> -->
                                            </div>
                                        </div>
                                       <%-- <a href="<%=path%>production/toManageProduction.action" >路径！！临时跳转，后期删掉，跳转进入服务商后台管理</a> --%>
<%-- <h3><a href="<%=path%>powder/toFindCharacter.action"  >h临时跳转进入权限管理，后期删掉，路径！！</a></h3>
<h3><a href="<%=path%>production/toAdminProductionManage.action"  >h临时跳转进入作品审核管理，后期删掉，路径！！</a></h3> --%>
<%--    <h3><a href="<%=path%>production/findBuyProduction.action"  >h临时跳转进入作品审核管理，后期删掉，路径！！</a></h3>
        --%>                                 
                                        <div class="ydc-asset-img clearfix"   id="proList">
                                           <c:forEach items="${list}"  var="list" >
                                              <div class="ydc-asset-img-list">
                                                <div class="ydc-asset-img-list-img"  >
                                                   <a href="<%=path%>production/toProductionDetal.action?proId=${list.productionId}"  target="_blank">
                                                <img src="<%=path%>picture/findPicture.action?url=${list.productionImage}"  alt=""></a></div>
                                               <br>
                                                <div class="ydc-asset-img-list-til">${list.productionName }</div>
                                              
                                            </div> 
                                        	</c:forEach>	
                      
                                        </div>
                                            
                                            
                                            
                                            
                                            
                                        </div>
                                        <div class="ydc-pagination"  style="position:absolute; left:170px;">
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
	
 
	  <c:forEach items="${demandBeans}"  var="demandBeans" >	              
	           <div class="filtr-item" data-category="2">
	              <a href="<%=path%>production/toProductionDetal.action?proId=${list.productionId}">
			 <img src="<%=path%>picture/findPicture.action?url=${demandBeans.demandHead}"  alt="">
			<span class="ss">${demandBeans.demandTitle}</span>
		</a>
	</div>
</c:forEach>	
 
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
   	 
    	var toNumber=$("#toNumber").val();
//alert("跳转页数="+toNumber);
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
    	$("#proList").empty();
    	//alert("currentPage="+$("#currentPage").text());
    	$.ajax({	
    		 url:"<%=path %>production/AddPagesPass.action",
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
    	           
    	             $("#proList").append( "<div class='ydc-asset-img-list'><div class='ydc-asset-img-list-img'  >"
    	            		 +"<a href='<%=path%>production/toProductionDetal.action?proId="+e.productionId+"'>"
    	            +"<img src='<%=path%>picture/findPicture.action?url="+e.productionImage+"' alt=''></a></div>"
    	            +"<br><div class='ydc-asset-img-list-til'>"+e.productionName +"</div></div> "
    	             );
    	     
    			 
    			 } 	 
    			 
    		 }
    	})
    	
    }
    
    
    
    </script>
</body>
</html>