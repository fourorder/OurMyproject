package org.great.biz;

import java.util.List;

import org.great.bean.DemandBean;
import org.great.bean.RuleBean;

public interface RuleBiz {
	public List<RuleBean> countRule(String content);
	public List<RuleBean> rule(String content,int page);
	public List<RuleBean> findInfo(int introductionId);
	public void changeInfo(int introductionId2,String content2,int state);
	public void addRule(String content3);
	public void changeState(int ruleId);
	public void changeState2(int ruleId);
	public void changeState3(int ruleId);
}
