<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>付款</title>
</head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.alipay.config.*"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.request.*"%>
<%
	//获得初始化的AlipayClient
	AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
	
	//设置请求参数
	AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
	alipayRequest.setReturnUrl(AlipayConfig.return_url);
	alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
	
	//商户订单号，商户网站订单系统中唯一订单号，必填
	String out_trade_no = new String(request.getAttribute("WIDout_trade_no").toString());
//	System.out.println("作品名字="+out_trade_no);
	//付款金额，必填
	String total_amount = new String(request.getAttribute("WIDtotal_amount").toString());
	//订单名称，必填
	String subject = new String(request.getAttribute("WIDsubject").toString());
	//商品描述，可空
	String body = new String(request.getAttribute("WIDbody").toString());
	
	String proId = new String(request.getAttribute("proId").toString());
	String userId = new String(request.getAttribute("userId").toString());
	String proUserId = new String(request.getAttribute("proUserId").toString());
	String price = new String(request.getAttribute("price").toString());
	 
	
	 //设置自定义参数
    String passback_params = "proId="+proId+";userId="+userId+";proUserId="+proUserId+";price="+price;
    //将参数encode
    String passback_params2 =java.net.URLEncoder.encode(passback_params,"UTF-8");
    
	
	
	alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
			+ "\"total_amount\":\""+ total_amount +"\"," 
			+ "\"subject\":\""+ subject +"\"," 
			+ "\"body\":\""+ body +"\"," 
		/* 	  + "\"proId\":\""+ proId +"\"," 
			+ "\"userId\":\""+ userId +"\"," 
			+ "\"proUserId\":\""+ proUserId +"\"," 
			+ "\"price\":\""+ price +"\","  */ 
			 + "\"passback_params\":\""+ passback_params2 +"\","
			+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
	
	//若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
	//alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
	//		+ "\"total_amount\":\""+ total_amount +"\"," 
	//		+ "\"subject\":\""+ subject +"\"," 
	//		+ "\"body\":\""+ body +"\"," 
	//		+ "\"timeout_express\":\"10m\"," 
	//		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
	//请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节
	
	//请求
	String result = alipayClient.pageExecute(alipayRequest).getBody();
	
	//输出
	out.println(result);
%>


</body>
</html>