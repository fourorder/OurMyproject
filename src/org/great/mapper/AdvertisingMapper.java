package org.great.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.great.bean.AdvertisingBean;
import org.springframework.stereotype.Repository;

@Repository
public interface AdvertisingMapper {
	
	public AdvertisingBean getAdver(@Param("flag")int num);
	public List<AdvertisingBean> selectAdvertising(@Param("num")int num); //查找当前序号是否存在广告
	public int insertAdvertising(AdvertisingBean ab); //配置广告
	public int updateNum(@Param("advId")int advId); //更改配置广告序号
	public List<AdvertisingBean> selectAll(@Param("title")String title,@Param("time")String time,@Param("page")int page); //查找所有广告
	public int countAdvertising(@Param("title")String title,@Param("time")String time); //所有广告条数
	public List<AdvertisingBean> selectOne(@Param("advId")int advId);//查询单个广告
	public int affirm(@Param("advId")int advId,@Param("advNum")int advNum);//确认修改
	public int updateSerial(@Param("num")int num); //更改广告序号
	public List<AdvertisingBean> getAllAdver();//查询广告
}
