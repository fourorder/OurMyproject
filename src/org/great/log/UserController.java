package org.great.log;


import org.springframework.stereotype.Controller;

@Controller
//@RequestMapping("userController")
public class UserController {

	//@RequestMapping("testAOP")
	//@Log(operationType = "增加操作", operationName = "添加用户")
	public void testAOP(String userName, String password){
		System.out.println("UserController被调用了~~~~~~~~~~~~~~~~···");

//		String tmp = null;
//		tmp.substring(1);

	}
	
	//@Log(operationType = "修改操作", operationName = "修改用户")
	public void testAOP2(String userName, String password){
		System.out.println("UserController被调用了~~~~~~~~~~~~~~~~···");

		String tmp = null;
		tmp.substring(1);

	}
	
}