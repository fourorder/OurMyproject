package org.great.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.InformationBean;
import org.springframework.stereotype.Repository;

@Repository
public interface InformationMapper {
	public int setInformation(InformationBean ib);
	public List<InformationBean> getInformation(@Param("parameterid")int parameterid);
	public List<InformationBean> getInforList(@Param("parameterid")int parameterid,@Param("end")int end,@Param("start")int start);
}
