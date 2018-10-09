package org.great.biz;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.great.bean.AdvertisingBean;
import org.great.mapper.AdvertisingMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class AdvertisingBizImp implements AdvertisingBiz {
	@Resource
	private AdvertisingMapper advertisingMapper;
	

	@Override
	public List<AdvertisingBean> selectAdvertising(int num) {
		// TODO Auto-generated method stub
		return advertisingMapper.selectAdvertising(num);
	}
	public AdvertisingBean goToAdver(int num) {
		return advertisingMapper.getAdver(num);
	}

	@Override
	public int insertAdvertising(AdvertisingBean ab) {
		// TODO Auto-generated method stub
		System.out.println("标题："+ab.getAdvertisementTitle()+"内容："+ab.getAdvertisementContent()+"图片路径："+ab.getAdvertisementImage()+"序号："+ab.getAdvertisementNum());
		return advertisingMapper.insertAdvertising(ab);
	}
	
	
	@Override
	public int updateNum(int avdId) {
		// TODO Auto-generated method stub
		return advertisingMapper.updateNum(avdId);
	}

	@Override
	public List<AdvertisingBean> selectAll(String title,String time,int page) {
		// TODO Auto-generated method stub
		if(title!= null) {
			title="%"+title+"%";
		}
		System.out.println("num="+page);
		return advertisingMapper.selectAll(title,time,page);
	}

	@Override
	public int countAdvertising(String title,String time) {
		// TODO Auto-generated method stub
		if(title!= null ) {
			title="%"+title+"%";
		}
		return advertisingMapper.countAdvertising(title,time);
	}

	@Override
	public List<AdvertisingBean> selectOne(int avdId) {
		// TODO Auto-generated method stub
		return advertisingMapper.selectOne(avdId);
	}

	@Override
	public int affirm(int advId,int advNum) {
		// TODO Auto-generated method stub
		return advertisingMapper.affirm(advId,advNum);
	}

	@Override
	public int updateSerial(int num) {
		// TODO Auto-generated method stub
		return advertisingMapper.updateSerial(num);
	}
	@Override
	public List<AdvertisingBean> getAllAdver() {
		// TODO Auto-generated method stub
		return advertisingMapper.getAllAdver();
	}

	
}
