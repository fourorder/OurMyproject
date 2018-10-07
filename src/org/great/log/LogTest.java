package org.great.log;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LogTest {
	public static void main(String[] args){
		 //启动Spring容器        
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"applicationContext.xml");
       //获取service或controller组件
       UserController userController = (UserController) ctx.getBean("userController");
       userController.testAOP("zhangsan", "123456");
	}
}
