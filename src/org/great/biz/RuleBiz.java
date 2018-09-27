package org.great.biz;

import java.util.List;

import org.great.bean.DemandBean;
import org.great.bean.RuleBean;

public interface RuleBiz {
	public List<RuleBean> countRule();
	public List<RuleBean> countRule2(String ruleName);
	public List<RuleBean> rule(String ruleName,int page);
	public List<RuleBean> findInfo(int ruleId);
	public void changeInfo(int ruleId2,String ruleName2,int securityMoney2,int dealMoney2,String auctionTime2,String completeTime2);
	public void addRule(String ruleName3,int securityMoney3,int dealMoney3,String auctionTime3,String completeTime3);
	public void changeState(int ruleId,int stateId);
	public void changeState2(int ruleId,int stateId);
	public void changeState3(int ruleId,int stateId);
}
