package org.great.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.DemandTypeBean;

public interface DemandTypeBiz {
	public List<DemandTypeBean> countDemandType(@Param("parameterName")String parameterName);
	public List<DemandTypeBean> demandType(String parameterName,int page);
	public void addDemandType(String parameterName3);
	public void changeState(int parameterId);
}
