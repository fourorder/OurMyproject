package org.great.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.LineBean;
import org.great.bean.RuleBean;

public interface LineMapper {
	public List<LineBean> countLine(@Param(value="lineName")String lineName) ;
	public List<LineBean> line(@Param("lineName")String lineName,@Param("page")int page);
	public List<LineBean> findInfo(int lineId);
	public void addRule( @Param("lineName3")String lineName3,@Param("lineAddress3")String lineAddress3);
	public void changeInfo(@Param("lineId2")int lineId2,@Param("lineName2") String lineName2,@Param("lineAddress2") String lineAddress2,@Param("state") int state);
	public void changeState(int lineId);
	public void changeState2(int lineId);
	public void changeState3(int lineId);
}
