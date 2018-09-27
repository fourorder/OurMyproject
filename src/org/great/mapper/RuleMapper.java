package org.great.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.RuleBean;
import org.springframework.stereotype.Repository;

@Repository
public interface RuleMapper {
	public List<RuleBean> countRule() ;
	public List<RuleBean> countRule2(String ruleName) ;
	public List<RuleBean> rule(@Param("ruleName")String ruleName,@Param("page")int page);
	public List<RuleBean> findInfo(int ruleId);
	public void addRule( @Param("ruleName3")String ruleName3,@Param("securityMoney3") int securityMoney3,@Param("dealMoney3") int dealMoney3,@Param("auctionTime3") String auctionTime3,
			@Param("completeTime3")String completeTime3);
	public void changeInfo(@Param("ruleId2")int ruleId2,@Param("ruleName2") String ruleName2,@Param("securityMoney2") int securityMoney2, @Param("dealMoney2")int dealMoney2,@Param("auctionTime2") String auctionTime2,
			@Param("completeTime2")String completeTime2);
	public void changeState(int ruleId);
	public void changeState2(int ruleId);
	public void changeState3(int ruleId);
}
