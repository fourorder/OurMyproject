package org.great.biz;

import java.util.List;

import javax.annotation.Resource;

import org.great.bean.LineBean;
import org.great.mapper.LineMapper;

import org.springframework.stereotype.Service;

@Service
public class LineBizImp implements LineBiz {
	@Resource
	private LineMapper lineMapper;
	public List<LineBean> getLine() {
		return lineMapper.getLine();
	}
	@Override
	public List<LineBean> countLine(String lineName) {
		// TODO Auto-generated method stub
		if(lineName!=null) {
			lineName="%"+lineName+"%";
		}
		return lineMapper.countLine(lineName);
	}

	@Override
	public List<LineBean> line(String lineName, int page) {
		// TODO Auto-generated method stub
		if(lineName!=null) {
			lineName="%"+lineName+"%";
		}
		return lineMapper.line(lineName, page);
	}

	@Override
	public List<LineBean> findInfo(int lineId) {
		// TODO Auto-generated method stub
		return lineMapper.findInfo(lineId);
	}

	@Override
	public void changeInfo(int lineId2,String lineName2,String lineAddress2,int state) {
		// TODO Auto-generated method stub
		lineMapper.changeInfo(lineId2, lineName2, lineAddress2,state);
	}

	@Override
	public void addRule(String lineName3,String lineAddress3) {
		// TODO Auto-generated method stub
		lineMapper.addRule(lineName3,lineAddress3);
	}

	@Override
	public void changeState(int lineId) {
		// TODO Auto-generated method stub
		lineMapper.changeState(lineId);
	}

	@Override
	public void changeState2(int lineId) {
		// TODO Auto-generated method stub
		lineMapper.changeState2(lineId);
	}

	@Override
	public void changeState3(int lineId) {
		// TODO Auto-generated method stub
		lineMapper.changeState3(lineId);
	}

}
