package org.great.biz;

import javax.annotation.Resource;

import org.great.bean.AdvertisingBean;
import org.great.mapper.AdvertisingMapper;
import org.springframework.stereotype.Service;

@Service
public class AdvertisingBizImp implements AdvertisingBiz {
	@Resource
	private AdvertisingMapper advertisingMapper;
	
	public int setAdvertising(AdvertisingBean ab) {
		// TODO Auto-generated method stub
	
		return advertisingMapper.setAdvertising(ab);
	}

}
