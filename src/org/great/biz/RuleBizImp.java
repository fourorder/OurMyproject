package org.great.biz;

import java.util.List;

import javax.annotation.Resource;

import org.great.bean.RuleBean;
import org.great.mapper.RuleMapper;
import org.springframework.stereotype.Service;

@Service
public class RuleBizImp implements RuleBiz{
@Resource
private RuleMapper ruleMapper;

@Override
public List<RuleBean> countRule() {
	// TODO Auto-generated method stub
	return ruleMapper.countRule();
}
@Override
public List<RuleBean> countRule2(String ruleName) {
	// TODO Auto-generated method stub
		ruleName="%"+ruleName+"%";
	
	return ruleMapper.countRule2(ruleName);
}

@Override
public List<RuleBean> rule(String ruleName, int page) {
	// TODO Auto-generated method stub
	if(ruleName!=null) {
		ruleName="%"+ruleName+"%";
	}
	return ruleMapper.rule(ruleName, page);
}

@Override
public List<RuleBean> findInfo(int ruleId) {
	// TODO Auto-generated method stub
	return ruleMapper.findInfo(ruleId);
}

@Override
public void changeInfo(int ruleId2, String ruleName2, int securityMoney2, int dealMoney2, String auctionTime2,
		String completeTime2) {
	// TODO Auto-generated method stub
	ruleMapper.changeInfo(ruleId2, ruleName2, securityMoney2, dealMoney2, auctionTime2, completeTime2);
}
@Override
public void addRule( String ruleName3, int securityMoney3, int dealMoney3, String auctionTime3,
		String completeTime3) {
	// TODO Auto-generated method stub
	ruleMapper.addRule(ruleName3, securityMoney3, dealMoney3, auctionTime3, completeTime3);
}

@Override
public void changeState(int ruleId, int stateId) {
	// TODO Auto-generated method stub
	ruleMapper.changeState(ruleId);
}
@Override
public void changeState2(int ruleId, int stateId) {
	// TODO Auto-generated method stub
	ruleMapper.changeState2(ruleId);
}
@Override
public void changeState3(int ruleId, int stateId) {
	// TODO Auto-generated method stub
	ruleMapper.changeState3(ruleId);
}
}
