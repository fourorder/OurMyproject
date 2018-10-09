package org.great.handler;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.great.bean.AuthorityBean;
import org.great.bean.UserBean;
import org.great.bean.UserInfoBean;
import org.great.biz.FundBiz;
import org.great.biz.ProductionBiz;
import org.great.biz.UserBiz;
import org.great.mapper.AuthoriyMapper;
import org.great.note.HttpUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping("/user") // 用户的handler包
public class UserHandler {

@Resource
private UserBiz userBizImp;
@Resource
private ProductionBiz productionBizImp;
@Resource 
private AuthoriyMapper authoriyMapper;

@RequestMapping("/sendCode.action")
@ResponseBody
public List<Object> sendCode(String userTel) {
	System.out.println("手机号："+userTel);
	int flag=0;
	for (int i = 0; i <= 100; i++){ 
		 flag = new Random().nextInt(999999); 
		if (flag < 100000)    {     
			flag += 100000;  
			}    
		
		}
	System.out.println(flag);

	 String host = "https://feginesms.market.alicloudapi.com";
	    String path = "/codeNotice";
	    String method = "GET";
	    String appcode ="630643fa2b8f413fa3e6aa70d91142b9"; //"你自己的AppCode";
	    Map<String, String> headers = new HashMap<String, String>();
	    //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
	    headers.put("Authorization", "APPCODE " + appcode);
	    Map<String, String> querys = new HashMap<String, String>();
	    querys.put("param", String.valueOf(flag));
	    querys.put("phone", userTel);
	    querys.put("sign", "38358");
	    querys.put("skin", "38765");
	    // skin=38765 欢迎您注册，绑定手机号码，验证码为：@
	    //skin=38774 感谢您使用，解绑手机号码，验证码为：@
         //JDK 1.8示例代码请在这里下载：  http://code.fegine.com/Tools.zip

	    try {
	    	/**
	    	* 重要提示如下:
	    	* HttpUtils请从
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
             * 或者直接下载：
             * http://code.fegine.com/HttpUtils.zip
	    	* 下载
	    	*
	    	* 相应的依赖请参照
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
             * 相关jar包（非pom）直接下载：
             * http://code.fegine.com/aliyun-jar.zip
	    	*/
	    	HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
	    	//System.out.println(response.toString());如不输出json, 请打开这行代码，打印调试头部状态码。
             //状态码: 200 正常；400 URL无效；401 appCode错误； 403 次数用完； 500 API网管错误
	    	//获取response的body
	    	System.out.println(EntityUtils.toString(response.getEntity()));
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	List<Object> list=new ArrayList<>();
	list.add(flag);
	
	return list;
	
}
@RequestMapping("/sendCode2.action")
@ResponseBody
public List<Object> sendCode2(String userTel) {
	System.out.println("手机号："+userTel);
	int flag=0;
	for (int i = 0; i <= 100; i++){ 
		 flag = new Random().nextInt(999999); 
		if (flag < 100000)    {     
			flag += 100000;  
			}    
		
		}
	System.out.println(flag);

	 String host = "https://feginesms.market.alicloudapi.com";
	    String path = "/codeNotice";
	    String method = "GET";
	    String appcode ="630643fa2b8f413fa3e6aa70d91142b9"; //"你自己的AppCode";
	    Map<String, String> headers = new HashMap<String, String>();
	    //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
	    headers.put("Authorization", "APPCODE " + appcode);
	    Map<String, String> querys = new HashMap<String, String>();
	    querys.put("param", String.valueOf(flag));
	    querys.put("phone", userTel);
	    querys.put("sign", "38358");
	    querys.put("skin", "38774");
	    // skin=38765 欢迎您注册，绑定手机号码，验证码为：@
	    //skin=38774 感谢您使用，解绑手机号码，验证码为：@
         //JDK 1.8示例代码请在这里下载：  http://code.fegine.com/Tools.zip

	    try {
	    	/**
	    	* 重要提示如下:
	    	* HttpUtils请从
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
             * 或者直接下载：
             * http://code.fegine.com/HttpUtils.zip
	    	* 下载
	    	*
	    	* 相应的依赖请参照
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
             * 相关jar包（非pom）直接下载：
             * http://code.fegine.com/aliyun-jar.zip
	    	*/
	    	HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
	    	//System.out.println(response.toString());如不输出json, 请打开这行代码，打印调试头部状态码。
             //状态码: 200 正常；400 URL无效；401 appCode错误； 403 次数用完； 500 API网管错误
	    	//获取response的body
	    	System.out.println(EntityUtils.toString(response.getEntity()));
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	List<Object> list=new ArrayList<>();
	list.add(flag);
	
	return list;
	
}
@RequestMapping("/checkTel.action")
@ResponseBody
public List<Object> checkTel(String userTel){
	List<Object> list=new ArrayList<>();
	int msg=0;
	List<UserBean> user=userBizImp.checkTel(userTel);
	if(user.size()>0) {
		msg=1;//手机号已被注册
	}else {
		msg=2;//手机号没被注册
	}
	list.add(msg);
	return list;
	
}
@RequestMapping("/search.action")
public ModelAndView serach(String name,HttpServletRequest request,String page,String state) {

	ModelAndView modelAndView=new ModelAndView();

	request.setAttribute("objList", userBizImp.getAllList(name));
	request.setAttribute("searchName", name);
	request.setAttribute("page",1);
	modelAndView.setViewName("jsp/searchresult");
	return modelAndView;
	
}
@RequestMapping("/selectepage.action")
//雇主分页ajax
@ResponseBody
public List<Object> selectEpage(String name,String epage,String state){
	return userBizImp.search(name,epage,state,1);
}
@RequestMapping("/selectbpage.action")
//服务商分页ajax
@ResponseBody
public List<Object> selectBpage(String name,String bpage,String state){
	return userBizImp.search(name,bpage,state,2);
}
@RequestMapping("/selectppage.action")
//作品分页ajax
@ResponseBody
public List<Object> selectPpage(String name,String ppage,String state){
	return userBizImp.search(name, ppage, state, 3);
}
@RequestMapping("/selectopage.action")
//外部网站分页ajax
@ResponseBody
public List<Object> selectOpage(String name,String opage,String state){
	return userBizImp.search(name, opage, state, 4);
}
@RequestMapping("/EmployerInformation.action")//用户详细信息
public ModelAndView EmployerInformation(HttpServletRequest request,String userid){
	ModelAndView modelAndView=new ModelAndView();
	
	request.setAttribute("userInfo", userBizImp.userinfo(userid));
	modelAndView.setViewName("jsp/queryUserInfo");
	return modelAndView;
	
}
@RequestMapping("/returnHome.action")//返回主页
public ModelAndView returnHome(){
	ModelAndView modelAndView=new ModelAndView();
	modelAndView.setViewName("jsp/home");
	return modelAndView;
}
@RequestMapping("/UserInformation.action")//个人中心

ModelAndView UserInformation(HttpServletRequest request,String userid){
	ModelAndView modelAndView=new ModelAndView();
	UserBean userBean=(UserBean) request.getSession().getAttribute("user");
	request.setAttribute("userInfo", userBizImp.userinfo(userBean.getUserId()+""));
	modelAndView.setViewName("jsp/userInfo");
	
	ArrayList<AuthorityBean> menuList=new ArrayList<AuthorityBean>();
	menuList=authoriyMapper.findOwnSubclassMenu(userBean.getUserId());
	request.setAttribute("menuList", menuList);
	return modelAndView;

}		

	@RequestMapping("/UserInforEdit.action")//进入修改页面
	public ModelAndView UserInforEdit(HttpServletRequest request, String userid) {
		ModelAndView modelAndView = new ModelAndView();
		request.setAttribute("userInfo", userBizImp.userinfo(userid));
		modelAndView.setViewName("jsp/userInfoEdit");
		ArrayList<AuthorityBean> menuList=new ArrayList<AuthorityBean>();
		UserBean userBean=(UserBean) request.getSession().getAttribute("user");
		menuList=authoriyMapper.findOwnSubclassMenu(userBean.getUserId());
		request.setAttribute("menuList", menuList);
		
		
		return modelAndView;

	}
	@RequestMapping("/ToUserInforEdit.action") // 修改后返回个人中心
	public ModelAndView ToUserInforEdit(HttpServletRequest request,String userId,String userProfile,
			String userName,String userIdentity,String userTel,String userMail,MultipartFile file,String userAddress) {
		ModelAndView modelAndView = new ModelAndView();
		
		userBizImp.userInfoEdit(request,userId, userProfile, userName, userIdentity, userTel, userMail,file,userAddress);
		request.setAttribute("userInfo", userBizImp.userinfo(userId));
		UserBean userBean = (UserBean) request.getSession().getAttribute("user");
		userBean.setUserHead(userBizImp.userinfo(userId).getUserHead());
		request.getSession().setAttribute("user", userBean);
		
		modelAndView.setViewName("redirect:/user/UserInformation.action");
		
		return modelAndView;

	}	

@RequestMapping("/searchcredit.action")//查看信誉
ModelAndView searchCredit(HttpServletRequest request,String username){
	ModelAndView modelAndView=new ModelAndView();	
	request.setAttribute("userInfo", userBizImp.searchCredit(username));
	modelAndView.setViewName("jsp/searchcredit");
	return modelAndView;

}
@Resource
private FundBiz fundBizImp;
@RequestMapping("/accountManage.action")//账户管理
ModelAndView accountManage(HttpServletRequest request,String page) {
	UserBean ub=(UserBean) request.getSession().getAttribute("user");
	System.out.println("账户ID:"+ub.getUserId());
	ModelAndView modelAndView=new ModelAndView();
	String userMoney=fundBizImp.findUserMoney(Integer.valueOf(ub.getUserId()));
	request.setAttribute("userMoney", userMoney);
	request.setAttribute("fundList", fundBizImp.getFundList2(page,Integer.valueOf(ub.getUserId())));
	request.setAttribute("page", 1);
	request.setAttribute("countPage", fundBizImp.getcountPage2(Integer.valueOf(ub.getUserId())));
	request.setAttribute("userid", ub.getUserId());
	ArrayList<AuthorityBean> menuList=new ArrayList<AuthorityBean>();
	menuList=authoriyMapper.findOwnSubclassMenu(ub.getUserId());
	request.setAttribute("menuList", menuList);
	modelAndView.setViewName("jsp/userAccountManage");
	return modelAndView;
	
}
@RequestMapping("/accountManage2.action")
ModelAndView accountManage2(HttpServletRequest request,String page) {
	ModelAndView modelAndView=new ModelAndView();
	request.setAttribute("fundList", fundBizImp.getFundList(page));
	request.setAttribute("page", 1);
	request.setAttribute("countPage", fundBizImp.getcountPage());
	modelAndView.setViewName("jsp/accountManage");
	return modelAndView;
}
@RequestMapping("/selectFund2.action")//ajax分页跳转
@ResponseBody
public List<Object> selectFund(String page,String state,String userid){	
	return fundBizImp.selectFund2(page, state,Integer.valueOf(userid));	
}
@RequestMapping("/changeTel.action")//修改手机号
public ModelAndView changeTel(HttpServletRequest request) {
	String userTel= request.getParameter("userTel");
	request.setAttribute("userTel", userTel);
	ModelAndView modelAndView=new ModelAndView();
	modelAndView.setViewName("jsp/changeTel");
	
	return modelAndView;
	
}
@RequestMapping("/deleteTel.action")//修改手机号
public ModelAndView deleteTel(HttpServletRequest request,String userTel) {
	userBizImp.deleteTel(userTel);
	ModelAndView modelAndView=new ModelAndView();
	modelAndView.setViewName("jsp/BoundTel");
	
	return modelAndView;
	
}
@RequestMapping("/boundTel.action")//重新绑定手机号
public ModelAndView boundTel(HttpServletRequest request,String userTel,String userId) {
	System.out.println(userId);
	System.out.println(userTel);
	userBizImp.boundTel(userTel, userId);
	ModelAndView modelAndView=new ModelAndView();
	modelAndView.setViewName("redirect:/user/UserInformation.action?userId="+userId);
	
	return modelAndView;
	
	
}
@RequestMapping("/forgetPwd.action")//重新绑定手机号
public ModelAndView forgetPwd() {
	
	ModelAndView modelAndView=new ModelAndView();
	modelAndView.setViewName("jsp/forgetPwd");
	
	return modelAndView;
	
	
}
@RequestMapping("/checkUserAccount.action")//重新绑定手机号
@ResponseBody
public List<Object> checkUserAccount(String userAccount) {
	List<UserBean> userBeans=userBizImp.checkUserAccount(userAccount);
	int msg=0;
	List<Object> list=new ArrayList<>();
	
	if(userBeans.size()>0) {
		msg=2;
	}else {
		msg=1;
	}
	list.add(msg);
	
	return  list;
	
	
}
@RequestMapping("/checkAccountTel.action")//重新绑定手机号
@ResponseBody
public List<Object> checkAccountTel(String userAccount,String userTel) {
	List<UserBean> userBeans=userBizImp.checkAccountTel(userAccount,userTel);
	int msg=0;
	List<Object> list=new ArrayList<>();
	
	if(userBeans.size()>0) {
		msg=2;
	}else {
		msg=1;
	}
	list.add(msg);
	
	return  list;
	
	
}
@RequestMapping("/changePwd.action")
public ModelAndView changePwd(String userAccount) {
	userBizImp.changePwd(userAccount);
	ModelAndView modelAndView=new ModelAndView();
	modelAndView.setViewName("jsp/login");
	return modelAndView;
	
}

}
