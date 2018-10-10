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
        <title>作品编辑</title>
        <link rel="icon" type="image/x-icon" href="favicon.ico">
        <link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
        <link type="text/css" rel="stylesheet" href="<%=path%>css/core.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>css/icon.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>css/home.css">
        <script type="text/javascript" src="<%=path%>js/jquery-1.5.2.min.js"></script>
        <link rel="stylesheet" href="<%=path%>css/oindex.css">
    </head>
    <body>
        <!-- head YDC begin -->
        
      <form  method="post" action="<%=path%>production/editProduction.action?proId=${production.productionId}" enctype="multipart/form-data"  onSubmit="return check()">
        
        <div class="o-top">
				<div class="width1180">
					
					<span class="fr">
						<!-- <a href="#" title="登录">登录</a>
						<a href="#" title="注册">注册</a> -->
						<a href="<%=path %>user/home.action" title="众包首页"><i class="o-home"></i>众包首页</a>
						
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
                                        <li class="hit">发布文章</li>
                                        
                                    </ul>
                                    <div class="ydc-release-amount">
                                      
                                    </div>
                                </div>
                                <div class="ydc-panes">
                                    <div class="ydc-pane" style="display:block;">
                                        <div class="ydc-release-form-group ">
                                            <div class="ydc-warning-default">
                                                <p>标题字数需在11字到30字之间。</p>
                                            </div>
                                            <div class="ydc-release-form-group-input">
                                                <input type="text" class="ydc-form-control"  name="title"   id="title"    title=""   value=${production.productionName }  onkeyUp="textLimitCheck(this, 30);">
                                                <div class="ydc-form-group-jl">
                                                    <span id="messageCount">0</span>
                                                    /30
                                                </div>
                                            </div>
                                        </div>
                                        <div class="ydc-release-form-text">
                                            <textarea name="area2" style="width: 100%;">${production.productionDetal }
										</textarea>
                                        </div>
                                        <div class="ydc-form-city">
                                             
                                                <div class="aui-card-form-item">
                                                    <label class="aui-card-form-label">分类:</label>
                                                    <div class="aui-card-form-input">
                                                        <select id="province" name="className" >
                                                            <c:forEach items="${list}"  var="list" >	              
  <option value="${list.parameterId}"  >${list.parameterName}</option>
	             <%-- <c:if test=" ${production.parameterId }== ${list.parameterId}"><option value="${list.parameterId}"   selected >${list.parameterName}</option> </c:if> 
	              <c:if test="${production.parameterId }!= ${list.parameterId}">	          <option value="${list.parameterId}"  >${list.parameterName}</option>  </c:if>  --%>
</c:forEach>	
                                                        </select>
                                                 
                                                    </div>
                                                </div>
                                                <div class="aui-card-form-item preview  aui-news">
                                                    <label class="aui-card-form-label">封面:</label>
                                                    <div class="aui-file-up-img" id="preview_0">
                                                        <img class="" id="imghead_0" border="0" src="<%=path%>picture/findPicture.action?url=${production.productionImage}">
                                                    </div>
                                                    <div class="aui-file-up-btn clearfix ">
                                                          <div class="idPicFile aui-btn aui-file-new">  
                                                            <input type="file" name="file"   id="file" class="file_photo aui-file-new-up" style="margin:0;"/>
                                                            <a>上传图片</a>
                                                         </div> 
                                                         </div> 
                                                        <div >
                                                            <p>图片尺寸建议：800*400 图片大小不超过1MB</p>
                                                        </div>
                                                    
                                                </div>
                                                上传作品文件:<input type="file"   name="productionFile"    id="productionFile"    />
                                                
                                                 <div>
                                            价格<input  type="text"  name="price"   id="price"    value=${production.productionMoney} />
                                            
                                            
                                            </div>
                                                
                                                
                                                
                                                <div class="ydc-btn">
                                                
                                                <!-- <input type="submit"  class="btn"   value=" submit " />
                                                <input type="submit "  class="btn"  value="发布" /> -->
                                                    <button class="btn" type="submit"  >发布</button> 
                                                         
                                                  <!--   <button class="btn btn-default">保存草稿</button> -->
                                                </div>
                                             
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
            
	   /*  var slideIndex = 0;
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
	    } */
	
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
    function check(){
    	var areaText=$("#area2").val(); 
    	var title=$("#title").val();
    	 var price=$("#price").val();
    	// alert("qq");
    	 var reg = /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/;
    	//alert("标题="+title);
    if(title==""){
    	alert("请输入标题");
    	return false;
    }else{
    	  if(price==""){
    	    	alert("请输入金额");
    	    	return false;
    	    }else{
    	    	
    	    	if (!(reg.test(price))) {
    	    	 /* //  alert("正确~");
    	    	   return true; */
    	    		   alert("金额输入有误~");
       	    	    return false;
    	    	}else{
    	    		if($("#area2").val().length<20){
    	    			alert("请输入不少于10字的描述");
    	    			 return false;
    	    		}else{
    	    			if(document.getElementById("productionFile").value == null || document.getElementById("productionFile").value == ""){
        	                alert("请选择上传文件");
        	                return false;
        	                }else	{
        	                					 if(document.getElementById("file").value == null || document.getElementById("file").value == ""){
        	                	    	                alert("请选择上传图片");
        	                	    	                return false;
        	              				  }
        	    	    }
    	    		} 
    	    		
    	    	}
    	    	
    	    }
    }
   
  
    
    
	
	
   
	/* var area2=$("#area2").val();
	 
	alert "=="+area2);
	if(area2.length<10){
		alert("请输入不少于10字的描述");
		 return false;
	}
	if(area2.length>200){
		alert("描述超过200字");
		 return false;
	}  
	 */
    }    
        
        
        </script>
        </form>
    </body>
</html>
