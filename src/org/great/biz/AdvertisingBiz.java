package org.great.biz;

import java.util.List;

import org.great.bean.AdvertisingBean;

public interface AdvertisingBiz {
	public AdvertisingBean goToAdver(int num);
	public List<AdvertisingBean> selectAdvertising(int num); //查找当前序号是否存在广告
	public int updateNum(int advId); //更改配置广告序号
	public int insertAdvertising(AdvertisingBean ab); //配置广告
	public List<AdvertisingBean> selectAll(String title,String time,int page); //模糊分页查找所有广告
	public int countAdvertising(String title,String time); //所有广告条数
	public List<AdvertisingBean> selectOne(int advId);//查询单个广告
	public int affirm(int advId,int advNum);//确认修改
	public int updateSerial(int num); //更改广告序号
	public List<AdvertisingBean> getAllAdver();
}
