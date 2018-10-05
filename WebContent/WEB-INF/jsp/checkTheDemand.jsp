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
<title>最新需求</title>

 <link rel="icon" type="image/x-icon" href="favicon.ico">
 <link rel="stylesheet" href="<%=path%>css/oindex.css">
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
        <script type="text/javascript" src="<%=path%>admin/js/jquery.min.js"></script>
        <script type="text/javascript">
      
      
        var page = ${requestScope.page}
        function selectDemand(state){
        	
        	$("#demandDateList").empty();
        	var num=$("#btnjump").val();
        	if(num!=""){
        		page=num;		
        	}
        	$.ajax({
        	 url:"<%=path%>demand/selectDemand.action",
       		 data:"state="+state+"&page="+page+"&searchName="+$('#searchName').val(),
       		 dataType:"json",
       		 type:"post",
       		 success:function(redata){
       			page=redata[0];
       			var countpage = redata[1];
			   	var list=redata[2];
		        var len = list.length;
		        
       			
		
		       
		    
		        for(var i=0;i<len;i++){    
		        	
		            var e = list[i];
		            
		            $("#demandDateList").append(
		            		
		            " <div class='ydc-asset-img-list'>"
		          	+"<a href='<%=path%>demand/queryDemand.action?demandid="+e.demandId+"'>"
		            +"<img src='<%=path%>picture/findPicture.action?url="+e.demandHead+"' width='200' height='200'>"
		            		
		            + "<div class='ydc-asset-img-list-til'>"+e.demandTitle+"</div>"
		            
		            +"</a></div>"
		            );
		         } 	
		        $("#pages").html(page+"/"+countpage);
       		 }
        	})
        	
        	
        	
        	
        	
        	
        }
        
        
        
        </script>
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
                    <div class="ydc-column ydc-column-8">
                        <div class="ydc-release-content">
                            <div class="ydc-tabPanel ydc-tabPanel-release">
                                <div class="ydc-release-tab-head">
                                    <ul>
                                        <li class="hit">最新需求</li>
                                      
                                    </ul>
                                </div>
                                <div class="ydc-panes">
                                    <div class="ydc-pane" style="display:block;">
                                        <div class="ydc-release-form-group ">
                                            
                                            <div class="ydc-group-input clearfix" style="width:100%; margin-bottom:20px;">
                                                <input type="text" name="searchName" id="searchName" placeholder="请输入关键词进行搜索" value="${requestScope.searchName}" style="width:91.333%">
                                                <button class="ydc-group-button" onclick="selectDemand('query')">搜 索</button>
                                            </div>
                                        </div>
                                       
                                        <div class="ydc-asset-img clearfix" id="demandDateList">
                                           <c:forEach items="${demandBeans}"  var="demandBeans" >
                                          
                                            <div class="ydc-asset-img-list">
                                             <a href="<%=path%>demand/queryDemand.action?demandid=${demandBeans.demandId}">
                                                <div >
                                                
                                                <img src="<%=path%>picture/findPicture.action?url=${demandBeans.demandHead}" width='200px' height='200px'>
                                                </div> </a>
                                                <div class="ydc-asset-img-list-til">${demandBeans.demandTitle}</div>
                                                
                                                </div>
                                          
                                        	</c:forEach>	
                                        
                                        
                                        
                                        
                                            
                                        </div>
                                            
                                            
                                            
                                            
                                            
                                        </div>
                                       <div class="ydc-pagination">
									<ol>
										<li class="ydc-previous-item">
											<button class="ydc-previous-item-btn-medium" onclick="selectDemand('last')" id="last">
												<span>上一页</span>
											</button>
										</li>
										<li id="pages">${requestScope.page}/${requestScope.countpage}</li>
										<li class="ydc-previous-item">
											<button class="ydc-previous-item-btn-medium" onclick="selectDemand('next')" id="next">
												<span>下一页</span>
											</button>
											
										</li>
										<li class="ydc-item-quick">
											第<div class="ydc-item-quick-kun"><input type="number" aria-invalid="false" class="" id="btnjump"></div>页
											<button style="margin-left:5px;" class="ydc-previous-item-btn-medium"  onclick="selectDemand('jump')" >
												<span>跳转</span>
											</button>
										</li>
									</ol>
								
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
    
</body>
</html>