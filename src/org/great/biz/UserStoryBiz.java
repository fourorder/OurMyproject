package org.great.biz;

import java.util.List;

import javax.annotation.Resource;

import org.great.bean.UserStoryBean;
import org.great.mapper.UserStoryMapper;

public interface UserStoryBiz {
	public List<UserStoryBean> getStory();

}
