<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
	<title>顾问管理</title>
		<link href="iTunesArtwork@2x.png" sizes="114x114" rel="apple-touch-icon-precomposed">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/core.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/icon.css">
        <link type="text/css" rel="stylesheet" href="<%=path%>admin/css/home.css">
       <link rel="stylesheet" href="<%=path%>css/bootstrap.css">
	 <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=path%>admin/js/jquery-1.5.2.min.js"></script>
  <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/plugins/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=path%>css/oindex.css">
    <link rel="stylesheet" href="<%=path %>/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path %>/css/global.css" media="all">
    <link rel="stylesheet" href="<%=path %>/laydate/theme/default/laydate.css" media="all">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<style type="text/css">
#footer {
    text-align: center;
}
#footer ul {
    display: inline-block;
    overflow: auto;
}
p{
font-size: 20px;
text-indent:2em;
}
#footer ul li {
    display: inline;
    float: left;
}
</style>
</head>
<body>
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

<!-- content YDC begin -->

<!-- left end -->
			<!-- right begin -->
				<div class="ydc-column ydc-column-10">
					<div class="ydc-release-content">
						<div class="ydc-tabPanel ydc-tabPanel-release">
							<div class="ydc-release-tab-head"  id="footer">
								<a  style="width: 100%;font-size: 20px;color: red;"  >
									顾问业务
								</a>
								<hr class="layui-bg-blue">
							</div>
							<div class="ydc-panes">
								<div class="ydc-pane"  style="display:block;">
									<div class="clearfix">
									</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	<div align="center" style="height: 70%;width: 90%;margin:0 auto;background-color: #eff4d8; text-align: left"  >
					
   <div class="layui-tab"><!-- 选项卡开始 -->
   <input type="hidden" name="account" value="${account}" id="account">
   <input type="hidden" name="userId" value="${userId}" id="userId">

  <ul class="layui-tab-title" style="font-size: 25px;"><!-- 选项卡头开始 -->
    <li class="layui-this">首页</li>
    <li><a onclick="applyFor()">申请成为顾问</a></li>
    <li><a onclick="applyForList('tpage')">申请管理</a></li>
    <li><a onclick="project()">日报管理</a></li>
     <li><a onclick="accomplish('tpage')">项目完成表</a></li>
  </ul><!-- 选项卡头结束 -->
  <div class="layui-tab-content"><!-- 面板开始 -->
    <div class="layui-tab-item layui-show">
  <strong style="font-size:1.5em">◆ 进展检査 </strong>
 <p>外包管理小组按照《外包开发合同》力中的“监控计划”，定期检査承包商的开发进展情况， 
并记录到秒《外包开发过程监控报告》之中。进展检查的重点是:实际进度是否与计划相符? 
承包商的投入（人力、物力、财力）是否充分? </p>
<strong style="font-size:1.5em">◆质量检查 </strong>
<p>外包管理小组按照《外包开发合同》中的“监控计划”，对组织人员对录包商的工作成果进行技术评审 、
测试，或者参与承包商组织的技术评审和测试，以保证工作成果的质量符合要求。 
外包管理小组将评审结论记录到《外包开发过程监控报告》之中。 </p>
<strong style="font-size:1.5em">◆纠正编差 </strong>
<p>外包管理小组根据进展检查和质量检査的结论，督促承包商纠正工作偏差。如果需要更改合 
周、产品需求或开学计划，则按照变更控制规程处理。</p>
 <strong style="font-size:1.5em">◆成果验收</strong>
 <p>验收人员审查接包方应当交付的成果，如代码、文档，等等，确保这些成果是完整的并且是 
正确酌。验收人员将审査结果记录在《外包合同验收报告力之中。 </p>
 <strong style="font-size:1.5em">◆成果测试</strong>
<p>验收人员对待交付的产品进行全面的测试，确保产品符合需求。验收人员将测试结果记录在 
《外包合同验收报告》之中。</p> 
 <strong style="font-size:1.5em">◆问题处理</strong>
<p>如果验收人员在审查与测试时发现工作成果存在缺陷，则外包管理小组应当视问题的严重性 
与接包方协商，给出合适的处理措施片记录在《外包合同验收报告》之中。 
    如果工作成果存在严重的缺陷，则退回给承包方，接包方应当给出纠正缺陷的措施，双方协 商
第二次验收的时间。给发包方带来损失的，应当依据合门对接创方做出相成的处罚。 
  如果工作作成果存在一些轻微的缺陷，则接包方应当给出纠正缺陷的措施，双方协商是否 
需要第二次验收 。</p>
 <strong style="font-size:1.5em">◆成果交付</strong>
    <p>当所有工作成果都通过验收后，接包方将其交付给外包管理小组。双方责任人签字认可，外包管理员通知本机构的财务人员，将合同余款支付给接包方。</p>
    
    </div>
    <!-- 申请成为顾问业务 -->
    <div class='layui-tab-item' id='aaa'>
    </div>
    <div class="layui-tab-item">
<div align="center" style="height: 90%;width: 98%;margin:0 auto;background-color: #eff4d8; text-align: center"  id="table">
<select id="state1">
<option value="0">请选择</option>
<option value="902">未处理</option>
<option value="903">已接受</option>
<option value="904">拒绝</option>
</select>
<button  style="width:70px;height: 30px" onClick="sstate()">查询</button>
<table class="layui-table" style="width: 100%;" >
<thead>
 <tr>
<th>标题</th>
<th>内容</th>
<th>雇主</th>
<th>需求编号</th>
<th>状态</th>
<th width="400">操作</th>
</tr>
</thead>
<tbody id="ccc">
</tbody>
<tr>
<td colspan="7">当前页<span id="num">${num}</span>总页数<span id="totalPages">${totalPages}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="btn btn-primary" value="上一页" onClick="applyForList('tpage')">&nbsp;&nbsp;
<input type="button" class="btn btn-primary" value="下一页" onClick="applyForList('npage')">
</td>
</tr>

</table>
</div>

</div>
<div class="layui-tab-item">
<input type="hidden" name="userid" value="${id}" id="uid">
    <select id="ttt" onchange="pid()">
    <option value="0">请选择</option>
    </select>

<table class="layui-table" style="width: 100%;table-layout: fixed;" >

<thead>
 <tr>
 <th>序号</th>
<th>日期</th>
<th style='white-space :nowrap ;width :200px;text-overflow:ellipsis;overflow: hidden;'>内容</th>
<th>评价</th>
<th>批注</th>
<th >操作</th>
</tr>
</thead>
<tbody id="eee">
</tbody>
<tr>
<td colspan="7">当前页<span id="num1">${num1}</span>总页数<span id="totalPages1">${totalPages1}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="btn btn-primary" value="上一页" onClick="daily('tpage')">&nbsp;&nbsp;
<input type="button" class="btn btn-primary" value="下一页" onClick="daily('npage')">
</td>
</tr>

</table>
    
    </div>
    
      <div class="layui-tab-item">
     <div align="center" style="height: 90%;width: 98%;margin:0 auto;background-color: #eff4d8; text-align: center"  id="table">
<select id="projectState">
<option value="0">请选择</option>
<option value="1863">项目中</option>
<option value="1864">待审核</option>
<option value="1865">已完成</option>
<option value="1866">已失败</option>
</select>
 	
<button  style="width:70px;height: 30px" onClick="accomplish('tpage')">查询</button>
<table class="layui-table" style="width: 100%;" >
<thead>
 <tr>
<th>项目标题</th>
<th>项目内容</th>
<th>项目金额</th>
<th>状态</th>
<th>详情</th>
<th>评价</th>
<th>操作</th>
</tr>
</thead>
<tbody id="zzz">
</tbody>
<tr>
<td colspan="7">当前页<span id="num3">${num}</span>总页数<span id="totalPages3">${totalPages}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="btn btn-primary" value="上一页" onClick="accomplish('tpage')">&nbsp;&nbsp;
<input type="button" class="btn btn-primary" value="下一页" onClick="accomplish('npage')">
</td>
</tr>

</table>
</div> 
      
      </div>
  </div><!-- 面板结束 -->

 </div><!-- 选项卡结束 -->
 </div>	
							

		

<!-- content YDC end -->

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					评价
				</h4>
			</div>
			<div class="layui-form-item" id="ppp">
    <label class="layui-form-label">序号</label>
    <div class="layui-input-block">
      <input type="text" name="serialNumber" id="serialNumber"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
			<div class="modal-body" id="wrap">
				<label><input type="radio" name="radio" value="进度快">进度快</label>
                <label> <input type="radio" name="radio" value="进度正常">进度正常</label>
                  <label> <input type="radio" name="radio" value="进度偏慢">进度偏慢</label><br />
                  <label>批注</label>
                  <textarea  class="layui-textarea" id="notation"></textarea>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<a  class="btn btn-primary"  onclick="evaluation()" >提交</a>
				
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<!-- 模态框2（详情） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel2">
					详情
				</h4>
			</div>
			<div class="layui-form-item">
    <label class="layui-form-label">标题</label>
    <div class="layui-input-block">
      <input type="text" name="title" id="title"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">内容</label>
    <div class="layui-input-block">
      <textarea id="desc" disabled class="layui-textarea">未填写</textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">类型</label>
    <div class="layui-input-block">
      <input type="text" id="type"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">雇主id</label>
    <div class="layui-input-block">
      <input type="text" id="fromUserId"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">服务商id</label>
    <div class="layui-input-block">
      <input type="text" id="toUserId"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">发布时间</label>
    <div class="layui-input-block">
      <input type="text" id="time"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">佣金</label>
    <div class="layui-input-block">
      <input type="text" id="money"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">项目状态</label>
    <div class="layui-input-block">
      <input type="text" id="state"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">项目剩余时间</label>
    <div class="layui-input-block">
      <input type="text" id="time1"  disabled  lay-verify="required" value="暂无" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">文件下载</label>
    <div class="layui-input-block">
    <div class="layui-input-block" id="fileDown">暂无
    </div>
    </div>
  </div>
  
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
	</div>

<!-- 模态框3（项目总体评价） -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel3">
					项目总体评价
				</h4>
			</div>
			  <label>评价</label>
			  <input type="text" name="serialNumber1" id="serialNumber1"  disabled  lay-verify="required" value="未填写" autocomplete="off" class="layui-input">
                  <textarea  class="layui-textarea" id="notation1"></textarea>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<a  class="btn btn-primary"  onclick="present()" >提交</a>
				
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>



<script  src="<%=path %>layui/layui.js"></script>
<script >


layui.use(['form','layer','laydte'], function(){
	  var form = layui.form;
	  var layer=layui.layer;
	  var laydate=layui.laydate;
	  
	});
//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
var element = layui.element;
});

function applyFor(){	
	var account=$("#account").val();
	var userId=$("#userId").val();
	var flist="${list}";
	$.ajax({
		 url:"<%=path%>counselor/judge.action",
		 data:"account="+account+"&userId="+userId,
		 dataType:"json",
		 type:"post",
		 success:function(redata){
			 $('#aaa').empty();
			 if(redata==2){
				 $("#aaa").html("<a>您已经是顾问！</a>")

			 }else if(redata==1){
				
				 $("#aaa").html("<a>您已提交，请等待结果！</a>")
			 }else if(redata==0){
				 $("#aaa").html("<form class='layui-form' action='<%=path %>counselor/affirm.action' method='post' onsubmit='return CheckPost()' enctype='multipart/form-data' >"				   
			       +" <div class='layui-form-item'>"
			         +  "<label class='layui-form-label'>申请人</label>"
			          +  "<div class='layui-input-block'>"
			             +   "<input type='text' name='userAccount'  required  lay-verify='required' value='"+account+"' autocomplete='off' class='layui-input'>"
			              +  "<input type='hidden' name='userId' value='"+userId+"'>"
			            +"</div>"
			       + "</div>"
			       +" <div class='layui-form-item layui-form-text'>"
			        +   "<label class='layui-form-label'>内容</label>"
			          +  "<div class='layui-input-block'>"
			             +   "<textarea name='counselorIntroduction' required placeholder='请输入内容' class='layui-textarea'></textarea>"
			          +  "</div>"
			     +   "</div>"
			        +  "<div class='layui-form-item'>"
			         +   "<label class='layui-form-label'>服务类型</label>"
			         +   "<div class='layui-input-block'>"
			         + "<select name='serviceType'>"
			     +"<c:forEach items='"+flist+"'  var='fund'>"
			    + "<option value='${fund} '>${fund}</option>"
			    + "<c:out value='${fund}' />"
			    + "</c:forEach>"
			    + "</select>"
			     +   "</div>"
			     +  " </div>"
			     +  "<label class='layui-form-label'>服务价格</label>"
			     +  " <div class='layui-input-block'>"
			     +  " <input type='text' name='counselorMoney'  required  lay-verify='required' placeholder='请输入价格' autocomplete='off' class='layui-input' id='url'>"
			     +  " </div><br />"
			     +  " <label class='layui-form-label'>图片</label>"
			   + " <div class='layui-upload'>"
			+ "<input type='file' name='file'   id='1' class='file_photo aui-file-new-up' style='margin:0;'/>"                                                    
		+	"</div>"
			       + "<br />"
			      +  "<div class='layui-form-item'>"
			       +    " <div class='layui-input-block'>"
			              +  "<input type='submit' class='layui-btn  layui-btn-danger' id='test9' lay-submit lay-filter='formDemo'  value='立即提交'>"
			             +  " <button type='reset' class='layui-btn layui-btn-primary'>重置</button>"			                
			          + " </div>"
			      + " </div>"
			  +  "</form>")
			 }

		 }
	})
}
function applyForList(page){	
	var account=$("#account").val()
	var userId=$("#userId").val()
	var nn=$("#num").text();
    	var state1=$("#state1").val();
	$.ajax({
		 url:"<%=path%>counselor/applyForList.action",
		 data:"account="+account+"&userId="+userId+"&state="+state1+"&page="+page+"&number="+nn,
		 dataType:"json",
		 type:"post",
		 success:function(redata){
			 $("#ccc").empty();
			 $("#num").empty();
			 $("#totalPages").empty();
			 var num=redata[0]
			 var totalPages=redata[1]
			 $("#num").html(num);
			 $("#totalPages").html(totalPages);
				var list=redata[2]
			 var len = list.length;
			 for(var i=0;i<len;i++){ 
				 var e = list[i];
				 if(e.stateId==902){
				 $("#ccc").append(
						 "<tr><td>"+e.demandTitle+"</td>"+
							"<td>"+e.demandDetaIlinformation+"</td>"+
							"<td>"+e.userAccount+"</td>"+
							"<td>"+e.demandid+"</td>"+
							"<td>未处理</td>"+
							"<td><a onclick='particulars("+e.demandid+")'  data-toggle='modal' data-target='#myModal2' class='btn btn-warning illegalBtn rightSize'>查看详情</a>&nbsp;"+
							"<a class='btn btn-success   passBtn rightSize' onclick='return firm("+e.demandid+")'>确认接受</a>&nbsp;"+
							"<a class='btn btn-danger  deleteBtn rightSize' onclick='return firm1("+e.demandid+")'>拒绝接受</a>&nbsp;"+
							"<a onclick='particulars("+e.demandid+")'  data-toggle='modal' data-target='#myModal2' class='btn btn-warning illegalBtn rightSize'>查看详情</a></td>"+

							"</tr>"

				 )
				 }else if(e.stateId==903){
				
						 $("#ccc").append(
								 "<tr><td>"+e.demandTitle+"</td>"+
									"<td>"+e.demandDetaIlinformation+"</td>"+
									"<td>"+e.userAccount+"</td>"+
									"<td>"+e.demandid+"</td>"+
									"<td>已接受</td>"+
									"<td><a onclick='particulars("+e.demandid+")'  data-toggle='modal' data-target='#myModal2' class='btn btn-warning illegalBtn rightSize'>查看详情</a>&nbsp;"+
									"</td></tr>"
									) 
					
				 }else if(e.stateId==904){
					 $("#ccc").append(
							 "<tr><td>"+e.demandTitle+"</td>"+
								"<td>"+e.demandDetaIlinformation+"</td>"+
								"<td>"+e.userAccount+"</td>"+
								"<td>"+e.demandid+"</td>"+
								"<td>已拒绝</td>"+
								"<td><a onclick='particulars("+e.demandid+")'  data-toggle='modal' data-target='#myModal2'  class='btn btn-warning illegalBtn rightSize'>查看详情</a></td>&nbsp;"+
								"</tr>"
								)
				 }
			 }
		 }
	})
}

function sstate() {
	var account=$("#account").val()
	var userId=$("#userId").val()
	var nn=$("#num").text();
	var state2=$("#state1").val();
		$.ajax({	
			 url:"<%=path%>counselor/applyForList.action",
			data:"account="+account+"&userId="+userId+"&page=tpage"+"&number=1&state="+state2,
			dataType:"json",
			type:"post",
		   success:function(redata){
				$("#ccc").empty();
				$("#num").empty();
				 $("#totalPages").empty();
				var num=redata[0]
				var totalPages=redata[1]
				 $("#num").html(num);
				 $("#totalPages").html(totalPages);
				var list=redata[2]
				 var len = list.length;
				 for(var i=0;i<len;i++){ 
					 var e = list[i];
					 if(e.stateId==902){
							
						 $("#ccc").append(
								 "<tr><td>"+e.demandTitle+"</td>"+
									"<td>"+e.demandDetaIlinformation+"</td>"+
									"<td>"+e.userAccount+"</td>"+
									"<td>"+e.demandid+"</td>"+
									"<td>未处理</td>"+
									"<td><a onclick='particulars("+e.demandid+")'  data-toggle='modal' data-target='#myModal2' class='btn btn-warning illegalBtn rightSize'>查看详情</a>&nbsp;"+
									"<a class='btn btn-success   passBtn rightSize' onclick='return firm("+e.demandid+")'>确认接受</a>&nbsp;"+
									"<a class='btn btn-danger  deleteBtn rightSize' onclick='return firm1("+e.demandid+")'>拒绝接受</a>&nbsp;"+
									"</td></tr>"
						 )
						 }else if(e.stateId==903){
								 $("#ccc").append(
										 "<tr><td>"+e.demandTitle+"</td>"+
											"<td>"+e.demandDetaIlinformation+"</td>"+
											"<td>"+e.userAccount+"</td>"+
											"<td>"+e.demandid+"</td>"+
											"<td>已接受</td>"+
											"<td><a onclick='particulars("+e.demandid+")'  data-toggle='modal' data-target='#myModal2' class='btn btn-warning illegalBtn rightSize'>查看详情</a>&nbsp;"+
											"</td></tr>"
											) 
						 }else if(e.stateId==904){
							 $("#ccc").append(
									 "<tr><td>"+e.demandTitle+"</td>"+
										"<td>"+e.demandDetaIlinformation+"</td>"+
										"<td>"+e.userAccount+"</td>"+
										"<td>"+e.demandid+"</td>"+
										"<td>已拒绝</td>"+
										"<td><a onclick='particulars("+e.demandid+")'  data-toggle='modal' data-target='#myModal2'  class='btn btn-warning illegalBtn rightSize'>查看详情</a></td>&nbsp;"+
										"</tr>"
										)
						 }
				 }
					
				}
			
		})
}

function project() {
	var account=$("#account").val()
	var userId=$("#userId").val()
	$.ajax({
		 url:"<%=path%>counselor/project.action",
		 data:"account="+account+"&userId="+userId,
		 dataType:"json",
		 type:"post",
		 success:function(redata){
			 $("#ttt").empty();
			 var list=redata.list;
			 var len = list.length;
			 $("#ttt").append(
						"<option value=''>请选择</option>"
						 )
			 for(var i=0;i<len;i++){ 
				 var e = list[i];
				 $("#ttt").append(
						"<option value='"+e+"'>"+e+"</option>"
						
						 )
			 
			 }
		
		 }
	})
}

function pid() {
	var nn=$("#num1").text();
	var state1=$("#state2").val();
	var pid=$("#ttt").val()
	$.ajax({
		 url:"<%=path%>counselor/parameter.action",
		 data:"parameterId="+pid+"&state1"+state1+"&number=1&page=tpage",
		 dataType:"json",
		 type:"post",
		 success:function(redata){
			 $("#num1").empty();
			 $("#eee").empty();
			 $("#totalPages1").empty();
			var num=redata[0]
			var totalPages=redata[1]
			 $("#num1").html(num);
			 $("#totalPages1").html(totalPages);
			var list=redata[2]
			 var len = list.length;
			 for(var i=0;i<len;i++){ 
				 var e = list[i];
				 if(e.dailyReview=="未评价"){
				 $("#eee").append(
						 "<tr><td>"+e.daiId+"</td>"+
						 "<td>"+e.publishDate+"</td>"+	 
						 "<td  style='white-space :nowrap ;width :200px;text-overflow:ellipsis;overflow: hidden;'>"+e.daiContent+"</td>"+

						 "<td>未评价</td>"+
						 "<td>无批注</td>"+
						 "<td><a  data-toggle='modal' data-target='#myModal' onclick='Values("+e.daiId+")' class='btn btn-info'>点击评价</a></td>"+
						 "</tr>"
						 )
					 $("#serialNumber").val(e.daiId);	 
				 }else{
					 $("#eee").append(
							 "<tr><td>"+e.daiId+"</td>"+
							 "<td>"+e.publishDate+"</td>"+	 
							 "<td  style='white-space :nowrap ;width :200px;text-overflow:ellipsis;overflow: hidden;'>"+e.daiContent+"</td>"+
							 "<td>"+e.dailyReview+"</td>"+
							 "<td>"+e.postil+"</td>"+
							 "<td>无操作</td>"+
							 "</tr>"
							 )
				 }
			 }
		
		 }
	})
}

function sdaily() {
	$.ajax({
		 url:"<%=path%>counselor/parameter.action",
		 data:"parameterId="+pid+"&number=1&page=tpage",
		 dataType:"json",
		 type:"post",
		 success:function(redata){
			 $("#num1").empty();
			 $("#eee").empty();
			 $("#totalPages1").empty();
			var num=redata[0]
			var totalPages=redata[1]
			 $("#num1").html(num);
			 $("#totalPages1").html(totalPages);
			var list=redata[2]
			 var len = list.length;
			 for(var i=0;i<len;i++){ 
				 var e = list[i];
				 if(e.dailyReview=="未评价"){
				 $("#eee").append(
						 "<tr><td>"+e.daiId+"</td>"+
						 "<tr><td>"+e.publishDate+"</td>"+	 
						 "<td>"+e.daiContent+"</td>"+
						 "<td>未评价</td>"+
						 "<td>无批注</td>"+
						 "<td><a data-toggle='modal' data-target='#myModal' class='btn btn-info'>点击评价</a></td>"+
						 "</tr>"
						 )
				 }else{
					 $("#eee").append(
							 "<tr><td>"+e.daiId+"</td>"+
							 "<tr><td>"+e.publishDate+"</td>"+	 
							 "<td>"+e.daiContent+"</td>"+
							 "<td>"+e.dailyReview+"</td>"+
							 "<td>"+e.postil+"</td>"+
							 "<td>无操作</td>"+
							 "</tr>"
							 )
				 }
			 }
		
		 }
	})
}

function firm(demandid) {
    //利用对话框返回的值 （true 或者 false）
if (confirm("是否确认接受")) {
    	var userId=$("#userId").val()
	    var nn=$("#num").text();
	   var state2=$("#state1").val();
    	$.ajax({
   		 url:"<%=path%>counselor/applyForOk.action",
   		 data:"action=ok&demandid="+demandid+"&state1="+state2+"&number="+nn+"&userId="+userId,
   		 dataType:"json",
   		 type:"post",
   		 success:function(redata){
   			 $("#ccc").empty();
			 $("#num").empty();
			 var num=redata[0]
			 $("#num").html(num);
				var list=redata[1]
			 var len = list.length;
			 for(var i=0;i<len;i++){ 
				 var e = list[i];
				 if(e.stateId==902){
					 $("#ccc").append(
							 "<tr><td>"+e.demandTitle+"</td>"+
								"<td>"+e.demandDetaIlinformation+"</td>"+
								"<td>"+e.userAccount+"</td>"+
								"<td>"+e.demandid+"</td>"+
								"<td>未处理</td>"+
								"<td><a onclick='particulars("+e.demandid+")'  data-toggle='modal' data-target='#myModal2' class='btn btn-warning illegalBtn rightSize'>查看详情</a>&nbsp;"+
								"<a class='btn btn-success   passBtn rightSize' onclick='return firm("+e.demandid+")'>确认接受</a>&nbsp;"+
								"<a class='btn btn-danger  deleteBtn rightSize' onclick='return firm1("+e.demandid+")'>拒绝接受</a>&nbsp;"+
								"</td></tr>"
					 )
					 }else if(e.stateId==903){
							 $("#ccc").append(
									 "<tr><td>"+e.demandTitle+"</td>"+
										"<td>"+e.demandDetaIlinformation+"</td>"+
										"<td>"+e.userAccount+"</td>"+
										"<td>"+e.demandid+"</td>"+
										"<td>已接受</td>"+
										"<td><a onclick='particulars("+e.demandid+")'  data-toggle='modal' data-target='#myModal2' class='btn btn-warning illegalBtn rightSize'>查看详情</a>&nbsp;"+
										"</td></tr>"
										) 
					 }else if(e.stateId==904){
						 $("#ccc").append(
								 "<tr><td>"+e.demandTitle+"</td>"+
									"<td>"+e.demandDetaIlinformation+"</td>"+
									"<td>"+e.userAccount+"</td>"+
									"<td>"+e.demandid+"</td>"+
									"<td>已拒绝</td>"+
									"<td><a onclick='particulars("+e.demandid+")'  data-toggle='modal' data-target='#myModal2'  class='btn btn-warning illegalBtn rightSize'>查看详情</a></td>&nbsp;"+
									"</tr>"
									)
					 }
			 }
   		 }
   	})
       return true;
    }
    else {
    	 return false;
    }

}
function firm1(demandid) {
    //利用对话框返回的值 （true 或者 false）
    if (confirm("是否拒绝接受")) {
    	var userId=$("#userId").val()
	    var nn=$("#num").text();
	   var state2=$("#state1").val();
    	$.ajax({
   		 url:"<%=path%>counselor/applyForOk.action",
   		 data:"action=refuse&demandid="+demandid+"&state1="+state2+"&number="+nn+"&userId="+userId,
   		 dataType:"json",
   		 type:"post",
   		 success:function(redata){
   			 $("#ccc").empty();
			 $("#num").empty();
			 var num=redata[0]
			 $("#num").html(num);
				var list=redata[1]
			 var len = list.length;
			 for(var i=0;i<len;i++){ 
				 var e = list[i];
				 if(e.stateId==902){
						 $("#ccc").append(
								 "<tr><td>"+e.demandTitle+"</td>"+
									"<td>"+e.demandDetaIlinformation+"</td>"+
									"<td>"+e.userAccount+"</td>"+
									"<td>"+e.demandid+"</td>"+
									"<td>未处理</td>"+
									"<td><a onclick='particulars("+e.demandid+")'  data-toggle='modal' data-target='#myModal2' class='btn btn-warning illegalBtn rightSize'>查看详情</a>&nbsp;"+
									"<a class='btn btn-success   passBtn rightSize' onclick='return firm("+e.demandid+")'>确认接受</a>&nbsp;"+
									"<a class='btn btn-danger  deleteBtn rightSize' onclick='return firm1("+e.demandid+")'>拒绝接受</a>&nbsp;"+
									"</td></tr>"
							
						 )
				 }else if(e.stateId==903){
						 $("#ccc").append(
								 "<tr><td>"+e.demandTitle+"</td>"+
									"<td>"+e.demandDetaIlinformation+"</td>"+
									"<td>"+e.userAccount+"</td>"+
									"<td>"+e.demandid+"</td>"+
									"<td>已接受</td>"+
									"<td><a onclick='particulars("+e.demandid+")'  data-toggle='modal' data-target='#myModal2' class='btn btn-warning illegalBtn rightSize'>查看详情</a>&nbsp;"+
									"</td></tr>"
									) 
				 }else if(e.stateId==904){
					 $("#ccc").append(
							 "<tr><td>"+e.demandTitle+"</td>"+
								"<td>"+e.demandDetaIlinformation+"</td>"+
								"<td>"+e.userAccount+"</td>"+
								"<td>"+e.demandid+"</td>"+
								"<td>已拒绝</td>"+
								"<td><a onclick='particulars("+e.demandid+")'  data-toggle='modal' data-target='#myModal2' class='btn btn-warning illegalBtn rightSize'>查看详情</a></td>&nbsp;"+
								"</tr>"
								)
				 }
			 }
   		 }
   	})
       return true;
    }
    else {
    	 return false;
    }

}

function Values(Id) {
	alert(Id);
	$("#serialNumber").val(Id)
}

function evaluation() {
  var dailyId=$("#serialNumber").val();
	var notation=$("#notation").val();
	var account=$("#account").val();
	var userId=$("#userId").val();
	var numm=$("#ttt").val();
	var radio = $('#wrap input[name="radio"]:checked ').val();
	$.ajax({
 		 url:"<%=path%>counselor/appraise.action",
 		 data:"dailyId="+dailyId+"&notation="+notation+"&radio="+radio+"&account="+account+"&userId="+userId+"&num="+numm+"&page=1",
 		 dataType:"json",
 		 type:"post",
 		 success:function(redata){
 			
 			 $("#eee").empty();
 			var list=redata;
 			 var len = list.length;
 			 for(var i=0;i<len;i++){ 
				 var e = list[i];
				 if(e.dailyReview=="未评价"){
					 $("#eee").append(
							 "<tr><td>"+e.daiId+"</td>"+
							 "<td>"+e.publishDate+"</td>"+	 
							 "<td>"+e.content+"</td>"+
							 "<td>未评价</td>"+
							 "<td>无批注</td>"+
							 "<td><a data-toggle='modal' data-target='#myModal' class='btn btn-info'>点击评价</a></td>"+
							 "</tr>"
							 )
					 }else{
						 $("#eee").append(
								 "<tr><td>"+e.daiId+"</td>"+
								 "<td>"+e.publishDate+"</td>"+	 
								 "<td>"+e.content+"</td>"+
								 "<td>"+e.dailyReview+"</td>"+
								 "<td>"+e.postil+"</td>"+
								 "<td>无操作</td>"+
								 "</tr>"
								 )
					 }
 			 }
 			 $('#myModal').modal('hide')
 		 }
	})
	}
	//总评价
function Values1(Id) {
		$("#serialNumber1").val(Id);
		if (confirm("是否评价")) {
	$.ajax({
		 url:"<%=path%>counselor/selectEvaluate.action",
		 data:"demandid="+Id,
		 dataType:"json",
		 type:"post",
		 success:function(redata){
			 $("#notation1").val("");
			 var date1=redata[0];
			 var date2=redata[1];		 
			 if(date1 == 1){
				 return true;
				
			 }else if(date1==2){
				 alert("已评价！");
				  $('#notation1').val(date2);
				 return false; 
			 }
		 }
	})
	 return true; 		
}else {
	return false;
	}
}
function present() {
	var demandid=$("#serialNumber1").val();
	var content=$("#notation1").val();
	var userId=$("#userId").val();
	  var nn=$("#num3").text();
	  alert(nn)
	   var state2=$("#state1").val();
	$.ajax({
		 url:"<%=path%>counselor/overallMerit.action",
		 data:"demandid="+demandid+"&content="+content+"&userId="+userId+"&number="+nn+"&state="+state2,
		 dataType:"json",
		 type:"post",
		 success:function(redata){
			 $("#zzz").empty();
			 $("#num3").empty();
			 var num=redata[0]
			 $("#num3").html(num);
				var list=redata[1]
			 var len = list.length;
			 for(var i=0;i<len;i++){ 
				 var e = list[i];
				 if(e.stateId==1863){
					 $("#zzz").append(
							 "<tr><td>"+e.demandTitle+"</td>"+
								"<td>"+e.demandDetaIlinformation+"</td>"+
								"<td>"+e.dealMoney+"</td>"+
								"<td>项目中</td>"+
								"<td><a onclick='particulars("+e.demandId+")' data-toggle='modal' data-target='#myModal2'  class='btn btn-warning illegalBtn rightSize'>查看详情</a></td>"+
								"<td>无操作</td>"+
								"</tr>" 
					 )
					 }else if(e.stateId==2272){
						 $("#zzz").append(
						 "<tr><td>"+e.demandTitle+"</td>"+
							"<td>"+e.demandDetaIlinformation+"</td>"+
							"<td>"+e.dealMoney+"</td>"+
							"<td>等待审核</td>"+
							"<td><a onclick='particulars("+e.demandId+")' data-toggle='modal' data-target='#myModal2'  class='btn btn-warning illegalBtn rightSize'>查看详情</a><td>"+
							"<td>无操作</td>"+
							"<td><a onclick='Failure("+e.demandId+")'  class='btn btn-success   passBtn rightSize'>确认通过</a>&nbsp;"+
							"<a  onclick='Failure("+e.demandId+")'   class='btn btn-danger  deleteBtn rightSize'>不通过</a>&nbsp;"+
							"</td></tr>" 
						 )
					 }else if(e.stateId==1865){
						 $("#zzz").append(
								 "<tr><td>"+e.demandTitle+"</td>"+
									"<td>"+e.demandDetaIlinformation+"</td>"+
									"<td>"+e.dealMoney+"</td>"+
									"<td>项目完成</td>"+
									"<td><a onclick='particulars("+e.demandId+")'  data-toggle='modal' data-target='#myModal2' class='btn btn-warning illegalBtn rightSize'>查看详情</a></td>"+
									"<td><a onclick='Values1("+e.demandId+")' data-toggle='modal' data-target='#myModal3'>点击评价</a></td>"+
									"<td>项目已结束</td>"+
									"</tr>" 
								 ) 
					 }else if(e.stateId==1866){
						 $("#zzz").append(
								 "<tr><td>"+e.demandTitle+"</td>"+
									"<td>"+e.demandDetaIlinformation+"</td>"+
									"<td>"+e.dealMoney+"</td>"+
									"<td>项目失败</td>"+
									"<td><a onclick='particulars("+e.demandId+")' data-toggle='modal' data-target='#myModal2'  class='btn btn-warning illegalBtn rightSize'>查看详情</a></td>"+
									"<td><a onclick='Values1("+e.demandId+")' data-toggle='modal' data-target='#myModal3'>点击评价</a></td>"+
									"<td>项目已结束</td>"+
									"</tr>" 
								 )  
					 }
			 } 
		 }
	})
	
}
//详细信息
function particulars(demandid) {
	$.ajax({
  		 url:"<%=path%>counselor/particulars.action",
  		 data:"demandid="+demandid,
  		 dataType:"json",
  		 type:"post",
  		 success:function(redata){
  			$("#fileDown").empty(); 
  			var list=redata[0]
  			var type=redata[1]
  			var state=redata[2]
  			var time=redata[3]
  			 alert(time)
			 var len = list.length
  			 for(var i=0;i<len;i++){ 
				 var e = list[i];
  			    $("#title").val(e.demandTitle);
  			  $("#desc").val(e.demandDetaIlinformation);
  			 $("#type").val(type);
  			 $("#fromUserId").val(e.fromUserId);
  			 $("#toUserId").val(e.toUserId);
  			 $("#money").val(e.securityMoney);
  			 $("#time").val(e.publishTime);
  			 $("#state").val(state);
  			 $("#time1").val(time);
  			 if(e.filePath != null){
  				$("#fileDown").append(	 
  	  					"<a href='<%=path%>download.action?upUrl="+e.filePath+"' class='btn btn-warning illegalBtn rightSize' type='button' data-id='"+e.filePath+"' id='illegal' >下载项目</a>"
  	  			 )
  			 }else{
  				 alert(222)
  			 }
  			
  			 }
  		 }
	})
  		 
}
function Failure(demandid) {
	var userId=$("#userId").val()
    var nn=$("#num3").text();
   var state2=$("#projectState").val();
	if (confirm("是否确认失败")) {
		$.ajax({
	   		 url:"<%=path%>counselor/failure.action",
	   		 data:"demandid="+demandid+"&state="+state2+"&number="+nn+"&userId="+userId,
	   		 dataType:"json",
	   		 type:"post",
	   		 success:function(redata){
	   			alert("请及时评价！");
	   			 $("#zzz").empty();
				 $("#num3").empty();
				 var num=redata[0]
				 $("#num3").html(num);
					var list=redata[1]
				 var len = list.length;
				 for(var i=0;i<len;i++){ 
					 var e = list[i];
					 if(e.stateId==1863){
						 $("#zzz").append(
								 "<tr><td>"+e.demandTitle+"</td>"+
									"<td>"+e.demandDetaIlinformation+"</td>"+
									"<td>"+e.dealMoney+"</td>"+
									"<td>项目中</td>"+
									"<td><a onclick='particulars("+e.demandId+")' data-toggle='modal' data-target='#myModal2'  class='btn btn-warning illegalBtn rightSize'>查看详情</a></td>"+
									"<td>无操作</td>"+
									"</tr>" 
						 )
						 }else if(e.stateId==2272){
							 $("#zzz").append(
							 "<tr><td>"+e.demandTitle+"</td>"+
								"<td>"+e.demandDetaIlinformation+"</td>"+
								"<td>"+e.dealMoney+"</td>"+
								"<td>等待审核</td>"+
								"<td><a onclick='particulars("+e.demandId+")' data-toggle='modal' data-target='#myModal2'  class='btn btn-warning illegalBtn rightSize'>查看详情</a><td>"+
								"<td>无操作</td>"+
								"<td><a onclick='Failure("+e.demandId+")'  class='btn btn-success   passBtn rightSize'>确认通过</a>&nbsp;"+
								"<a  onclick='Failure("+e.demandId+")'   class='btn btn-danger  deleteBtn rightSize'>不通过</a>&nbsp;"+
								"</td></tr>" 
							 )
						 }else if(e.stateId==1865){
							 $("#zzz").append(
									 "<tr><td>"+e.demandTitle+"</td>"+
										"<td>"+e.demandDetaIlinformation+"</td>"+
										"<td>"+e.dealMoney+"</td>"+
										"<td>项目完成</td>"+
										"<td><a onclick='particulars("+e.demandId+")'  data-toggle='modal' data-target='#myModal2' class='btn btn-warning illegalBtn rightSize'>查看详情</a></td>"+
										"<td><a onclick='Values1("+e.demandId+")' data-toggle='modal' data-target='#myModal3'>点击评价</a></td>"+
										"<td>项目已结束</td>"+
										"</tr>" 
									 ) 
						 }else if(e.stateId==1866){
							 $("#zzz").append(
									 "<tr><td>"+e.demandTitle+"</td>"+
										"<td>"+e.demandDetaIlinformation+"</td>"+
										"<td>"+e.dealMoney+"</td>"+
										"<td>项目失败</td>"+
										"<td><a onclick='particulars("+e.demandId+")' data-toggle='modal' data-target='#myModal2'  class='btn btn-warning illegalBtn rightSize'>查看详情</a></td>"+
										"<td><a onclick='Values1("+e.demandId+")' data-toggle='modal' data-target='#myModal3'>点击评价</a></td>"+
										"<td>项目已结束</td>"+
										"</tr>" 
									 )  
						 }
				 }
	   		 }
	   	})
	       return true;
}
else {
	 return false;
}
}
function Pass(demandid) {
	var userId=$("#userId").val()
    var nn=$("#num3").text();
   var state2=$("#projectState").val();
	if (confirm("是否确认通过")) {
		$.ajax({
	   		 url:"<%=path%>counselor/Pass.action",
	   		 data:"demandid="+demandid+"&state="+state2+"&number="+nn+"&userId="+userId,
	   		 dataType:"json",
	   		 type:"post",
	   		 success:function(redata){
	   			 alert("请及时评价！");
	   			 $("#zzz").empty();
				 $("#num3").empty();
				 var num=redata[0]
				 $("#num3").html(num);
					var list=redata[1]
				 var len = list.length;
				 for(var i=0;i<len;i++){ 
					 var e = list[i];
					 if(e.stateId==1863){
						 $("#zzz").append(
								 "<tr><td>"+e.demandTitle+"</td>"+
									"<td>"+e.demandDetaIlinformation+"</td>"+
									"<td>"+e.dealMoney+"</td>"+
									"<td>项目中</td>"+
									"<td><a onclick='particulars("+e.demandId+")' data-toggle='modal' data-target='#myModal2'  class='btn btn-warning illegalBtn rightSize'>查看详情</a></td>"+
									"<td>无操作</td>"+
									"</tr>" 
						 )
						 }else if(e.stateId==2272){
							 $("#zzz").append(
							 "<tr><td>"+e.demandTitle+"</td>"+
								"<td>"+e.demandDetaIlinformation+"</td>"+
								"<td>"+e.dealMoney+"</td>"+
								"<td>等待审核</td>"+
								"<td><a onclick='particulars("+e.demandId+")' data-toggle='modal' data-target='#myModal2'  class='btn btn-warning illegalBtn rightSize'>查看详情</a><td>"+
								"<td>无操作</td>"+
								"<td><a onclick='Pass("+e.demandId+")'  class='btn btn-success   passBtn rightSize'>确认通过</a>&nbsp;"+
								"<a  onclick='Failure("+e.demandId+")'   class='btn btn-danger  deleteBtn rightSize'>不通过</a>&nbsp;"+
								"</td></tr>" 
							 )
						 }else if(e.stateId==1865){
							 $("#zzz").append(
									 "<tr><td>"+e.demandTitle+"</td>"+
										"<td>"+e.demandDetaIlinformation+"</td>"+
										"<td>"+e.dealMoney+"</td>"+
										"<td>项目完成</td>"+
										"<td><a onclick='particulars("+e.demandId+")'  data-toggle='modal' data-target='#myModal2' class='btn btn-warning illegalBtn rightSize'>查看详情</a></td>"+
										"<td><a onclick='Values1("+e.demandId+")' data-toggle='modal' data-target='#myModal3'>点击评价</a></td>"+
										"<td>项目已结束</td>"+
										"</tr>" 
									 ) 
						 }else if(e.stateId==1866){
							 $("#zzz").append(
									 "<tr><td>"+e.demandTitle+"</td>"+
										"<td>"+e.demandDetaIlinformation+"</td>"+
										"<td>"+e.dealMoney+"</td>"+
										"<td>项目失败</td>"+
										"<td><a onclick='particulars("+e.demandId+")' data-toggle='modal' data-target='#myModal2'  class='btn btn-warning illegalBtn rightSize'>查看详情</a></td>"+
										"<td><a onclick='Values1("+e.demandId+")' data-toggle='modal' data-target='#myModal3'>点击评价</a></td>"+
										"<td>项目已结束</td>"+
										"</tr>" 
									 )  
						 }
				 }
	   		 }
	   	})
	       return true;
}
else {
	 return false;
}
}
function accomplish(page) {
	var state2=$("#projectState").val();
	var userId=$("#userId").val();
	$.ajax({
  		 url:"<%=path%>counselor/accomplish.action",
  		 data:"&state="+state2+"&number=1&userId="+userId+"&page="+page,
  		 dataType:"json",
  		 type:"post",
  		 success:function(redata){
  			 $("#zzz").empty();
			 $("#num3").empty(); 
			 $("#totalPages3").empty();
			 var num=redata[0]
			 var totalPages=redata[1]
			 $("#num3").html(num);
			 $("#totalPages3").html(totalPages);
				var list=redata[2]
			 var len = list.length;
				for(var i=0;i<len;i++){ 
					 var e = list[i];
					 if(e.stateId==1863){
					 $("#zzz").append(
							 "<tr><td>"+e.demandTitle+"</td>"+
								"<td>"+e.demandDetaIlinformation+"</td>"+
								"<td>"+e.dealMoney+"</td>"+
								"<td>项目中</td>"+
								"<td><a onclick='particulars("+e.demandId+")'  data-toggle='modal' data-target='#myModal2' class='btn btn-warning illegalBtn rightSize'>查看详情</a></td>"+
								"<td>无操作</td>"+
								"</tr>" 
					 )
					 }else if(e.stateId==2272){
						 $("#zzz").append(
						 "<tr><td>"+e.demandTitle+"</td>"+
							"<td>"+e.demandDetaIlinformation+"</td>"+
							"<td>"+e.dealMoney+"</td>"+
							"<td>等待审核</td>"+
							"<td><a onclick='particulars("+e.demandId+")'  data-toggle='modal' data-target='#myModal2' class='btn btn-warning illegalBtn rightSize'>查看详情</a><td>"+
							
							"<td><a onclick='Pass("+e.demandId+")'  class='btn btn-success   passBtn rightSize'>确认通过</a>&nbsp;"+
							"<a  onclick='Failure("+e.demandId+")'   class='btn btn-danger  deleteBtn rightSize'>不通过</a>&nbsp;"+
							"</td></tr>" 
						 )
					 }else if(e.stateId==1865){
						 $("#zzz").append(
								 "<tr><td>"+e.demandTitle+"</td>"+
									"<td>"+e.demandDetaIlinformation+"</td>"+
									"<td>"+e.dealMoney+"</td>"+
									"<td>项目完成</td>"+
									"<td><a onclick='particulars("+e.demandId+")' data-toggle='modal' data-target='#myModal2'  class='btn btn-warning illegalBtn rightSize'>查看详情</a></td>"+
									"<td><a onclick='Values1("+e.demandId+")' data-toggle='modal' data-target='#myModal3'>点击评价</a></td>"+
									"<td>项目已结束</td>"+
									"</tr>" 
								 ) 
					 }else if(e.stateId==1866){
						 $("#zzz").append(
								 "<tr><td>"+e.demandTitle+"</td>"+
									"<td>"+e.demandDetaIlinformation+"</td>"+
									"<td>"+e.dealMoney+"</td>"+
									"<td>项目失败</td>"+
									"<td><a onclick='particulars("+e.demandId+")' data-toggle='modal' data-target='#myModal2'  class='btn btn-warning illegalBtn rightSize'>查看详情</a></td>"+
									"<td><a onclick='Values1("+e.demandId+")' data-toggle='modal' data-target='#myModal3'>点击评价</a></td>"+
									"<td>项目已结束</td>"+
									"</tr>" 
								 )  
					 }
				}
  		 }
	})
}

</script>
</body>
</html>