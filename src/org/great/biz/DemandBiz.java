package org.great.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.DemandBean;

public interface DemandBiz {
public List<DemandBean> countDemand(@Param("demandTitle")String demandTitle);
/*public List<DemandBean> countDemand2(String demandTitle);*/
public List<DemandBean> demand(String demandTitle,int page);
public List<DemandBean> findInfo(int demandId);
public String findFromUserName(int demandId);
public String findToUserName(int demandId);
public String findParameterName(int demandId);
public String findStateName(int demandId);
public void changeInfo(int demandId2,String demandDetailInformation2,int securityMoney2,int dealMoney2,String completeTime2,String auctionTime2,String demandHead2);
public void changeState(int demandId,int stateId);
public void changeState2(int demandId,int stateId);
public void changeState3(int demandId,int stateId);
}
