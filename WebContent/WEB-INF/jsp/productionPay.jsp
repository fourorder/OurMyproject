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
<title>Insert title here</title>
</head>
<body>
<h1>支付确认</h1>

<h3>商品名称： ${productionBean.productionName }</h3>
<h3 >付款金额： ${productionBean.productionMoney }</h3>




<a href="<%=path %>production/productionPayFinish.action?userId=2&proId=${productionBean.productionId}&price=${productionBean.productionMoney}&proUserId=${productionBean.userId}"><h1 style="color:red ; font-size:50px">购买完成，后期删掉,点击跳转,生成购买记录,购买者ID写死</h1></a>
</body>
</html>