package org.great.biz;

import java.util.List;

import javax.annotation.Resource;

import org.great.bean.DemandTypeBean;
import org.great.mapper.DemandTypeMapper;
import org.springframework.stereotype.Service;

@Service
public class DemandTypeBizImp implements DemandTypeBiz{
@Resource
private DemandTypeMapper demandTypeMapper;
	@Override
	public List<DemandTypeBean> countDemandType(String parameterName) {
		// TODO Auto-generated method stub
		if (parameterName!=null) {
			parameterName="%"+parameterName+"%";
		}
		return demandTypeMapper.countDemandType(parameterName);
	}

	@Override
	public List<DemandTypeBean> demandType(String parameterName, int page) {
		// TODO Auto-generated method stub
		if (parameterName!=null) {
			parameterName="%"+parameterName+"%";
		}
		return demandTypeMapper.demandType(parameterName,page);
	}

	@Override
	public void addDemandType(String parameterName3) {
		// TODO Auto-generated method stub
		 demandTypeMapper.addDemandType(parameterName3);
	}

	@Override
	public void changeState(int parameterId) {
		// TODO Auto-generated method stub
		demandTypeMapper.changeState(parameterId);
	}

}
