package org.great.mapper;

import java.util.List;

import org.great.bean.UserStoryBean;
import org.springframework.stereotype.Repository;
@Repository
public interface UserStoryMapper {

	public List<UserStoryBean> getStory();
}
