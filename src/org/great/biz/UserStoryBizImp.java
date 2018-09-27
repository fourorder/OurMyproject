package org.great.biz;

import java.util.List;

import javax.annotation.Resource;

import org.great.bean.UserStoryBean;
import org.great.mapper.UserStoryMapper;
import org.springframework.stereotype.Service;

@Service
public class UserStoryBizImp implements UserStoryBiz{
	@Resource 
	private UserStoryMapper userStoryMapper;
	public List<UserStoryBean> getStory(){
		
		return userStoryMapper.getStory();
	}
	
}
