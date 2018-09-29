package org.great.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.RuleBean;
import org.springframework.stereotype.Repository;

@Repository
public interface RuleMapper {
	public List<RuleBean> countRule(@Param(value="content")String content) ;
	public List<RuleBean> rule(@Param("content")String content,@Param("page")int page);
	public List<RuleBean> findInfo(int introductionId);
	public void addRule( @Param("content3")String content3);
	public void changeInfo(@Param("introductionId2")int introductionId2,@Param("content2") String content2,@Param("state") int state);
	public void changeState(int introductionId);
	public void changeState2(int introductionId);
	public void changeState3(int introductionId);
}
