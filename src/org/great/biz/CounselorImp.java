package org.great.biz;

import java.util.List;

import javax.annotation.Resource;

import org.great.bean.CounselorBean;
import org.great.mapper.CounselorMapper;
import org.springframework.stereotype.Service;

@Service
public class CounselorImp implements CounselorBiz {

	@Resource
	private CounselorMapper coounselor;
	
	
	@Override
	public int applyFor(CounselorBean cb) {
		// TODO Auto-generated method stub
		return coounselor.applyFor(cb);
	}


	@Override
	public List<CounselorBean> select(String account) {
		// TODO Auto-generated method stub
		return coounselor.select(account);
	}


	@Override
	public List<CounselorBean> conditionQuery(int state, int page) {
		// TODO Auto-generated method stub
		return coounselor.conditionQuery(state, page);
	}


	@Override
	public int countCounserlor(int state) {
		// TODO Auto-generated method stub
		return coounselor.countCounserlor(state);
	}


	@Override
	public int applyForOk(String account) {
		// TODO Auto-generated method stub
		return coounselor.applyForOk(account);
	}


	@Override
	public List<String> type() {
		// TODO Auto-generated method stub
		return coounselor.type();
	}


	@Override
	public int forbidden(String account) {
		// TODO Auto-generated method stub
		return coounselor.forbidden(account);
	}


	@Override
	public int start(String account) {
		// TODO Auto-generated method stub
		return coounselor.start(account);
	}

}
