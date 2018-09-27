package org.great.biz;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.UserBean;
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
	public int stateId;
	public int characterId;
	public int flag;
	public int login(String userAccount, String userPwd,HttpServletRequest request) {
		// TODO Auto-generated method stub
		System.out.println(userPwd+"密码核实");
		List<UserBean> user=userMapper.login(userAccount, userPwd);
		if(user.size()>0){
			for(int i=0;i<user.size();i++) {
				stateId=user.get(i).getStateId();
				characterId=user.get(i).getCharacterId();
				String userName=user.get(i).getUserName();
				request.setAttribute("userName", userName);
				int userId=user.get(i).getUserId();
				request.setAttribute("userId", userId);
				int characterId=user.get(i).getCharacterId();
				request.setAttribute("characterId", characterId);
				request.setAttribute("fundList", fundBizImp.getFundList("1"));
				request.setAttribute("page", 1);
			}
			System.out.println("stateId="+stateId);
			System.out.println("characterId="+characterId);
			if(stateId==1&characterId==1){
				flag=1;
				
			}else if(stateId==1&characterId==2) {
				System.out.println("该用户被锁定");
				flag=1;
			}else if(stateId==2&characterId==1) {
				System.out.println("该用户被锁定");
				flag=2;
			}else if(stateId==2&characterId==2) {
				System.out.println("该用户被锁定");
				flag=2;
			}else if(stateId==3&characterId==2) {
				System.out.println("该用户被删除");
				flag=4;
			}else if(stateId==3&characterId==2) {
				System.out.println("该用户被删除");
				flag=4;
			}else if(stateId==1&characterId==3) {
				System.out.println("管理员登录");
				flag=5;
			}
		
			
		}else {
			
			flag=3;
		}
		
		return flag;
	}

}
