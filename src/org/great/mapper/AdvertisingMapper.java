package org.great.mapper;


import org.great.bean.AdvertisingBean;
import org.springframework.stereotype.Repository;

@Repository
public interface AdvertisingMapper {
	
	public int  setAdvertising(AdvertisingBean ab);
}
