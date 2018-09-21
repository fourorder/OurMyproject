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
	public int flag;
	public int login(String userAccount, String userPwd,HttpServletRequest request) {
		// TODO Auto-generated method stub
		List<UserBean> user=userMapper.login(userAccount, userPwd);
		if(user.size()==1){
			for(int i=0;i<user.size();i++) {
				stateId=user.get(i).getStateId();
				String userName=user.get(i).getUserName();
				request.setAttribute("userName", userName);
				int userId=user.get(i).getUserId();
				request.setAttribute("userId", userId);
				int userCharacter=user.get(i).getCharacterId();
				request.setAttribute("userCharacter", userCharacter);
				request.setAttribute("fundList", fundBizImp.getFundList("1"));
				request.setAttribute("page", 1);
			}
			
			if(stateId==1){
				flag=1;
				
			}else {
				System.out.println("该用户被锁定");
				flag=2;
			}
		
			
		}else {
			
			flag=3;
		}
		
		return flag;
	}

}
