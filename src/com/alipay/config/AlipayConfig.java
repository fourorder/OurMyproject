package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	/*HttpServletRequest request=new HttpServletRequest();
	HttpSession session = request.getSession();*/
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016092100564428";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key ="MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDNtb5E5a2kxzL2akeTWsJcqPx8tEsTChKa4S6H8aq1+CXouodlUJQP4jextKgDm+21mSoLJJ4/nYx+OkTvy3OYGK2/+s3LFMNVYLZEMPIpCClCjsKt+2lBpoQRXg6uROe1zDnwqsCGgxQ/wj1xzZit7lo229QrhKu01AeJ3mvuTEglRMathaynkNowtOtUrBjQILORLu6vwOF6cODeeEcfT1QgMf32khH18WJ2Y5UJouqojaHS5mEb+e/fBQaRrzwH5sGtvuoZaVhJlNvyh6L5A2Gz5RCPNsgAEpy4T+BALF1ncjfPvXyPdfrD1J+pok/TtTv7Vop4m+GcArEK16RjAgMBAAECggEBAIZjqHUcU6/lz156ml4jGf0tDR5vLui2WOdEG4EGmc8d2a5MRe4jkUc7M8Vtz6Hj+Yz9DiGPf67xv3ormSPLl64S2VglgtKcsuwRLaIpE9tIkKQB3h+Jsv8HyRoLh63EKFh1npijBPobolvxCvFRLuDaaaeTP+5aU07kgjRI0dwwX0mnwy8gJFXzNTBJ217blchxpWyjNI6oxjWtyZcYfQqz6AcvHWO5QPnUsVgVY5Uni3AzjwjgmY2mouTYqipOdIga58d1S3S/Jt5OtSwUn3ZIeYu01Y0Wn6BBfOPp9l4WMDT5/vUNQ4YJzoA54p812twhBt845piVkR+F+Hmf8oECgYEA81rrClUUWTkwiXCm32dZBcN2guh9ZpVkbT0URVpJhe95fGmvwogJeiPLHjT0MRZQwZlyaHMXs89p4zQWtsgE1WRXOLiVyvGBZ2zUOefRrBy8NjwozdpTe+dvd/Afb9RJSlTelQzN+gyn7oWtmBK599P7jwh2FMnZvQ+z66/rSsECgYEA2GYSplrHUnlTr763GtpVtRkRsOfISZEztmWgM2zHjv8G/k1ekA55Qhcmzb+6ylE8VSzXSvl1FPQFeNQqi9NAqNZgGkMnLdEQ92/Luj84slC5OvPqV0Bq8YGDEf+2i5QnV+kGo+7gILmgVWFcmrOTN58gNQWtQsLCA1IwbrHjbCMCgYEApqaMbvb0iGVxp61NmY/cluXUMrGjrqx/qY86YoQB9YaZW2nEwyMF2m7ImlcJItR1WR8MChtHEAvqJ310UJeJN9kPIfjGG8RnKbyNWVo3a/YBreJkzxPEOAW1gB0gaiSmTBDynH+4TpR8LAu/ZXTthZnVm43fzzyrr50hSTWfnAECgYBn1SJhu/Ej+59SFnqZYeX6DVtVvQF3ezqK7FxgEHP4gxoB73HOQYOhWKZ/1t1zsmL2o5tyGBw7v5LYlUUM7oJ6ANMABvTHoSc48uWYKjm0JdObG+p3jytBUllny4D1nFL8dY2AH2Bfk3IBRcQ/Xqbm621yw5SNEhIxscAXfTeYbQKBgQC4M7kEl75OgMHCU18j+pPr8L2dDZcMkfMXKXG2uZkT1bi9JepnVkHTExDmaOwYxM+4E4FnYpHvMD8WmOr6H+wGs6dwBvzJ7lkzQG5wLMndEV/S9SG2Dk8QTWmx1ZmCrCEcEtJ0LIMZ1gFnnOSIgoMPC2CkrHYHYG2imMQqHrRvXg==";
   // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
  public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmnFVK4CZwzfICGlV2MXd8I3Pa/L8gD31N/sl80LJsg2u8EYUUFBprNeFqjJVKgTGAM/7fdFuH6QuGoDjIhcNqeg6oO/o8jPaPcdYgVTWBj5Brc1fxaEull3i90xINC+LpN257QCMzvCfpeHRFTLOJssKs1S8HDXVBJ6OD3Xl7QSvxt9bgUWdf4dZZsk/kvJilBELnzLFCKQJAKBNGsVTLEaPkAURlGbx+tiYNEkEyUmBLlGnaV7AzkHkHSnTm9TLKZwr9O1Qq9iynX3P8grEpx2vDLyehiLKggv5lp+5iAqNQLLMlqEA5EMzwmq2/bjg6Zq8tSD+2SYm+qaZp3wE6wIDAQAB";
  // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	//public static String notify_url = "http://127.0.0.1:8080/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";
	/*public static String notify_url = "http://127.0.0.1:8080/Myproject/production/productionPayFinish.action";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	//public static String return_url = "http://127.0.0.1:8080/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";
	public static String return_url = "http://127.0.0.1:8080/Myproject/production/productionPayFinish.action";
*/
  public static String notify_url = null;

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	//public static String return_url = "http://127.0.0.1:8080/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";
	public static String return_url =null;

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

