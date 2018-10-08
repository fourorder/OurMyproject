package org.great.biz;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.UserBean;
import org.great.mapper.ProductionMapper;
import org.great.mapper.UserMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
@Service
public class LoginBizImp implements LoginBiz {
	@Resource
	private FundBiz fundBizImp;
	@Resource
	private LoginBiz loginBizImp;
	@Resource
	private UserMapper userMapper;
	@Resource
	private ProductionMapper productionMapper;
	public int stateId;
	public int charcaterId;
	public int flag;
	public int login(String userAccount, String userPwd,HttpServletRequest request) {
		// TODO Auto-generated method stub
		List<UserBean> user=userMapper.login(userAccount, userPwd);
		if(user.size()==1){
			for(int i=0;i<user.size();i++) {
				stateId=user.get(i).getStateId();
				charcaterId=user.get(i).getCharacterId();
			}			
			if(stateId==1){
				if (charcaterId==3) {
					flag=4;//管理员跳转
				}else {
					flag=1;//雇主服务商成功登陆跳转
				}				
				
			}else {
				flag=2;//账号被锁定跳转
			}
		
			
		}else {
			
			flag=3;//登陆失败跳转
		}
		request.getSession().setAttribute("user",user.get(0));//将用户对象存到session里
		return flag;
	}

}
