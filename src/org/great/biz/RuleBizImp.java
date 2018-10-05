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
public List<RuleBean> countRule(String content) {
	// TODO Auto-generated method stub
	if(content!=null) {
		content="%"+content+"%";
	}
	return ruleMapper.countRule(content);
}


@Override
public List<RuleBean> rule(String content, int page) {
	// TODO Auto-generated method stub
	if(content!=null) {
		content="%"+content+"%";
	}
	return ruleMapper.rule(content, page);
}

@Override
public List<RuleBean> findInfo(int introductionId) {
	// TODO Auto-generated method stub
	return ruleMapper.findInfo(introductionId);
}

@Override
public void changeInfo(int introductionId2,String content2,int state) {
	// TODO Auto-generated method stub
	ruleMapper.changeInfo(introductionId2, content2, state);
}
@Override
public void addRule( String ruleName3) {
	// TODO Auto-generated method stub
	ruleMapper.addRule(ruleName3);
}

@Override
public void changeState(int introductionId) {
	// TODO Auto-generated method stub
	ruleMapper.changeState(introductionId);
}
@Override
public void changeState2(int introductionId) {
	// TODO Auto-generated method stub
	ruleMapper.changeState2(introductionId);
}
@Override
public void changeState3(int introductionId) {
	// TODO Auto-generated method stub
	ruleMapper.changeState3(introductionId);
}
}
