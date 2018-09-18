package org.great.biz;

import java.util.List;

import javax.annotation.Resource;

import org.great.bean.FundBean;
import org.great.mapper.FundMapper;
import org.springframework.stereotype.Service;
@Service
public class FundBizImp implements FundBiz{
@Resource
private FundMapper fundMapper;
public List<FundBean> getFundList(){
	return fundMapper.getFundList();
}
}