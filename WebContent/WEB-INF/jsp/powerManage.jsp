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
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Cache-Control" content="no-cache">
    <title>jquery.tree-multiselect</title>

    <link href="<%=path%>plugins/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=path%>plugins/tree-multiselect/jquery.tree-multiselect.min.css" rel="stylesheet" />
     <link href="<%=path%>css/style.min.css" rel="stylesheet" />
	 	<link rel="stylesheet" href="<%=path%>css/jquery-ui.css">
    <link href="<%=path%>plugins/bootstrap/bootstrap.min.js"  />
    <link href="<%=path%>js/jquery.min.js"  />
    <style>
        .rightSize {
            margin-right: 5px;
        }
		.therightSize{
			
		}
        body {
            padding: 20px;
        }
        #treeSelectTable {
            width: 80%;
        }
        #treeSelectTable tr th,#treeSelectTable tr td {
            text-align: center;
        }
    </style>
	<script>
  
	</script>
</head>
<body class="gray-bg2">
    <div class="wrapper wrapper-content"  id="statisipDataArea">
		
        <div id="statisipArea" class="">
            <h3>角色管理</h3>
			<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">添加角色</button>
          <!-- ---------------------- -->
          <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
				添加角色
				</h4>
			</div>
			<div class="modal-body">
				<!-- ------------ -->
				<div class="input-group">
			<span class="input-group-addon">角色名称</span>
			<input type="text" class="form-control"  id="roleName"  placeholder="请输入要设置的角色名称">
		</div>
		<br>
				<!-- ------------ -->
				<div class="input-group">
			<span class="input-group-addon">角色描述</span>
			<input type="text" class="form-control"  id="roleIntro" placeholder="请输入该角色的描述">
		</div>
		<br>
				<!-- ------------ -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" id="submitAddRole">
					确认添加
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
   <!--   --------------- -->
           
        <!--   --------------- -->
            <table id="treeSelectTable" class="table table-striped table-bordered">
                <thead>
                    <tr><td>序号</td><td>角色名称</td><td>创建时间</td><td>角色描述</td><td>操作</td></tr>
                </thead> 
                <tbody id="treeSelectBody">
           
                    					 <c:forEach items="${list}"  var="list"  varStatus="status">	              
	            						<tr><td>${ status.index + 1}</td><td>${list.characterName }</td><td>${list.characterTime }</td><td>${list.characterIntro }</td>
	            										<td>
	            										            <%-- 连接着index.js文件 选择第几个button  57行  选择授权button    <button class="btn btn-info btn-sm  modifyRoleBtn rightSize" type="button" data-id=${list.characterId } id=${list.characterId } ><i class="fa fa-paste"></i> 修改</button> --%>
                														<button class="btn btn-primary btn-sm grantAuthorityBtn rightSize" type="button" data-id=${list.characterId }  id=${list.characterId }><i class="fa fa-external-link"></i> 授权</button>
													<c:if test="${list.characterId>4}">
																		<button class="btn btn-danger btn-sm deleteBtn rightSize" type="button" data-id=${list.characterId } id=${list.characterId }><i class="fa fa-paste"></i>删除</button>
	            									</c:if>
	            										</td>
	            						</tr>
											</c:forEach>
                </tbody>
            </table> 
        </div>
     
 
    </div>
 
     <!--给用户分配角色modal-->
    <div class="modal inmodal fade" id="grantAuthorityModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false" >
        <div class="modal-dialog">
            <div class="modal-content animated fadeIn">
                <div class="modal-header btn-primary">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                    </button>
                    <h4 class="modal-title" id="AuthorityTitle"></h4>
                </div>
                <div class="modal-body" id="authorityBody">
                  
                </div>
                <div class="modal-footer">
                    <button type="button"   class="btn btn-default"  data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary"  id="authoritysubmit">提交</button>
                </div>
            </div>
        </div>
    </div>
<!-- --------------------- -->

<div class="modal" id="delmymodal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">确实删除</h4>
            </div>
            <div class="modal-body">
                <p>确认删除该角色吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="confirmDelRole">删除</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
复制代码

<!-- ------------------------ -->
   <%--  <script id="treeSelect-template" type="text/x-dot-template">
         <tr>
            <td><%= it.i %></td>
            <td><%= it.roleName %></td> 
            <td>null</td>
            <td>null</td>
            <td> 
                <button class="btn btn-info btn-sm  modifyRoleBtn rightSize" type="button" data-id=<%= it.i %> ><i class="fa fa-paste"></i> 修改</button>
                <button class="btn btn-primary btn-sm grantAuthorityBtn rightSize" type="button" data-id=<%= it.i %> ><i class="fa fa-external-link"></i> 授权</button>
				<button class="btn btn-danger btn-sm deleteBtn rightSize" type="button" data-id=<%= it.i %>><i class="fa fa-paste"></i>删除</button>
            </td>
        </tr>
    </script>  --%>
   
    
    <script src="<%=path%>plugins/jquery/jquery.min.js"></script>
    <script src="<%=path%>plugins/jquery/jquery-ui.min.js"></script>
    <script src="<%=path%>plugins/bootstrap/bootstrap.min.js"></script>
    <script src="<%=path%>plugins/tree-multiselect/jquery.tree-multiselect.min.js"></script>
    <script src="<%=path%>plugins/doT/doT.js"></script>
    <!--bootstrap-table-->
    <!--<script src="~/Content/js/plugins/bootstrap-table/bootstrap-table.js"></script>
    <script src="~/Content/js/plugins/bootstrap-table/bootstrap-table-zh-CN.js"></script>
    $1$layer#1#
    <script src="~/Content/js/plugins/layer/layer.min.js"></script>
    $1$封装的ajax数据接口#1#
    <script src="~/Content/js/plugins/doT/doT.js"></script>
    <script src="~/Content/js/commonjs.js"></script>
    <script src="~/Content/js/config.router.js"></script>-->
    <script src="<%=path%>js/indexCJ.js"></script>
</body>

</html>

