package org.great.handler;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.great.bean.UserInfoBean;
import org.great.biz.ProductionBiz;
import org.great.biz.UserBiz;
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
	
	request.setAttribute("userInfo", userBizImp.userinfo(userid));
	modelAndView.setViewName("jsp/userInfo");
	return modelAndView;

}		

	@RequestMapping("/UserInforEdit.action")//进入修改页面
	public ModelAndView UserInforEdit(HttpServletRequest request, String userid) {

		ModelAndView modelAndView = new ModelAndView();
		request.setAttribute("userInfo", userBizImp.userinfo(userid));
		modelAndView.setViewName("jsp/userInfoEdit");
		return modelAndView;

	}
	@RequestMapping("/ToUserInforEdit.action") // 修改后返回个人中心
	public ModelAndView ToUserInforEdit(HttpServletRequest request,String userId,String userProfile,
			String userName,String userIdentity,String userTel,String userMail,MultipartFile file) {
		ModelAndView modelAndView = new ModelAndView();
		
		userBizImp.userInfoEdit(request,userId, userProfile, userName, userIdentity, userTel, userMail,file);
		request.setAttribute("userInfo", userBizImp.userinfo(userId));
		modelAndView.setViewName("jsp/userInfo");
		return modelAndView;

	}	

@RequestMapping("/searchcredit.action")//查看信誉
ModelAndView searchCredit(HttpServletRequest request,String username){
	ModelAndView modelAndView=new ModelAndView();	
	request.setAttribute("userInfo", userBizImp.searchCredit(username));
	modelAndView.setViewName("jsp/searchcredit");
	return modelAndView;

}

}
