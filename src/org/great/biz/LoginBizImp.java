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
	public int flag;
	public int login(String userAccount, String userPwd,HttpServletRequest request) {
		// TODO Auto-generated method stub
		List<UserBean> user=userMapper.login(userAccount, userPwd);
		if(user.size()==1){
			for(int i=0;i<user.size();i++) {
				stateId=user.get(i).getStateId();
				
			}			
			if(stateId==1){
				flag=1;
				request.getSession().setAttribute("user",user.get(0));//将用户对象存到session里
			}else {
				flag=2;
			}
		
			
		}else {
			
			flag=3;
		}
		
		return flag;
	}

}
