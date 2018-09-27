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
			<button type="button" class="btn btn-primary btn-lg addBtn therightSize">添加角色</button>
            <table id="treeSelectTable" class="table table-striped table-bordered">
                <thead>
                    <tr><td>序号</td><td>角色名称</td><td>创建时间</td><td>角色描述</td><td>操作</td></tr>
                </thead> 
                <tbody id="treeSelectBody">
                    					 <c:forEach items="${list}"  var="list" >	              
	            						<tr><td>${list.characterId }</td><td>${list.characterName }</td><td>${list.characterTime }</td><td>${list.characterId }</td>
	            										<td>
	            										                <button class="btn btn-info btn-sm  modifyRoleBtn rightSize" type="button" data-id=${list.characterId } ><i class="fa fa-paste"></i> 修改</button>
                														<button class="btn btn-primary btn-sm grantAuthorityBtn rightSize" type="button" data-id=${list.characterId } ><i class="fa fa-external-link"></i> 授权</button>
																		<button class="btn btn-danger btn-sm deleteBtn rightSize" type="button" data-id=${list.characterId }><i class="fa fa-paste"></i>删除</button>
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
    <script src="<%=path%>js/index.js"></script>
</body>

</html>

