package org.great.biz;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.great.mapper.UserMapper;
import org.springframework.stereotype.Service;
@Service
public class RegisterBizImp implements RegisterBiz {
    @Resource
    private RegisterBiz registerBizImp;
    @Resource
	private UserMapper userMapper;
	@Override
	public void register(String userAccount, String userPwd, int characterId, String userName, long userTel,
			String userIdentity, int stateId, HttpServletRequest request) {
		// TODO Auto-generated method stub
		  userMapper.addUser(userAccount, userPwd, characterId, userName, userTel, userIdentity, stateId);
	}
	
	

}
