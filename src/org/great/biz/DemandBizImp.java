package org.great.biz;

import java.util.List;

import javax.annotation.Resource;

import org.great.bean.DemandBean;
import org.great.mapper.DemandMapper;
import org.great.mapper.UserMapper;
import org.springframework.stereotype.Service;
@Service
public class DemandBizImp implements DemandBiz{
	@Resource
	private DemandMapper demandMapper;
	@Override
	public List<DemandBean> countDemand(String demandTitle) {
		// TODO Auto-generated method stub
		if (demandTitle!=null) {
			demandTitle="%"+demandTitle+"%";
		}
		return demandMapper.countDemand(demandTitle);
	}
	@Override
	public List<DemandBean> demand(String demandTitle,int page) {
		// TODO Auto-generated method stub
		if (demandTitle!=null) {
			demandTitle="%"+demandTitle+"%";
		}
		return demandMapper.demand(demandTitle,page);
	}
/*	@Override
	public List<DemandBean> countDemand2(String demandTitle) {
		// TODO Auto-generated method stub
		demandTitle="%"+demandTitle+"%";
		return demandMapper.countDemand2(demandTitle);
	}*/
	@Override
	public List<DemandBean> findInfo(int demandId) {
		// TODO Auto-generated method stub
		return demandMapper.findInfo(demandId);
	}
	@Override
	public String findFromUserName(int demandId) {
		// TODO Auto-generated method stub
		return demandMapper.findFromUserName(demandId);
	}
	@Override
	public String findToUserName(int demandId) {
		// TODO Auto-generated method stub
		return demandMapper.findToUserName(demandId);
	}
	@Override
	public String findParameterName(int demandId) {
		// TODO Auto-generated method stub
		return demandMapper.findParameterName(demandId);
	}
	@Override
	public String findStateName(int demandId) {
		// TODO Auto-generated method stub
		return demandMapper.findStateName(demandId);
	}
	@Override
	public void changeInfo(int demandId2, String demandDetailInformation2, int securityMoney2, int dealMoney2,
			String completeTime2, String auctionTime2, String demandHead2) {
		 demandMapper.changeInfo(demandId2, demandDetailInformation2, securityMoney2, dealMoney2, completeTime2, auctionTime2, demandHead2);
		
		// TODO Auto-generated method stub
		
	}
	@Override
	public void changeState(int demandId, int stateId) {
		demandMapper.changeState(demandId);
		// TODO Auto-generated method stub
		
	}
	@Override
	public void changeState2(int demandId, int stateId) {
		demandMapper.changeState2(demandId);
		// TODO Auto-generated method stub
		
	}
	@Override
	public void changeState3(int demandId, int stateId) {
		demandMapper.changeState3(demandId);
		// TODO Auto-generated method stub
		
	}
	

}
