package org.great.biz;

import java.util.List;

import javax.annotation.Resource;

import org.great.bean.InformationBean;
import org.great.mapper.InformationMapper;
import org.springframework.stereotype.Service;

@Service
public class InformationBizImp implements InformationBiz{

	
	@Resource
	private InformationMapper informationMapper;
	
	
	@Override
	public int setInformation(InformationBean ib) {
		// TODO Auto-generated method stub
		System.out.println("Biz实现类");
		return informationMapper.setInformation(ib);
	}


	@Override
	public List<String> informationType() {
		// TODO Auto-generated method stub
		return informationMapper.informationType();
	}


	@Override
	public int selectPid(String paramenter) {
		// TODO Auto-generated method stub
		System.out.println("Imp:"+paramenter);
		return informationMapper.selectPid(paramenter);
	}


	@Override
	public int countInfor(int state) {
		// TODO Auto-generated method stub
		return informationMapper.countInfor(state);
	}


	@Override
	public List<InformationBean> conditionQuery(int state, int page) {
		// TODO Auto-generated method stub
		return informationMapper.conditionQuery(state, page);
	}


	@Override
	public int delInfor(int inforId) {
		// TODO Auto-generated method stub
		return informationMapper.delInfor(inforId);
	}


	@Override
	public int updateInfor(InformationBean ib) {
		// TODO Auto-generated method stub
		return informationMapper.updateInfor(ib);
	}


	@Override
	public List<InformationBean> selectOne(int inforId) {
		// TODO Auto-generated method stub
		return informationMapper.selectOne(inforId);
	}

	

}
