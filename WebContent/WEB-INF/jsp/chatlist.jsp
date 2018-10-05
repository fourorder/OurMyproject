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
<title>消息列表</title>
<link rel="stylesheet" href="<%=path%>css/oindex.css">
<style type="text/css">

.grouptable{
    position: relative;
    font-size: 16px;
    border: 1px solid #ddd;
    border-top: 0;
    width: 100%;
    height: 140px;
}
.table-item-img{
    overflow: hidden;
    background-color: #eee;
    position: relative;
    float: left;
    height: 95px;
    width: 133px;
    margin: 20px;
    background:#FFFFFF;
}
.ydcactions{
    font-size: 12px;
    float: right;
    margin-right: 40px;
    height: 100%;
    line-height: 140px;
}
.actions-trigger{
    font-size: 14px;
    color: #3b77be;
    margin-left: 20px;
    cursor:pointer;
    background: none;
    border: none;
}
.item-text{
    word-break: break-all;
    padding-top: 40px;
    margin-left: 20px;
    margin-bottom: 20px;
}
.table-item-tag{
    display: inline-block;
    border-radius: 2px;
    margin-left: 6px;
    padding: 1px 6px;
    font-size: 12px;
    color: #3b77be;
    border: 1px solid #3b77be;
    margin-right: 6px;
}
.group-table-item-info{
    margin-left: 20px;
    font-size: 12px;
    color: #a5a5a5;
}
</style>
<link rel="icon" type="image/x-icon" href="favicon.ico">
        <link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/core.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/icon.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/home.css">
        <script type="text/javascript" src="<%=path%>admin/js/jquery-1.5.2.min.js"></script>
        
        <script type="text/javascript" src="<%=path%>admin/js/jquery.min.js"></script>
       
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
				<!-- left end -->
       
           <!-- right begin -->
				<div class="ydc-column ydc-column-8" style="margin:auto;">
					<div class="ydc-release-content">
						<div class="ydc-tabPanel ydc-tabPanel-release">
							<div class="ydc-release-tab-head">
								<ul>
									<li class="hit">未读消息列表</li>
								</ul>
								
							</div>
							<div class="ydc-panes">
								<div class="ydc-pane" style="display:block;">								
									<div class="ydc-group-table" id="chatList">    <!-- 这个是主标签 -->
									 <c:forEach items="${chatList[0]}"  var="chat" >
									 	<!-- 未读消息人列表 -->									 
									 	<div class="ydc-group-table-item">
											<div class="ydc-group-table-item-img">
												<img src="<%=path%>picture/findPicture.action?url=${chat.userHead}">
											</div>
											<div class="ydc-actions">
												<div>
													<a href="<%=path%>chat/gotochat.action?account=${chat.userAccount}"   target="_blank"><button class="ydc-actions-trigger">查看未读消息</button></a>
												</div>
											</div>
											<div class="ydc-group-table-item-text">
												<span>
													${chat.userName}
												</span>
												<span class="ydc-group-table-item-tag">${chat.count}</span>
											</div>
										</div>
									 </c:forEach>									
									</div>
								</div>                                  
                                    <div class="ydc-pagination">
									<ol>
										<li class="ydc-previous-item">
											<button class="ydc-previous-item-btn-medium ydc-disabled" onclick="selectchat('last')" id="last" disabled="disabled">
												<span>上一页</span>
											</button>
										</li>
										<li id="pages">${chatList[1]}/${chatList[2]}</li>
										<li class="ydc-previous-item">
										<c:if test="${chatList[2]=='1'}">
										<button class="ydc-previous-item-btn-medium ydc-disabled" onclick="selectchat('next')" id="next" disabled="disabled">
												<span>下一页</span>
											</button>
										</c:if>
										<c:if test="${chatList[2]!='1'}">
										<button class="ydc-previous-item-btn-medium" onclick="selectchat('next')" id="next">
												<span>下一页</span>
											</button>
										</c:if>																					
										</li>
										<li class="ydc-item-quick">
											第<div class="ydc-item-quick-kun"><input type="number" aria-invalid="false" class="" id="btn1"></div>页
											<button style="margin-left:5px;" class="ydc-previous-item-btn-medium"  onclick="selectchat('jump')" >
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
	    
var page="1";
function selectchat(state){
	$("#chatList").empty();
	var num=$("#btn1").val();
	if(num!=""){
		page=num;		
	}
	$.ajax({	
		 url:"<%=path%>chat/selectchat.action",
		 data:"state="+state+"&page="+page,
		 dataType:"json",
		 type:"post",
		 success:function(redata){		
			   		page=redata[1];
			   	 var list=redata[0];
		         var len = list.length;
		         var size=redata[2];
		         
		          for(var i=0;i<len;i++){    			        	 
		             var e = list[i];
		             $("#chatList").append("<div class='ydc-group-table-item'>"
								+"<div class='ydc-group-table-item-img'>"
						+"<img src='<%=path%>picture/findPicture.action?url="+e.userHead+"'>"
					+"</div>"
					+"<div class='ydc-actions'>"
						+"<div>"
							+"<a href='<%=path%>chat/gotochat.action?account="+e.userAccount+"'   target='_blank'><button class='ydc-actions-trigger'>查看未读消息</button></a>"
						+"</div>"
					+"</div>"
					+"<div class='ydc-group-table-item-text'>"
						+"<span>"
							+e.userName
						+"</span>"
						+"<span class='ydc-group-table-item-tag'>"+e.count+"</span>"
					+"</div>"
				+"</div>"); 
		         } 	 
		          if(page==1){
		        	 $("#last").attr("class","ydc-previous-item-btn-medium ydc-disabled"); 
		        	 $("#last").attr("disabled",true);
		         }else{
		        	 $("#last").attr("class","ydc-previous-item-btn-medium");
		        	 $("#last").attr("disabled",false);
		         }
		         if(page==size){
		        	 $("#next").attr("class","ydc-previous-item-btn-medium ydc-disabled");
		        	 $("#next").attr("disabled",true);
		         }else{
		        	 $("#next").attr("class","ydc-previous-item-btn-medium");
		        	 $("#next").attr("disabled",false);
		         }
		         $("#pages").html(page+"/"+size); 
		         
		 }
	 }); 
    	
}
</script>        
        
     
</body>
</html>