package org.great.mapper;


import org.apache.ibatis.annotations.Param;
import org.great.bean.AdvertisingBean;
import org.springframework.stereotype.Repository;

@Repository
public interface AdvertisingMapper {
	
	public int  setAdvertising(AdvertisingBean ab);
	public AdvertisingBean getAdver(@Param("flag")int num);
}
