package org.great.biz;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.great.bean.ParameterBean;
import org.great.mapper.UserMapper;
import org.springframework.stereotype.Service;
@Service
public class RegisterBizImp implements RegisterBiz {
    @Resource
    private RegisterBiz registerBizImp;
    @Resource
	private UserMapper userMapper;
   /* 雇主注册*/
	@Override
	public void register(String userAccount, String userPwd, Integer characterId, String userName, long userTel,
			String userIdentity, Integer stateId, HttpServletRequest request,String userRegisterTime) {
		// TODO Auto-generated method stub
		
		  userMapper.addUser(userAccount, userPwd, characterId, userName, userTel, userIdentity, stateId,userRegisterTime);
	}
	/*服务商注册*/
	@Override
	public void register2(String userAccount, String userPwd, Integer characterId, String userName, long userTel,
			String userIdentity, Integer stateId, HttpServletRequest request,String userRegisterTime,int businessTypeId) {
		// TODO Auto-generated method stub
		
		  userMapper.addUser2(userAccount, userPwd, characterId, userName, userTel, userIdentity, stateId,userRegisterTime,businessTypeId);
	}
	/*寻找服务商类型*/
	@Override
	public List<ParameterBean> findBusinessType() {
		// TODO Auto-generated method stub
		return userMapper.findBusinessType();
	}
	
	

}
