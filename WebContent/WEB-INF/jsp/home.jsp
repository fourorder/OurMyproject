<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<head>
	<meta charset="UTF-8">
	<title>众包服务平台</title>
	<link rel="stylesheet" href="<%=path%>css/oindex.css">
	<script type="text/javascript" src="<%=path%>js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=path%>js/jquery.superslide.2.1.1.js"></script>
</head>
<body>

	<!--头部-->
		<header class="oindex-head">
			<div class="o-top">
				<div class="width1180">
					<span class="fl">您好，欢迎访问众包一站式服务平台
					</span>
					<span class="fr">
						<!-- <a href="#" title="登录">登录</a>
						<a href="#" title="注册">注册</a> -->
						<a href="#" title="众包首页"><i class="o-home"></i>众包首页</a>
						<a href="#" title="联系我们" ><i class="o-contract"></i>联系我们</a>
						<!--登录后
						<a title="管理员" href="http://www.yizhihou.com/member/" target="_blank" rel="nofollow">嘉客</a>
						<a href="http://www.yizhihou.com/member/logout.php" rel="nofollow">退出</a>
						-->
					</span>
				</div>
			</div>
			<div clear></div>
			<div class="head-muild">
				<div class="width1180">
					 <h1 class="fl"><img src="<%=path%>images/logo1.png"></h1> 
					<div class="o-search">
						<form action="<%=path%>user/search.action?page=1" method="post">
							<input type="text" class="search-text"  placeholder="请输入您搜索的关键词" name="name"><button class="search-bnt" type="submit"><img src="<%=path%>images/search-i.png">  搜索</button>
						</form>
					</div>
					<!-- <div class="fl search-keywords">
						<a href="#" title="长沙注册公司">长沙注册公司</a>       <a href="#" title="注册流程">注册流程</a>      <a href="#" title="注册费用">注册费用</a>
					</div> -->
					<div class="clearfix"></div>
					<nav>
						<div class="fenlei-nav fl">用户操作</div>
						<ul class="fl">
							<li><a href="index.html" title="首页" class="on">首页</a></li>
							<%-- <li><a href="#" title="最新需求">最新需求<img src="<%=path%>images/hot.gif"></a></li>
							<li><a href="#" title="最新作品">最新作品<img src="<%=path%>images/hot.gif"></a></li> --%>
							<li><a href="<%=path %>lighthouse/gotolighthouse.action?page=1" title="曝光台">曝光台<img src="<%=path%>images/hot.gif"></a></li>
							<li><a href="<%=path %>skippage/gotosearchcredit.action" title="信用查询">信用查询<img src="<%=path%>images/hot.gif"></a></li>
							<li><a href="<%=path %>introduction/getrule.action" title="规则介绍">规则介绍</a></li>
							<!-- <li><a href="#" title="关于我们">关于我们</a></li> -->
							<span class="fr"><img src="<%=path%>images/o-tel.gif"></span>
						</ul>
					</nav>
				</div>
			</div>
		</header>
	<!--头部-->
	<!--banner-->
		<div class="o-banner">
			<div class="width1180">
				<div class="banner-menu">
				<c:if test="${user.characterId==1}">
					<ul>
						<li>
						<p><a href="<%=path%>demand/fromDemand.action" title="发布需求" ><i class="o-index1"></i>发布需求<b></b></a></p>
							
						</li>
						<li class="clearfix">
							<p><a href="<%=path%>production/toProduction.action"  title="购买作品"><i class="o-index2"></i>购买作品<b></b></a></p>
						

						</li>
						<li class="clearfix">
							<p><a href="#" title="寻找顾问"><i class="o-index3"></i>寻找顾问<b></b></a></p>						
						</li>
						
					</ul>		
				</c:if>
				<c:if test="${user.characterId==2}">
					<ul>
						<li>
						<p><a href="<%=path%>demand/toDemand.action" title="我要投标" ><i class="o-index1"></i>我要投标<b></b></a></p>
							
						</li>
						<li class="clearfix">
						<p><a href="<%=path%>production/toManageProduction.action"  title="发布作品"><i class="o-index2"></i>发布作品<b></b></a></p>
						
						</li>
						<li class="clearfix">
						<p><a href="#"  title="成为顾问"><i class="o-index2"></i>成为顾问<b></b></a></p>
						
						</li>
					</ul>		
				</c:if>	
				</div>
				<!--滚动图片-->
				<div class="banner-mulid">
					<div class="qianhong-b">
				    	<ul class="qianhongpic" style="position: relative; width: 1920px; height: 460px;">
				            <li style="position: absolute; width: 708px; left: 0px; top: 0px; display: list-item;"><a href="#" title="">
								<a href="<%=path%>adver/gotoadver.action?flag=${adverList[0].advertisementNum}"><img src="<%=path%>picture/findPicture.action?url=${adverList[0].advertisementImage}" width="708px" height="330px"></a>
				            </a></li>
				            <li style="position: absolute; width: 708px; left: 0px; top: 0px; display: list-item;"><a href="#" title="">
								<a href="<%=path%>adver/gotoadver.action?flag=${adverList[1].advertisementNum}"><img src="<%=path%>picture/findPicture.action?url=${adverList[1].advertisementImage}" width="708px" height="330px"></a>
				            </a></li>
				            <li style="position: absolute; width: 708px; left: 0px; top: 0px; display: list-item;"><a href="#" title="">
								<a href="<%=path%>adver/gotoadver.action?flag=${adverList[2].advertisementNum}"><img src="<%=path%>picture/findPicture.action?url=${adverList[2].advertisementImage}" width="708px" height="330px"></a>
				            </a></li>
				        </ul>
				        <a class="prev" href="javascript:void(0)" style="opacity: 0.07474937499999999; display: none;"></a>
				        <a class="next" href="javascript:void(0)" style="opacity: 0.07399; display: none;"></a>
				        <div class="num">
				        <ul><li class="on">1</li><li class="">2</li><li class="">3</li></ul>
				      
				      </div>

                    </div>
                    <div class="banner-li">
						<img src="<%=path%>images/oindex-1.png"><img src="<%=path%>images/oindex-2.png" class="fr">
                    </div>
<script>
/*鼠标移过，左右按钮显示*/
$(".qianhong-b").hover(function(){
$(this).find(".prev,.next").fadeTo("show",0.1);
},function(){
$(this).find(".prev,.next").hide();
})
/*鼠标移过某个按钮 高亮显示*/
$(".prev,.next").hover(function(){
$(this).fadeTo("show",0.7);
},function(){
$(this).fadeTo("show",0.1);
})
$(".qianhong-b").slide({ titCell:".num ul" , mainCell:".qianhongpic" , effect:"fold", autoPlay:true, interTime:3000 , autoPage:true });
</script>

</div>
<!--右边-->
					<div class="banner-right">
						<div class="user-box">
							<img src="<%=path%>images/banner-touxiang.png">
							<c:if test="${user==null}">
							<p>hi,您好！</p>
							</c:if>
							<c:if test="${user!=null}">
							<p>${user.userName}</p>
							</c:if>
							<c:if test="${user==null}">
							<a href="<%=path%>user/show.action" title="" class="b-login">登录</a><a href="<%=path%>user/gotoregister.action" title="" class="b-regist">注册</a>
							</c:if>
							<c:if test="${user!=null}">
							<a href="<%=path%>user/UserInformation.action?userid=${user.userId}" title="" class="b-login">个人中心</a><a href="<%=path%>user/logout.action" title="" class="b-regist">退出登录</a>
							</c:if>
							
							
						</div>
						<div class="banner-baoz">
							<p>全程服务无忧保障</p>

							<ul>
								<li class="fl"><img src="<%=path%>images/b-01.png">价格透明</li>
								<li class="fr"><img src="<%=path%>images/b-02.png">安全保障</li>
								<li class="fl"><img src="<%=path%>images/b-03.png">准时保质</li>
								<li class="fr"><img src="<%=path%>images/b-04.png">售后无忧</li>
							</ul>
						</div>
						<div class="clearfix"></div>
						<div class="banner-anli">
							<p>成功交易&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=path%>fund/getFundList.action?page=1">更多</a></p>
							<ul>
							<c:forEach items="${fundList}"  var="fund">
								<li>${fund.dealDate}&nbsp;&nbsp;&nbsp;${fund.userBean.userName}&nbsp;&nbsp;&nbsp;成功交易</li>
							</c:forEach>
								<!-- <li class="fl"><img src="images/b-01.png">价格透明</li>
								<li class="fr"><img src="images/b-02.png">安全保障</li>
								<li class="fl"><img src="images/b-03.png">准时保质</li>
								<li class="fr"><img src="images/b-04.png">售后无忧</li> -->
							</ul>
						</div>							
						</div>
				<!--右边-->
				</div>

				<!--滚动图片-->
				
			</div>
		</div>
	<!--banner-->
	<!--推荐服务-->
	<div class="width1180 o-tuijian">
		<div class="o-indexttitle">
			<span>热卖作品</span>
		</div>
		<ul>
			<li>
				<div class="tuijian-text">
					<p class="t-title">${productionList[0].productionName}</p>
					<p class="t-decoration">${productionList[0].productionDetal}</p>
					<p class="t-price">${productionList[0].productionMoney}</p>
					<a href="#" title="立即购买">立即购买</a>
				</div>
				<div class="tuijian-img fl"><img src="<%=path%>picture/findPicture.action?url=${productionList[0].productionImage}" width="148px" height="120px"></div>
			</li>
			<li>
				<div class="tuijian-text">
					<p class="t-title">${productionList[1].productionName}</p>
					<p class="t-decoration">${productionList[1].productionDetal}</p>
					<p class="t-price">${productionList[1].productionMoney}</p>
					<a href="#" title="立即购买">立即购买</a>
				</div>
				<div class="tuijian-img fl"><img src="<%=path%>picture/findPicture.action?url=${productionList[1].productionImage}" width="148px" height="120px"></div>
			</li>
			<li>
				<div class="tuijian-text">
					<p class="t-title">${productionList[2].productionName}</p>
					<p class="t-decoration">${productionList[2].productionDetal}</p>
					<p class="t-price">${productionList[2].productionMoney}</p>
					<a href="#" title="立即购买">立即购买</a>
				</div>
				<div class="tuijian-img fl"><img src="<%=path%>picture/findPicture.action?url=${productionList[2].productionImage}" width="148px" height="120px"></div>
			</li>
		</ul>
	</div>
	<!--推荐服务-->
	<!--工商服务-->
	<!-- <div class="gongs-fuwu">
		<div class="width1180">
			<div class="o-indexttitle">
				<span class="fl">工商服务</span>
				<div class="fr">
					<a href="#" title="公司注册">公司注册</a><a href="#" title="工商变更">工商变更</a><a href="#" title="更多">更多</a>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="ofuwu-box width1180">
				<div class="gongsizc-box fl"><img src="images/oindex-3.png"></div>
				<ul class="fl">
					<li>
						<div class="li-top fuwupic1">
							
								<p class="fuwu-title"><a href="#" title="有限责任公司注册"> 有限责任公司注册</a></p>
								<p class="color666">抢先一步，最快3天拿执照</p>
								<p class="fuwu-price colorred">￥599.00</p>
								<a href="#" class="look-detail">查看详情</a>
						</div>
						<div class="fuwupic2">
							
								<p class="fuwu-title"><a href="#" title="有限责任公司注册"> 有限责任公司注册</a></p>
								<p class="color666">1张身份证即可当老板</p>
								<p class="fuwu-price colorred">￥499.00</p>
								<a href="#" class="look-detail">查看详情</a>
						</div>
					</li>

					<li>

						<div class="li-big">
							
								<p class="fuwu-title"><a href="#" title="小规模代理记账"> 小规模代理记账</a></p>
								<p class="color666">高效快捷，0失误，全负责！</p>
								<p class="fuwu-price colorred">￥3600.00/年</p>
								<a href="#" class="look-detail">查看详情</a>
						</div>


					</li>
					
					<li>
						<div class="li-top fuwupic3">
							
								<p class="fuwu-title"><a href="#" title="一般纳税人代理记账"> 一般纳税人代理记账</a></p>
								<p class="color666">一般纳税人,尊享专业服务</p>
								<p class="fuwu-price colorred">￥5000.00/年</p>
								<a href="#" class="look-detail">查看详情</a>
						</div>
						<div class="fuwupic4">
						
								<p class="fuwu-title"><a href="#" title="税务筹划"> 税务筹划</a></p>
								<p class="color666">税务筹划， 一对一专项指导</p>
								<p class="fuwu-price colorred">￥100.00</p>
								<a href="#" class="look-detail">查看详情</a>
						</div>
					</li>

					<li style="border-right:0px">

						<div class="fuwupic5">
							
								<p class="fuwu-title"><a href="#" title="有限责任公司注册">小规模代理记账</a></p>
								<p class="color666">高效快捷，0失误，全负责！</p>
								<p class="fuwu-price colorred">￥3600.00/年</p>
								<a href="#" class="look-detail">查看详情</a>
							
						</div>

					</li>

				</ul>
			</div>
		</div>
	</div> -->
	<!--工商服务-->
	<div class="fuw-advance width1180"><img src="<%=path%>images/oindex-16.png"></div>
	<!--知识产权-->
	<div class="zhishicq-box width1180">
		<div class="o-indexttitle">
				<span class="fl">雇主故事</span>
				<!-- <div class="fr">
					<a href="#" title="更多">更多</a>
				</div> -->
			</div>
			<div class="clearfix"></div>
			<div class="zhishicq-bigt">
					<ul>
						<li  style="height:300px;">
							<a href="${story[0].userStoryUrl}" title="" target="_blank"><span class="s-line">${story[0].userStoryTitle}</span>
							<p class="color666">${story[0].userStoryTime} </p>
							<!-- <p class=" colorred">￥2100起</p> -->
							<img src="<%=path%>picture/findPicture.action?url=${story[0].storyImg}" width="150px" height="120px">
							</a>
						</li>
						<li style="height:300px;">
							<a href="${story[1].userStoryUrl}" title="" target="_blank"><span class="s-line">${story[1].userStoryTitle}</span>
							<p class="color666">${story[1].userStoryTime} </p>
							<img src="<%=path%>picture/findPicture.action?url=${story[1].storyImg}" width="150px" height="120px">

							</a>
						</li>
						<li style="height:300px;">
							<a href="${story[2].userStoryUrl}" title="" target="_blank"><span class="s-line">${story[2].userStoryTitle}</span>
							<p class="color666">${story[2].userStoryTime} </p>
							<img src="<%=path%>picture/findPicture.action?url=${story[2].storyImg}" width="150px" height="120px">
							</a>
						</li>
						<li style="height:300px;">
							<a href="${story[3].userStoryUrl}" title="" target="_blank"><span class="s-line">${story[3].userStoryTitle}</span>
							<p class="color666">${story[3].userStoryTime} </p>
							<img src="<%=path%>picture/findPicture.action?url=${story[3].storyImg}" width="150px" height="120px">
							</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
				<!-- <div class="zhishicq-bigb">
					<dl class="width450">
						<dt class="fl"><img src="images/oindex-24.png"></dt>
						<dd class="fl width250">
							<a href="#" title="商标注册">商标注册</a>
							<a href="#" title="无效宣告">无效宣告</a>
							<a href="#" title="商标注销">商标注销</a>
							<a href="#" title="异议答辩">异议答辩</a>
							<a href="#" title="异议复审">异议复审</a>
							<a href="#" title="异议复审">异议复审</a>
						</dd>
					</dl>

					<dl >
						<dt class="fl"><img src="images/oindex-25.png"></dt>
						<dd class="fl">
							<a href="#" title="发明专利 ">发明专利 </a>
							<a href="#" title="外观专利">外观专利</a>
							<a href="#" title="实用新型专利">实用新型专利</a>
						</dd>
					</dl>

					<dl >
						<dt class="fl"><img src="images/oindex-26.png"></dt>
						<dd class="fl">
							<a href="#" title="一般作品普通办理 ">一般作品普通办理 </a>
							<a href="#" title="软件著作权普通办理">软件著作权普通办理</a>
						</dd>
					</dl>
				</div> -->
	</div>
	<!--知识产权-->
	<!--团队-->
	<%-- <div class="o-indexttitle width1180">
				<span>优秀团队</span>
	</div>
	<div class="oindex-team">
		<div class="width1180">
			<ul>
				<li>
					<img src="<%=path%>images/144224541.jpg" alt="陈经理">
					<p class="team-name">易广生</p>
					<p class="fontsize16">软件开发</p>
					<div class="team-desert">
						<p><i></i><span>擅长领域：</span>web项目/微信小程序</p>
						<p><i></i><span>开发经验：</span>5年</p>
						<p><i></i><span>联系方式：</span><font class="colorfa3508">18359222648</font></p>
						<a href="http://p.qiao.baidu.com/cps/chat?siteId=10343511&userId=23095085" title="联系我" rel="nofollow" class="team-bnt">联系我</a>
					</div>
				</li>
				<li>
					<img src="<%=path%>images/181252981.jpg" alt="陈经理">
					<p class="team-name">陈先生</p>
					<p class="fontsize16">前端设计</p>
					<div class="team-desert">
						<p><i></i><span>擅长领域：</span>js/php/html5</p>
						<p><i></i><span>开发经验：</span>6年</p>
						<p><i></i><span>联系方式：</span><font class="colorfa3508">18359222648</font></p>
						<a href="http://p.qiao.baidu.com/cps/chat?siteId=10343511&userId=23095085" title="联系我" rel="nofollow" class="team-bnt">联系我</a>
					</div>
				</li>
				<li>
					<img src="<%=path%>images/175321551.jpg" alt="陈经理">
					<p class="team-name">谢小姐</p>
					<p class="fontsize16">美工</p>
					<div class="team-desert">
						<p><i></i><span>擅长领域：</span>ps/UI设计</p>
						<p><i></i><span>开发经验：</span>5年</p>
						<p><i></i><span>联系方式：</span><font class="colorfa3508">18359222648</font></p>
						<a href="http://p.qiao.baidu.com/cps/chat?siteId=10343511&userId=23095085" rel="nofollow" title="联系我" class="team-bnt">联系我</a>
					</div>
				</li>
			</ul>
		</div>
	</div> --%>
	<!--团队-->
	<!--知识百科-->
	<!-- <div class="knowledge width1180">
		<div class="o-indexttitle">
				<span class="fl">知识百科</span>
				<div class="fr">
					<a href="#" title="公司注册">公司注册</a><a href="#" title="代理记账">代理记账</a><a href="#" title="知识产权">知识产权</a><a href="#" title="更多">更多</a>
				</div>
		</div>
		<div class="clearfix"></div>
		<div class="knowledge-box fl">
			<div class="knowledge-title"><span>公司注册流程</span><a href="#" title="更多" class="fr">更多</a></div>
			<ul>
				<li><a href="#" title="注册汽车租赁公司需要准备什么材料">注册汽车租赁公司需要准备什么材料</a></li>
				<li><a href="#" title="100元也能注册一家公司，你们信吗？">100元也能注册一家公司，你们信吗？</a></li>
				<li><a href="#" title="推动监管改革创新 维护市场繁荣发展 ——国家">推动监管改革创新 维护市场繁荣发展 ——国家</a></li>
				<li><a href="#" title="100元也能注册一家公司，你们信吗？">长沙公司注册后一般出现以下几种情况，税账！</a></li>
				<li><a href="#" title="注册汽车租赁公司需要准备什么材料">长沙颁发首张"四十三证合一"执照 "多头跑"</a></li>
				<li><a href="#" title="100元也能注册一家公司，你们信吗？">网购也是需要发票的！</a></li>
				<li><a href="#" title="推动监管改革创新 维护市场繁荣发展 ——国家">长沙公司注册后现以下几种情况，税账！</a></li>
				<li><a href="#" title="100元也能注册一家公司，你们信吗？">长沙颁发首张"四十三证合一"执照 "多头跑"</a></li>
			</ul>
		</div>

		<div class="knowledge-box fl">
			<div class="knowledge-title"><span>公司注册费用</span><a href="#" title="更多" class="fr">更多</a></div>
			<ul>
				<li><a href="#" title="注册汽车租赁公司需要准备什么材料">注册汽车租赁公司需要准备什么材料</a></li>
				<li><a href="#" title="100元也能注册一家公司，你们信吗？">100元也能注册一家公司，你们信吗？</a></li>
				<li><a href="#" title="推动监管改革创新 维护市场繁荣发展 ——国家">推动监管改革创新 维护市场繁荣发展 ——国家</a></li>
				<li><a href="#" title="100元也能注册一家公司，你们信吗？">长沙公司注册后一般出现以下几种情况，税账！</a></li>
				<li><a href="#" title="注册汽车租赁公司需要准备什么材料">长沙颁发首张"四十三证合一"执照 "多头跑"</a></li>
				<li><a href="#" title="100元也能注册一家公司，你们信吗？">网购也是需要发票的！</a></li>
				<li><a href="#" title="推动监管改革创新 维护市场繁荣发展 ——国家">长沙公司注册后现以下几种情况，税账！</a></li>
				<li><a href="#" title="100元也能注册一家公司，你们信吗？">长沙颁发首张"四十三证合一"执照 "多头跑"</a></li>
			</ul>
		</div>

		<div class="knowledge-box fr" style="margin-right:0px">
			<div class="knowledge-title"><span>公司注册常见问题</span><a href="#" title="更多" class="fr">更多</a></div>
			<ul>
				<li><a href="#" title="注册汽车租赁公司需要准备什么材料">注册汽车租赁公司需要准备什么材料</a></li>
				<li><a href="#" title="100元也能注册一家公司，你们信吗？">100元也能注册一家公司，你们信吗？</a></li>
				<li><a href="#" title="推动监管改革创新 维护市场繁荣发展 ——国家">推动监管改革创新 维护市场繁荣发展 ——国家</a></li>
				<li><a href="#" title="100元也能注册一家公司，你们信吗？">长沙公司注册后一般出现以下几种情况，税账！</a></li>
				<li><a href="#" title="注册汽车租赁公司需要准备什么材料">长沙颁发首张"四十三证合一"执照 "多头跑"</a></li>
				<li><a href="#" title="100元也能注册一家公司，你们信吗？">网购也是需要发票的！</a></li>
				<li><a href="#" title="推动监管改革创新 维护市场繁荣发展 ——国家">长沙公司注册后现以下几种情况，税账！</a></li>
				<li><a href="#" title="100元也能注册一家公司，你们信吗？">长沙颁发首张"四十三证合一"执照 "多头跑"</a></li>
			</ul>
		</div>

	</div> -->
	<!--知识百科-->
	<div class="clearfix"></div>
	<!--最新资讯-->
	<div class="knowledge-zixun width1180">
		<div class="o-indexttitle">
				<span class="fl">最新资讯</span>
				<!-- <div class="fr">
					<a href="#" title="创业资讯">创业资讯</a><a href="#" title="创业资讯">创业资讯</a><a href="#" title="法律资讯">法律资讯</a><a href="#" title="更多">更多</a>
				</div> -->
		</div>
		<div class="clearfix"></div>
		<ul>
			<li style="height:400px;">
				<div class="news-pic">
					<a href="${informationList1[0].informationAddress}" title="" target="_blank"><img src="<%=path%>picture/findPicture.action?url=${informationList1[0].informationImg}" width="240" height="160"></a>
					<p class="ne-title"><a href="${informationList1[0].informationAddress}" title="" target="_blank">${informationList1[0].informationTitle}</a></p>
					<p class="color999">时间：${informationList1[0].informationPublishTime}</p>
				</div>
				<a href="<%=path%>infor/infolist.action?typeid=${informationList1[0].parameterId}" target="_blank"><font color="red">更多</font></a>
				<div class="news-text">
					<p><a href="${informationList1[1].informationAddress}" title="" target="_blank">${informationList1[1].informationTitle}</a></p>
					<p><a href="${informationList1[2].informationAddress}" title="" target="_blank">${informationList1[2].informationTitle}</a></p>
					<p><a href="${informationList1[3].informationAddress}" title="" target="_blank">${informationList1[3].informationTitle}</a></p>
				</div>
			</li>

			<li style="height:400px;">
				<div class="news-pic">
					<a href="${informationList2[0].informationAddress}" title="" target="_blank"><img src="<%=path%>picture/findPicture.action?url=${informationList2[0].informationImg}" width="240" height="160"></a>
					<p class="ne-title"><a href="${informationList2[0].informationAddress}" title="" target="_blank">${informationList2[0].informationTitle}</a></p>
					<p class="color999">时间：${informationList2[0].informationPublishTime}</p>
				</div>
				<a href="<%=path%>infor/infolist.action?typeid=${informationList2[0].parameterId}" target="_blank"><font color="red">更多</font></a>
				<div class="news-text">
					<p><a href="${informationList2[1].informationAddress}" title="" target="_blank">${informationList2[1].informationTitle}</a></p>
					<p><a href="${informationList2[2].informationAddress}" title="" target="_blank">${informationList2[2].informationTitle}</a></p>
					<p><a href="${informationList2[3].informationAddress}" title="" target="_blank">${informationList2[3].informationTitle}</a></p>
				</div>
			</li>

			<li style="height:400px;">
				<div class="news-pic">				
					<a href="${informationList3[0].informationAddress}" title="" target="_blank"><img src="<%=path%>picture/findPicture.action?url=${informationList3[0].informationImg}" width="240" height="160"></a>
					<p class="ne-title"><a href="${informationList3[0].informationAddress}" title="" target="_blank">${informationList3[0].informationTitle}</a></p>
					<p class="color999">时间：${informationList3[0].informationPublishTime}</p>
				</div>
				<a href="<%=path%>infor/infolist.action?typeid=${informationList3[0].parameterId}" target="_blank"><font color="red">更多</font></a>
				<div class="news-text">
					<p><a href="${informationList3[1].informationAddress}" title="" target="_blank">${informationList3[1].informationTitle}</a></p>
					<p><a href="${informationList3[2].informationAddress}" title="" target="_blank">${informationList3[2].informationTitle}</a></p>
					<p><a href="${informationList3[3].informationAddress}" title="" target="_blank">${informationList3[3].informationTitle}</a></p>
				</div>
			</li>
			<li style="height:400px;">
				<div class="news-pic">
					<a href="${informationList4[0].informationAddress}" title="" target="_blank"><img src="<%=path%>picture/findPicture.action?url=${informationList4[0].informationImg}" width="240" height="160"></a>
					<p class="ne-title"><a href="${informationList4[0].informationAddress}" title="" target="_blank">${informationList4[0].informationTitle}</a></p>
					<p class="color999">时间：${informationList4[0].informationPublishTime}</p>
				</div>
				<a href="<%=path%>infor/infolist.action?typeid=${informationList4[0].parameterId}" target="_blank"><font color="red">更多</font></a>
				<div class="news-text">
					<p><a href="${informationList4[1].informationAddress}" title="" target="_blank">${informationList4[1].informationTitle}</a></p>
					<p><a href="${informationList4[2].informationAddress}" title="" target="_blank">${informationList4[2].informationTitle}</a></p>
					<p><a href="${informationList4[3].informationAddress}" title="" target="_blank">${informationList4[3].informationTitle}</a></p>
				</div>
			</li>
		</ul>
	</div>
	<!--最新资讯-->
	<div class="clearfix"></div>
	<!--最新成交数据-->
	<div class="chengjiao-data">
		<div class="width1180">
			<div class="data-t">
				<p><strong>众包成交数据</strong></p>
				<p>近30天成交数据</p>
			</div>

			<div class="data-box">
				<p class="data-p"><strong>3606</strong>件</p>
				<p class="fw-name">需求完成</p>
			</div>

			<div class="data-box">
				<p class="data-p"><strong>4000</strong>件</p>
				<p class="fw-name">作品成交</p>
			</div>

			<div class="data-box">
				<p class="data-p"><strong>4230</strong>此</p>
				<p class="fw-name">咨询顾问</p>
			</div>

		</div>
	</div>
	<!--最新成交数据-->
	<!--战略合作-->
	<div class="cooperation-box width1180">
		<div class="o-indexttitle">
				<span class="fl">战略合作</span>

		</div>
		<div class="clearfix"></div>
		<ul>
			<li><img src="<%=path%>images/join-hz_01.png"></li>
			<li><img src="<%=path%>images/join-hz_03.png"></li>
			<li><img src="<%=path%>images/join-hz_04.png"></li>
			<li><img src="<%=path%>images/join-hz_06.png"></li>
			<li><img src="<%=path%>images/join-hz_08.png"></li>
			<li><img src="<%=path%>images/join-hz_16.png"></li>
			<li><img src="<%=path%>images/join-hz_17.png"></li>
			<li><img src="<%=path%>images/join-hz_18.png"></li>
			<li><img src="<%=path%>images/join-hz_19.png"></li>
			<li><img src="<%=path%>images/join-hz_20.png"></li>
		</ul>

	</div>
	<!--战略合作-->
	<div class="clearfix"></div>
	<!--友情连接-->
	<div class="oindex-link width1180">
		<p class="fontsize16">友情连接</p>
		<p>
		<c:forEach items="${lineList}"  var="line">
			<a href="${line.lineAddress}" >${line.lineName}</a>
		</c:forEach>
			<!-- <a href="#" title="阿里云">阿里云</a>
			<a href="#" title="腾讯云">腾讯云</a>
			<a href="#" title="传一科技">传一科技</a>
			<a href="#" title="微信网页版">微信网页版</a>
			<a href="#" title="支付宝">支付宝</a>
			<a href="#" title="百度">百度</a>
			<a href="#" title="搜狐">搜狐</a>
			<a href="#" title="网易">网易</a>
			<a href="#" title="腾讯">腾讯</a> -->
		</p>

	</div>
	<!--友情连接-->

	<!--尾部-->
	<footer class="o-footer">
		<!-- <div class="footer-t ">
		<div class="width1180">
			<div class="footert-left">
				<ul>
					<p>关于易知猴</p>
					<li><a href="#" title="了解我们">了解我们</a></li>
					<li><a href="#" title="品牌故事">品牌故事</a></li>
					<li><a href="#" title="加入我们">加入我们</a></li>
					<li><a href="#" title="联系我们">联系我们</a></li>
				</ul>

				<ul>
					<p>公司代办</p>
					<li><a href="#" title="注册公司">注册公司</a></li>
					<li><a href="#" title="公司变更">公司变更</a></li>
					<li><a href="#" title="公司注销">公司注销</a></li>
					<li><a href="#" title="公司转让">公司转让</a></li>
				</ul>

				<ul>
					<p>代理记账</p>
					<li><a href="#" title="记账报税">记账报税</a></li>
					<li><a href="#" title="财税代办">财税代办</a></li>
					<li><a href="#" title="税务筹划">税务筹划</a></li>
					<li><a href="#" title="财税审计">财税审计</a></li>
				</ul>

				<ul>
					<p>资质办理</p>
					<li><a href="#" title="食品经营许可证">食品经营许可证</a></li>
					<li><a href="#" title="卫生许可">卫生许可</a></li>
					<li><a href="#" title="进出许可">进出许可</a></li>
					<li><a href="#" title="道路运输许可证">道路运输许可证</a></li>
				</ul>
				
				<ul>
					<p>知识产权</p>
					<li><a href="#" title="商标注册">商标注册</a></li>
					<li><a href="#" title="专利申请">专利申请</a></li>
					<li><a href="#" title="版权登记">版权登记</a></li>
				</ul>

			</div>
			<div class="foot-contract">
				<p>网 址：www.hcx123.com</p>
				<p>邮 箱：313627421@qq.com</p>
				<p>电 话：18900728915  </p>
				<p>地 址：湖南省长沙市雨花区香樟路瑞都华庭2栋2
单元1105室</p>
				<p>在线咨询：<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=418146334&amp;site=http://www.yizhihou.net/&amp;menu=yes" target="_blank" title="在线咨询" rel="nofollow"><img src="images/single_main_left_box3_QQ.png"></a></p>
			</div>
			</div>
		</div> -->
		<!-- <div class="clearfix"></div> -->
		<div class="foot-b">
			<div class="width1180">
				<span class="fl">CopyRight@2001-2018 众包一站式服务 湘ICP备15004606号-11</span> <img src="<%=path%>images/k8008_B3_Top001.gif"><img src="<%=path%>images/k8008_B3_Top008.gif"><img src="<%=path%>images/k8008_B3_Top009.gif"><img src="<%=path%>images/k8008_B3_Top010.gif">
			</div>
		</div>
	</footer>
	<!--尾部-->
	
</body>
</html>