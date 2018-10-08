package org.great.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.DemandTypeBean;
import org.springframework.stereotype.Repository;

@Repository
public interface DemandTypeMapper {
	public List<DemandTypeBean> countDemandType(@Param(value="parameterName")String parameterName);
	public List<DemandTypeBean> demandType(@Param("parameterName")String parameterName,@Param("page")int page);
	public void addDemandType(@Param("parameterName3")String parameterName3);
	public void changeState(@Param("parameterId")int parameterId);
}
