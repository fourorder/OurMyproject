package org.great.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.DemandBean;
import org.springframework.stereotype.Repository;

@Repository
public interface DemandMapper {
	public List<DemandBean> countDemand(@Param(value="demandTitle")String demandTitle);
	/*public List<DemandBean> countDemand2(String demandTitle);*/
	public List<DemandBean> demand(@Param("demandTitle")String demandTitle,@Param("page")int page);
	public List<DemandBean> findInfo(int demandId);
	public String findFromUserName(int demandId);
	public String findToUserName(int demandId);
	public String findParameterName(int demandId);
	public String findStateName(int demandId);
	public void changeInfo(@Param("demandId2")int demandId2,@Param("demandDetailInformation2") String demandDetailInformation2,@Param("securityMoney2") int securityMoney2,@Param("dealMoney2") int dealMoney2,
			@Param("completeTime2")String completeTime2, @Param("auctionTime2")String auctionTime2,@Param("demandHead2") String demandHead2);
	public void changeState(int demandId);
	public void changeState2(int demandId);
	public void changeState3(int demandId);
}
