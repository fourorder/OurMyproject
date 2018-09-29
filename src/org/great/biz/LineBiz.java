package org.great.biz;

import java.util.List;

import org.great.bean.LineBean;
import org.great.bean.RuleBean;

public interface LineBiz {
	public List<LineBean> countLine(String lineName);
	public List<LineBean> line(String lineName,int page);
	public List<LineBean> findInfo(int lineId);
	public void changeInfo(int lineId2,String lineName2,String lineAddress2,int state);
	
	public void addRule(String lineName3,String lineAddress3);
	public void changeState(int lineId);
	public void changeState2(int lineId);
	public void changeState3(int lineId);
}
