package org.great.biz;

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

	

}
